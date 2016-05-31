# Capistrano::Apache

Capistrano extension for Apache tasks

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
