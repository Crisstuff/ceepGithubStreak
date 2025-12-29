# Ceep Github streak

This is a program that im running on a [raspberry pi](https://www.raspberrypi.com/) 5 to Ceep my github streak. It commit's a massage into this README.md file once every day its running.

### Tools: 
- crontab -e
- bash

### How it works
- This project uses crontab to set a rimainder to run this script once every day
- The `script.sh` file contains a bash script that opens the `README.md` file and types a massage to <b> Ceep Github streak </b> 🎉
- The script also count's the Total count and + 1 for each time it runs 

</br>

### Conditions to the script: 
- See the `Highest held streak`: If the streak is higher than the `Highest held streak` the `Total count now` amount becomes the new  `Highest held streak` amount.
- Add the last time the streak was updated in the `Last updated` to see the last date it was updated.
- Show the `Total count now` of the streak by counting the massages under the `List of prints`. 
- If the `Last updated` date isnt from the day erlyer the `List of prints` gets viped and the `Total count now` gets set back to 0.


# Version for Linux & Mac OS

## How to sett this up in general linux/mac PC
1. Clone this repositorry
2. Open the `README.md` scroll to the bottom of the file and change the information under `Times this ceepGithubStreak have run`
   
   | From this | To this |
   | :------- | :------- |
   | Highest held streak: 1 days | Highest held streak: X days  | 
   | Last updated: 23.11.2025 |  Last updated: DD.MM.YYYY |
   | Total count now: 1 |  Total count now: 0  |
   
   And delate all the `This is a message` comments under the `List of prints`.

   This resets the the README.md to production.
    
4. In the terminal type `chmod +x script.sh` & klikk `enter` | This will make the script runeble.
5. Open the project and type this in the terminal vindow `pwd` | This will show the file path to your project `copy the file path`.
6. Type this in the terminal window `crontab -e` | To write `shift I` this means Insert.
7. Type in `00 00 * * *` & `your file path` & `script.sh` | remember that.
   
   After you have done this it should look something like this | `00 00 * * * cd /path/to/your/repo && ./script.sh`.
   
   Then klikk `esc` to get out of Insert mode, Then write `:wq` this means write quit and saves your changes.

8. Now you`ll just have to have your machene run constantly and the script will run 00:00 every day 👍

## How to set this up on a raspberry pi 5
- Work in progress 

# Version for Window OS
- Work in progress



# Times this ceepGithubStreak have run:

This part of the README will be where the commits are happening. The list under will be updated every day the script is running under `List of prints` you will see all the massages that has been commited in your current streak. NOTE: The info for to update each day is beaing calculated using the date in `Last updated`. I recomend to not try to edit any of the information under so that you dont messup the streak.

<b> Highest held streak: 1 days </b>

<b> Last updated: 29.12.2025 </b>

<b> Total count now: 1 </b>

<b> List of prints: </b>

This is a message, 23.12.2025
This is a message - 23.12.2025 15:16:12
This is a message - 23.12.2025 15:16:40
This is a message - 23.12.2025 15:22:49
This is a message - 23.12.2025 15:22:52
This is a message - 23.12.2025 15:22:53
This is a message - 23.12.2025 15:22:54
This is a message - 29.12.2025 18:03:01
