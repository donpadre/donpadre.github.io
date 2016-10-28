---
title: "Comment utiliser « Bash sur Ubuntu pour Windows » avec Cmder (ComEmu) ?!"
title_seo: "Comment faire fonctionner « Bash sur Ubuntu pour Windows » avec Cmder ?!"
description: "Comment faire fonctionner « Bash sur Ubuntu pour Windows » avec Cmder ?!"
date: 2016-09-25 08:00 CEST
hero_image: "bash-windows.webp"
thumbnail: "bash-windows.webp"
category: Linux
excerpt: "Avec la mise à jour Anniversary de Windows 10 est apparu dans sa version professionnel, « Bash sur Ubuntu pour Windows »  un vrai invité de commande Linux pour Windows comme son nom l’indique. Microsoft à créer cet invité de commande en partenariat avec Canonial, l’éditeur qui se trouve derrière Ubuntu. Encore à ses balbutiements par rapport un vrai invité de commande sous Linux ou Unix, au niveau des performances d’exécution."
author: olivier
---

![bash-windows](https://i1.wp.com/www.donpadre.fr/wp-content/uploads/2016/09/bash-windows.png?resize=720%2C302&ssl=1 "Bash sur Ubuntu pour Windows")

Sous _Windows_ j’ai pris pour l’habitude d’utiliser **Cmder** un émulateur d’invité de commande Linux, qui contient un Bash émuler pour faire du Web développement afin d’utiliser des technologies comme **_Nodejs , __Sass, _Gulp, _Bower,_ _et_ _PHP-cli_**, en ligne commande.

![cmder-bash-ubuntu-for-windows-10](https://i2.wp.com/www.donpadre.fr/wp-content/uploads/2016/09/cmder-bash-ubuntu-for-windows-10.png?resize=720%2C300&ssl=1 "Cmder avec Bash sur Ubuntu sur Windows")

Et je me suis posé la question comment lier **Bash sur _Ubuntu_** et _**Cmder,** _en fouillant un peu sur les internet j’ai trouvé mon bonheur dans un Issues du **Github**  officiel de _Cmder._

Pour cela nous allons mettre en place une nouvelle tâche appelé  **« Bash::Ubuntu »** dans Cmder :

1. Ouvrir les paramètres soit en cliquant sur les 3 barres en bas a droite de la fenêtre ou en utilisant la combinaison de touche **_Win+Alt+P_,**
2.  Aller dans _**Startup->Tasks,**_
3.  Cliquer sur le bouton **+** en bas à gauche afin d’ajouter une nouvelle tâche,
4.  **Choisir un nom pour votre tâche**,
5.  Dans **Task parameters** rentrer cette ligne :
    _/icon « %USERPROFILE%\AppData\Local\lxss\bash.ico »_
6.  Dans **Commands** : rentrer cette ligne :
    _%windir%\System32\bash.exe ~ -c zsh -cur_console:p_
7.  Sauvegarder votre tâche en cliquant sur **Save setting**

Et voilà tout est près, vous pouvez utiliser cmder avec bash ubuntu pour windows.


![cmder-settings](https://i1.wp.com/www.donpadre.fr/wp-content/uploads/2016/09/cmder-settings-1.png?resize=720%2C462&ssl=1 "Paramètre de cmder")



Source splash : [Ayesh.me](https://ayesh.me/)
