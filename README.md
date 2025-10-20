# mobile-docker

This repository contains Docker configurations for deploying mobile network components such as HSS (Home Subscriber Server) and IMS (IP Multimedia Subsystem) using Kamailio.

## Components

- **HSS**: Implements the Home Subscriber Server using PyHSS.
- **IMS**: Implements the IP Multimedia Subsystem using Kamailio with various IMS modules
    - I-CSCF (Interrogating Call Session Control Function): Handles incoming SIP requests and routes them to the appropriate S-CSCF.
    - P-CSCF (Proxy Call Session Control Function): Acts as the first point of contact for the user equipment in the IMS network.
    - S-CSCF (Serving Call Session Control Function): Manages the session state and service logic for SIP sessions.

## Prerequisites

- Docker
- Docker Compose (v2)
- A database for HSS (e.g., MySQL or PostgreSQL)

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/Samland-Gov/mobile-docker.git
   ```
2. Navigate to the project directory:
    ```bash
    cd mobile-docker
    ```
3. Configure the services:
   - Modify `hss/config.yaml` to set up your HSS configuration and database.

4. Build and start the services using Docker Compose:
    ```bash
    docker compose up --build -d
    ```
5. Verify that the services are running:
    ```bash
    docker compose ps
    ```

6. Access the services:
    - HSS REST API: `http://localhost:8180`
    - HSS REST API docs: `http://localhost:8180/docs`
    - Diameter Interface: Port `3868`
    - IMS I-CSCF Service: Port `5060`/`5062` (SIP)
    - IMS P-CSCF Service: Port `5160`/`5162` (SIP)
    - IMS S-CSCF Service: Port `5260`/`5262` (SIP)

