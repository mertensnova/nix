


find . ! -name 'ss.sh' -exec rm -rf {} +
sudo cp -r /etc/nixos .
sudo mv nixos/* . 
sudo rm -rf nixos

