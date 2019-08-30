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
		{ grep -qie '^OK$' ${outfile?} ||
		  grep -qie '^Accepted$' ${outfile?} ; } &&
		true
		;;
	    ( 400 | 401 | 402 | 403 | 404 | 405 )
		test ${expected_hcode} == ${actual_hcode:-UNSET-ACTUAL} &&
		{ grep -qie '^Found$' ${outfile?} ||
		  grep -qie '^Not found$' ${outfile?} ||
		  grep -qie '^Method not Allowed$' ${outfile?} ; } &&
		true
		;;
	    ( 500 )
		test ${expected_hcode} == ${actual_hcode:-UNSET-ACTUAL} &&
		{ grep -qie '^Method not Allowed$' ${outfile?} ||
		  grep -qie '^Internal Error$' ${outfile?} ; } &&
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
    curl -6 "$@"
}
function curlish() {
    curl -6 --silent --write-out %{http_code} -o ${outfile?} "$@"
}
