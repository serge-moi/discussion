<?php


require_once("libraries/utilities.php");

// Je mets ma fonction isLoged dans une variable
$isLoged = isLoged();

// Si un utilisateur est connecté
if($isLoged){
    // Alors je redirige vers l'index
    redirect("index.php");
}

// Si le formulaire est validé alors je peux continuer
if(isset($_POST["inscription"])){
    $login = extractSafeFromPost("login");
    $password = filter_input(INPUT_POST,"password");
    $password2 = filter_input(INPUT_POST,"password2");
    $hash = password_hash($password, PASSWORD_BCRYPT);


    // Si l'utilisateur a bien entré un login et un mot de passe je continue
    if(!empty($_POST["login"]) && !empty($_POST["password"])){

        // Je stock dans une variable la longueur de mon login
        $loginsize =strlen($login);
        // Si mon login est inférieur ou égale a 255 charactères je continue
        if($loginsize <= 10){
            // Je me connecte a ma bdd
            $connexion = getCo();
            if(!$connexion){
                die("Connexion failed: ".mysqli_connect_error());
            }
            $requete = "SELECT login FROM utilisateurs WHERE login = \"$login\"";
            $query = mysqli_query($connexion, $requete);
            $resultat = mysqli_fetch_all($query);
            // Si la variable résultat n'est pas vide
            if(!empty($resultat)){
                // Je signale a l'utilisateur qu'il y a déjà un utilisateur avec ce login
                $erreur = "Ce login est déjà pris";
            }else{
                // Sinon si le mdp est égale a mdp confirmé alors je continue
                if($password == $password2){
                    // Je crée une requête d'insertion
                    $requete = "INSERT INTO utilisateurs(login, password) VALUES ('$login','$hash')";
                    $query = mysqli_query($connexion, $requete);
                    // Je crée un message de session pour confirmer que le compte a bien été créé
                    $_SESSION["comptecree"] = "Votre compte a bien été créé";
                    redirect("index.php");
                }else{
                    // Sinon la confirmation de mdp ne correspond pas au mdp, j'affiche un message d'erreur
                    $erreur = "Vos mots de passes ne correspondent pas !";
                }
            }
        }
        else{
            // Sinon mon login est supérieur a 10 caractères alors j'affiche un message d'erreur
            $erreur = "Votre pseudo ne doit pas dépasser 10 caractères";
        }
    }
    else{
        // Sinon le login ou le mdp n'a pas été entré dans le formulaire et j'affiche un message d'erreur
        $erreur = "Tous les champs doivent être completé";
    }
}


require("templates/inscription.phtml");


?>