<?php 

use Database\Models\AuthorModel;
require_once(__DIR__."/../auth_redirection_staff.php");
    $author_id = explode("/",$_SERVER["REQUEST_URI"])[3];
    $author = AuthorModel::update($author_id,$_POST);
    if(isset($author["error"])){
        echo $author["error"];
        die();
    }   
    if($author == 1){
        header("Location: http://".$_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"]."/authors");
        die();
    }
   
