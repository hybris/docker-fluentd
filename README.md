# docker-fluentd

Docker image with [fluentd](http://www.fluentd.org/) and the following plugins:

* [fluent-plugin-kubernetes_metadata_filter](https://rubygems.org/gems/fluent-plugin-kubernetes_metadata_filter/versions/0.23.0) (0.23.0)
* [fluent-plugin-kafka](https://rubygems.org/gems/fluent-plugin-kafka/versions/0.1.5) (0.1.5)

Supported platforms:

* CoreOS

## Usage

```bash
$ docker run -v <path-to-local-fluentd-conf>:/fluentd/etc -d teamidefix/fluentd
```
