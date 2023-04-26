<?php

namespace App\Model;

use PDO;

class WorkDepartementsManager extends AbstractManager
{
    public const TABLE = 'work_departement';
    public function SelectAllWorkDepartement()
    {
        $query = "SELECT name from work_departement";
        $statement = $this->pdo->query($query);
        return $statement->fetchAll();
    }
}