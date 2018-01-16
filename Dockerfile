FROM ubuntu:16.04

USER root
RUN sudo apt-get update; sudo apt-get install curl
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg

RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

RUN apt-get update
RUN apt-get install dotnet-sdk-2.0.0

RUN export PATH=$PATH:$HOME/dotnet
RUN dotnet --version