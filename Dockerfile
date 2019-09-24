FROM ubuntu:18.04
RUN apt-get update && apt-get install -y build-essential less vim
RUN apt-get install -y libglib2.0-dev git python
WORKDIR /app
RUN git clone https://github.com/beckus/qemu_stm32.git
RUN git clone https://github.com/lupyuen/stm32bluepill-unittest
WORKDIR /app/qemu_stm32
RUN git submodule update --init pixman && git submodule update --init dtc
RUN ./configure --enable-debug --target-list="arm-softmmu" --python=python2 --disable-cocoa
RUN apt-get install -y autoconf libtool
#RUN make

CMD ["/bin/bash", "-c", "sleep 100000"]
