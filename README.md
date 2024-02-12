# CompTIA_PBQ2Lab

This repository aims to provide lab environments for CompTIA Performance-Based Questions (PBQs) using Docker.

## Getting Started

To get started, please follow these steps:

### Prerequisites

Make sure you have Docker and Docker Compose installed on your system. If not, you can find installation instructions in the official documentation:

- [Docker Installation Guide](https://docs.docker.com/get-docker/)
- [Docker Compose Installation Guide](https://docs.docker.com/compose/install/)

### Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/f-4-u/CompTIA_PBQ2Lab.git
    ```

2. Navigate to the project directory:

    ```bash
    cd CompTIA_PBQ2Lab
    ```

3. Activate the environment using .direnv:

    ```bash
    direnv allow
    ```

4. Start the Docker containers:

    ```bash
    start
    ```

5. Validate fullfilled tasks:

    ```bash
    validate
    ```

6. View tasks:

    ```bash
    tasks
    ```

7. When finished, clean up resources:

    ```bash
    finish
    ```

## Docker Compose Version Support

This project exclusively supports Docker Compose version 2. Please ensure that your Docker Compose configuration complies with version 2 specifications.

## Contributing

If you'd like to contribute to this project, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## TODO

- [ ] switch to config management tools
- [ ] advanced tooling with .derenv
- [ ] provide more PBQs
