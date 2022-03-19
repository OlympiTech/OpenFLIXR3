function pm_clean {
    info "Removing unused packages."
    sudo apt-get -y autoremove #|| fatal "Failed to remove unused packages from apt."
    info "Cleaning up package cache."
    sudo apt-get -y autoclean #|| fatal "Failed to cleanup cache from apt."
}

function pm_install($package) {
    info "Installing dependencies."
    apt-get -y install $package
}

function pm_update {
    info "Removing unused packages."
    apt-get -y update #|| fatal "Failed to remove unused packages from apt."
    if (!($? -eq $TRUE)) {
    FATAL "Error updating"
    }
}