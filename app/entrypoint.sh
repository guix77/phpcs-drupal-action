#!/bin/sh

cp /app/problem-matcher.json /github/workflow/problem-matcher.json

echo "::add-matcher::${RUNNER_TEMP}/_github_workflow/problem-matcher.json"

phpcs --standard=Drupal,DrupalPractice --extensions=php,module,inc,install,test,profile,theme,css,info,txt,md,yml web/modules/custom web/themes/custom

status=$?

echo "::remove-matcher owner=phpcs::"

exit $status
