# Deploy script for the ITONK course at Aarhus University School of Engineering. 

To use this tool, clone the repository on your Raspberry Pi.

This tool will create a Docker image with the specified jar-file for the Raspberry Pi. Port 8080 will be exposed. 

The repository contains two files: 
* deploy.sh - the script itself

## Usage
```bash
sh deploy.sh --version=<VERSION NUMBER> --repo=<DOCKER HUB REPOSITORY> --jar=<PATH TO JAR-file>
```
