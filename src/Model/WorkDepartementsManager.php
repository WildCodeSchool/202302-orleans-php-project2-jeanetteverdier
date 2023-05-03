<?php

namespace App\Model;

use PDO;

class WorkDepartementsManager extends AbstractManager
{
    public const TABLE = 'work_departement';
    public function selectAllWorkDepartement()
    {
        $query = "SELECT name, id from work_departement";
        $statement = $this->pdo->query($query);
        return $statement->fetchAll();
    }
}
