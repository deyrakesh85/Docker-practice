#!/bin/sh

echo "========================="
echo "Checking Pre-requisites.."
echo "========================="

docker_installed="no"
docker_compose_installed="no"

if [ `docker -v | echo $?` -ne 0 ]; then

        echo "\nDocker is not running/installed\n"
else
        echo "\n`docker -v` ======>> \033[0;32m is found!!\033[0m\n"
                docker_installed="yes"
fi


if [ `docker-compose -v | echo $?` -ne 0 ]; then

        echo "\nDocker is not running/installed\n"
else
        echo "\n`docker-compose -v` ======>> \033[0;32m is found!!\033[0m\n"
                docker_compose_installed="yes"
fi


if [ $docker_installed = no -o $docker_compose_installed = no ]; then

        echo "Exiting as pre-requisites are not found."
        exit 1
else

        echo "All pre-requisites are found."
        echo "==============================="
        echo "*****  Starting Services  *****"
        echo "==============================="
        sudo docker-compose up -d
        if [ `echo $?` -eq 0 ]; then
                echo "\033[0;32mServices started successfully.\033[0m"
        else
                echo "There are some problem starting the appication."
                exit 1
        fi
fi