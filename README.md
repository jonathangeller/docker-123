# Lotus 1-2-3 Docker Image

This repository provides a Dockerfile to easily build and run the [123elf](https://github.com/taviso/123elf) project, which emulates the classic Lotus 1-2-3 spreadsheet application.

![Lotus 1-2-3 for Linux](https://lock.cmpxchg8b.com/img/123linux.png)

## About
This Dockerfile makes it simple to start and test the 123elf project without needing to manually install dependencies and build the project yourself.

**Note:** I am not affiliated with the original project. This Dockerfile is provided for convenience.

## Usage

### Build the Docker Image

1. Clone this repository:
    ```sh
    git clone https://github.com/jonathangeller/docker-123.git
    cd docker-123
    ```

2. Build the Docker image:
    ```sh
    docker build --no-cache -t docker123 .
    ```

### Run the Docker Container

To run the container interactively:
```sh
docker run -it --rm docker123
```

## Disclaimer

- **Use at Your Own Risk:** We take no responsibility for the use or running of this Docker image. It should be run at your own risk.
- **No Affiliation:** We are not affiliated with the original 123elf project.
- **Indemnity:** By using this Dockerfile, you agree to indemnify and hold harmless the authors and maintainers of this repository from any and all liability, claims, damages, and expenses arising from the use of the Docker image.

For more information, please refer to the original project repository: [123elf on GitHub](https://github.com/taviso/123elf).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
