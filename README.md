Le code source d'un petit Proof Of Concept permettant de présenter une approche Map/Reduce de traitement de données.

Ce PoC repose sur l'analyse d'un corpus de tweets:
- dans un premier cas on charge un fichier volumineux afin d'extraite le nombre de hashtags qui le composent. Le chargement est donc potentiellement long. Dans le futur, rien d'indique que le fichier ne sera pas plus important. Donc aucune maitrise à ce niveau.
- dans un second temps, on charge le fichier "splité" dans différents plus petits fichiers puis on applique l'approche Map/Reduce sur les données afin d'extraire les mêmes informations. Cette approche est basée sur des Threads. Normalement elle devra se faire un ensemble de machines.
