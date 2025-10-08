# automateVMs

infrastructure automation project using **Ansible** to manage AWS virtual machines

---

## getting started

### 1: clone this repository

### 2: set up your local venv for python and ansible dependencies
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

### 3: install ansible collections that this project uses

ansible-galaxy collection install -r collections/requirements.yml
ansible-galaxy collection install -r collections/requirements.yml -p collections

### 4: configure AWS credentials

export AWS_ACCESS_KEY_ID=your-access-key
export AWS_SECRET_ACCESS_KEY=your-secret-key
export AWS_REGION=us-west-2

### 5: run a playbook

ansible-playbook playbooks/example.yml

### project structure
automateVMs/
├── .venv/                      # Python virtual environment (not tracked by Git)
├── ansible.cfg                 # Ansible configuration file
├── collections/
│   └── requirements.yml        # Ansible Galaxy collection dependencies
├── inventories/                # Host and group definitions
├── playbooks/                  # Main Ansible playbooks
├── requirements.txt            # Python package dependencies
├── shell_scripts/              # Helper scripts
├── templates/                  # Jinja2 templates
└── README.md                   # Project documentation




