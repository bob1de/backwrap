# borgwrapper

A bash based wrapper for creating backups with borg.

Compared to the well-known borgmatic, this wrapper follows another
philosophy. It aims to have no dependencies other than bash, flock and
the utilities like date and find that are most likely to be present
on every GNU/Linux system.

In addition to regular files and directories, borgwrapper can
automatically snapshot btrfs subvolumes before backing them up, which
is a must when consistency matters (e.g. for database backups).

It's configuration is very simple and should be doable in under 5 minutes.

Also, borgwrapper integrates nicely with crontab and provides a built-in
command for generating a suitable crontab entry with no effort. You
specify the desired backup interval, and borgwrapper does the rest
for you.
