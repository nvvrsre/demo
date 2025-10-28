# demo
sudo su
apt update
apt install docker.io -y
git clone https://github.com/nvvrsre/demo.git
docker build -t demo:latest .
docker run -d -p 8080:8080 demoapp
