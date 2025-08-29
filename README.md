# nimble-library

A simple project to test and demonstrate C and Go binding in Nim (based on https://github.com/logos-co/nim-library-template).

## Getting Started

1. **Clone the repository:**
    ```sh
    git clone https://github.com/2-towns/nimble-library
    cd nimble-test
    ```

2. **Install dependencies:**
    ```sh
    make update
    ```

3. **Build the project:**
    ```sh
    make libclock
    ```

4. **Build the example:**
    ```sh
    make example_c
    ```

5. **Run the example:**
    ```sh
    cd build
    ./clock
    ```
