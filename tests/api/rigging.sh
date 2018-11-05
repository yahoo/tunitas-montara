# source ${0%/*}/rigging.sh || exit 70
# https://en.wikipedia.org/wiki/Registered_port
# http://www.iana.org/assignments/port-numbers
# 49152-65535
PORT_BASE=49152
PORT_width=16383
PORT=$((PORT_base + RANDOM % PORT_width))
pidfile=${0%/*}/run.pid

