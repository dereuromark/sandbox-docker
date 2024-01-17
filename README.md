# Docker for Sandbox

Docker Container Setup for the sandbox including
- PHP 8.2
- Mysql
- Traefic HTTPS

See https://github.com/dereuromark/sandbox for the main repo.

## Installation

Check out the repo, e.g. using

    git clone https://github.com/dereuromark/sandbox-docker.git

Then run

    ./setup.sh

which should download the sandbox repo.

Then:

    ./up.sh

which will start all containers.

Then you can log in into main "sandbox" one using

    ./shell.sh

Now you need to finish the installation using

    ./install.sh

directly in that directory (/var/www/).

Once done, it should be all up and running.

## Usage
When reinstalling, make sure to not use install.sh anymore, but

    ./setup.sh

It will not try to create databases or seed them anymore.

## Log out

Type `exit;` and press enter.
You can down the vms inside the root dir using `./down.sh`.
