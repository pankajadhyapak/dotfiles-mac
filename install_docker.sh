# Delete any configuration from previous installs
rm -rf ~/.docker/config.json

# Install Colima, Docker, Compose, and Credential Helper
brew install colima docker docker-credential-helper docker-compose

# Set symlink
# sudo ln ~/.config/colima/default/docker.sock /var/run

# # Start Colima
# colima start

# # Check status
# colima status
