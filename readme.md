## Installation

Run the project using one of the following ways:
    - To start the sample .NET Core server:

    ```
    cd NetCoreServer
    dotnet restore
    dotnet run
    ```
	
	- Using docker:

	```
    docker build -t sample-image -f Dockerfile .
    docker create --name core-sample sample-image
    docker start core-sample
    ```

Then go to client and open index.html to connect to server.
Change url property to your server endpoint.