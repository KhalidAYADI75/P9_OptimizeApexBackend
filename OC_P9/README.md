La version finale du projet se trouve dans la branche Release/V1 .
# Description du projet
## Problématiques à résoudre.
Ralentissement du fonctionnement de l’application et nombreux bugs :

● Quand un commercial de FASHA est en train de mettre à jour une commande sur un compte qui a déjà 100 commandes, il rencontre une erreur 
dans le déclencheur “UpdateAccountCA”.<br />
● Sur la commande, il y a un champ Net Amount (“NetAmount__c”), qui est calculé automatiquement selon la formule suivante:NetAmount = TotalAmount - ShipmentCost. <br />
Le process fonctionne très bien quand une ligne de commande est ajouté depuis l’interface, mais quand plusieurs lignes sont ajoutées avec data loader, 
seule la première commande est mise à jour.<br />
● Code désorganisé : pas de conventions de nommage, classes trop longues.<br />
● Les classes de tests ne respectent pas les bonnes pratiques de Salesforce pour la validation des résultats.<br />
● Le prix des produits est mis à jour chaque semaine. Le code se lançant chaque semaine pour mettre à jour le chiffre d’affaires prend plusieurs heures.<br />

## Besoins :
● Optimiser l’application.<br />
● Réorganiser le code.

## Identification de la mission :
Optimisation de l’application suivant les demandes ci-dessous : <br />
● Mise à jour du chiffre d’affaires sur le compte au passage du statut de la commande à Ordered.<br />
● Réalisation et lancement d’un batch mettant à jour le chiffre d’affaires de tous les comptes lors de la migration des données. <br />
● Affichage des commandes d’une équipe par commercial. <br />

Réorganisation du code suivant les demandes ci-dessous : <br />
● Mise en place de conventions de nommage.<br />
● Optimisation des classes : <br />
○ .trigger <br />
○ MyTeamOrdersController.cls <br />
○ testUpdateAccountCA.cls <br />
○ UpdateAccountCA.trigger <br />
○ UpdateAccounts.cls <br />
○ UpdateAllAccounts.cls
La version finale du projet se trouve dans la branche Release/V1 .
# Description du projet
## Problématiques à résoudre.
Ralentissement du fonctionnement de l’application et nombreux bugs :

● Quand un commercial de FASHA est en train de mettre à jour une commande sur un compte qui a déjà 100 commandes, il rencontre une erreur 
dans le déclencheur “UpdateAccountCA”.<br />
● Sur la commande, il y a un champ Net Amount (“NetAmount__c”), qui est calculé automatiquement selon la formule suivante:NetAmount = TotalAmount - ShipmentCost. <br />
Le process fonctionne très bien quand une ligne de commande est ajouté depuis l’interface, mais quand plusieurs lignes sont ajoutées avec data loader, 
seule la première commande est mise à jour.<br />
● Code désorganisé : pas de conventions de nommage, classes trop longues.<br />
● Les classes de tests ne respectent pas les bonnes pratiques de Salesforce pour la validation des résultats.<br />
● Le prix des produits est mis à jour chaque semaine. Le code se lançant chaque semaine pour mettre à jour le chiffre d’affaires prend plusieurs heures.<br />

## Besoins :
● Optimiser l’application.<br />
● Réorganiser le code.

## Identification de la mission :
Optimisation de l’application suivant les demandes ci-dessous : <br />
● Mise à jour du chiffre d’affaires sur le compte au passage du statut de la commande à Ordered.<br />
● Réalisation et lancement d’un batch mettant à jour le chiffre d’affaires de tous les comptes lors de la migration des données. <br />
● Affichage des commandes d’une équipe par commercial. <br />

Réorganisation du code suivant les demandes ci-dessous : <br />
● Mise en place de conventions de nommage.<br />
● Optimisation des classes : <br />
○ .trigger <br />
○ MyTeamOrdersController.cls <br />
○ testUpdateAccountCA.cls <br />
○ UpdateAccountCA.trigger <br />
○ UpdateAccounts.cls <br />
○ UpdateAllAccounts.cls
