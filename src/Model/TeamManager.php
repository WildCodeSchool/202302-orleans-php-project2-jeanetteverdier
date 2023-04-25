<?php

namespace App\Model;

use PDO;

class TeamManager extends AbstractManager
{
    public const TABLE = 'team';

    public function mySelectAll()
    {
        $query = "SELECT t.firstname, t.lastname, t.post, t.biography, t.picture, wd.name
        FROM team as t
        INNER JOIN work_departement as wd ON wd.id=t.work_departement_id;";
        $statement = $this->pdo->query($query);

        return  $statement->fetchAll();
    }

    public function workDepartement()
    {
        $query = "SELECT name from work_departement";
        $statement = $this->pdo->query($query);
        
        return $statement->fetchAll();
    }
}