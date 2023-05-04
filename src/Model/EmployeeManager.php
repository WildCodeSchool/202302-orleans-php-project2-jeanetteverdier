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

    public function insertEmploye(array $employee)
    {
        $query = "INSERT INTO "
        . self::TABLE .
        " (`firstname`, `lastname`, `post`, `work_departement_id`) VALUES 
        (:firstname, :lastname, :post, :work_departement_id);";
        $statement = $this->pdo->prepare($query);

        $statement->bindValue('firstname', $employee['firstname']);
        $statement->bindValue('lastname', $employee['lastname']);
        $statement->bindValue('post', $employee['post']);
        $statement->bindValue('work_departement_id', $employee['departementId']);

        return $statement->execute();
    }
}
