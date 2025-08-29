# nimble-library

A simple project to test and demonstrate C and Go binding in Nim (based on https://github.com/logos-co/nim-library-template).

## Getting Started

Clone the repository
```sh
git clone https://github.com/2-towns/nimble-library
cd nimble-test
```

Install dependencies
```sh
make update
```

Build the project
```sh
make libclock
```

Build the example
```sh
make example_c
```

Run the example
```sh
cd build
./clock
```

## Use the go binding

```sh 
cd binding 
go get
go test ./...
```
