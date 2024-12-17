pip install PyGithub
python daily_commit.py
crontab -e
0 12 * * * /usr/bin/python3 /path/to/daily_commit.py

# To ting jeg kan gjøre for og legge til Pat på en trygg måte: 
# jeg kan legge den inn i en fil på PCen så den ikke er i scriptet så kan jeg kalle på den derifra
# Jeg kan (Add the PAT as a GitHub Secret) eksempel er brukt i yaml filen her

