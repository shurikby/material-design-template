# Assessment report:
## Commands used in linux VM:
**There is also a script provided for automatic deployment. You can find it in Assessment report/deploy.sh**

~~~
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install nginx git
sudo systemctl status nginx
git config --global user.name "*********”
git config --global user.email "********"
git clone https://github.com/shurikby/material-design-template.git
ssh-keygen
cat /home/shurik/.ssh/id_rsa.pub
git remote set-url origin git@github.com:shurikby/material-design-template
cp /etc/nginx/sites-available/default ~/default.bak  #making backup of nginx site configuration
sudo vi /etc/nginx/sites-available/default
sudo nginx -T   # test and show nginx configuration
sudo systemctl restart nginx
crontab -e
sudo systemctl restart cron
grep CRON /var/log/syslog   # check if job is actually running
~~~

## Cronjob

    * * * * * /bin/sh -c 'cd /home/shurik/material-design-template && /usr/bin/git pull origin master' 2>&1 | /usr/bin/logger -t CRON_gitpull
I am sending an output of cronjob to syslog to confirm that everything works as expected. 
Here is `grep CRON /var/log/syslog` output (screenshot is also available in "Assessment report" folder):
~~~
Oct  8 14:42:01 ubuntu CRON[2355]: (shurik) CMD (/bin/sh -c 'cd /home/shurik/material-design-template && /usr/bin/git pull origin master' 2>&1 | /usr/bin/logger -t CRON_gitpull)
Oct  8 14:42:03 ubuntu CRON_gitpull: From github.com:shurikby/material-design-template
Oct  8 14:42:03 ubuntu CRON_gitpull:  * branch            master     -> FETCH_HEAD
Oct  8 14:42:03 ubuntu CRON_gitpull: Already up to date.
Oct  8 14:43:01 ubuntu CRON[2371]: (shurik) CMD (/bin/sh -c 'cd /home/shurik/material-design-template && /usr/bin/git pull origin master' 2>&1 | /usr/bin/logger -t CRON_gitpull)
Oct  8 14:43:03 ubuntu CRON_gitpull: From github.com:shurikby/material-design-template
Oct  8 14:43:03 ubuntu CRON_gitpull:  * branch            master     -> FETCH_HEAD
Oct  8 14:43:03 ubuntu CRON_gitpull: Already up to date.
Oct  8 14:44:01 ubuntu CRON[2382]: (shurik) CMD (/bin/sh -c 'cd /home/shurik/material-design-template && /usr/bin/git pull origin master' 2>&1 | /usr/bin/logger -t CRON_gitpull)
Oct  8 14:44:02 ubuntu CRON_gitpull: From github.com:shurikby/material-design-template
Oct  8 14:44:02 ubuntu CRON_gitpull:  * branch            master     -> FETCH_HEAD
Oct  8 14:44:02 ubuntu CRON_gitpull: Already up to date.
Oct  8 14:45:01 ubuntu CRON[2395]: (shurik) CMD (/bin/sh -c 'cd /home/shurik/material-design-template && /usr/bin/git pull origin master' 2>&1 | /usr/bin/logger -t CRON_gitpull)
Oct  8 14:45:03 ubuntu CRON_gitpull: From github.com:shurikby/material-design-template
Oct  8 14:45:03 ubuntu CRON_gitpull:  * branch            master     -> FETCH_HEAD
Oct  8 14:45:04 ubuntu CRON_gitpull: Already up to date.
Oct  8 14:46:01 ubuntu CRON[2406]: (shurik) CMD (/bin/sh -c 'cd /home/shurik/material-design-template && /usr/bin/git pull origin master' 2>&1 | /usr/bin/logger -t CRON_gitpull)
Oct  8 14:46:02 ubuntu CRON_gitpull: From github.com:shurikby/material-design-template
Oct  8 14:46:02 ubuntu CRON_gitpull:  * branch            master     -> FETCH_HEAD
Oct  8 14:46:02 ubuntu CRON_gitpull:    9ac5de8..4a7b237  master     -> origin/master
Oct  8 14:46:02 ubuntu CRON_gitpull: Updating 9ac5de8..4a7b237
Oct  8 14:46:02 ubuntu CRON_gitpull: Fast-forward
Oct  8 14:46:02 ubuntu CRON_gitpull:  README.md      | 16 +++++++++-------
Oct  8 14:46:02 ubuntu CRON_gitpull:  www/index.html |  2 +-
Oct  8 14:46:02 ubuntu CRON_gitpull:  2 files changed, 10 insertions(+), 8 deletions(-)
~~~

## Nginx configuration

file `/etc/nginx/sites-available/default`:
~~~
---	root /var/www/html;
+++	root /home/shurik/material-design-template/www;
~~~
I have changed web root path to the folder containing git repository in my home folder.

## Git hook
You can find a script file and screenshot of the result in the report folder. 
I have to use "-n" key now to commit it.














<h1>Material Design One Page HTML Template</h1>
<p>MD One page template is fully responsive and free to use. This HTML template is based on <a href="http://materializecss.com/">Materialize</a>, a CSS Framework based on Material Design.</p>
<a href="http://joashpereira.com/templates/material_one_pager/">View Demo</a>
<br/>
<h3>Screenshots</h3>
<img src="https://m1.behance.net/rendition/modules/155787441/disp/f7713eb665752f2da380ec8f7a3cdcae.png" height="300px"/> <img src="https://m1.behance.net/rendition/modules/155787447/disp/e546efd70f5b46e45829e0da79375243.png" height="300px"/>
<br/>
<a href="https://www.behance.net/gallery/23484793/Material-Design-One-Page-Template">View More Screens</a>
<h3>Platforms used</h3>
HTML, CSS, JS

<h3>Resources</h3>
<ul>
    <li><a href="http://materializecss.com/">Materialize</a></li>
    <li><a href="http://www.materialpalette.com/">Material Design Colors</a></li>
</ul>

<h2>License</h2>
Material Design One Page HTML Template is licensed under the <a href="http://sam.zoy.org/wtfpl/">WTFPL license</a>.
