#!/bin/bash

# Function to check the status of Nginx
check_nginx() {
    echo "Checking Nginx status..."
    systemctl is-active --quiet nginx && echo "Nginx is running." || echo "Nginx is not running."
}

# Function to check the status of PHP-FPM
check_php_fpm() {
    echo "Checking PHP-FPM status..."
    systemctl is-active --quiet php7.4-fpm && echo "PHP-FPM is running." || echo "PHP-FPM is not running."
}

# Function to check the status of MySQL
check_mysql() {
    echo "Checking MySQL status..."
    systemctl is-active --quiet mysql && echo "MySQL is running." || echo "MySQL is not running."
}

# Function to check system resources (Memory and CPU)
check_system_resources() {
    echo "Checking system resources..."
    echo "Memory status:"
    free -h
    echo "CPU status:"
    top -bn1 | grep "Cpu(s)"
}

# Main function to run all tests
run_tests() {
    check_nginx
    check_php_fpm
    check_mysql
    check_system_resources
}

# Start the tests
echo "Starting system tests..."
run_tests
