Installation of Grav is a trivial process. In fact, there is no real installation. You have **three** options for installing Grav. The first - and simplest - way is to download the **zip** archive, and extract it. The second way is to install with **Composer**. The third way is to clone the source project directly from **GitHub**, and then run an included script command to install needed dependencies:

## Check for PHP version[](https://learn.getgrav.org/17/basics/installation#check-for-php-version)

Grav is incredibly easy to set up and get running. Be sure you have at least PHP version 7.3.6+ by going to the terminal and typing `php -v`:

## Option 1: Install from ZIP package[](https://learn.getgrav.org/17/basics/installation#option-1-install-from-zip-package)

The easiest way to install Grav is to download the ZIP package and extract it:

1.  Download the latest-and-greatest **[Grav](https://getgrav.org/download/core/grav/latest)** or **[Grav + Admin](https://getgrav.org/download/core/grav-admin/latest)** package.
2.  Extract the ZIP file in the [webroot](https://www.wordnik.com/words/webroot) of your web server, e.g. `~/webroot/grav`

There are [Skeleton](https://getgrav.org/downloads/skeletons)\-packages available, which include the core Grav system, sample pages, plugins, and configuration. They are a great way to get started; all you have to do is [download the Skeleton](https://getgrav.org/downloads/skeletons)\-package you prefer, and follow the steps above.

If you downloaded the ZIP file and then plan to move it to your webroot, please move the **ENTIRE FOLDER** because it contains several hidden files (such as .htaccess) that will not be selected by default. The omission of these hidden files can cause problems when running Grav.

## Option 2: Install with composer[](https://learn.getgrav.org/17/basics/installation#option-2-install-with-composer)

The alternative method is to install Grav with [composer](https://getcomposer.org/doc/00-intro.md#installation-linux-unix-osx):

If you want to check out the bleeding edge version of Grav, add `1.x-dev` as an additional parameter:

## Option 3: Install from GitHub[](https://learn.getgrav.org/17/basics/installation#option-3-install-from-github)

Another method is to clone Grav from the GitHub repository, and then run a simple dependency installation script:

1.  Clone the Grav repository from [GitHub](https://github.com/getgrav/grav) to a folder in the webroot of your server, e.g. `~/webroot/grav`. Launch a **terminal** or **console** and navigate to the webroot folder:
    
2.  Install **vendor dependencies** via [composer](https://getcomposer.org/doc/00-intro.md#installation-linux-unix-osx):
    
3.  Install the **plugin** and **theme dependencies** by using the [Grav CLI application](https://learn.getgrav.org/17/advanced/grav-cli) `bin/grav`:
    
    This will automatically **clone** the required dependencies from GitHub directly into this Grav installation.
    

## Option 4: Install on Cloudron[](https://learn.getgrav.org/17/basics/installation#option-4-install-on-cloudron)

Cloudron is a complete solution for running apps on your server and keeping them up-to-date and secure. On your Cloudron you can install Grav with a few clicks. If you host multiple sites, you can install them completely isolated from one another on the same server.

[![Install](https://cloudron.io/img/button.svg)](https://cloudron.io/store/org.getgrav.cloudronapp.html)

The source code for the package can be found [here](https://git.cloudron.io/cloudron/grav-app).

## Webservers[](https://learn.getgrav.org/17/basics/installation#webservers)

#### Apache/IIS/Nginx[](https://learn.getgrav.org/17/basics/installation#apache-iis-nginx)

Using Grav with a web server such as Apache, IIS, or Nginx is as simple as extracting Grav into a folder under the [webroot](https://www.wordnik.com/words/webroot). All it requires to function is PHP 7.3.6 or higher, so you should make sure that your server instance meets that requirement. More information about Grav requirements can be found in the [requirements](https://learn.getgrav.org/17/basics/requirements) chapter of this guide.

If your web root is, for example, `~/public_html` then you could extract it into this folder and reach it via `http://localhost`. If you extracted it into `~/public_html/grav` you would reach it via `http://localhost/grav`.

Every web server must be configured. Grav ships with .htaccess by default, for Apache, and comes with some [default server configuration files](https://github.com/getgrav/grav/tree/master/webserver-configs), for `nginx`, `caddy server`, `iis`, and `lighttpd`. Use them accordingly when needed.

#### Running Grav with the Built-in PHP Webserver Using `router.php`[](https://learn.getgrav.org/17/basics/installation#running-grav-with-the-built-in-php-webserver-using-router-php)

You can run Grav using a simple command from Terminal / Command Prompt using the built-in PHP server available to any system with PHP 7.3.6+ installed. All you need to do is navigate to the root of your Grav install using the Terminal or Command Prompt and enter `php -S localhost:8000 system/router.php`. You can replace the port number (in our example it's `8000`) with any port you prefer.

Entering this command will present you with output similar to the following:

Your terminal will also give you real-time updates of any activity on this ad hoc-style server. You can copy the URL provided in the `Listening on` line and paste that into your browser of choice to access your site, including the administrator.

This is a useful tool for quick development, and should **not** be used in place of a dedicated web server such as Apache.

## Successful Installation[](https://learn.getgrav.org/17/basics/installation#successful-installation)

The first time it loads, Grav pre-compiles some files. If you now refresh your browser, you will get a faster, cached version.

![Grav Installed](https://learn.getgrav.org/user/pages/01.basics/03.installation/install.png)

In the previous examples, **$** represents the command prompt. This may look different on various platforms.

By default, Grav comes with some sample pages to give you something to get started with. Your site is already fully functional and you can configure it, add content, extend it, or customize it as much as you like.

## Installation & Setup Problems[](https://learn.getgrav.org/17/basics/installation#installation-setup-problems)

If any issues are discovered during the initial page load (or after a cache-flush event) you may see an error page:

![Grav with Problems](https://learn.getgrav.org/user/pages/01.basics/03.installation/problems.png)

Please consult the [Troubleshooting](https://learn.getgrav.org/17/troubleshooting) section for help regarding specific issues.

## Grav Updates[](https://learn.getgrav.org/17/basics/installation#grav-updates)

To keep your site up to date, please read [Updating Grav & Plugins](https://learn.getgrav.org/17/basics/updates).

Found errors? Think you can improve this documentation? Simply click the **Edit** link at the top of the page, and then the icon on Github to make your changes.