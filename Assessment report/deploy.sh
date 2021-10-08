#! /usr/bin/env bash
name="********"
email="*******"
github_user="shurikby"
github_repo="material-design-template"
repository_key_path="/home/shurik/.ssh/id_rsa"


location=$(dirname $(realpath -s $0))
webroot="${location}/${github_repo}/www"

echo "####################################"
echo "###     Website deployment       ###"
echo "####################################"
echo "###   Installing nginx and git"
sudo apt-get update
sudo apt-get install nginx git -y 
echo "###   Configuring git "
git config --global user.name "$name"
git config --global user.email "$email"
echo "###   Cloning repository "
git clone https://github.com/${github_user}/${github_repo}.git
if [[ ! -f "$repository_key_path" ]]; then
	echo "###   Generating a key for github"
	ssh-keygen -q -t rsa -N '' -f "$repository_key_path"
	cat  ${repository_key_path}.pub
	read -p "###    Add key to github and press [Enter] key to continue..."
else
	echo "###    The key is already existing, skipping this step"
fi
cd ./${github_repo}
git remote set-url origin git@github.com:${github_user}/${github_repo}
echo "###   Configuring nginx"
cp /etc/nginx/sites-available/default ${location}/default.bak  #making backup of nginx site configuration
sudo sed -i "s|/var/www/html|$webroot|g" "/etc/nginx/sites-available/default"
sudo nginx -t   # test and show nginx configuration
sudo systemctl restart nginx
systemctl is-active --quiet nginx && echo "###   Nginx is installed successfuly" || "### Nginx is not running, check configuration manualy"
echo "###   Installing cron job"
crontab -l > cron.tmp
echo "* * * * * /bin/sh -c 'cd ${location}/${github_repo} && /usr/bin/git pull origin master' 2>&1 | /usr/bin/logger -t CRON_gitpull" >> cron.tmp
crontab cron.tmp
rm cron.tmp
sudo systemctl restart cron
echo "###   Site is deployed" 




