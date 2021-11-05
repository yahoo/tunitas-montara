# source ${0%/*}/rigging.sh || exit 70
#
# output
#
outfile="${0%.test}.out"
#
# port
#
# https://en.wikipedia.org/wiki/Registered_port
# http://www.iana.org/assignments/port-numbers
# 49152-65535
PORT_BASE=49152
PORT_width=16383
PORT=$((PORT_base + RANDOM % PORT_width))
PORT=23118
URLHOSTPORT=http://localhost:$PORT
pidfile=${0%/*}/run.pid
#
# PATH
#
__topdir=$(realpath ${0%/*}/../..)
export PATH="${__topdir?}/bin:${__topdir?}/sbin:$PATH"
#
# The expected page response from montara is the string of the HTTP code and that is all
# Enable this to turn off the checking (grepping) for the page content from teh server.
#
# checkby_grep_the_returned_page_content=0 .... do not grep
# checkby_grep_the_returned_page_content=1 .... do grep the outfile for the specific strings
#
declare -i checkby_grep_the_returned_page_content=0
function checkby_grep() {
    if ((0 == checkby_grep_the_returned_page_content)) ; then
        echo "DEBUG skip grep $@" 1>&2
        return 0;
    else
        echo "DEBUG check grep $@" 1>&2
        grep -qie $1 ${outfile?}
    fi
}
#
# But is it correct?
#
# assert 0 == $? and 405 == ${code?}
#
function assert() {
    echo "DEBUG assert $@" 1>&2
    echo "DEBUG assert outfile $(head -n 1 ${outfile?} < /dev/null 2>&1)" 1>&2
    local args=( "$@" )
    if [[ 7 != $# ]] ; then
	echo "$0: error, assertion is missing arguments [[ assert ${args[@]} ]]" 1>&2
	exit 70
    else
	local expected_ecode=$1; shift
	local op1=$1; shift
	local actual_ecode=$1; shift
	local op2=$1; shift
	local expected_hcode=$1; shift
	local op3=$1; shift
	local actual_hcode=$1; shift
	if [[ '==' != $op1 ]] || [[ 'and' != $op2 ]] || [[ '==' != $op3 ]]; then
	    echo "${0}: error, assertion is missing arguments [[ assert ${args[@]} ]]" 1>&2
	    exit 70
	else 
	    test ${expected_ecode?} == ${actual_ecode?} &&
	    case ${expected_hcode:-UNSET-EXPECTED} in
	    ( 200 | 201 | 202 )
		test ${expected_hcode} == ${actual_hcode:-UNSET-ACTUAL} &&
                { checkby_grep '^OK$' ||
                  checkby_grep '^Accepted$' ; } &&
		true
		;;
	    ( 400 | 401 | 402 | 403 | 404 | 405 | 409 | 410 )
		test ${expected_hcode} == ${actual_hcode:-UNSET-ACTUAL} &&
		{ checkby_grep '^Found$' ||
		  checkby_grep '^Not found$' ||
		  checkby_grep '^Method not Allowed$' ||
		  checkby_grep '^Conflict$' ||
		  checkby_grep '^Gone$' ; } &&
		true
		;;
	    ( 500 )
		test ${expected_hcode} == ${actual_hcode:-UNSET-ACTUAL} &&
		{ checkby_grep '^Method not Allowed$' ||
		  checkby_grep '^Internal Error$' ; } &&
		true
		;;
	    ( * )
		echo "$0: error, unknown assertion key [[ ${expected_hcode:-(unset)} ]]" 1>&2
		exit 70
		;;
	    esac
	fi
    fi
}
#
# https://wiki.tunitas.technology/page/Issue/Fedora_LXC_/etc/hosts_is_wrong_for_localhost_in_IPv6
# WATCHOUT - the -6 here is REQUIRED for use in LXC containers with an incorrect /etc/hosts.
#
# See /etc/hosts
#     127.0.0.1  localhost.localdomain   localhost  Fedora-27 <-------------- the name of the original LXC container as inherited
#     ::1        localhost6.localdomain6 localhost6 <------------------------ INSUFFICIENT
#
#     MISSING
#     ::1        localhost.localdomain localhost <--------------------------- BETTER
#
# See /etc/nsswitch.conf
#     hosts:      files dns myhostname
#
#
# So by demanding that curl use IPv6, it will go up to DNS to get "localhost" which will properly resolve to ::1
#
# Exhibition of the failure
#
# $ curl --verbose --write-out '%{http_code}' -o ./consent.PUT.out -H 'Content-Type: application/json' -X PUT -d @./consent.PUT.json http://localhost:23118/consent
#  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                 Dload  Upload   Total   Spent    Left  Speed
#  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0*   Trying 127.0.0.1...
# * TCP_NODELAY set
# * connect to 127.0.0.1 port 23118 failed: Connection refused
# * Failed to connect to localhost port 23118: Connection refused
# * Closing connection 0
# curl: (7) Failed to connect to localhost port 23118: Connection refused
#
function curlpure() {
    # WATCHOUT - curl exits with success even when the response code is NOT a success code (e.g. 500)
    curl ${CURL_VERBOSE:+--verbose} -6 "$@"
}
function curlcode() {
    # WATCHOUT - curl exits with success even when the response code is NOT a success code (e.g. 500)
    curl ${CURL_VERBOSE:+--verbose} -6 --write-out %{http_code} -o /dev/null "$@"
}
function curlish() {
    { echo $0" notice, calling curlish $@" ;
      echo $0" notice, curlish is deprecated, instead use curlok" ; } 1>&2
    curlok "$@"
}
function curlok() {
    local response
    response=$(curl ${CURL_VERBOSE:+--verbose} -6 --silent --write-out %{http_code} -o ${outfile?} "$@")
    local -i e=$?
    if ((0 != e)) ; then
        return $e;
    else
        case $response in
            ( 2?? ) return 0 ;; # the run succeeds
            ( * )   return 1 ;; # the run fails from code >= 400, 500 etc.
        esac
    fi
}
#
# used in aaa.start.test
# used in zzz.end.test
#
function debug_show_service() {
    local keyword=$1; shift
    local tag="DEBUG ${keyword?}"
    echo "${tag?} pid=${pid:-(unset)}"
    echo "${tag?} pidfile=${pidfile:-(unset)}"
    echo "${tag?} pidfile contains $(< ${pidfile?})"
    echo "${tag?} BEGIN"
    ps -ef | sed -n -e "/montara-service/ s/^/${tag?}: /p"
    echo "${tag?} END"
}
