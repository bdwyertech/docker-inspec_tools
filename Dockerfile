FROM ruby:2.7-alpine

RUN apk add --virtual .build-deps build-base curl \
    && gem install inspec_tools \
    && apk del .build-deps

RUN apk add bash

CMD ["bash"]
