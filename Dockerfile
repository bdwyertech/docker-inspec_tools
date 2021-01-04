FROM ruby:2.7-alpine

ARG BUILD_DATE
ARG VCS_REF

LABEL org.opencontainers.image.title="bdwyertech/inspec_tools" \
      org.opencontainers.image.version=$VCS_REF \
      org.opencontainers.image.description="For running Mitre InSpec Tools" \
      org.opencontainers.image.authors="Brian Dwyer <bdwyertech@github.com>" \
      org.opencontainers.image.url="https://hub.docker.com/r/bdwyertech/inspec_tools" \
      org.opencontainers.image.source="https://github.com/bdwyertech/docker-inspec_tools.git" \
      org.opencontainers.image.revision=$VCS_REF \
      org.opencontainers.image.created=$BUILD_DATE \
      org.label-schema.name="bdwyertech/inspec_tools" \
      org.label-schema.description="For running Mitre InSpec Tools" \
      org.label-schema.url="https://hub.docker.com/r/bdwyertech/inspec_tools" \
      org.label-schema.vcs-url="https://github.com/bdwyertech/docker-inspec_tools.git"\
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE

RUN apk add --virtual .build-deps bash build-base curl \
    && gem install inspec_tools \
    && apk del .build-deps \
    && adduser inspec -h /home/inspec -D

USER inspec
WORKDIR /inspec

CMD ["bash"]
