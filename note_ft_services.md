# KUBERNETES

### Quelques terminologie:

	Cluster: Ensemble de noeuds.
	
	Noeud de gestion: machine qui contrôle les noeuds de Kubernetes et assigne les tâches.
	
	Noeuds de calcul: machines qui contrôlent les tâches qui leur sont assignés. Ces noeuds sont contrôlés par le noeud de gestion Kubernetes.
	
	Pod: un ou plusieurs conteneurs déployés sur un seul noeud. Le pod est l'objet Kubernetes le plus petit et le plus simple.

	Service: méthode qui permet d'exposer une application exécutée sur un ensemble de pods en tant que service réseau. Le service dissocie la définition des tâches des pods.

	Volume: répertoire contenant des données auxquelles les conteneurs d'un pod peuvent accéder. Un volume Kubernetes a la même durée de vie que le pod dans lequel il se trouve et cette durée de vie dépasse celle de n'importe quel conteneur exécuté dans le pod. Ainsi, les données sont conservées lorsqu'un conteneur démarre.

	Espaces de noms: cluster virtuel. Les espaces de noms permettent à Kubernetes de gérer plusieurs clusters (pour plusieurs équipes ou projets) au sein d'un même cluster physique.

