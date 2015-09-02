ignitespeak
===========

Speaker and speaking proposal management system for [Ignite Baltimore](http://www.ignitebaltimore.com/). We use this app to accept speaking proposals and to produce various documents needed to run each event. This is also the hub where speakers upload their presentations. The app currently runs at [speak.ignitebaltimore.com](http://speak.ignitebaltimore.com/)

We'd like to expand it to be useful for all [Ignite projects worldwide](http://igniteshow.com/). Check out our [Issues page](https://github.com/ignitebaltimore/ignitespeak/issues) for examples of what needs to happen. Join us!

Build Status
============
* TODO add some public CI build status graphics a la http://docs.travis-ci.com/user/status-images/

Badges:
=======
[![Code Climate](https://codeclimate.com/github/trendwithin/ignitespeak/badges/gpa.svg)](https://codeclimate.com/github/trendwithin/ignitespeak)
[![Test Coverage](https://codeclimate.com/github/trendwithin/ignitespeak/badges/coverage.svg)](https://codeclimate.com/github/trendwithin/ignitespeak/coverage)
[Code Ship](https://codeship.com/projects/45ea7ba0-3359-0133-3797-32e25a7c007a/status?branch=master)
Requirements
============
Ruby 2.2+
Postgres 9.0+

Setup Instructions
==================

``` cp sample.env .env ```
You can edit this file to have your own secret token and login information.

Open config/database.yml and configure
```username: subelsky```
to be the username in your environment

Setup the database in your environment
```rake db:setup```

Add a proposal to the database
```rake db:seed```

To get your own ignitespeak app up and running, click the button
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


Contributors
============
* Original coding by [Mike Subelsky](http://www.subelsky.com/)
