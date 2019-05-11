FROM appleboy/drone-facebook:1.5.1-linux-amd64

# Github labels
LABEL "com.github.actions.name"="Facebook Notify"
LABEL "com.github.actions.description"="Sending a Facebook message"
LABEL "com.github.actions.icon"="message-square"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/appleboy/facebook-action"
LABEL "homepage"="https://github.com/appleboy"
LABEL "maintainer"="Bo-Yi Wu <appleboy.tw@gmail.com>"
LABEL "version"="0.0.2"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
