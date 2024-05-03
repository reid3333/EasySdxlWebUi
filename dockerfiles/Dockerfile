FROM ubuntu:jammy

RUN sed -ie 's;http://archive.ubuntu.com/;http://jp.archive.ubuntu.com/;' /etc/apt/sources.list \
    && apt update && apt install -y python3 python3-pip python3-venv \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY *.bat *.md *.txt /EasySdxlWebUi/
COPY Download/ /EasySdxlWebUi/Download/
COPY SdxlWebUi/ /EasySdxlWebUi/SdxlWebUi/

WORKDIR "/EasySdxlWebUi/"
CMD ["/bin/bash"]

