FROM ubuntu:16.04

USER root

RUN apt-get update && apt-get install -y curl libunwind8 gettext apt-transport-https

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg

RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

RUN apt-get update
RUN apt-get install dotnet-sdk-2.0.0

RUN export PATH=$PATH:$HOME/dotnet
RUN dotnet --version