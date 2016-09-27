# Create Production Environment using Amazon EC2 instance

## Create EC2 instance
1. [Create AWS account](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html#cli-signup)
1. Download Google Authenticatior App for iPhone
1. Create [IAM](https://aws.amazon.com/iam/) user
    1. Open the [IAM console](https://console.aws.amazon.com/iam/home?#home)
    1. In the navigation pane, choose Users.
    1. Choose your IAM user name (not the check box).
    1. Choose the Security Credentials tab and then choose Create Access Key.
    1. To see your access key, choose Show User Security Credentials
    1. Choose Download Credentials, and store the keys in a secure location.
1. [Launch EC2 instance](https://us-west-2.console.aws.amazon.com/quickstart/vm/home?region=us-west-2)
1. Save the instance key-value credentials (the .pem) file into a new */secrets* directory.
1. Create a *.gitignore* file
1. Add `secrets` to the *.gitignore* file
1. Go to to EC2 managment console, select *instance-1* and click the *Connect* button.
1. In your terminal, change the permissions for the *instance-1.pem* file to not be publicly viewable
    
    ```bash
    chmod 400 secret/instance-1.pem
    ```
1. ssh into the instance
    ```bash
    ssh -i "secret/instance-1.pem" ubuntu@ec2-54-213-141-131.us-west-2.compute.amazonaws.com
    ```

## Install packages
1. Install *git*
    ```bash
    sudo apt-get install git
    ```
1. Install *Nginx*
    ```bash
    sudo-apt-get install nginx
    ```
1. Install *rbenv*
    ```bash
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    ```
1. Install *ruby-build*
    ```bash
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    ```
1. Create *.bashrc.local* with *rbenv*/*ruby-build* shims
    ```bash
    touch ~/.bashrc.local
    ```
    ```bash
    # .bashrc.local

    export PATH="$HOME/.rbenv/bin:$PATH"
    export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
    eval "$(rbenv init -)"
    ```
1. Source *.bashrc.local* from *.bashrc*
    ```bash
    # .bashrc

    ...

    source ~/.bashrc.local
    ```
1. Install *Ruby*
    ```bash
    rbenv install 2.1.2
    ```
1. Install *Bundler*
    ```bash
    gem install bundler
    ``` 
1. Install *Unicorn*
    ```bash
    gem install unicorn
    ```
1. Install *postgresql*
    ```bash
    sudo apt-get install postgresql libpq-dev
    ```

## Pull in your codebase
1. Create a new `/apps` directory in the home folder.
1. Clone the *learning-web-apps* repo into EC2 instance
    ```bash
    git clone https://github.com/jackblandin/learning-web-apps.git
    ```
1. Install bundles
    ```bash
    bundle install
    ```

    If this fails, try this:
    ```bash
    sudo chown -R ubuntu /home/ubuntu/.bundle
    bundle install
    ```

## Setup application server (Unicorn)
1. Create */var/www/* directory
    ```bash
    cd /var
    sudo mkdir www
    ```
1. Create a *unicorn*.rb file in `/var/www/notes-svc/` directory
    ```bash
    cd www
    sudo mkdir notes-svc
    cd notes-svc
    sudo touch unicorn.rb
    ```
    ```rb
    # unicorn.rb

    # Set the working application directory
    # working_directory "/path/to/your/app"
    working_directory "/var/www/notes-svc"

    # Unicorn PID file location
    # pid "/path/to/pids/unicorn.pid"
    pid "/var/www/notes-svc/pids/unicorn.pid"

    # Path to logs
    # stderr_path "/path/to/logs/unicorn.log"
    # stdout_path "/path/to/logs/unicorn.log"
    stderr_path "/var/www/notes-svc/logs/unicorn.log"
    stdout_path "/var/www/notes-svc/logs/unicorn.log"

    # Unicorn socket
    # listen "/tmp/unicorn.[app name].sock"
    listen "/tmp/unicorn.notessvc.sock"

    # Number of processes
    # worker_processes 4
    worker_processes 2

    # Time-out
    timeout 30
    ```
1. Test *Unicorn*
    ```bash
    cd ~/apps/notes_app/
    unicorn
    ```
