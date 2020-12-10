# Modifier la config minikube
minikube config
    minikube config set memory 1024 : Exemple pour reconfigurer la mémoire vive

# Accéder à l'interface web d'administration Kubernetes
minikube dashboard

# Récupérer l'adresse IP du cluster en cours d'exécution
minikube ip 

# Obtenir les logs de l'instance en cours d'exécution pour du débogage
minikube logs 
    -f ou --follow : Suivre en permanence les logs de Minikube
    -n ou --length : Nombre de lignes à afficher (50 par défaut)
    --problems : Afficher uniquement les logs qui pointent vers des problèmes connus

# Se connecter en ssh sur le nœud Minikube
minikube ssh

# Démarrer un cluster Kubernetes local
minikube start
    --cpu <int> : Nombre de processeurs alloués au minikube VM (2 par défaut)
    --disk-size <string> : Taille de disque allouée à la VM minikube (format <number[<unit>], où unité = b, k, m or g) (par défaut "20g")
    --memory <int> : Quantité de RAM allouée à la VM mini-cube en Mo (par défaut 2048)
    --vm-driver <string> : Hyperviseur à utiliser (par défaut VirtualBox)

# Supprimer un cluster Kubernetes local
minikube delete

# Obtenir le statut d'un cluster Kubernetes local
minikube status

# Arrêter un cluster Kubernetes en cours d'exécution
minikube stop 

# Afficher le numéro de la version actuelle et la plus récente de Minikube 
minikube update-check 

# Afficher la version de Minikube
minikube version