FROM php:8.4-cli-alpine
ENV PATH=${PATH}:/root/.composer/vendor/bin
RUN apk add --no-cache \
	git && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer global config --no-plugins allow-plugins.dealerdirect/phpcodesniffer-composer-installer true && \
    composer global require drupal/coder squizlabs/php_codesniffer && \
    phpcs --config-set default_standard Drupal,DrupalPractice
COPY app /app
RUN chmod +x /app/entrypoint.sh
WORKDIR /app
ENTRYPOINT ["/app/entrypoint.sh"]