<?php

namespace App\Model;

use PDO;

class EmployeeManager extends AbstractManager
{
    public const TABLE = 'employee';

    public function selectEmployeeWithDepartment()
    {
        $query = "SELECT t.firstname, t.lastname, t.post, t.biography, t.picture, wd.name
        FROM employee as t
        INNER JOIN work_departement as wd ON wd.id=t.work_departement_id;";
        $statement = $this->pdo->query($query);

        return  $statement->fetchAll();
    }
}
