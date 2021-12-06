FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
RUN dpkg --add-architecture i386 \
    && apt-get update --fix-missing \
    && apt-get list --upgradable && apt-get install -y \ 
    && apt-get install wine32 \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*


USER gitpod
