# Capistrano::Apache

Capistrano extension for Apache tasks

:warning: **This package has been moved to on official repository** :warning:

This page contains the documentation of the **version 1** of this plugin.
For future versions, please checkout this one:
https://github.com/capistrano-plugins/capistrano-apache

The gem name is still the same (`capistrano-apache`), upgrading from v1 to v2 or higher
will move to the new one automatically.

Therefore, this repository will not receive any update anymore.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano', '~> 3.2'
gem 'capistrano-apache'
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install capistrano-apache
```

## Usage

Require the module in your `Capfile`:

```ruby
require 'capistrano/apache'
```

`capistrano/apache` comes with 5 tasks:

* apache:reload
* apache:force_reload
* apache:restart
* apache:stop
* apache:zap

You can execute the task on command line:
 
```bash
cap production apache:reload
```

And configure it on your `deploy.rb` file:

```ruby
namespace :deploy do
  after :finishing, 'apache:reload'
  after :rollback, 'apache:reload'
end
```

### Configuration

Configurable options, shown here with defaults:

```ruby
set :apache_roles, :all
```

You can also override the default `php-apache` service command:
 
```ruby
SSHKit.config.command_map[:apache] = 'sudo /etc/init.d/apache2'
```
