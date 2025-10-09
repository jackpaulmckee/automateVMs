# automateVMs

This repo allows the user to deploy manage AWS virtual machines via ansible 

---

## Getting Started:

#### 1. Clone this repository

#### 2. set up your local venv for software package dependencies

'
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
'

3. install ansible collections that this project uses

'
ansible-galaxy collection install -r collections/requirements.yml
ansible-galaxy collection install -r collections/requirements.yml -p collections
'

generate ssh keys on your host machine:


### 4: configure AWS credentials

- login to AWS account
- generate access keys via the Identity and Access Management (IAM) section of your portal




'
export AWS_ACCESS_KEY_ID=your-access-key
export AWS_SECRET_ACCESS_KEY=your-secret-key
export AWS_REGION=us-west-2
'

### 5: run playbooks in order

provision.yml


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




 bash
 echo "hello"
  
bash
echo "hello"