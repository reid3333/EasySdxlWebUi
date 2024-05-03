FROM ubuntu:jammy

RUN sed -ie 's;http://archive.ubuntu.com/;http://jp.archive.ubuntu.com/;' /etc/apt/sources.list \
    && apt-get update && apt-get install -y python3 python3-pip python3-venv sudo aria2 curl git \
    && curl -LO https://github.com/PowerShell/PowerShell/releases/download/v7.4.2/powershell_7.4.2-1.deb_amd64.deb \
    && apt-get install -y ./powershell_7.4.2-1.deb_amd64.deb \
    && apt-get clean \
    && rm -f powershell_7.4.2-1.deb_amd64.deb \
    && rm -rf /var/lib/apt/lists/*

COPY *.bat *.md *.txt /EasySdxlWebUi/
COPY Download/ /EasySdxlWebUi/Download/
COPY SdxlWebUi/ /EasySdxlWebUi/SdxlWebUi/

WORKDIR "/EasySdxlWebUi/"
CMD ["/bin/bash"]

