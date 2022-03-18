FROM alpine:3.11

ENV GRADLE_VERSION=6.1.1
ENV CACERTIFICATES_VERSION=20191127-r1
ENV JAVA_VERSION=11.0.5_p10-r0

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

VOLUME /data

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

WORKDIR /data

ENTRYPOINT ["gradle"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="gradle" \
      "org.label-schema.base-image.name"="docker.io/library/alpine" \
      "org.label-schema.base-image.version"="3.11" \
      "org.label-schema.description"="Gradle in a container" \
      "org.label-schema.url"="https://gradle.org/" \
      "org.label-schema.vcs-url"="https://github.com/FXinnovation/fx-docker-gradle" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.gradle.version"=$GRADLE_VERSION \
      "org.label-schema.applications.ca-certificates.version"=$CACERTIFICATES_VERSION \
      "org.label-schema.applications.openjdk.version"=$JAVA_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="docker run --rm $(pwd):/data fxinnovation/gradle tasks"
