FROM nginx:latest
COPY . /usr/share/nginx/html
EXPOSE 5000

USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \ 
https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \ 
signed-by=/usr/share/keyrings/docker-archive-keyring.asc) \
https://download.docker.com/linux/debian \
$(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list


RUN groupadd docker  && usermod -aG docker jenkins
RUN apt-get update  && apt-get install -y docker-ce-cli

RUN touch /var/run/docker.sock && chown jenkins /var/run/docker.sock
USER jenkins

