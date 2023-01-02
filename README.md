# Ruby on Rails Sample Application from Tutorial

The sample application follows the following tutorial:
[*Ruby on Rails Tutorial*](https://railstutorial.jp/)
（7th Edition）by
[Michael Hartl](https://www.michaelhartl.com/)

## License

The source code under [Ruby on Rails Tutorial](https://railstutorial.jp/)
is made public through MITLicense and Beerware License. Please check the
details under [LICENSE.md](LICENSE.md).

## Usage

Clone the repository in order to use the application. Then install the
required RubyGems through the following commands.

```
$ gem install bundler -v 2.3.14
$ bundle _2.3.14_ config set --local without 'production'
$ bundle _2.3.14_ install
```

After installation, migrate to the database.

```
$ rails db:migrate
```

Finally, check that the application runs by testing.

```
$ rails test
```

You should be ready to run rails server when all test passes

```
$ rails server
```

For more details, please check
[*Ruby on Rails Tutorial*](https://railstutorial.jp/).
