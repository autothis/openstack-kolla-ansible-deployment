#!/bin/bash

# Define variables for Openstack Kolla-Ansible deployment (uncomment lines, and populate variables - not required if using other methods of variables population).

    #OPENSTACK_BRANCH='' #This is the branch that will be used for this deployment e.g. 'stable/zed'.
    #MANAGEMENT_NIC='' #This is the Network Interface that will be used for Management of the Openstack host e.g. 'ens192'.
    #NEUTRON_NIC='' #This is the Network Interface that will be used by the Openstack Neutron serivce (physnet1) e.g. 'ens224'.
    #KOLLA_VIP_ADDRESS='' #This is the Virtual IP Address that will be used to serve Openstack Services outside of the Openstack Deployment (for example the WebUI) e.g '192.168.0.69'.
    #CINDER_LVM_DISK='' #This is the disk that will be configured as an LVM for use by the Openstack Cinder service, and provided to your instances as persitent storage e.g. '/dev/sdb'.
    #PUBLIC_SUBNET='' #This is the subnet of the 'Public' network that will be created in Openstack, it will need to be accessible on your NEUTRON_NIC e.g. '192.168.0.0/24'
    #PUBLIC_GATEWAY='' #This is the Gateway IP address for the PUBLIC_SUBNET e.g. '192.168.0.254'.
    #PUBLIC_DNS='' #This is the DNS Resolver for the PUBLIC_SUBNET e.g. '8.8.8.8'.
    #PUBLIC_DHCP_START='' #This is the First IP Address that can be assigned by DHCP from the PUBLIC_SUBNET e.g. '192.168.0.100'.
    #PUBLIC_DHCP_END='' #This is the Last IP Address that can be assigned by DHCP from the PUBLIC_SUBNET e.g. '192.168.0.200'.
    #VENV_LOCATION='' #This is the path to the Python Virtual Environment that will be used for the Kolla-Ansible Deployment e.g. '/etc/kolla/venv'.
    #KOLLA_BASE_IMAGE='' #This is the image (container) that will be used for the Openstack Serivces deployed by Kolla-Ansible e.g. 'debian'.
    #ENABLE_MAGNUM='' #This is a boolean that tells Kolla-Ansible to enable Magnum (K8s Deployment on Openstack) e.g. 'yes'.
    #ENABLE_CINDER='' #This is a boolean that tells Kolla-Ansible to enable Cinder (Block Storage on Openstack) e.g. 'yes'.
    #ENABLE_CINDER_BACKEND_LVM='' #This is a boolean that tells Kolla-Ansible to enable Cinder on LVM Backend (Block Storage on Openstack) e.g. 'yes'.

# Create Functions

    set_openstackvariables () {

        # Define K3S_VARIABLE array containing required variables for K3s deployment
        OPENSTACK_VARIABLE_1=("OPENSTACK_BRANCH" "$OPENSTACK_BRANCH" "This is the branch that will be used for this deployment e.g. 'stable/zed'.")
	    OPENSTACK_VARIABLE_2=("MANAGEMENT_NIC" "$MANAGEMENT_NIC" "This is the Network Interface that will be used for Management of the Openstack host e.g. 'ens192'.")
	    OPENSTACK_VARIABLE_3=("NEUTRON_NIC" "$NEUTRON_NIC" "This is the Network Interface that will be used by the Openstack Neutron serivce (physnet1) e.g. 'ens224'.")
	    OPENSTACK_VARIABLE_4=("KOLLA_VIP_ADDRESS" "$KOLLA_VIP_ADDRESS" "This is the Virtual IP Address that will be used to serve Openstack Services outside of the Openstack Deployment (for example the WebUI) e.g '192.168.0.69'.")
	    OPENSTACK_VARIABLE_5=("CINDER_LVM_DISK" "$CINDER_LVM_DISK" "This is the disk that will be configured as an LVM for use by the Openstack Cinder service, and provided to your instances as persitent storage e.g. '/dev/sdb'.")
	    OPENSTACK_VARIABLE_6=("PUBLIC_SUBNET" "$PUBLIC_SUBNET" "This is the subnet of the 'Public' network that will be created in Openstack, it will need to be accessible on your NEUTRON_NIC e.g. '192.168.0.0/24'.")
	    OPENSTACK_VARIABLE_7=("PUBLIC_GATEWAY" "$PUBLIC_GATEWAY" "This is the Gateway IP address for the PUBLIC_SUBNET e.g. '192.168.0.254'.")
	    OPENSTACK_VARIABLE_8=("PUBLIC_DNS" "$PUBLIC_DNS" "This is the DNS Resolver for the PUBLIC_SUBNET e.g. '8.8.8.8'.")
	    OPENSTACK_VARIABLE_9=("PUBLIC_DHCP_START" "$PUBLIC_DHCP_START" "This is the First IP Address that can be assigned by DHCP from the PUBLIC_SUBNET e.g. '192.168.0.100'.")
	    OPENSTACK_VARIABLE_10=("PUBLIC_DHCP_END" "$PUBLIC_DHCP_END" "This is the Last IP Address that can be assigned by DHCP from the PUBLIC_SUBNET e.g. '192.168.0.200'.")
	    OPENSTACK_VARIABLE_11=("VENV_LOCATION" "$VENV_LOCATION" "This is the path to the Python Virtual Environment that will be used for the Kolla-Ansible Deployment e.g. '/etc/kolla/venv'.")
    	OPENSTACK_VARIABLE_12=("KOLLA_BASE_IMAGE" "$KOLLA_BASE_IMAGE" "This is the image (container) that will be used for the Openstack Serivces deployed by Kolla-Ansible e.g. 'debian'.")
    	OPENSTACK_VARIABLE_13=("ENABLE_MAGNUM" "$ENABLE_MAGNUM" "This is a boolean that tells Kolla-Ansible to enable Magnum (K8s Deployment on Openstack) e.g. 'yes'.")
    	OPENSTACK_VARIABLE_14=("ENABLE_CINDER" "$ENABLE_CINDER" "This is a boolean that tells Kolla-Ansible to enable Cinder (Block Storage on Openstack) e.g. 'yes'.")
    	OPENSTACK_VARIABLE_15=("ENABLE_CINDER_BACKEND_LVM" "$ENABLE_CINDER_BACKEND_LVM" "TThis is a boolean that tells Kolla-Ansible to enable Cinder (Block Storage on Openstack) e.g. 'yes'.")


        # Combine K3S_VARIABLE arrays int the K3S_VARIABLES array
        OPENSTACK_VARIABLES=(
            OPENSTACK_VARIABLE_1[@]
            OPENSTACK_VARIABLE_2[@]
            OPENSTACK_VARIABLE_3[@]
            OPENSTACK_VARIABLE_4[@]
            OPENSTACK_VARIABLE_5[@]
            OPENSTACK_VARIABLE_6[@]
            OPENSTACK_VARIABLE_7[@]
            OPENSTACK_VARIABLE_8[@]
            OPENSTACK_VARIABLE_9[@]
            OPENSTACK_VARIABLE_10[@]
            OPENSTACK_VARIABLE_11[@]
            OPENSTACK_VARIABLE_12[@]
            OPENSTACK_VARIABLE_13[@]
            OPENSTACK_VARIABLE_14[@]
            OPENSTACK_VARIABLE_15[@]
        )
    }

    print_title () {

        printf ${YELLOW}"#%.0s"  $(seq 1 ${BREAK})
        printf "\n"
        printf "$TITLE \n"
        printf "#%.0s"  $(seq 1 ${BREAK})
        printf "\n"${COLOUR_OFF}
    }

# Define Output Colours

    # Reset
    COLOUR_OFF='\033[0m'       # Text Reset

    # Regular Colors
    BLACK='\033[0;30m'        # Black
    RED='\033[0;31m'          # Red
    GREEN='\033[0;32m'        # Green
    YELLOW='\033[0;33m'       # Yellow
    BLUE='\033[0;34m'         # Blue
    PURPLE='\033[0;35m'       # Purple
    CYAN='\033[0;36m'         # Cyan
    WHITE='\033[0;37m'        # White

# Get current working directory

    OPENSTACK_DEPLOY_PATH=$(pwd)

# Timeout in seconds

    TIMEOUT=300

# Break width '='

    BREAK=150

# Set Openstack Variables

    set_openstackvariables
    OPENSTACK_MISSING_VARIABLES=() 
    KOLLA_BASE_IMAGE='debian'
    ENABLE_MAGNUM='yes' 
    ENABLE_CINDER='yes'
    ENABLE_CINDER_BACKEND_LVM='yes'

# Print Local Disk Table

    TITLE="Local Disk Table"
    print_title

    lsblk -f

# Missing Variables

    TITLE="Looking for missing Openstack Kolla-Ansible Deployment Variables"
    print_title

  # Loop OPENSTACK_VARIABLES looking for missing variables

    COUNT=${#OPENSTACK_VARIABLES[@]}
    for ((i=0; i<$COUNT; i++))
    do
        NAME=${!OPENSTACK_VARIABLES[i]:0:1}
        VALUE=${!OPENSTACK_VARIABLES[i]:1:1}
        DESC=${!OPENSTACK_VARIABLES[i]:2:1}

        if [[ -z "${VALUE}" ]]; then
            echo "Name: ${NAME}"
            printf "Value: ${RED}${NAME} is undefined\n${COLOUR_OFF}"
            echo "Description: ${DESC}"
            printf ${WHITE}"=%.0s"  $(seq 1 ${BREAK})${COLOUR_OFF}
            printf "\n${COLOUR_OFF}"
            OPENSTACK_MISSING_VARIABLES+=( "OPENSTACK_VARIABLE_$(expr $i + 1)[@]" )
        fi
    done

  # Loop OPENSTACK_MISSING_VARIABLES to give user option to define any missing variables

    COUNT=${#OPENSTACK_MISSING_VARIABLES[@]}
    for ((i=0; i<$COUNT; i++))
    do
        NAME=${!OPENSTACK_MISSING_VARIABLES[i]:0:1}
        VALUE=${!OPENSTACK_MISSING_VARIABLES[i]:1:1}
        DESC=${!OPENSTACK_MISSING_VARIABLES[i]:2:1}

        printf "${YELLOW}No value provided for '${NAME}'\n${COLOUR_OFF}"
        printf "$DESC\n"
        read -p "$(printf "${CYAN}Provide a value for '${NAME}': ${GREEN}")" $NAME
        printf "${COLOUR_OFF}"
    done

# Update K3 Variables

    set_OPENSTACKvariables
    clear

# Loop OPENSTACK_VARIABLES to display variables to be used for Openstack deployment.

    TITLE="Variables to be using in Openstack Kolla-Ansible Deployment"
    print_title

    COUNT=${#OPENSTACK_VARIABLES[@]}
    for ((i=0; i<$COUNT; i++))
    do
        NAME=${!OPENSTACK_VARIABLES[i]:0:1}
        VALUE=${!OPENSTACK_VARIABLES[i]:1:1}
        DESC=${!OPENSTACK_VARIABLES[i]:2:1}

        if [[ -z "${VALUE}" ]]; then
            echo "Name: ${NAME}"
            printf "Value: ${RED}${NAME} is undefined\n${COLOUR_OFF}"
            echo "Description: ${DESC}"
            printf ${WHITE}"=%.0s"  $(seq 1 ${BREAK})${COLOUR_OFF}
            printf "\n${COLOUR_OFF}"
        else
            printf "Name: ${CYAN}${NAME}\n${COLOUR_OFF}"
            printf "Value: ${GREEN}${VALUE}\n${COLOUR_OFF}"
            printf "Description: ${WHITE}${DESC}\n${COLOUR_OFF}"
            printf ${BLUE}"=%.0s"  $(seq 1 ${BREAK}) \n
            printf "\n${COLOUR_OFF}"
        fi
    done

# Confirm Variables before Deployment

    read -p "$(printf "${YELLOW}Would you like to proceed with deployment, based on the variables listed above? [y/N] ${COLOUR_OFF}")" -r
    if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        printf "${GREEN}Proceeding with provided variables...\n${COLOUR_OFF}"
    elif [[ $REPLY =~ ^([nN][oO]|[nN])$ ]]
    then
        printf "${RED}You have chosen not to proceed, exiting...\n${COLOUR_OFF}"
        exit
    else
        printf "${RED}You have provided an invaild answer, exiting...\n${COLOUR_OFF}"
        exit
    fi

# Install Prerequisites

    TITLE="Installing Prerequisites"
    print_title

    apt install --yes \
        git \
        xz-utils \
        python3-dev \
        libdbus-1-dev \
        curl \
        libffi-dev \
        gcc \
        libssl-dev \
        python3-docker \
        libdbus-glib-1-dev \
        python3-dbus \
        lvm2 \
        python3-venv \
        ca-certificates

    printf "${GREEN}Done\n${COLOUR_OFF}"

    TITLE="Installing KUBECTL"
    print_title

    mkdir -p /etc/apt/keyrings
    curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
    apt update
    apt install --yes kubectl

    printf "${GREEN}Done\n${COLOUR_OFF}"

# Configure Cinder

    # Create LVM for Cinder to use
    TITLE="Creating Cinder LVM"
    print_title

    pvcreate $CINDER_LVM_DISK
    vgcreate cinder-volumes $CINDER_LVM_DISK

    printf "${GREEN}Done\n${COLOUR_OFF}"

    # Complete System Cinder Prerequisite Configuration
    TITLE="Cinder Prerequisites"
    print_title

    echo configfs >> /etc/modules
    update-initramfs -u

    printf "${GREEN}Done\n${COLOUR_OFF}"

# Configure Openstack Host Networking

    # Configure Neutron Interface
    TITLE="Configure Neutron Interface"
    print_title

    echo allow-hotplug ${NEUTRON_NIC} >> /etc/network/interfaces
    echo iface ${NEUTRON_NIC} inet manual >> /etc/network/interfaces
    ifup ${NEUTRON_NIC}

    printf "${GREEN}Done\n${COLOUR_OFF}"

#################################################################################################################################################
#################################################################################################################################################
#################################################################################################################################################
#################################################################################################################################################
#################################################################################################################################################
#################################################################################################################################################
#################################################################################################################################################
# Reboot System
#################################################################################################################################################
#################################################################################################################################################
#################################################################################################################################################
#################################################################################################################################################
#################################################################################################################################################
#################################################################################################################################################
#################################################################################################################################################

# Configure Python Virtual Environment

    # Create and Enter Python Virtual Environment
    TITLE="Create and Enter Python Virtual Environment"
    print_title

    python3 -m venv ${VENV_LOCATION}
    source ${VENV_LOCATION}/bin/activate

    printf "${GREEN}Done\n${COLOUR_OFF}"

# Install PIP Modules

    # Making sure PIP Packages are up to date
    TITLE="Making sure PIP Packages are up to date"
    print_title

    pip install --update

    printf "${GREEN}Done\n${COLOUR_OFF}"

    # Install Ansible
    TITLE="Installing Ansible"
    print_title

    pip install 'ansible>=4,<6'

    printf "${GREEN}Done\n${COLOUR_OFF}"

    # Install Kolla-Ansible
    TITLE="Installing Kolla-Ansible"
    print_title

    pip install git+https://opendev.org/openstack/kolla-ansible@${OPENSTACK_BRANCH}

    printf "${GREEN}Done\n${COLOUR_OFF}"

    # Install dbus-python package
    TITLE="Installing dbus-python package"
    print_title

    pip install dbus-python

    printf "${GREEN}Done\n${COLOUR_OFF}"

    # Install python-openstackclient
    TITLE="Installing python-openstackclient package"
    print_title

    pip install python-openstackclient -c https://releases.openstack.org/constraints/upper/master

    printf "${GREEN}Done\n${COLOUR_OFF}"

    # Install python-magnumclient
    TITLE="Installing python-magnumclient package"
    print_title

    pip install python-magnumclient

    printf "${GREEN}Done\n${COLOUR_OFF}"

# Setup Kolla-Ansible Configuration Directory and Files

    # Create Kolla Configuration Directory
    TITLE="Create Kolla Configuration Directory"
    print_title

    mkdir -p /etc/kolla
    chown $USER:$USER /etc/kolla

    printf "${GREEN}Done\n${COLOUR_OFF}"

    # Create Kolla Examples and Inventory Files
    TITLE="Create Kolla Configuration Directory"
    print_title

    cp -r ${VENV_LOCATION}/share/kolla-ansible/etc_examples/kolla/* /etc/kolla
    cp ${VENV_LOCATION}/share/kolla-ansible/ansible/inventory/all-in-one .
    
    # Add Python Interpreter to the Inventory File
    PYTHON_INTERPRETER="localhost ansible_python_interpreter=python"
    sed -i "1s/^/${PYTHON_INTERPRETER}\n/" all-in-one

    printf "${GREEN}Done\n${COLOUR_OFF}"

# Configure Kolla-Ansible

    # Install Kolla-Ansible Dependencies
    TITLE="Install Kolla-Ansible Dependencies"
    print_title

    kolla-ansible install-deps

    printf "${GREEN}Done\n${COLOUR_OFF}"

    # Create Ansible Configuration Tuning File
    TITLE="Create Ansible Configuration File"
    print_title

    mkdir /etc/ansible
	cat <<-'EOF' > /etc/ansible/ansible.cfg
	[defaults]
	host_key_checking=False
	pipelining=True
	forks=100
	EOF

    printf "${GREEN}Done\n${COLOUR_OFF}"

    # Generate Kolla Passwords
    TITLE="Generate Kolla-Ansible Passwords in '/etc/kolla/passwords.yml'"
    print_title

    kolla-genpwd

    printf "${GREEN}Done\n${COLOUR_OFF}"

    printf "${GREEN}Done\n${COLOUR_OFF}"

    # Configure Kolla-Ansible '/etc/kolla/globals.yml' Deployment File
    TITLE="Configure Kolla-Ansible '/etc/kolla/globals.yml' Deployment File"
    print_title

    KOLLA_GLOBAL="/etc/kolla/globals.yml"

    echo "kolla_base_distro: \"${KOLLA_BASE_IMAGE}\"" >> $KOLLA_GLOBAL
    echo "network_interface: \"${MANAGEMENT_NIC}\"" >> $KOLLA_GLOBAL
    echo "neutron_external_interface: \"${NEUTRON_NIC}\"" >> $KOLLA_GLOBAL
    echo "kolla_internal_vip_address: \"${KOLLA_VIP_ADDRESS}\"" >> $KOLLA_GLOBAL
    echo "enable_magnum:  \"${ENABLE_MAGNUM}\"" >> $KOLLA_GLOBAL
    echo "enable_cinder: \"${ENABLE_CINDER}\"" >> $KOLLA_GLOBAL
    echo "enable_cinder_backend_lvm: \"${ENABLE_CINDER_BACKEND_LVM}\"" >> $KOLLA_GLOBAL

    printf "${GREEN}Done\n${COLOUR_OFF}"

# Deploy Kolla-Ansible Openstack

    # Kolla-Ansible Bootstrap Servers
    TITLE="Bootstrapping Kolla-Ansible Servers"
    print_title

    kolla-ansible -i ./all-in-one bootstrap-servers

    printf "${GREEN}Done\n${COLOUR_OFF}"

    # Kolla-Ansible Pre-Checks
    TITLE="Running Kolla-Ansible Pre-Checks"
    print_title

    kolla-ansible -i ./all-in-one prechecks

    printf "${GREEN}Done\n${COLOUR_OFF}"

    # Kolla-Ansible Bootstrap Servers
    TITLE="Deploying Kolla-Ansible Openstack"
    print_title

    kolla-ansible -i ./all-in-one deploy

    printf "${GREEN}Done\n${COLOUR_OFF}"

# Perform Kolla-Ansible Post-Deploy Tasks

    # Kolla-Ansible Post-Deploy
    TITLE="Performing Kolla-Ansible Openstack Post Deployment Tasks"
    print_title

    kolla-ansible post-deploy

    printf "${GREEN}Done\n${COLOUR_OFF}"









#Get password from /etc/kolla/clouds.yaml
#log into web UI and download admin-openrc.sh
#cp admin-openrc.sh to ~/.config/openstack
#Update ~/.config/openstack with the password from clouds.yaml
###/path/to/venv/share/kolla-ansible/init-runonce ####source ~/.config/openstack

##Image Creation
#
#	#Create Fedora Image - v35 is the latest supported version for Zed (as of 05/03/2023) 
#	wget https://builds.coreos.fedoraproject.org/prod/streams/stable/builds/35.20220424.3.0/x86_64/fedora-coreos-35.20220424.3.0-openstack.x86_64.qcow2.xz
#	wget https://builds.coreos.fedoraproject.org/prod/streams/stable/builds/36.20221106.3.0/x86_64/fedora-coreos-36.20221106.3.0-openstack.x86_64.qcow2.xz 
#	wget https://builds.coreos.fedoraproject.org/prod/streams/stable/builds/37.20230205.3.0/x86_64/fedora-coreos-37.20230205.3.0-openstack.x86_64.qcow2.xz
#	unxz fedora-coreos-37.20230205.3.0-openstack.x86_64.qcow2.xz
#	unxz fedora-coreos-36.20221106.3.0-openstack.x86_64.qcow2.xz
#	unxz fedora-coreos-35.20220424.3.0-openstack.x86_64.qcow2.xz
#	openstack image create --disk-format qcow2 --container-format bare --property os_distro=fedora-coreos \
#	--public --file ./fedora-coreos-35.20220424.3.0-openstack.x86_64.qcow2 fedora-coreos-35
#	openstack image create --disk-format qcow2 --container-format bare --property os_distro=fedora-coreos \
#	--public --file ./fedora-coreos-36.20221106.3.0-openstack.x86_64.qcow2 fedora-coreos-36
#	openstack image create --disk-format qcow2 --container-format bare --property os_distro=fedora-coreos \
#	--public --file ./fedora-coreos-37.20230205.3.0-openstack.x86_64.qcow2 fedora-coreos-37
#
## Public Network Configuration
#	openstack network create --external --provider-physical-network physnet1 \
#	--provider-network-type flat public
#	openstack subnet create --dhcp \
#	--allocation-pool 'start=172.28.10.160,end=172.28.10.180' --network public \
#	--subnet-range '172.28.10.0/24' --gateway '172.28.10.254' --dns-nameserver 10.204.36.25 public-subnet
#
#
##Create Magnum Templates
#	openstack coe cluster template create kubernetes-cluster-template37 \
#						--image fedora-coreos-37 \
#						--external-network public \
#						--dns-nameserver 8.8.8.8 \
#						--master-flavor m1.small \
#						--flavor m1.small \
#						--coe kubernetes	
#	openstack coe cluster template create kubernetes-cluster-template36 \
#						--image fedora-coreos-36 \
#						--external-network public \
#						--dns-nameserver 8.8.8.8 \
#						--master-flavor m1.small \
#						--flavor m1.small \
#						--coe kubernetes
#	openstack coe cluster template create kubernetes-cluster-template35 \
#						--image fedora-coreos-35 \
#						--external-network public \
#						--dns-nameserver 8.8.8.8 \
#						--master-flavor m1.small \
#						--flavor m1.small \
#						--coe kubernetes
#
#
## Create Magnum K8s Cluster
#	CLUSTER_NAME="kubernetes-cluster"
#	openstack coe cluster create \
#		--cluster-template kubernetes-cluster-template37 \
#		--master-count 1 \
#		--node-count 1 \
#		--timeout 60 \
#		--keypair mykey \
#		$CLUSTER_NAME
#
#	openstack coe cluster show kubernetes-cluster
#	mkdir -p ~/clusters/kubernetes-cluster
#	$(openstack coe cluster config kubernetes-cluster --dir ~/clusters/kubernetes-cluster)
#	export KUBECONFIG=~/clusters/kubernetes-cluster/config
#
#	kubectl -n kube-system get pods






# Deployment Complete Message to User
#
#  TITLE="Deployment Complete"
#  print_title
#
#  printf "${GREEN}CONGRATULATIONS!!! K3s has been successfully deployed.\n${COLOUR_OFF}"
#  printf "${GREEN}Your K3s Dashboard is now available @ ${CYAN} https://${DASHBOARD_SUBDOMAIN}.${DOMAIN}\n${COLOUR_OFF}"
#  printf "${YELLOW}You will need to generate a token for authentication to the dashboard, you can use the aliased command ${RED}'admin' ${YELLOW}to get one\n${COLOUR_OFF}"
#  printf "${GREEN}Here is a token you can use right now (they do expire)\n${COLOUR_OFF}"
#
#  # Generating Dashboard Token
#  K3S_TOKEN=$(kubectl -n kubernetes-dashboard create token admin-user)
#
#  printf "${PURPLE}${K3S_TOKEN}\n${COLOUR_OFF}"
#
#  printf "${YELLOW}You will need to install the Self Signed CA Certificate on any machines you dont want to get TLS warnings on.\n${COLOUR_OFF}"
#  printf "${GREEN}The Self Signed CA Certificate has been automatically added to your K3 Hosts CA Store.\n${COLOUR_OFF}"
#  printf "${RED}Your Self Signed CA Certificate is:\n${COLOUR_OFF}"
#  printf '%s\n' "${SELFSIGNED_CA_CERTIFICATE}"
