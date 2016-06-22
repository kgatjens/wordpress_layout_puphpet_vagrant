# Base Project: Wordpress as dependency with Composer, using Vagrant/Puppet portable environment

## To mirror this repository please do the following:

    # Make a bare clone of the repository
	git clone --bare https://github.com/hangarlabs/base-wordpress-composer.git

	# Mirror-push to the new repository (for example an existing bitbucket repo)
	cd base-wordpress-composer.git
	git push --mirror https://github.com/hangarcr/[new-repository].git

	# Remove our temporary local repository    
	cd ..
	rm -rf base-wordpress-composer.git


## Requirements:
* Have installed ruby [RVM](http://rvm.io/)

* Download and Install the latest version of [VirtualBox](https://www.virtualbox.org/wiki/Downloads). If you have Virtual Box already installed, please make sure you update the version to at least 4.3.6

* Download their Extension Pack [at the same link](https://www.virtualbox.org/wiki/Downloads).

* Download and Install latest version [Vagrant](http://www.vagrantup.com/downloads.html). If you already have an older version o vagrant please uninstall it using "gem uninstall vagrant" before attempting to install the new one.

