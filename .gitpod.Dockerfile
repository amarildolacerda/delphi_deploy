FROM gitpod/workspace-full-vnc:latest

USER root


RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y install cabextract libxext6 libxext6:i386 libfreetype6 libfreetype6:i386

RUN sudo dpkg --add-architecture i386  
RUN sudo apt-get update  
RUN apt-get install -y \
      wine \
      wine32 \
      wine64 \
      libwine \
      libwine:i386 \
      fonts-wine

# finaliza
#RUN apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# Expose the PostgreSQL port
# EXPOSE 5432

USER gitpod


