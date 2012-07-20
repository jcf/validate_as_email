# ValidateAsEmail [![Build Status](https://secure.travis-ci.org/evently/validate_as_email.png?branch=master)](http://travis-ci.org/evently/validate_as_email) [![CodeClimate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/evently/validate_as_email)

Validation of email addresses via the excellent Mail gem that is
available in all Rails 3 applications.

## Installation

Add this line to your application's Gemfile:

    gem 'validate_as_email'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validate_as_email

## Usage

This gem required Ruby 1.9, and is tested against MRI, JRuby, and
Rubinius using Travis CI.

You will need to be using Rails 3 to make use of this validator, as it
is built on top of ActiveModel, which was introduced in Rails 3.

### Usage with ActiveModel

``` ruby
class Person
  include ActiveModel::Validations
  validates_as_email :email
  attr_accessor :email
end

# OR

class Person
  include ActiveModel::Validations
  validates :email, email: true
  attr_accessor :email
end
```

### Usage with ActiveRecord

``` ruby
class Person < ActiveRecord::Base
  validates_as_email :email
  attr_accessor :email
end

# OR

class Person < ActiveRecord::Base
  validates :email, email: true
  attr_accessor :email
end
```

### Built-in RSpec Matcher

``` ruby
class Person < ActiveRecord::Base
  validates_as_email :email
  attr_accessor :email
end

describe Person do
  it { should have_a_valid_email_address_for(:email) }
  it { should_not have_a_valid_email_address_for(:email) }
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
