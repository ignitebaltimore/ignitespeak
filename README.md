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

[ ![Codeship Status for IgniteSpeak](https://codeship.com/projects/45ea7ba0-3359-0133-3797-32e25a7c007a/status?branch=master)](https://codeship.com/projects/100184)

Requirements
============
* [Git](https://git-scm.com/)
* [Ruby 2.2](https://www.ruby-lang.org/)
* [Bundler](http://bundler.io/) gem (see below)

There's a lot of ways to install Git and Ruby. Jumpstart Labs has [a good example](http://tutorials.jumpstartlab.com/topics/environment/environment.html)
but there are many others.

Setup
=====
1) Fork the `ignitebaltimore/ignitespeak` repository to your own github account following [these instructions](https://help.github.com/articles/fork-a-repo/).
Make sure you also create an [upstream remote](https://help.github.com/articles/configuring-a-remote-for-a-fork/) so you can get
changes made to the original app.

2) Open a terminal on your computer and run theses commands (I'm assuming you already have Ruby installed):

```bash
gem install bundler # so you can get all the other gems the app depends on
```

3) Create a copy of the ignitespeak on your development machine (I'm assu

```bash
# replace '#############' with your own github name
git clone https://github.com/#########/ignitespeak.git
git remote add upstream https://github.com/ignitebaltimore/ignitespeak.git
cd ignitespeak
bin/setup
rake spec # if these tests pass, you're good to go
```

Development Environment
=======================
```bash
rails console # opens an interactive console where you can interact with the Proposal model
foreman start # boots up the app, which you can access at http://127.0.0.1:5000/
```
To sign into the admin system, visit `http://127.0.0.1:5000/admin`. You'll need to give the username and password
specified in your `.env` file (which is probably "test" for both).

Deployment
==========
To get your own ignitespeak app up and running, click the button

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


Contributors
============
* Original coding by [Mike Subelsky](http://www.subelsky.com/)
