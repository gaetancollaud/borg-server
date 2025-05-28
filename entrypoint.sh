#!/bin/sh

mkdir -p /home/borg/.ssh

if [[ -z "${PUBLIC_KEY}" ]]; then
  echo="No PUBLIC_KEY environment defined, be sure to mount the SSH key manually in /home/borg/.ssh/authorized_keys"
else
  echo "Adding PUBLIC_KEY to /home/borg/.ssh/authorized_keys"
  echo "${PUBLIC_KEY}" > /home/borg/.ssh/authorized_keys
fi

chown -R borg:borg /home/borg/.ssh
chmod 600 /home/borg/.ssh/authorized_keys || echo "ERROR could not find any authorized_keys file, please check the PUBLIC_KEY environment variable"

chown -R borg:borg /backups

/usr/bin/supervisord
