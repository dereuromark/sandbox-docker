# Docker for Sandbox

Docker Container Setup for the sandbox including
- PHP 8.2
- Mysql (MariaDB 10)
- Traefik HTTPS

See https://github.com/dereuromark/sandbox for the main repo.

## Installation

Check out the repo, e.g. using

    git clone https://github.com/dereuromark/sandbox-docker.git

You can configure each `docker-compose.yml` if needed.

Then run

    ./install.sh

which should download the sandbox repo.

Then:

    ./up.sh

which will start all containers.

Then you can log in into main "sandbox" one using

    ./shell.sh

Now you need to finish the installation inside using

    ./install.sh

directly in that directory (/var/www/).

Once done, it should be all up and running.

## Usage
When reinstalling, make sure to not use install.sh anymore inside, but

    ./setup.sh

It will not try to create databases or seed them anymore.

## Log out

Type `exit;` and press enter.
You can down the containers from the root dir using `./down.sh`.
