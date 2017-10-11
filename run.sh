#!/bin/bash

set -e

set | grep -E '^(PATH|SERVICE_CURATOR_LOGGING_LEVEL|SERVICE_ELASTICSEARCH_HOST|SERVICE_ELASTICSEARCH_PORT|SERVICE_ELASTICSEARCH_USERNAME|SERVICE_ELASTICSEARCH_PASSWORD)=' > /etc/environment

STDOUT_LOC=${STDOUT_LOC:-/proc/1/fd/1}
STDERR_LOC=${STDERR_LOC:-/proc/1/fd/2}

echo "${CRON_EXPR}  root /scripts/run_curator.sh > ${STDOUT_LOC} 2> ${STDERR_LOC} 2>&1" > /etc/crontab

exec cron -f
