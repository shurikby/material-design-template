# Assessment report:
## Commands used in linux VM:
~~~
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install nginx git
sudo systemctl status nginx
git config --global user.name "Aliaksandr Aliaksandrau”
git config --global user.email "aliaksandra@playtika.com"
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

## Nginx configuration

file `/etc/nginx/sites-available/default`:
~~~
---	root /var/www/html;
+++	root /home/shurik/material-design-template/www;
~~~
I have changed path to web root to the folder containing git repository in my home folder.
















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
