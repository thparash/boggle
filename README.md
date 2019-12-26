# Boggle

A Boogle game built using Ruby on Rails and ReactJS. A player gets two minutes to find as many words as possible. Each word must have at least three letters.

### Tech

Boggle was built using the following technology.

- [Ruby on Rails] - for the backend.
- [React.js] - for the frontend.
- [Docker] - for contenarization and ease of installation.

### Installation

Boggle is very easy to install and deploy in a Docker contianer. You will need to install [Docker](https://docs.docker.com/install/) if it is not already installed on your computer. You can install Docker by visiting [https://docs.docker.com/install/](https://docs.docker.com/install/), and following the installation instructions for your operating system.

After installing Docker and cloning this git repository, follow the instructions below to build and run the application.

Open your favorite Terminal, and change to the 'boogle' directory where docker-compose.yml file is located.

```sh
$ cd boggle
```

Then, enter the following docker-compose command to build and start the application. This should take around 4 to 5 minutes.

```sh
$ docker-compose up --build
```

Once the application is ready, you should see a message saying that the server is listening for requests. By default, the application will listen on port 8080.

Verify that the application is ready by navigating to your server address in your preferred web browser.

```sh
localhost:8080
```

OR

```sh
127.0.0.1:8080
```

### Testing

Boggle uses [RSpec-Rails](https://github.com/rspec/rspec-rails) gem for testing. You can find all the tests inside 'boggle/app/specs' directory.

Follow the instructions below to build and test the application.

Change to the 'boogle' directory where docker-compose.yml file is located.

```sh
$ cd boggle
```

Open the environment configuration file i.e 'config.env' inside the 'boggle' directory with your favorite text editor, and change the value of 'RAILS_ENV' environment varaible from 'production' to 'test'.

```
RAILS_ENV=test
```

Once done, open two Terminal windows or tabs, and enter the following docker-compose command to build and start the application.

First Tab:

```sh
$ docker-compose up --build
```

Once the application is ready, you should see a message saying that the server is listening for requests.

Then, in the second terminal window or tab, enter the following command to run the tests while the docker containers are running in the first terminal or tab.

Second Tab:

```sh
$ docker exec rails-backend bundle exec rspec
```

---

## Author

Parash Thapa

## License

MIT

## Acknowledgments

This application uses dictionary text file from [https://github.com/dwyl/english-words](https://github.com/dwyl/english-words)
