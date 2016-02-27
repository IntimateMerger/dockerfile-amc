[![Circle CI](https://circleci.com/gh/IntimateMerger/dockerfile-amc/tree/master.svg?style=svg)](https://circleci.com/gh/IntimateMerger/dockerfile-amc/tree/master)

# Aerospike Management Console Dockerfile
Dockerfile for Aerospike Management Console

## How to use this image

### Environment

If you don't set the env, Rundeck use the default env.

```yml
TZ: Asia/Tokyo
```

### Example

```bash
$ docker run -d --name amc -p 8081:8081 intimatemerger/amc
```
