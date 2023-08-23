#!/bin/bash

function start_project() {
    docker-compose up -d
}

function stop_project() {
    docker-compose down
}

function open_browser() {
    # Change this depending on your OS and browser preference
    # For MacOS with default browser:
    open http://localhost:8080

    # For Linux with xdg-open (default browser):
    # xdg-open http://localhost:8080

    # For Windows (assuming WSL):
    # /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe http://localhost:8080
}

function connect_mysql() {
    docker exec -it lamp_mysql_1 mysql -uroot -ppoopypants
}

while true; do
    echo "Choose an option:"
    echo "1) docker-compose up"
    echo "2) docker-compose down"
    echo "3) Open in browser"
    echo "4) Connect to MySQL"
    echo "5) Exit"
    read -p "Enter choice: " choice

    case $choice in
        1)
            start_project
            ;;
        2)
            stop_project
            ;;
        3)
            open_browser
            ;;
        4)
            connect_mysql
            ;;
        5)
            exit 0
            ;;
        *)
            echo "Invalid choice!"
            ;;
    esac
done
