FROM python:3.10-slim

# install wget
RUN apt-get update && apt-get install -y wget unzip

# Download the dependency
RUN wget https://github.com/juriku/hidden-characters-detector/archive/refs/heads/main.zip
RUN unzip main.zip

# enter the folder
WORKDIR hidden-characters-detector-main

# run script
ENTRYPOINT ["python3", "hidden-characters-detector.py", "--fail", "-r", "-d", "."]