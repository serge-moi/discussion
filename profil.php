<?php

require_once("libraries/utilities.php");


// Je mets ma fonction isLoged dans une variable
$isLoged = isLoged();

// Si aucun utilisateur connecté
if(!$isLoged){
    // Alors je redirige vers l'index
    redirect("index.php");
}


// je stock les elements dans des variables
$login = extractSafeFromPost("login");
$password = filter_input(INPUT_POST,"password");
$newPass = filter_input(INPUT_POST,"newMdp");
$newPass2 = filter_input(INPUT_POST,"newMdp2");
$hash2 = password_hash($newPass, PASSWORD_BCRYPT);

// Connexion a la base de donnée
$connexion = getCo();
if(!$connexion){
    die("Connexion failed: ".mysqli_connect_error());
}
// Je lance une requete qui récupère les utilisateurs via leurs id
$requete = "SELECT * FROM utilisateurs WHERE login ='".$_SESSION['login']."';";
$query=mysqli_query($connexion,$requete);
$resultat = mysqli_fetch_all($query);



// Si le formulaire a été validé alors je continue
if(isset($_POST["modifier"])){
    $connexion = getCo();
    if(!$connexion){
        die("Connexion failed: ".mysqli_connect_error());
    }
    $requete = "SELECT COUNT(login) FROM utilisateurs WHERE login = \"$login\"";
    $query=mysqli_query($connexion,$requete);
    $count =mysqli_fetch_all($query);

    if($count[0][0]==0||$login==$_SESSION["login"]){
        if(password_verify($password, $resultat[0][2]) && $newPass == $newPass2){
            if($newPass != ""){
                $connexion = getCo();
                if(!$connexion){
                    die("Connexion failed: ".mysqli_connect_error());
                }
                $requete = "UPDATE utilisateurs SET password = \"$hash2\", login = \"$login\" WHERE utilisateurs.id = ".$resultat[0][0]."";
                echo $requete;
                $query = mysqli_query($connexion,$requete);
                $_SESSION["login"]=$login;
                redirect("profil.php");
            } else {
                $connexion = getCo();
                if(!$connexion){
                    die("Connexion failed: ".mysqli_connect_error());
                }
                $requete = "UPDATE utilisateurs SET login = \"$login\" WHERE utilisateurs.id = ".$resultat[0][0]."";
                echo $requete;
                $query = mysqli_query($connexion, $requete);
                $_SESSION["login"]=$login;
                redirect("profil.php");
            }
        } else {
            $erreur = "Mot de passe incorrect";
        }
    } else {
        $erreur = "Ce login est déja utilisé";
    }
}
require("templates/profil.phtml");