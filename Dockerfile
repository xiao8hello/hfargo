FROM ubuntu

RUN apt update && apt install -y wget curl unzip nodejs npm git

USER root

WORKDIR /tmp

COPY install.sh install.sh

# 哪吒面板，可以不装
COPY agent.sh agent.sh

RUN ["chmod", "+x", "install.sh"]

RUN npm install -g hexo-cli

# CMD [ "/bin/bash" ]

CMD [ "bash", "./install.sh" ]

