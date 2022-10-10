# Nervatura Examples

## **Quick Start**

### **Node.js** and **NPM**

Recommended API: 
- gRPC 
- CGO (Linux and Windows x64)

```
$ git clone https://github.com/nervatura/nervatura-examples.git
$ cd nervatura-examples/node
$ npm install
$ npm start
```
Open your browser to http://localhost:8080

You do not need a Nervatura backend server to use the CLI and CGO. Automatic server start can be turned off with `NT_EXAMPLE_SERVICE_DISABLED=true`  (see in the `nervatura-examples/node/.env` file).

### **Python** and **Snap** or **Windows Package Manager**

Recommended API:  
- CGO (Linux and Windows x64)
- gRPC

1. Download the Python examples

    ```
    $ git clone https://github.com/nervatura/nervatura-examples.git
    $ cd nervatura-examples/python
    $ pip install -r requirements.txt
    $ python main.py
    ```
    Open your browser to http://localhost:8000

2. Nervatura backend

  - Linux
    ```
    $ sudo snap install nervatura
    ```
    The CLI and CGO is ready to use. To use the gRPC and HTTP, start Nervatura service with the .env.example settings (`nervatura-examples/python` directory):
    ```
    $ /snap/nervatura/current/nervatura -env $(pwd)/.env.example
    ```

  - Windows:
    ```
    winget install --id Nervatura.Nervatura --source winget
    ```
    - change the value of the `NT_EXAMPLE_SERVICE_PATH` (`nervatura-examples/python/.env.example` file): "/snap/nervatura/current/nervatura" -> *"C:/Program Files/Nervatura/nervatura.exe"*
    - change the value of the `NT_EXAMPLE_SERVICE_LIB` (`nervatura-examples/python/.env.example` file): "/snap/nervatura/current/nervatura.so" -> *"C:/ProgramData/Nervatura/nervatura.dll"*

    Start the Nervatura backend server (gRPC and HTTP examples) with the .env.example settings (`nervatura-examples/python` directory):

    ```
      & "C:\Program Files\Nervatura\nervatura.exe" -env .env.example
    ```

### **Go** and **Docker**

Recommended API:
- gRPC

1. Download the Go examples

    ```
    $ git clone https://github.com/nervatura/nervatura-examples.git
    $ cd nervatura-examples/go
    $ go mod vendor
    $ go run ./main.go
    ```
    Open your browser to http://localhost:7000

2. Nervatura backend (`nervatura-examples/go` directory)
    ```
    $ docker run -i -t --rm --name nervatura --env-file .env.example -p 5000:5000 -p 9200:9200 -v $(pwd)/data:/data nervatura/nervatura:latest
    ```

## **Examples**

- Create a demo database - **All examples require a demo database. Please run this first!**
- Basic password login
- Custom token (passwordless) login
- Nervatura Client custom token login
- Using external API for token based authentication
- Nervatura Client language translation
- Create an invoice
- Nervatura Client menu shortcuts
- Nervatura CSV Report Example

More info see [**Nervatura Docs**](https://nervatura.github.io/nervatura/docs)
