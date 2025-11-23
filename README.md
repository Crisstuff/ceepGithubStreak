# Ceep Github streak

This is a program that im running on a [raspberry pi](https://www.raspberrypi.com/) 5 to Ceep my github streak. It is a program that commit's a massage into this readMe file once every day its running.

### Tools: 
- crontab -e
- bash

### How it works
- This project uses crontab to set a rimainder to run this script once every day
- The `script.sh` file contains a bash script that opens the `README.md` file and types a massage to <b> Ceep Github streak </b> 🎉
- The script also count's the Total count and + 1 for each time it runs 

</br>

- See the longest held streak 
- Add the last time in the `Last updated` to see the last date it was updated
- Total count now is the amount of times the massage has been written to now  


# Version for Linux & Mac OS

## How to sett this up in general linux/mac PC
1. Clone this repositorry
2. Open the project and type this in the terminal vindow `pwd` | This will show the file path to your project `copy the file path`
3. Now type this in the terminal window `crontab -e` | Navigate to the part where it says `sdakfndjsa`
4. Then type in `00 00 * * *` & `your file path`
   
   After you have done this it should look something like this | `00 00 * * * /path/to/your/script.sh`

5. Now you`ll just have to have your machene run constantly and the script will run 00:00 every day 👍

## How to set this up on a raspberry pi 5

# Version for Window OS
- Working progress


# Times this ceepGithubStreak have run:
<b> Highest held streak: 100 days </b>

<b> Last updated: 00:00 21.11.2025 </b>

<b> Total count now: 12 </b>

<b> List of prints: </b>
This is a massage, 
This is a massage, 
This is a massage, 
This is a massage, 
This is a massage, 
This is a massage, 
This is a massage, 
This is a massage, 
