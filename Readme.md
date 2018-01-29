# Bibliothecary Web

A way of running bibliothecary and it's related services as a standalone REST API

Uses docker-compose to put all the pieces together and run them all together.

Useful for analysing dependencies without going outside of a local network

Currently using a branch of bibliothecary to enable configuration of parser urls: https://github.com/librariesio/bibliothecary/pull/412

## Install

Install the ruby dependencies:

```shell
bundle install
```

Pull all the docker images:

```shell
docker-compose up --build
```

Access the API on: http://locahost:5000

## API

POST to /identify_manifests with JSON like:

```json
{"file_names": ["package.json", "index.html", "styles.css"]}
```

POST to /analyse_file with JSON like:

```json
{"file_name": "package.json", "file_contents": "contents of package.json file"}
```
