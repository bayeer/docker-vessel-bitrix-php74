# Docker for Bitrix CMS

This docker is based on https://github.com/shipping-docker/vessel


## Quick start

1. Clone this repo
```bash
cd ~/
git clone git@github.com:bayeer/docker-vessel-bitrix-php74.git
```

2. Copy and setup .env:
```bash
cd docker-vessel-bitrix-php74
cp .env.example .env
```

3. Start docker containers (or build them at first run):
```bash
cd ~/docker-vessel-bitrix-php74
./vessel start
```

4. Available vessel commands:
```bash
./vessel help
```


## Starting and Stopping Vessel

There's only a few commands to know to start or stop your containers. Database and Redis data is saved when you stop and restart Vessel.


### Starting Vessel

This will start your containers and listen on port 80 for web requests.

```bash
# Start the environment
./vessel start

## This is equivalent to
./vessel up -d
```


### Stopping Vessel

Stopping Vessel will stop the containers and destroy them. They get recreated when you start Vessel back up. Your data (database/cache) is saved between restarts.

```bash
# Stop the environment
./vessel stop

## This is equivalent to
./vessel down
```
