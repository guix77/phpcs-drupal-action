#!/bin/sh

cp /app/problem-matcher.json /github/workflow/problem-matcher.json

echo "::add-matcher::${RUNNER_TEMP}/_github_workflow/problem-matcher.json"

phpcs

status=$?

echo "::remove-matcher owner=phpcs::"

exit $status
