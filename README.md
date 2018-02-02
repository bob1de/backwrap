# backwrap

A bash based wrapper for creating backups with borg or restic.

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

       # This will show the usage options.
       ./backwrap
       # And this will take a backup.
       ./backwrap backup

4. Optionally, set up a cronjob to take backups regularly.

       mkdir /etc/backwrap.d
       mv backup.cfg /etc/backwrap.d
       CONFIG=/etc/backwrap.d ./backwrap gen-crontab > /etc/cron.d/backwrap


## Upgrade

Simply pull upgrades from the master branch.

    cd /path/to/your/backwrap/repository
    git pull


## Backing up to SFTP

When backing up to a SFTP server which listens on a port other than 22,
or which requires public key authentication with a key other than your
default ``id_rsa``, you can create a custom host configuration in
``~/.ssh/config``:

    Host backup_host
      Hostname my-backup-server.de
      Port 12322
      User backup_user
      IdentityFile /root/.ssh/id_rsa_backup
      LogLevel ERROR

The ``LogLevel ERROR`` causes OpenSSH to not print a warning when the
host's IP address changed, which will happen when using dynamic DNS.

Now, you just need to specify the repository in the backwrap config
like so:

    RESTIC_REPO="sftp://backup_host/restic"

or

    BORG_REPO="backup_host:borg"
