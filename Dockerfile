FROM alpine:3.4
MAINTAINER PAWEL OCZADLY <paweloczadly@gmail.com>
LABEL Description="Fluentd docker image + systemd and kafka plugins" Vendor="SAP Hybris" Version="1.0"

RUN apk --no-cache --update add \
                            build-base \
                            ca-certificates \
                            make \
                            ruby \
                            ruby-irb \
                            ruby-dev && \
    echo 'gem: --no-document' >> /etc/gemrc && \
    gem install oj && \
    gem install fluentd                                  -v 0.12.26 --no-ri --no-rdoc && \
    gem install fluent-plugin-kubernetes_metadata_filter -v 0.23.0  --no-ri --no-rdoc && \
    gem install fluent-plugin-kafka                      -v 0.1.5   --no-ri --no-rdoc && \
    gem install fluent-plugin-elasticsearch              -v 1.5.0   --no-ri --no-rdoc && \
    apk del build-base ruby-dev && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

COPY fluent.conf /fluentd/etc/

ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="fluent.conf"

EXPOSE 24224 5140

CMD exec fluentd -v -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
