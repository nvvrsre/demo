# 🚀 Pega Demo App – Docker Deployment on EC2

This guide helps you deploy your **Pega demo web app** (or dummy WAR) using **Docker** on an **AWS EC2 Ubuntu** instance.  
You’ll build the Docker image, run the container, and access it from your browser.

---

## 🧱 Step-by-Step Instructions

### 🧩 1️⃣ Switch to Root User

```bash
sudo su
```
Switching to root ensures you have permission to install and run Docker.

---

### 🧩 2️⃣ Update System Packages

```bash
apt update -y
```
This updates your package index to get the latest versions.

---

### 🧩 3️⃣ Install Docker

```bash
apt install docker.io -y
```

Installs Docker Engine from Ubuntu’s repository.

---

### 🧩 4️⃣ Clone Your Application Repository

```bash
git clone https://github.com/nvvrsre/demo.git # you can change repo details of yours
cd demo
```

This pulls your demo app source code (which includes the `Dockerfile`, WAR, or HTML).

---

### 🧩 5️⃣ Build the Docker Image

```bash
docker build -t demoapp:latest .
```

- Builds a Docker image from your `Dockerfile` in the current folder (`.`)
- Tags it as `demoapp:latest`  
  ✅ Note: In your original script, `demo` and `demoapp` were mixed — we use **demoapp** consistently here.

---

### 🧩 6️⃣ Run the Docker Container

```bash
docker run -d -p 8080:8080 --name pega-demo demoapp:latest
```

- `-d` → Detached mode (runs in background)  
- `-p 8080:8080` → Maps container port 8080 to EC2 port 8080  
- `--name pega-demo` → Assigns a name to your container  
- `demoapp:latest` → The image you built

✅ Verify it’s running:
```bash
docker ps
```

You should see something like:
```
CONTAINER ID   IMAGE           PORTS
abcd1234       demoapp:latest  0.0.0.0:8080->8080/tcp
```

---

### 🧩 7️⃣ (One-Time) Allow Port 8080 in AWS Security Group

1. Go to **AWS Console → EC2 → Instances**
2. Select your instance → scroll to **Security → Security groups**
3. Edit **Inbound Rules**
4. Add:
   - **Type:** Custom TCP
   - **Port:** 8080
   - **Source:** 0.0.0.0/0 (for testing)

✅ Now, EC2 will allow public HTTP traffic to port 8080.

---

### 🧩 8️⃣ Access the Application

In your browser, open:

👉 **http://publicIP:8080/pega/**

If your WAR is deployed under `/pega`, this will load the app.  
If you renamed it to `ROOT.war`, then use:

👉 **http://publicIP:8080**
