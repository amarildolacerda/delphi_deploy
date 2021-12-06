FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
RUN dpkg --add-architecture i386 
RUN apt-get update --fix-missing 
RUN apt-get list --upgradable
RUN apt-get install -y  
RUN apt-get install wine32

# finaliza
RUN apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*


USER gitpod
