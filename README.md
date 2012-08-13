Juste un petitt Proof Of Concept permettant de présenter une approche Map/Reduce de traitement de données.

Ce PoC repose sur l'analyse d'un corpus de tweets:
- dans un premier cas on charge un fichier volumineux afin d'extraite le nombre de hashtags qui le compose. Le chargement est donc potentiellement long. De plus rien n'indique que dans le temps se fichier n'évoluera de façon importante et rapide.
- dans un second temps on charge, le fichier "splité", puis on applique l'approche Map/Reduce sur les données afin d'extraire les mêmes informations. Cette approche est basée sur des Threads. Normalement elle devra se faire un ensemble de machines.
