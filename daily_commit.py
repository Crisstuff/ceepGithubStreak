from github import Github 
from datetime import datetime
import os



# GitHub Personal Access Token
GITHUB_TOKEN = "your_personal_access_token/ PAT"
REPO_NAME = "Crisstuff/ceepGithubStreak"  # Replace with "username/repository"

# File details
FILE_PATH = "daily_commit.txt"  # File to be created or updated
COMMIT_MESSAGE = "Daily update"

# Initialize GitHub API client
g = Github(GITHUB_TOKEN)

try:
    # Get the repository
    repo = g.get_repo(REPO_NAME)
    
    # Get the current date
    today = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    # Check if the file exists
    try:
        file = repo.get_contents(FILE_PATH)
        # Update the file with new content
        new_content = f"Last updated: {today}"
        repo.update_file(file.path, COMMIT_MESSAGE, new_content, file.sha)
        print(f"Updated {FILE_PATH} with new content.")
    except:
        # If the file does not exist, create it
        content = f"Created on: {today}"
        repo.create_file(FILE_PATH, COMMIT_MESSAGE, content)
        print(f"Created {FILE_PATH} in the repository.")

except Exception as e:
    print(f"An error occurred: {e}")
