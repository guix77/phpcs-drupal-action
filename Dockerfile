FROM guillaumeduveau/docker-phpcs-drupal:latest

RUN mkdir ~/action

COPY entrypoint.sh \
     problem-matcher.json \
     ~/action/

RUN chmod +x ~/action/entrypoint.sh

ENTRYPOINT ["~/action/entrypoint.sh"]
