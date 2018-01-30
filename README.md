# backwrap

A bash based wrapper for creating backups with borg.

Compared to the well-known borgmatic, this wrapper follows another
philosophy. It aims to have no dependencies other than bash, flock and
the utilities like date and find that are most likely to be present
on every GNU/Linux system.

In addition to regular files and directories, backwrap can
automatically snapshot btrfs subvolumes before backing them up, which
is a must when consistency matters (e.g. for database backups).

It's configuration is very simple and should be doable in under 5 minutes.

Also, backwrap integrates nicely with crontab and provides a built-in
command for generating a suitable crontab entry with no effort. You
specify the desired backup interval, and backwrap does the rest
for you.


## Setup

1. Clone the repository.

       git clone https://github.com/efficiosoft/backwrap

2. Adapt the sample configuration to your needs.

       cd backwrap
       cp backup.cfg.sample backup.cfg
       vim backup.cfg
       # ... make your changes as documented in the sample configuration

3. Run backwrap.

       CONFIG=backup.cfg ./backwrap

4. Optionally, set up a cronjob to take backups regularly.

       mkdir /etc/backwrap.d
       cp backup.cfg /etc/backwrap.d
       CONFIG=/etc/backwrap.d ./backwrap gen-crontab > /etc/cron.d/backwrap


## Upgrade

Simply pull upgrades from the master branch.

    cd /path/to/your/backwrap/repository
    git pull
