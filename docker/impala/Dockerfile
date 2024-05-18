FROM keyhong/custom-base-hive:v1.0.0

ARG IMPALA_VERSION=4.3.0

ARG IMPALA_VERSION=${IMPALA_VERSION:-4.3.0}

ENV IMPALA_HOME=/opt/impala

ENV IMPALA_CONF_DIR=/etc/impala/conf

RUN mkdir -p ${IMPALA_HOME} {IMPALA_CONF_DIR}

ENV PATH=${IMPALA_HOME}/bin:${PATH}

ARG IMPALA_URL=http://apache.mirror.cdnetworks.com/impala/${IMPALA_VERSION}/apache-impala-${IMPALA_VERSION}.tar.gz

RUN wget -c -O impala.tar.gz ${IMPALA_URL} \
    && tar -zxvf impala.tar.gz --directory=${IMPALA_HOME} --strip 1 \
    && rm -rf impala.tar.gz

COPY ./conf/hadoop/core-site.xml ${IMPALA_CONF_DIR}

COPY ./conf/hadoop/hdfs-site.xml ${IMPALA_CONF_DIR}

# COPY --chmod=755 ./docker/hive/hiveserver2/startup.sh /startup.sh

# CMD [ "/startup.sh" ]


