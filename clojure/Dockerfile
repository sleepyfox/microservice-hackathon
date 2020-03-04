FROM clojure:lein

# Install make
RUN apt -q update && apt install -yq curl iputils-ping telnet netcat whois

# Set group and user IDs for docker user
ARG GID=1000
ARG UID=1000
ARG USER=me

# Create the group and user
RUN groupadd -g $GID $USER
RUN useradd -g $GID -M -u $UID -d /var/app $USER

# Application setup
WORKDIR /var/app
RUN chmod 777 /var/app
USER $USER

COPY project.clj .
RUN lein deps
COPY . .
CMD ["lein", "run"]
