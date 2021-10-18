##### Prerequisites
install Ruby [3.0.2](https://www.ruby-lang.org/en/documentation/installation/)

install [yarn](https://yarnpkg.com/getting-started/install)

##### 1. Check out the repository

```bash
git clone git@github.com/Chrispycode/recipe_book.git
```

##### 2. Setup rails and Webpacker
Run the following commands setup rails and Webpacker.

```bash
gem install bundler:2.2.22
bundle
yarn
```

##### 3. Create and setup the database

Run the following command to create and setup the database.

```ruby
rails db:setup
```

##### 4. Start the Rails server with Webpacker

You can start the rails server and webpacker separately using the commands below.

```ruby
rails s
bin/webpack-dev-server
```

And now you can visit the site with the URL http://localhost:3000
