# Serveur HTTP avec Docker

Ce projet met en place un serveur HTTP minimaliste en **Python** avec `http.server`, conteneurisé avec **Docker**. Il inclut un pipeline **CI/CD** via **GitHub Actions** pour automatiser la construction et le push de l’image sur **DockerHub**.

---

## **1. Prérequis**

Avant de commencer, assure-toi d’avoir installé :

- [Docker](https://www.docker.com/get-started)
- Un compte sur [DockerHub](https://hub.docker.com/)

---

## **2. Construire et exécuter l’image Docker**

### **Construction de l’image**

Exécute la commande suivante pour construire l’image Docker :

```sh
docker build -t simple-http-server .
```

### **Exécution du conteneur**

Une fois l’image construite, lance le conteneur avec :

```sh
docker run -p 8000:8000 simple-http-server
```

Accède ensuite au serveur via :  
 **http://localhost:8000**

---

## **3. Taguer et Pousser l’image sur DockerHub**

Si tu veux publier ton image sur **DockerHub**, remplace `doucodese` par ton **nom d’utilisateur DockerHub**, puis suis ces étapes :

### **Connexion à DockerHub**

```sh
docker login -u <nom_utilisateur>
```

(Si demandé, entre ton mot de passe ou ton token DockerHub.)

### **Taguer l’image**

```sh
docker tag simple-http-server ${env:DOCKER_USERNAME}/simple-http-server:v1
```

### **Pousser l’image vers DockerHub**

```sh
 docker push ${env:DOCKER_USERNAME}/simple-http-server:v1.0
```

Ton image sera disponible sur DockerHub à l’adresse :  
 `https://hub.docker.com/r/doucodese/simple-http-server`

### **Exécuter directement l'image depuis DockerHub**

```sh
docker run -p 8000:8000 <nom_utilisateur>/simple-http-server:v1.0
```

---

## **4. Automatisation avec GitHub Actions**

Le projet inclut un pipeline **CI/CD** pour automatiser le build et le push vers **DockerHub** à chaque **push sur la branche `main`**.

### **Configurer les secrets GitHub**

Avant d’exécuter le pipeline, configure les **secrets GitHub** :

1. Va sur **GitHub** → **Ton dépôt** → **Settings** → **Secrets and variables** → **Actions**.
2. Ajoute ces **secrets** :
   - **DOCKER_USERNAME** = `nom_utilisateur`
   - **DOCKER_PASSWORD** = _(Ton mot de passe ou token DockerHub)_

### **Pipeline GitHub Actions (`.github/workflows/ci.yml`)**

Lors d’un `git push` sur `main`, GitHub Actions :  
 Construit l’image Docker  
 Se connecte à DockerHub  
 Tague et pousse l’image

---

## **5. Lancer avec Docker Compose **

Si tu préfères gérer le conteneur avec **Docker Compose**, utilise :

### **Construire et démarrer le service**

```sh
docker-compose up --build
```

---

## **6. Vérification après le déploiement**

Pour vérifier que l’image a bien été poussée sur **DockerHub**, va sur :  
 **https://hub.docker.com/r/doucodese/simple-http-server**

Tu peux aussi l’exécuter directement depuis DockerHub :

```sh
docker run -p 8000:8000 <nom_utilisateur>/simple-http-server:v1.0
```

---

### Auteur : **El Hadji Seydou Nourou Kandji**
