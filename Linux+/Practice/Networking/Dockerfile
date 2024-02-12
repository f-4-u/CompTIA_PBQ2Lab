FROM alpine:latest AS fetcher

# Install git
RUN apk add --update --no-cache \
    curl \
    && rm -rf /var/cache/apk/*
WORKDIR /app

RUN curl -o taskchecker.sh https://raw.githubusercontent.com/f-4-u/CompTIA_PBQ2Lab/main/bin/taskchecker.sh \
    && curl -o tasks.txt https://raw.githubusercontent.com/f-4-u/CompTIA_PBQ2Lab_Tasks/main/Linux%2B/Practice/Networking/tasks.txt

RUN echo 'echo' >> /root/.bashrc \
&& echo 'echo "You automatically switch to the lab environment!' >> /root/.bashrc \
&& echo 'You can leave it with \"exit"\"' >> /root/.bashrc \
&& echo 'echo' >> /root/.bashrc

RUN touch /root/.bash_history \
&& echo 'export HISTFILE="$HOME/.bash_history"' >> /root/.bashrc \
&& echo 'export HISTSIZE=1000' >> /root/.bashrc \
&& echo 'export HISTFILESIZE=2000' >> /root/.bashrc \
&& echo 'export HISTCONTROL=ignoredups:ignorespace' >> /root/.bashrc \
&& echo "PROMPT_COMMAND='history -a'" >> /root/.bashrc \
&& echo "history -w" >> /root/.bashrc \
&& chmod 600 /root/.bash_history

RUN echo 'alias tasks="cat /tasks/README.md"' >> /root/.bashrc
RUN echo 'tasks' >> /root/.bashrc

FROM debian:stable-slim

# Update package lists and install necessary utilities
RUN apt-get update \
    && apt-get install -y \
      bash\
      iproute2\
      net-tools\
      dnsutils\
    && rm -rf /var/lib/apt/lists/*

COPY --from=fetcher /app/tasks.txt /app/tasks.txt
COPY --from=fetcher /app/taskchecker.sh /usr/local/bin/validate
COPY --from=fetcher /root /root
COPY .env /app/.env

ENV HOSTNAME=powerstation

RUN chmod +x /usr/local/bin/validate
RUN echo "${HOSTNAME}}" > /etc/hostname

ENV PATH="/usr/local/bin/:$PATH"

# Keep container running
CMD [ "tail", "-f", "/dev/null" ]
