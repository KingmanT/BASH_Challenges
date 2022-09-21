#!/bin/bash

# Provide a menu to user to select ssh or scp
# Based on user selection ask for user name and ip-address.
# For scp ask user for direction of copy: remote to local/local to remote.
# Copy file to destination home directory with same source file name.
# Ask for source/destination file location. If no destination location is provided
# If user gives destination along with filename, keep that as destination filename.
# If user provides only destination location (no file name), keep as source file name.
# Note: User should know the password for remote user.

read -p "Enter the IP address of the server you would like to interact with: " ip
read -p "Enter the username to use on that server: " uname
read -p "Enter the path on your local machine of where the public key to that IP is stored: " path
read -p "Enter the name of the file (and extension) containing the public key: " key
echo "-----------------------------------------------------------------"
echo " "
echo "From the following menu:"

PS3="What would you like to do today? "
options=("SSH" "SCP")
select ans in "${options[@]}"; 
do
    case $ans in 
        SSH)
            echo " "
            echo "You have chosen SSH"
            echo "Please confirm that you would like to use $key located in the directory $path to SSH into $uname@$ip"
            read -p "Press enter to continue or type 'exit' to cancel " ssh_ans
            if [[ $ssh_ans = "exit" ]]; then
                echo "cancelling program"
                exit 0
            else
                echo "Now connecting to $ip"
                cd $path
                ssh -i $key $uname@$ip
            fi
            break
        ;;
        SCP)
            echo " "
            echo "You have chosen SCP"
            cd $path

            echo "From the following menu:"
            PS3="Would you like to transfer a file from your local machine to the remote machine or from the remote machine to local?"
            options1=("Remote to Local" "Local to Remote")
            select ans1 in "${options1[@]}";
            do
                case $ans1 in
                    "Remote to Local")
                        read -p "Enter the the name of the file and it's extension that you would like to transfer from $ip: " file
                        read -p "Enter the location (path) of $file at $ip: " location
                        read -p "Enter the destination of the file in your local machine: " dest
                        read -p "Would you like to rename the file at the destination? (yes/no): " qrename
                        if [[ $qrename = "yes" ]]; then
                            read -p "Please enter the new name of the file: " newname
                            echo "Please confirm that you would like to transfer $file located in $location at $ip to folder $dest on your local machine with the name $newname"
                            read -p "Press enter to continue or type 'exit' to cancel " scpans
                            if [[ $scpans = "exit" ]]; then
                                echo "cancelling program"
                                exit 0
                            else 
                            echo "transferring file"
                            scp $uname@$ip:$location/$file $dest/$newname
                            fi
                        else
                            echo "Please confirm that you would like to transfer $file located in $location at $ip to folder $dest on your local machine"
                            read -p "Press enter to continue or type 'exit' to cancel " scp2ans
                            if [[ $scp2ans = "exit" ]]; then
                                echo "cancelling program"
                                exit 0
                            else 
                            echo "transferring file"
                            scp $uname@$ip:$location/$file $dest
                            fi
                        fi
                        break
                    ;;
                    "Local to Remote")
                        read -p "Enter the the name of the file and it's extension that you would like to transfer to $ip: " file
                        read -p "Enter the location (path) of $file in your local machine: " location
                        read -p "Enter the destination of the file at $ip: " dest
                        read -p "Would you like to rename the file at the destination? (yes/no): " qrename
                        if [[ $qrename = "yes" ]]; then
                            read -p "Please enter the new name of the file: " newname
                            echo "Please confirm that you would like to transfer $file located at $location to $ip in folder $dest with the name $newname"
                            read -p "Press enter to continue or type 'exit' to cancel " scpans
                            if [[ $scpans = "exit" ]]; then
                                echo "cancelling program"
                                exit 0
                            else 
                            echo "transferring file"
                            scp $location/$file $uname@$ip:$dest/$newname
                            fi
                        else
                            echo "Please confirm that you would like to transfer $file located at $location to $ip in folder $dest"
                            read -p "Press enter to continue or type 'exit' to cancel " scp2ans
                            if [[ $scp2ans = "exit" ]]; then
                                echo "cancelling program"
                                exit 0
                            else 
                            echo "transferring file"
                            scp $location/$file $uname@$ip:$dest
                            fi
                        fi
                        break
                    ;;
                    *)
                    echo "$REPLY is not a valid option.  Please enter an option from the list using it's number"
                    ;;
                esac
            done
            
            break
        ;;
        *)
            echo "$REPLY is not a valid option.  Please enter an option from the list using it's number"
        ;;
    esac
done
