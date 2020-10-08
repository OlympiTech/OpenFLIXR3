function pm_clean {
    info "Removing unused packages."
    apt-get -y autoremove > /dev/null 2>&1 || fatal "Failed to remove unused packages from apt."
    info "Cleaning up package cache."
    apt-get -y autoclean > /dev/null 2>&1 || fatal "Failed to cleanup cache from apt."
}

function pm_install($package) {
    info "Installing dependencies."
    apt-get -y install $package
}
