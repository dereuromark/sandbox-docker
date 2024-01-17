cd sandbox

# Note: If you dont have ssh keys set up for local GIT, you can use https instead.
git clone git@github.com:dereuromark/cakephp-sandbox.git

cd cakephp-sandbox/

# If you have local composer set up, you can also directly use that as well
[ ! -f composer.phar ] && curl -sS https://getcomposer.org/installer | php
php composer.phar selfupdate

php composer.phar install --prefer-dist

[ ! -f config/app_local.php ] && cp config/app_local.default.php config/app_local.php

# Now you can log in inside sandbox/ using ./shell.sh
