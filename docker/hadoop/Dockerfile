# === Stage 1: JDK, Linux Package Build ===

ARG JDK_VERSION=8-jdk-slim-buster

FROM openjdk:${JDK_VERSION}

RUN apt-get update -yqq \
    && apt-get upgrade -yqq \
    && apt-get install -yqq --no-install-recommends \
        apt-utils \
        curl \
        wget \
        netcat \
    && apt-get autoremove -yqq --purge \
    && rm -rf /var/lib/apt/lists/*

# === Stage 2: Hadoop Build ===

ARG USER_DEFINED_HADOOP_VERSION=3.3.6
ARG HADOOP_VERSION=${USER_DEFINE_HADOOP_VERSION:-3.3.6}
ARG HADOOP_URL=http://apache.mirror.cdnetworks.com/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz

ENV HADOOP_HOME=/opt/hadoop

ENV PATH=${HADOOP_HOME}/bin/:${PATH} \
    HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop \
    YARN_CONF_DIR=${HADOOP_HOME}/etc/hadoop \
    HADOOP_OPTS="-Djava.library.path=${HADOOP_HOME}/lib/native"

RUN mkdir -p ${HADOOP_HOME} ${HADOOP_HOME}/logs /data

RUN wget -c -O hadoop.tar.gz ${HADOOP_URL} \
    && tar -zxvf hadoop.tar.gz --directory=${HADOOP_HOME} --exclude=hadoop-${HADOOP_VERSION}/share/doc --strip 1 \
    && rm -rf hadoop.tar.gz

# === Stage 3: Copy Configs and Binary files ===

COPY --chmod=755 ./docker/hadoop/conf/ ${HADOOP_CONF_DIR}

COPY --chmod=755 ./docker/hadoop/bin /bin/
