## Installation
1. Register a Slack app at https://api.slack.com/apps
2. Copy the file .env.sample to .env
3. Fill out the following fields:
    - SECRET_KEY (follow instructions in the comments at the top of .env)
    - SLACK_KEY (this is called "Client ID" in Slack admin)
    - SLACK_SECRET (this is called "Client Secret" in Slack admin)
    - DATABASE_URL (run your own local copy of Postgres, or use a cloud service)
    - REDIS_URL (run your own local copy of Redis, or use a cloud service)
    - URL (the public facing URL of your installation)
    - AWS_ (all of the keys beginning with AWS) 
    - SECRET_KEY (follow instructions in the comments at the top of .env)
    - SLACK_KEY (this is called "Client ID" in Slack admin)
    - SLACK_SECRET (this is called "Client Secret" in Slack admin)
4. Configure your Slack app's Oauth & Permissions settings
    - Add http://localhost:3000/auth/slack.callback as an Oauth redirect URL
    - Ensure that the bot token scope contains at least users:read
#### Requires the following dependencies:
    - Docker
    - AWS S3 bucket or compatible API for file storage
    - Slack or Google developer application for authentication