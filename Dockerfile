# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# Install Python.
ARG TEMPIO_VERSION BUILD_ARCH
RUN \
#    curl -sSLf -o /usr/bin/tempio \
#    "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}"
    apk add --no-cache python3 py3-pip

# Download the Chambers code.
RUN \
    wget https://github.com/chrisgilldc/chambers/archive/refs/heads/master.zip &&\
    unzip master.zip &&\
    pwd &&\
    ls

# Install
RUN \
    pip install --break-system-packages ./chambers-master

# Copy root filesystem
#COPY rootfs /
COPY run.sh /
RUN chmod a+x /run.sh
RUN ls -al /

CMD [ "/run.sh" ]