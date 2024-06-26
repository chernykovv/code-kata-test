# Exercise

The goal of the project is to build a command line tool.

Using Ruby, write a command line tool that consumes the first `20` `even` numbered TODO's in most performant way and output the `title` and whether it is `completed` or not.

- TODO at index 1 can be accessed at: <https://jsonplaceholder.typicode.com/todos/1>

- TODO at index 2 can be accessed at: <https://jsonplaceholder.typicode.com/todos/2>

Ensure you are submitting the code along with cli.

## Judging Criteria

- Engineering principles & standards
- System extensibility & Scalability
- Test coverage
- Brevity and Simplicity

## Bonus Points

- Docker

## FAQ

### What is the time-limit on exercise ?

There is none, ensure you submit your best attempt and as soon as you possibly can.

### How to submit ?

Submit a GitHub / Bitbucket repo for review. No ZIP files!

### Do I need to write tests for connecting to API ?

That can be ommitted.

# How to run Result:

run `ruby todo.rb 1 2 3 4 5` in terminal inside of the app directory

OR

run `docker build -t todo . && docker run --rm -it todo ruby todo.rb 1 2 3 4 5 6`
