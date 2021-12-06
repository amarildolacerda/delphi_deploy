FROM gitpod/workspace-full:latest

USER gitpod

# Install .NET SDK (Current channel)
# Source: https://docs.microsoft.com/dotnet/core/install/linux-scripted-manual#scripted-install
RUN mkdir -p /home/gitpod/dotnet && curl -fsSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel Current --install-dir /home/gitpod/dotnet
RUN sudo apt update -y
RUN sudo apt install wine32 -y




ENV DOTNET_ROOT=/home/gitpod/dotnet
ENV PATH=$PATH:/home/gitpod/dotnet

