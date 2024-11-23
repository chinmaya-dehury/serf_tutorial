# Serf Tutorial

This project is a tutorial on service discovery mechanisms using Serf, a tool from HashiCorp for cluster membership, failure detection, and orchestration. The tutorial demonstrates how to containerize a simple Flask application, install Serf within the container, and use it to form a cluster of multiple containers.

## Project Structure

- **app.py**: A simple Flask application that returns "Hello World" along with the container's ID and IP address.
- **Dockerfile**: Defines the environment for the Flask application, including the installation of Serf.
- **docker-compose.yml**: Manages the deployment of multiple instances of the Flask application using Docker Compose.
- **README.md**: Documentation for setting up and running the project.

## Prerequisites

- Docker and Docker Compose installed on your system.
- Internet connection to download necessary images and packages.

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd serf_tutorial
   ```

2. **Build the Docker Image**:
   Use Docker Compose to build the image:
   ```bash
   docker-compose build
   ```

3. **Run the Containers**:
   Start the containers using Docker Compose:
   ```bash
   docker-compose up -d
   ```

4. **Access the Flask Application**:
   Open a web browser and navigate to:
   - `http://localhost:5001`
   - `http://localhost:5002`
   - `http://localhost:5003`

   Each URL corresponds to a different instance of the Flask application.

5. **Verify Serf Cluster**:
   To check the Serf cluster status, enter one of the running containers:
   ```bash
   docker exec -it serf_tutorial-flask-app-1 bash
   serf members
   ```

   This command will list all the members of the Serf cluster.

## Managing Containers

- **Stop a Container**:
  ```bash
  docker stop <container_id_or_name>
  ```

- **Restart a Container**:
  ```bash
  docker start <container_id_or_name>
  ```

- **View Logs**:
  ```bash
  docker logs <container_id_or_name>
  ```

## Troubleshooting

- **Port Conflicts**: If you encounter port conflicts, ensure that the ports specified in `docker-compose.yml` are not in use by other applications.
- **Network Issues**: Ensure your network allows access to the necessary URLs for downloading Serf and other dependencies.

## Conclusion

This tutorial provides a basic setup for using Serf with containerized applications. For more advanced configurations and features, refer to the [official Serf documentation](https://www.serf.io/intro/index.html).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
