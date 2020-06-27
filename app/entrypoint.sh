#!/bin/sh

cp /app/problem-matcher.json /github/workflow/problem-matcher.json
cp /app/ruleset.xml /github/workflow/ruleset.xml

echo "::add-matcher::${RUNNER_TEMP}/_github_workflow/problem-matcher.json"

phpcs  --standard=${RUNNER_TEMP}/_github_workflow/ruleset.xml

status=$?

echo "::remove-matcher owner=phpcs::"

exit $status
