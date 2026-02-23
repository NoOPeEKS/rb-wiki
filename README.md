# Big Data & Data Science Wiki

## Prerequisites

To run this application, you need to have both Ruby and Rails installed in your system.
We recommend using a Ruby version manager to do so. ASDF is a nice version manager for multiple languages and runtimes.
You will also need SQLite installed in your system (we use SQLite for simplicity and ease of migration).

### Installing ASDF
Follow the steps in [ASDF's webpage](https://asdf-vm.com/guide/getting-started.html) and install the binary.

### Installing Ruby
To install Ruby with asdf, run the following commands:
```bash
asdf plugin add ruby

asdf install ruby 3.3.4

asdf set ruby 3.3.4
```

### Installing Rails
Once you have Ruby installed locally, in this directory, install the Rails and Bundler gems.
```bash
gem install rails -v 7.1.3
gem install bundler
```

### Install all the dependencies (Gems)
```bash
bundle install
```

## Install the application
To install the application you need at least yarn or npm available.
```bash
bin/rails yarn:install

bin/rails db:create
bin/rails db:migrate
bin/rails assets:precompile
```

## Run the wiki
Running the wiki is easy, you just need to run the HTTP server with this simple command:
```bash
bin/rails server
```

Your application will now be available at `http://localhost:3000`. Then you can setup a reverse proxy with NGINX as you please to redirect HTTP requests in your server's HTTP 80 and HTTPS 443 ports to the application located at HTTP 3000.
