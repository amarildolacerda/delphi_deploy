FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
RUN dpkg --add-architecture i386 && apt-get update  

RUN apt-get install -y \
      wine \
      wine32 \
      wine64 \
      libwine \
      libwine:i386 \
      fonts-wine

# finaliza
RUN apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*


USER gitpod
