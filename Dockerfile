FROM debian:12-slim

# עדכונים
RUN apt-get update && apt-get upgrade -y

# התקנת כלים בסיסיים + Java + PHP
RUN apt-get install -y \
    php-cli \
    php-mbstring \
    php-xml \
    curl \
    wget \
    unzip \
    default-jre-headless \
    bash

# התקנת signal-cli
WORKDIR /opt
RUN wget https://github.com/AsamK/signal-cli/releases/download/v0.11.10/signal-cli-0.11.10-Linux.tar.gz \
    && tar -xzf signal-cli-0.11.10-Linux.tar.gz \
    && mv signal-cli-0.11.10 signal-cli \
    && ln -s /opt/signal-cli/bin/signal-cli /usr/local/bin/signal-cli

# תיקיית עבודה לבוט
WORKDIR /app
COPY . .

RUN chmod +x start.sh

CMD ["bash", "start.sh"]
