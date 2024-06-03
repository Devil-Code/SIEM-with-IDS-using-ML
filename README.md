# SIEM with IDS using Machine Learning

This project integrates a Security Information and Event Management (SIEM) system with an Intrusion Detection System (IDS) utilizing machine learning. The setup uses various tools and services like Zeek, Elasticsearch, Kibana, Logstash, Filebeat, and the Stratosphere Linux IPS for enhanced network security monitoring and threat detection.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)
- [Contact Information](#contact-information)

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You are using a Linux-based operating system.
- You have `sudo` privileges.
- You have a stable internet connection for downloading dependencies.
- Make sure to edit the install and run files with the ip address and port number.

## Installation

To set up the project, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone <repository_url>
   cd <repository_name>
   ```

2. **Run the installation script:**
   ```bash
   chmod +x install.sh
   sudo ./install.sh
   ```

   This script performs the following actions:
   - Upgrades the system packages.
   - Installs Zeek (an IDS tool).
   - Installs required Python packages listed in `requirements.txt`.
   - Clones the Stratosphere Linux IPS repository.
   - Installs Java 8 and sets up Elasticsearch, Kibana, Logstash, and Filebeat.

## Usage

To start the services and deploy the IDS, run the following script:

```bash
chmod +x run.sh
sudo ./run.sh
```
![Alt Text](Image_URL)

This script performs the following actions:
- Starts the Elasticsearch, Kibana, and Filebeat services.
- Deploys Zeek for network traffic monitoring.
- Flushes old outputs from the Stratosphere Linux IPS.
- Starts the Redis server.
- Runs the Stratosphere Linux IPS for processing network logs.
- Starts Logstash with the specified configuration.

After running the script, you can access Kibana at: `ip_addr:port`

##Screenshots

![Alt Text](./screenshots/recon.png)
Reconnaissance Flagged!!!

![Alt Text](./screenshots/anamoly.png)
Anamoly Flagged!!!

## Project Structure

The project directory contains the following files:

- `requirements.txt` - Lists all the Python dependencies required for the project.
- `install.sh` - A shell script to set up the environment and install necessary tools and packages.
- `run.sh` - A shell script to start and configure the services for the SIEM and IDS system.

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a Pull Request.

## License

This project is licensed under the GNU GPL v3.0 License. See the `LICENSE` file for details.

## Contact Information

For any inquiries or issues, please contact:
- **Pritesh Gandhi**
- **Email**: pgandhi1412@gmail.com
- **GitHub**: [YourGitHubProfile](https://github.com/Devil-Code)
  
