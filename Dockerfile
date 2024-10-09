# Étape 1 : Utiliser une image Node.js de base
FROM node:18-alpine

# Étape 2 : Définir le répertoire de travail
WORKDIR /app

# Étape 3 : Copier les fichiers package.json et package-lock.json dans le conteneur
COPY package.json package-lock.json ./

# Étape 4 : Installer les dépendances
RUN npm install

# Étape 5 : Copier le fichier .env pour les variables d'environnement
COPY .env .env

# Étape 6 : Copier tous les autres fichiers du projet dans le conteneur
COPY . .

# Étape 7 : Construire l'application Next.js pour la production
RUN npm run build

# Étape 8 : Exposer le port sur lequel Next.js va fonctionner
EXPOSE 3000

# Étape 9 : Démarrer l'application
CMD ["npm", "start"]

