# Deploy to Amazon EC2

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
1. Add `secrets` to the *.gitignore` file
1. Go to to EC2 managment console, select *instance-1* and click the *Connect* button.
1. In your terminal, change the permissions for the *instance-1.pem* file to not be publicly viewable
    ```bash
    chmod 400 secret/instance-1.pem
    ```
1. ssh into the instance
    ```bash
    ssh -i "secret/instance-1.pem" ubuntu@ec2-54-213-141-131.us-west-2.compute.amazonaws.com
    ```
1. Create a new `/apps` directory in the home folder.
1. Install *git* on the instance
    ```bash
    sudo apt-get install git
    ```
1. Clone the *learning-web-apps* repo into the instance
    ```bash
    git clone https://github.com/jackblandin/learning-web-apps.git
    ```

## Install Nginx and Unicorn
1. Install nginx on instance-1:
    ```bash
    sudo-apt-get install nginx
    ```
1. Install Bundler on instance-1
    ```bash
    sudo apt-get install bundler
    ``` 
1. Install ruby on instance-1
2. Install rbenv on instance-1

1. Install Unicorn on instance-1
    ```
    sudo apt-get install 
    




    
