FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
RUN dpkg --add-architecture i386 \
    apt-get update --fix-missing && apt-get install -y \       
    apt install wine \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*


USER gitpod
