FROM alpine as base
RUN apk add --no-cache git
WORKDIR /git
RUN git clone https://github.com/outline/outline.git

FROM node:14-alpine
LABEL author="Dương Đức Nam <nampt1999@gmail.com>"

EXPOSE 80
WORKDIR /app
ENV PORT                        80
ENV FORCE_HTTPS                 false
ENV ENABLE_UPDATES              true
ENV DEBUG                       cache,presenters,events
ENV SLACK_MESSAGE_ACTIONS       true
ENV AWS_S3_FORCE_PATH_STYLE     true
ENV AWS_S3_ACL                  private
ENV NODE_ENV                    production-ssl-disabled

COPY --from=base /git/outline /app
RUN yarn install --silent
RUN yarn build

CMD yarn sequelize:migrate --env=production-ssl-disabled && yarn start