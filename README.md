# automateVMs

This repo allows the user to deploy manage AWS virtual machines via *ansible* or **ansible** 

---

## Get Set Up

#### Clone this repository

install git
clone

#### Set up your control node with dependencies

Get your control node set up with python, a virtual environment, python dependencies, ansible, and ansible collections dependencies:

Run setup.sh

if you don't yet have an ssh key pair, generate one:
'''bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "client to servers" -N ''
'''

source .venv/bin/activate


### 4: configure AWS credentials

- Create / login to AWS account
- generate access keys via the Identity and Access Management (IAM) section of your portal


apply the access keys to the temp memory of your control node :

'''
export AWS_ACCESS_KEY_ID=your-access-key
export AWS_SECRET_ACCESS_KEY=<your-secret-key>
export AWS_REGION=us-west-1
'''

### 5: run Ansible commands:

ansible-playbook playbooks/provision.yml  

ansible-inventory -i inventories/aws_ec2.yml --graph
ansible-inventory -i inventories/aws_ec2.yml --list
ansible -i inventories/aws_ec2.yml all -m ping


### project structure

'''
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
'''


'''
 bash
 echo "hello"
 '''

'''
bash
echo "hello"
'''