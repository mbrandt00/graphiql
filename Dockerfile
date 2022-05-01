FROM ruby:2.7.4
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list 
RUN apt update && apt -y install nodejs yarn
RUN mkdir /app
WORKDIR /app 

COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh 
ENTRYPOINT ["/app/docker-entrypoint.sh"]
