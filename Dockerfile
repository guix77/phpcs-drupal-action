FROM guillaumeduveau/docker-phpcs-drupal:latest

RUN mkdir ~/action

COPY --chown=app:app \
                     entrypoint.sh \
                     problem-matcher.json \
     /home/app/action/

RUN chmod +x ~/action/entrypoint.sh

ENTRYPOINT ["/home/app/action/entrypoint.sh"]
