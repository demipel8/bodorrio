# bodorrio
My wedding web

This project makes use of the [Trello rest API](https://developers.trello.com/reference/)

## Build the project

*It requires docker*

```
make build
```

## Test the project

```
make test
```

## Lint the project

```
make lint
```

## Run the project

Execute the following shell command:

```
make run-example
```

Open a browser and go to `http://localhost:4000`

Example Trello board: https://trello.com/b/uNEr4dgX/bodorriotest

### Build your own

Execute `cp spec/integration/.env .env` and substitute the env variables with your own.

```
make run
```
