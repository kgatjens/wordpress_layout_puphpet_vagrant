## References

This project is based in Bedrock Wordpress Stack (https://github.com/roots/bedrock), and uses the same folder structure 

## Features

* Better folder structure
* Dependency management with [Composer](http://getcomposer.org)
* Easy WordPress configuration with environment specific files
* Environment variables with [Dotenv](https://github.com/vlucas/phpdotenv)
* Autoloader for mu-plugins (use regular plugins as mu-plugins)

##Folder Structure

The organization of Bedrock is similar to putting WordPress in its own subdirectory but with some improvements.

* In order not to expose sensitive files in the webroot, Bedrock moves what's required into a web/ directory including the vendor'd wp/ source, and the wp-content source.
* wp-content has been named app to better reflect its contents. It contains application code and not just "static content". It also matches up with other frameworks such as Symfony and Rails.
* wp-config.php remains in the web/ because it's required by WP, but it only acts as a loader. The actual configuration files have been moved to config/ for better separation.
* vendor/ is where the Composer managed dependencies are installed to.
wp/ is where the WordPress core lives. It's also managed by Composer but can't be put under vendor due to WP limitations.

# Composer
    
## To add a new Wordpres plugin from a repository

Add the package to the composer.json repositories section. Yo need to define dev-master as the plugin version
    
    {
        "type"   : "package",
        "package": {
          "name"   : "plugin/plugin-name",
          "type"   : "wordpress-plugin",
          "version": "dev-master",
          "source" : {
              "url"  : "https://github.com/plugin-name",
              "type" : "git",
              "reference": "master"
          }
        }
Add the dependency to the require section in the composer.json

    "plugin/plugin-name": "dev-master",

## To add a new Wordpres plugin from a zip

Add the package to the composer.json repositories section. Is important to define the exact version of the plugin
    
    {
        "type"   : "package",
        "package": {
          "name"   : "plugin/plugin-name",
          "type"   : "wordpress-plugin",
          "version": "dev-master",
          "source" : {
              "url"  : "https://downloads.wordpress.org/plugin/plugin-name.1.6.5.zip",
              "type" : "zip",
              "reference": "master"
          }
        }
Add the dependency to the require section in the composer.json

    "plugin/plugin-name": "1.6.5",  

## To add a new Wordpres theme from a repository

Add the package to the composer.json repositories section. Yo need to define dev-master as the theme version
    
    {
        "type"   : "package",
        "package": {
          "name"   : "theme/theme-name",
          "type"   : "wordpress-theme",
          "version": "dev-master",
          "source" : {
              "url"  : "https://github.com/theme-name",
              "type" : "git",
              "reference": "master"
          }
        }
Add the dependency to the require section in the composer.json

    "plugin/theme-name": "dev-master",

## To add a new Wordpres theme from a zip

Add the package to the composer.json repositories section. Is important to define the exact version of the theme
    
    {
        "type"   : "package",
        "package": {
          "name"   : "plugin/theme-name",
          "type"   : "wordpress-theme",
          "version": "dev-master",
          "source" : {
              "url"  : "https://downloads.wordpress.org/plugin/theme-name.1.6.5.zip",
              "type" : "zip",
              "reference": "master"
          }
        }
Add the dependency to the require section in the composer.json

    "plugin/theme-name": "1.6.5",       


## To add a new Wordpres mu-plugin from a repository

Add the package to the composer.json repositories section. Yo need to define dev-master as the mu-plugin version
    
    {
        "type"   : "package",
        "package": {
          "name"   : "plugin/mu-plugin-name",
          "type"   : "wordpress-muplugin",
          "version": "dev-master",
          "source" : {
              "url"  : "https://github.com/mu-plugin-name",
              "type" : "git",
              "reference": "master"
          }
        }
Add the dependency to the require section in the composer.json

    "plugin/mu-plugin-name": "dev-master",

## To add a new Wordpres mu-plugin from a zip

Add the package to the composer.json repositories section. Is important to define the exact version of the mu-plugin
    
    {
        "type"   : "package",
        "package": {
          "name"   : "plugin/mu-plugin-name",
          "type"   : "wordpress-muplugin",
          "version": "dev-master",
          "source" : {
              "url"  : "https://downloads.wordpress.org/plugin/mu-plugin-name.1.6.5.zip",
              "type" : "zip",
              "reference": "master"
          }
        }
Add the dependency to the require section in the composer.json

    "plugin/mu-plugin-name": "1.6.5",   


## Save custom theme in Git

To store the “custom-theme-child” theme folder in Git you will need to modify your .gitignore file so that it doesn’t ignore this folder and its files but does continue to ignore everything else in wp-content. In this case the lines you would need to add to .gitignore would look like this:

# Don’t ignore themes dir, but ignore everything inside
!/wp-content/themes
/wp-content/themes/*

# Don’t ignore custom-theme-child theme
!/wp-content/themes/custom-theme-child


# Vagrant

## Create the .env file

Copy the .env.example  to .env

    cp /project/.env.example /project/.env
    
Change the following Values: 

* DB_NAME
* DB_USER
* DB_PASSWORD
* WP_ENV
* WP_HOME

###Important: You need to create the .env in order to make wordpress work, cause the wordpress config files read the information of the DB from the .env file

##Change the Vhost name

To change the vhost url you need to edit the puphepet/config.yaml file in the following sections:

    vagrantfile:
        vm:
            ...
            hostname: your-new-url

    apache:
        ...
        av_ib9oco2yqbx6:
            servername: your-new-url

##Change DB root password and DB name

To change the DB root password you need to edit the puphepet/config.yaml file in the following sections:

    mysql:
        ...
        users:
            settings:
                ...
                root_password: the-new-password

To change the DB  name you need to edit the puphepet/config.yaml file in the following sections:

    mysql:
        ...
        databases:
            settings:
                mysqlnd_vad1vtktz1xb
                    name: the-new-name



## To create a Database backup 

Go to the /misc folder an run the following command
    
    ./ get_sql_backup.sh

The backup will be create in pupphet/files
You cand update your database with the backup, by running the following command
    
    ./backend vagrant provision

If you edit the DB name and/or the root user password and/or the vhost URL you also need to edit the misc/get_sql_backup.sh

    ssh -i ../.vagrant/machines/default/virtualbox/private_key vagrant@the-new-url "mysqldump -uroot -pthe-new-root-pass  -h localhost the-new-db-name > backup.sql"
    scp -i ../.vagrant/machines/default/virtualbox/private_key vagrant@the-new-url:/home/vagrant/backup.sql ../puphpet/files/backup.sql

And the misc/get_sql_backup_from_deploy.sh
    ssh root@166.78.0.120 "mysqldump -u root -proot -h localhost the-new-db-name > wordpress_db_backup.sql"
    scp root@166.78.0.120:/root/wordpress_db_backup.sql puphpet/files/backup.sql

## To initialize the project 

Execute the following command:

    ./backend vagrant up

That will be run the following actions:

* Create the Database
* Install composer (Only the first time)
* Composer update (This will update the wordpress core and its dependencies)
* Update the DB with the backup (Only the first time and if the backup.sql exists)





