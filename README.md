## Lab using Flask

### Run using flask
`python app/app.py`

### Run Docker
`docker-compose -f compose.yaml up`

### Run Unittest
`python -m unit_test`

### Robot Testing
`Robot ./test_cases.robot`

### intsall google headle
`sudo apt-get update`

# Install dependencies
`sudo apt-get install -y curl unzip xvfb libxi6 libgconf-2-4`

# Download and install Google Chrome
`curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -`
`echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list`
`sudo apt-get -y update`
`sudo apt-get -y install google-chrome-stable`

