# Serf Tutorial

This project is a tutorial on service discovery mechanisms using Serf, a tool from HashiCorp for cluster membership, failure detection, and orchestration. The tutorial demonstrates how to containerize a simple Flask application, install Serf within the container, and use it to form a cluster of multiple containers.

## Project Structure

- **app.py**: A simple Flask application that returns "Hello World" along with the container's ID and IP address.
- **Dockerfile**: Defines the environment for the Flask application, including the installation of Serf.
- **docker-compose.yml**: Manages the deployment of multiple instances of the Flask application using Docker Compose.
- **event-handler.sh**: A script to handle Serf events, logging details about member joins, leaves, queries, and user events.
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
   docker-compose up -d --scale flask-app=3
   ```

4. **Access the Flask Application**:
   Open a web browser and navigate to:
   - `http://localhost:<random_port_1>`
   - `http://localhost:<random_port_2>`
   - `http://localhost:<random_port_3>`

   Each URL corresponds to a different instance of the Flask application. Note that Docker assigns random host ports to the internal port 5000.

5. **Verify Serf Cluster**:
   To check the Serf cluster status, enter one of the running containers:
   ```bash
   docker exec -it <container_id> bash
   serf members
   ```

   This command will list all the members of the Serf cluster.

6. **Broadcast a User Event and Query**:
   To broadcast a user event and see it handled by the event handler script, execute the following command inside one of the running containers:
   ```bash
   docker exec -it <container_id> bash
   serf event my-event "Hello, Serf!"
   ```

   You should see entries similar to:
   ```
   User event received: my-event
   Event payload: Hello, Serf!
   ```

   To send a query and see it handled by the event handler script, use the following command:
   ```bash
   docker exec -it <container_id> bash
   serf query service-status
   ```
   
   You should see entries like:
   ```
   Service is running on <container_id>
   ```

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
- **Payload Issues**: If user event payloads are not appearing in logs, verify the event command and check the `event-handler.sh` script for correct handling.

## Conclusion

This tutorial provides a basic setup for using Serf with containerized applications. For more advanced configurations and features, refer to the [official Serf documentation](https://www.serf.io/intro/index.html).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
