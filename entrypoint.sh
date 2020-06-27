#!/bin/sh

cp /app/action/problem-matcher.json /github/workflow/problem-matcher.json

echo "::add-matcher::${RUNNER_TEMP}/_github_workflow/problem-matcher.json"

phpcs --report=checkstyle

status=$?

echo "::remove-matcher owner=phpcs::"

exit $status
