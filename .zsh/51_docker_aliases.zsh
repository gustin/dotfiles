# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Remove unused data
alias dc="docker system prune -f"

# Stop all containers
function dstop() { docker stop $(docker ps -a -q); }

# Starts all containers
function dstart() { docker start $(docker ps -a -q); }

# Restarts all containers
function drestart() { docker restart $(docker ps -a -q); }

# Remove all containers
function drm() { docker rm $(docker ps -a -q); }

# Remove all exited containers
drme() { docker rm $(docker ps -q -f status=exited); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

alias drmi='docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")'

# Remove all images
function dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
function dbu() { docker build -t=$1 .; }

# Show all alias related docker
function dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
