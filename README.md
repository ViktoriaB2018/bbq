# BBQ (barbecue)

## Application for invitations to events
### You can create events, subscribe to events, write comments, add photos.

* Ruby version 2.5.3
* Rails version 5.2.2
* Deploy - Heroku

#### Before running

```
bundle install
bundle exec rake db:migrate
```

#### For production environment

You need set up variable environments

Amazon S3 Storage:

```
S3_BUCKET_REGION
S3_ACCESS_KEY
S3_SECRET_KEY
S3_BUCKET_NAME
```
SendGrid:

```
SENDGRID_USERNAME
SENDGRID_PASSWORD
```

#### For development environment

You need set up variable environments to config/application.yml with gem [figaro](https://github.com/laserlemon/figaro) or in another way as you want

```
GMAIL_USERNAME
GMAIL_PASSWORD
```
#### For development environment

VPS Digital Ocean

http://b-b-q.icu
