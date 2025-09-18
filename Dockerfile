FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow.sh /app/wisecow.sh

RUN sed -i 's/\r$//' /app/wisecow.sh && chmod +x /app/wisecow.sh

# Add /usr/games to PATH for fortune/cowsay
ENV PATH="/usr/games:${PATH}"

EXPOSE 4499

CMD ["./wisecow.sh"]
