## No longer in use. I have switched to Ghost
This is the source code of fayimora.com

To run:

``` sh
git clone git://github.com/fayimora/website.git
cd website
bundle
bundle exec middleman
```

Then visit [http://localhost:4567/](http://localhost:4567/)

### Requirements

If the `bundle` command fails to run, you may need to upgrade your Ruby version. The build requires 1.9.3 or newer (2.0.0 recommended). You can use [RVM](https://rvm.io/) to install it:

``` sh
curl -L https://get.rvm.io | bash -s stable
rvm install 2.0.0
rvm use 2.0.0
```
