# Add the repository to install cloudflared.
curl -L https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/cloudflare-archive-keyring.gpg] https://pkg.cloudflare.com/cloudflared $(lsb_release -cs) main" | sudo tee  /etc/apt/sources.list.d/cloudflared.list

# Add the repository to install Docker.
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/raspbian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/raspbian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the repository of available packages (applications and software utilities) and upgrade all packages. This will take a while.
sudo apt update && sudo apt upgrade;

# Install some basic applications and utilities.
# - tldr: a helpful and concise utility for explaining commands, with examples.
#
# - tmux: a terminal multiplexer, allowing you to have multiple panes of a terminal
# open at the same time.
#
# - neovim: a text editor. Alternatively (and pre-installed) use nano.
#
# - cloudflared: a utility used to securely expose processes to the internet.
#
# - docker: a utility used for quickly, easily, and securely deploying pre-built applications.
sudo apt install tldr tmux neovim cloudflared docker;

# Systemctl is a tool used to manage underlying system processes, called daemons. Enable will start the docker
# daemon at startup, and start starts the daemon now.
sudo systemctl enable docker;

restart;
