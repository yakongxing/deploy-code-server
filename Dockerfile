# Start from the code-server Debian base image
FROM bencdr/code-server-deploy-container:latest

# You can add custom software and dependencies for your environment here. Some examples:

# RUN code-server --install-extension esbenp.prettier-vscode
# RUN sudo apt-get install -y build-essential
# RUN COPY myTool /home/coder/myTool

# Install NodeJS
RUN sudo curl -fsSL https://deb.nodesource.com/setup_15.x | sudo bash -
RUN sudo apt-get install -y nodejs wget vim

# heroku-cli
RUN curl https://cli-assets.heroku.com/install.sh | sh

RUN cd /tmp && wget https://github.com/fatedier/frp/releases/download/v0.35.1/frp_0.35.1_linux_amd64.tar.gz && tar -xvf frp_0.35.1_linux_amd64.tar.gz && rm -rf frp_0.35.1_linux_amd64.tar.gz \
  && sudo mkdir /frp &&  cp -R /tmp/frp_0.35.1_linux_amd64/* /frp
