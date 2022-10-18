#!/bin/sh

cp /app/problem-matcher.json /github/workflow/problem-matcher.json

echo "::add-matcher::${RUNNER_TEMP}/_github_workflow/problem-matcher.json"

phpcs -d memory_limit=${INPUT_MEMORY_LIMIT} --report=checkstyle

status=$?

echo "::remove-matcher owner=phpcs::"

exit $status
