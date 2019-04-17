# Kele
*  Kele is a Ruby Gem API client to provide easy access to the Bloc API
* Bloc's API provides an external facing [JSON Web Token](https://jwt.io/) authorized gateway to the Bloc application.

## Dependencies
* [Httparty](https://github.com/jnunemaker/httparty) - provides a programmatic Ruby interface to make HTTP requests.
* Ruby 2.0.0 or higher
* Use `irb` for testing

## Initialization
* Build gem
```
gem build kele.gemspec
```
* Install gem
```
gem install ./kele-0.0.1.gem
```
* Run gem with irb
```
$ irb
 >> require './lib/kele'
 => true
 >> kele_client = Kele.new("Bloc email", "Bloc Password")
 ```

 
