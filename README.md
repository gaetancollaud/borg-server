# Borg Backup Server Container

### Description

My take on a Borgbackup Server as a Docker container to facilitate the backing up of remote machines using [Borgbackup](https://github.com/borgbackup). Forked from [grantbevis/borg-server](https://github.com/grantbevis/borg-server).

### Usage with docker-compose

Put your public key in the PUBLIC_KEY environment variables. It will automatically be added.
Another possibility is to mount the authorized_keys under /home/borg/.ssh/authorized_keys

```yaml
services:
  borg-server:
    restart: always
    image: ghcr.io/gaetancollaud/borg-server
    ports:
      - 2222:22
    environment:
      - PUBLIC_KEY=ssh-rsa AAA...  # Option with public key in env
    volumes:
      # - ./.ssh:/home/borg/.ssh # Option with folder mount
      - ./backups:/backups
```
