> [!WARNING]
> **This repository is no longer maintained by our internal teams.**  
> The template is provided *as is* and will not receive updates, bug fixes, or new features.  
> You are welcome to contribute on it or fork the repository and modify it for your own use.
> To deploy this template on [Upsun](https://www.upsun.com), you can use the [ConvSun](https://github.com/upsun/convsun)
> tool to convert an existing `.platform.app.yaml` configuration file to the [Upsun Flex format](https://docs.upsun.com/create-apps/app-reference/single-runtime-image.html).

# Django 4 for Platform.sh

This template deploys the Django 4 application framework on Platform.sh, using the gunicorn application runner.  It also includes a PostgreSQL database connection pre-configured.

Django is a Python-based web application framework with a built-in ORM.

## Features

* Python 3.10
* PostgreSQL 12
* Automatic TLS certificates
* Pip-based builds

## Customizations

The following files have been added to a basic Django configuration.  If using this project as a reference for your own existing project, replicate the changes below to your project.

* The `.platform/applications.yaml`, `.platform/services.yaml`, and `.platform/routes.yaml` files have been added.  These provide Platform.sh-specific configuration and are present in all projects on Platform.sh.  You may customize them as you see fit.
* A rudimentary `myapp` application is included for demonstration purposes.  In particular, the `settings.py` file is set up to configure Django to connect to the correct database, and run in Debug mode when not running the `master` branch.  You are free to change that configuration if you prefer.

## Package managers

By default, this template uses `pip` to manage dependencies.
The `applications.yaml` file has been defined to download the latest version of `pip` into the container, then to use it to install dependencies during the build hook when the file system is writable.

If, however, you would like to use another tool (pipenv or Poetry), alternate app configurations have been provided in the same file to use them.
`applications.yaml` contains configuration for three applications in an array:

```yaml
- !include pip.app.yaml
# - !include pipenv.app.yaml
# - !include poetry.app.yaml
```

To use a different build and package manager, comment out the pip configuration object, and uncomment either the pipenv or Poetry line that links to their individual configuration files.

The presence of these variations is only meant to serve as a demo.
If you are using this template as a guide for deploying your own project on Platform.sh, it's sufficient to create a `.platform.app.yaml` file at the root of your repository, and then copy the contents of one of the desired configuration files into it (rather than including an `applications.yaml` with `!include` keys).

## References

* [Django](https://www.djangoproject.com/)
* [Python on Platform.sh](https://docs.platform.sh/languages/python.html)
