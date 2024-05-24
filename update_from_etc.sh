sudo rm -rf flake.* hosts modules options
sudo cp -r /etc/nixos .
cd nixos
sudo mv * ../
cd ../
sudo rm -rf nixos
