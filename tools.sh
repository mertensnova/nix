#! /bin/bash
date_today=$(date)
echo "Today is: $date_today"

cd
sudo mkdir "Hacking Tools"
cd "Hacking Tools"

# ---------------------------- Explotation Tools --------------------------------
echo "Creating a directory for explotation tools..."
sudo mkdir Exploitation
cd Exploitation

# Installing Metasploit
echo "Installing Metasploit Framework..."
sudo snap install metasploit-framework --beta
echo "Metasploit Framework added..."

cd ../

# ---------------------------- OSINT Tools --------------------------------
echo "Creating  a directory for OSINT tools..."
sudo mkdir OSINT
cd OSINT

# Installing Sherlock
echo "Installing Sherlock..."
git clone https://github.com/sherlock-project/sherlock.git
cd sherlock
python3 -m pip install -r requirements.txt
cd ../
echo "Sherlock added..."

# Installing Instragram OSINT
echo "Installing OSINTgram..."
git clone https://github.com/Datalux/Osintgram.git
cd Osintgram
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
echo "OSINTgram added..."
cd ../

# Installing Phoneinfoga
echo "Installing Phoneinfoga..."
git clone https://github.com/sundowndev/PhoneInfoga
cd PhoneInfoga/
python3 -m pip install -r requirements.txt --user
cp config.example.py config.py 
python3 phoneinfoga.py -v
echo "Phoneinfoga added..."
cd ../

cd ../

# ---------------------------- Networking Tools --------------------------
echo "Creating a directory for networking tools..."
sudo mkdir Networking
cd Networking

# Installing WireShark
echo "Installing WireShark..."
sudo dnf install wireshark-qt
echo "WireShark added..."

# Installing Evillimitter	
echo "Installing Evillimiter..."
cd
git clone https://github.com/bitbrute/evillimiter.git
cd evillimiter
sudo python3 setup.py install
echo "Evillimmiter added..."
cd ../

# Installing Responder
echo "Installing Responder..."
git clone https://gitlab.com/kalilinux/packages/responder.git
echo "Responder added..."

cd ../

# ---------------------------- Password Cracking Tools --------------------------
echo "Creating a directory for password cracking..."
sudo mkdir Password-Cracking
cd Password-Cracking
# Installing Hydra
echo "Installing Hydra..."
sudo dnf -y install hydra
echo "Hydra added..."

# Installing HashCat
echo "Installing Hashcat..."
sudo dnf install hashcat
echo "Hashcat added..."

echo "Installing Hash Identifier"
sudo snap install hash-id

cd ../
# ---------------------------- Web-App Pentesting Tools --------------------------
echo "Creating a directory for web pentesing..."
sudo mkdir "Web-App Pentesting"
cd "Web-App Pentesting"

# Installing ffuf
echo "Installing FFuf..."
git clone https://github.com/ffuf/ffuf ; 
cd ffuf 
go get 
go build
cd ../

# Installing WhatWeb
echo "Installing WhatWeb..."
git clone https://github.com/urbanadventurer/WhatWeb.git

# Installing Seclists
echo "Installing SecLists..."
git clone https://github.com/danielmiessler/SecLists.git

# Installing HackCrawler
echo "Installing HackCrawler..."
go install github.com/hakluke/hakrawler@latest

echo "Installing Medusa..."
git clone https://src.fedoraproject.org/rpms/medusa.git

cd ../

# ----------------------------  Scripts --------------------------
echo "Creating a directory for scripts..."
sudo mkdir "Scripts"
cd "Scripts"
