function firstrun {
    Info "Performing docker functions. Version check and install"
    dcheck

    Info "Post install steps"
    dbg "Adding docker group"
    groupadd docker
    dbg "Adding user to Docker Group"
    usermod -aG docker $USER
    dbg "Pushing group changes"
    newgrp $USER
    dbg "Granting ownership of docker"
    chown "$USER":"$USER" /home/"$USER"/.docker -R
    dbg "Applying attributes to docker folder"
    chmod g+rwx "$HOME/.docker" -R
    dbg "Enabling docker service"
    systemctl enable docker.service
    dbg "Enabling containerd service"
    systemctl enable containerd.service
    Info "Post install steps completed"
}

function dcheck {
    $d = (which docker)
    if ($null -eq $d) {
        dbg "Docker not installed, performing install"
        dinst
    } elseif (!($null -eq $d)){
        info "Docker installed"
        $u = (apt list --upgradable)
        if ($u -like "docker-ce*") {
            Info "There is an update for Docker."
            read-host "Do you wish to upgrade? [Y/N]" | if (_? -eq "Y") {
                apt-get update
                apt-get upgrade -y
            } else {
                warn "Skipping upgrade"
            }
        }
    } else {
        fatal "Something went wrong. Exiting."
    }
}

function dinst {
    apt-get update
    dbg "Checking dependencies"
    (apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release)

    dbg "Installing Keys"
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    dbg "Adding repository to APT"
    dbg "Removing alias conflict"
    remove-alias echo
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

    apt-get update
    (apt-get install -y docker-ce docker-ce-cli containerd.io)
    Info "Docker install complete"
}