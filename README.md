---
Title: Portfolio Website Drupal Template 
Author: Myeong Lee 
Email: deeper.myeong.lee@gmail.com
Date: February 2018
---

# Portfolio Website Drupal Template 

This is an empty template for anybody who is interested in setting up a Drupal-based portpolio website. This template is desigend and developed by Myeong Lee, and feel free to modify it when you use it. This repository is under the GNU GPL license. 
To see how this template looks, check out [Myeong's website](http://myeonglee.com).

## Pre-requisites
You need to have the following software installed on your PC:
- Vagrant 1.8.6
- VirtualBox 5.1.6
- Ansible 2.1.0 
- Python 2.x

If you're using a Windows machine, Ansible is not available -- you need to install required packages inside your Vagrant machine (once it's up). For the software packages required, see `vm/basic/playbook.yml`. 

Also, after you install everything, you need to know how to use Drupal to configure the website properly. 

## Local Environment Set-up

1. Clone this repo to your computer.
2. On your command line, run the following command to download and configure a Vagrant machine (Ubuntu Xenial running on VirtualBox):
```
cd vm/basic/
vagrant up
```
This will take a while. Grab a cup of coffee...
If you face any issues while running the Vagrant scripts, it's mostly software version issues. If you cannot resolve it, contact Myeong. 

3. Once a Vagrant machine is up, it's ready to be used. You can access to the machine by typing:
``` 
vagrant ssh
```
When you're done using the machine, type `vagrant halt` to turn the machine off. The Ubuntu image is saved, but it's removed from your memory space. 
You can start developing the portfolio in `html`, and it will automatically applied to the Ubuntu machine. 

4. Migrate `DB/portfolio.sql` to the MySQL DB running on the Vagrant machine. The default ID/Password is `root` and `root`. You can change it once you SSH into the machine (chaging credential is recommended for the security purpose). 

5. Copy `html/sites/default/themes/default.settings.php` to `html/sites/default/themes/settings.php`. Inside this file, modify the DB information (if applicable).

6. You can access your development website by going to `192.168.33.13` on your browser.

7. Enabling Clean URLs
	- Open `/etc/apache2/apache2.conf`, go to the line where `<Directory "/var/www/">` is at, and modify the line `AllowOverride None` to `AllowOverride All`. 	
	- Then clean URL works for Drupal sites. 

8. Once development is done, you can deploy `html` folder to your own server (you can make use of the Ansible scripts to configure your server automatically).


[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
