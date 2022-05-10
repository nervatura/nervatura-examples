# Nervatura Examples

## Quick Start

### Node.js

```
$ git clone https://github.com/nervatura/nervatura-examples.git
$ cd nervatura-examples/node
$ npm install
$ npm start
```
Open your browser to http://localhost:8080

### Python

1. Download the Python examples

    ```
    $ git clone https://github.com/nervatura/nervatura-examples.git
    $ cd nervatura-examples/python
    $ pip install -r requirements.txt
    $ python main.py
    ```
    Open your browser to http://localhost:8000

2. Download the Nervatura

  - Linux x64
    ```
    $ mkdir bin
    $ cd bin
    $ curl -L -s https://api.github.com/repos/nervatura/nervatura/releases/latest | grep -o -E "https://(.*)nervatura_(.*)_linux_amd64.tar.gz" | wget -qi -
    $ tar -zxf *.gz
    $ rm *.gz
    ```

  - Windows users:
    - download the [latest version](https://github.com/nervatura/nervatura/releases/latest) to the `/bin` directory
    - change the value of the `NT_EXAMPLE_SERVICE_PATH` (`.env.example` file): "bin/nervatura" -> "bin/nervatura.exe"
    - change the value of the `NT_EXAMPLE_SERVICE_LIB` (`.env.example` file): "bin/nervatura.so" -> "bin/nervatura.dll"

3. Start the Nervatura backend server (gRPC and HTTP examples)

    ```
      $ bin/nervatura -env .env.example
    ```

## Examples

- Create a demo database - **All examples require a demo database. Please run this first!**
- Basic password login
- Custom token (passwordless) login - public/private key pair
- Nervatura Client custom token login - with the HMAC algorithm
- Using external API for token based authentication
- Nervatura Client language translation
- Create an invoice
- Nervatura Client menu shortcuts
- Nervatura CSV Report Example

More info see [**Nervatura Docs**](https://nervatura.github.io/nervatura/docs)
