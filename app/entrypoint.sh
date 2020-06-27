#!/bin/sh

cp /app/problem-matcher.json /github/workflow/problem-matcher.json

echo "::add-matcher::${RUNNER_TEMP}/_github_workflow/problem-matcher.json"

ls -la
phpcs web/modules/custom web/themes/custom

status=$?

echo "::remove-matcher owner=phpcs::"

exit $status
