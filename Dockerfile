FROM ubuntu:22.04

# עדכונים
RUN apt update && apt upgrade -y

# התקנת PHP + כל מה שצריך
RUN apt install -y php php-cli php-mbstring php-xml curl wget unzip default-jre bash

# התקנת signal-cli
RUN wget https://github.com/AsamK/signal-cli/releases/download/v0.11.10/signal-cli-0.11.10-Linux.tar.gz && \
    tar -xvzf signal-cli-0.11.10-Linux.tar.gz && \
    mv signal-cli-0.11.10 /opt/signal-cli && \
    ln -s /opt/signal-cli/bin/signal-cli /usr/local/bin/signal-cli

# הוספת קבצי הבוט
WORKDIR /app
COPY . .

# ודא שהסקריפט ניתן להרצה
RUN chmod +x start.sh

# סטארט פקודה שמריצה את הבוט
CMD ["bash", "start.sh"]
