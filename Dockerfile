FROM guillaumeduveau/docker-phpcs-drupal:latest

COPY entrypoint.sh \
     problem-matcher.json \
     /app/action/

RUN chmod +x /app/action/entrypoint.sh

ENTRYPOINT ["/app/action/entrypoint.sh"]
