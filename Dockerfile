FROM ubuntu:16.04

USER root

RUN apt-get update; apt-get install -y curl apt-transport-https apt-utils libunwind8 liblttng-ust0 libcurl3 libssl1.0.0 libuuid1 libkrb5 zlib1g libicu55

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg

RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'

RUN apt-get update

RUN apt-get install -y dotnet-sdk-2.0.0

RUN export PATH=$PATH:$HOME/dotnet

RUN dotnet --version