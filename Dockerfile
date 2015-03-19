FROM c12e/debian
MAINTAINER CognitiveScale.com

RUN VERSION=2.2.4 \
  && apt-get update \
  && apt-get install -y unzip \
  && wget http://downloads.typesafe.com/play/${VERSION}/play-${VERSION}.zip \
  && unzip -d /opt play-${VERSION}.zip \
  && rm -f play-${VERSION}.zip \
  && ln -s /opt/play-${VERSION} /opt/play \
  && update-alternatives --install "/usr/bin/play" "play" "/opt/play/play" 100 \
  && ln -s /activator-${VERSION}-minimal/activator /usr/local/bin/activator \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
