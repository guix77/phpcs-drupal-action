# Fast & inexpensive GitHub Action to check Drupal PHP coding standards with annotations

![PHPCS Drupal action](./resources/images/phpcs-drupal-action.png)

This GitHub Action allows to **check your code against the Drupal PHP coding standards**.

It has **GitHub Annotations** working out-of-the box. It's **fast** and **inexpensive** (in terms of GitHub Action minutes) compared to most others. This is because it doesn't install your composer dependencies. The downside is that all components versions are fixed by the version of the action you are using, and not by your code base.

The Docker image used by this action is automatically built from this repository on https://quay.io/repository/guix77/phpcs-drupal-action

## Requirements

+ A Drupal project following the https://github.com/drupal-composer/drupal-project structure;
+ A GitHub repository of course.

## Installation

In the root of your Drupal project, create ````phpcs.xml````:

````
<?xml version="1.0" encoding="UTF-8"?>
<ruleset name="drupal">
  <description>PHP CodeSniffer configuration for Drupal coding standards.</description>
  <file>./web/modules/custom</file>
  <file>./web/themes/custom</file>
  <arg name="extensions" value="php,module,inc,install,test,profile,theme,css,info,txt,md,yml" />
  <config name="drupal_core_version" value="10" />
  <rule ref="Drupal" />
  <rule ref="DrupalPractice" />
</ruleset>
````

In the root of your Drupal project, create ````.github/workflows/drupalCodingStandards.yml````:

````
name: Drupal coding standards

on: [pull_request]

jobs:
  phpcs-drupal:
      name: Drupal coding standards
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v4
        - uses: guix77/phpcs-drupal-action@php8.4RC3
````

You can customize the trigger of course (\\\\on: [pull_request]\\\\).

That's it.

## Memory limit

Optionally you could define the memory limit to use when executing phpcs. By default it is set to 128M.

````
uses: guix77/phpcs-drupal-action@php8.4RC3
with:
  memory_limit: 512M
````

Define this if you get an error like: `Fatal error: Allowed memory size of...`.

## Credits

Inspired by https://github.com/chekalsky/phpcs-action
