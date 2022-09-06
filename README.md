# Django 4 for Platform.sh

<p align="center">
<a href="https://console.platform.sh/projects/create-project?template=https://raw.githubusercontent.com/platformsh/template-builder/master/templates/django4/.platform.template.yaml&utm_content=django4&utm_source=github&utm_medium=button&utm_campaign=deploy_on_platform">
    <img src="https://platform.sh/images/deploy/lg-blue.svg" alt="Deploy on Platform.sh" width="180px" />
</a>
</p>

This template deploys the Django 4 application framework on Platform.sh, using the gunicorn application runner.  It also includes a PostgreSQL database connection pre-configured.

Django is a Python-based web application framework with a built-in ORM.

## Features

* Python 3.10
* PostgreSQL 13
* Automatic TLS certificates
* Pip-based builds

## Customizations

The following files have been added to a basic Django configuration.  If using this project as a reference for your own existing project, replicate the changes below to your project.

* The `.platform.app.yaml`, `.platform/services.yaml`, and `.platform/routes.yaml` files have been added.  These provide Platform.sh-specific configuration and are present in all projects on Platform.sh.  You may customize them as you see fit.
* An additional Pip library, [`platformshconfig`](https://github.com/platformsh/config-reader-python), has been added.  It provides convenience wrappers for accessing the Platform.sh environment variables.
* A rudimentary `myapp` application is included for demonstration purposes.  In particular, the `settings.py` file is set up to configure Django to connect to the correct database, and run in Debug mode when not running the `master` branch.  You are free to change that configuration if you prefer.

## Package managers

By default, this template uses `pip` to manage dependencies.
The `.platform.app.yaml` has been defined to download the latest version of `pip` into the container, then to use it to install dependencies during the build hook when the file system is writable.

If, however, you would like to use another tool (pipenv or Poetry), that configuration has been included in the commented out portions of that file.

## References

* [Django](https://www.djangoproject.com/)
* [Python on Platform.sh](https://docs.platform.sh/languages/python.html)
