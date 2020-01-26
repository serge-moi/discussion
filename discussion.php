<?php

require_once("libraries/utilities.php");


$connexion = getCo();
$requete = "SELECT date_format(date,'%d/%m/%Y %H:%i:%s'), login, message FROM utilisateurs INNER JOIN messages ON utilisateurs.id = messages.id_utilisateur ORDER BY date DESC";
$query = mysqli_query($connexion, $requete);
$resultat = mysqli_fetch_all($query);



if(isset($_POST["message"]) && $_POST["message"] != "" && isset($_SESSION["id"])){
    $mess = $_POST["message"];
    $messlash = addslashes($mess);
    $connexion = getCo();
    $requete = "INSERT INTO `messages`(`id`, `message`, `id_utilisateur`, `date`) VALUES (null,'$messlash','".$_SESSION["id"]."',now())";
    $query = mysqli_query($connexion,$requete);
    redirect("discussion.php");
}
if(isset($_POST["message"]) && empty($_POST["message"])){
    $erreur = "Veuillez écrire quelque chose";
}

require("templates/discussion.phtml");













?>