**Apache Service Monitoring Bash Script**

This Bash script monitors the status of the Apache web server service and attempts to start it if it's not running. It provides an enhanced automated way to ensure the operational status of the Apache service.
Usage

    Save the script to a file named apache_test.sh

    Make the script executable by running the following command in your terminal:

    bash

chmod +x apache_test.sh

Run the script using the following command:

bash

    sudo ./apache_test.sh

Requirements

    This script assumes that the Apache service is managed using systemctl.

Caution

    This script is designed for basic monitoring and might not handle all scenarios of Apache service failure.
    It's recommended to test the script in a controlled environment before using it in production.
