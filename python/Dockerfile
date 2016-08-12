FROM debian:jessie

ENV PYTHON_SOURCE Python.tgz
ENV PYTHON_VERSION 3.5.2

ADD https://www.python.org/ftp/python/"${PYTHON_VERSION}"/Python-"${PYTHON_VERSION}".tgz /"${PYTHON_SOURCE}"

RUN apt-get update && apt-get install -y \
    gcc \
    make \
    libssl-dev

WORKDIR /usr/src/Python
RUN tar x --strip-components=1 -f /"${PYTHON_SOURCE}" && rm /"${PYTHON_SOURCE}"

RUN ./configure --enable-shared \
    && make -j "$(nproc)" \
    && make install \
    && make clean \
    && ldconfig

CMD ["/bin/bash"]
