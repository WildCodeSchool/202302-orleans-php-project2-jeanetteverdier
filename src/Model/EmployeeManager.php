<?php

namespace App\Model;

use PDO;

class EmployeeManager extends AbstractManager
{
    public const TABLE = 'employee';

    public function selectEmployeeWithDepartment()
    {
        $query = "SELECT t.id, t.firstname, t.lastname, t.post, t.biography, t.picture, wd.name
        FROM employee as t
        INNER JOIN work_departement as wd ON wd.id=t.work_departement_id;";
        $statement = $this->pdo->query($query);

        return  $statement->fetchAll();
    }

    public function insertEmploye(array $employe)
    {
        $query = "INSERT INTO "
        . self::TABLE .
        " (`firstname`, `lastname`, `post`, `work_departement_id`) VALUES 
        (:firstname, :lastname, :post, :work_departement_id);";
        $statement = $this->pdo->prepare($query);

        $statement->bindValue('firstname', $employe['firstname']);
        $statement->bindValue('lastname', $employe['lastname']);
        $statement->bindValue('post', $employe['post']);
        $statement->bindValue('work_departement_id', $employe['about']);

        return $statement->execute();
    }
}
