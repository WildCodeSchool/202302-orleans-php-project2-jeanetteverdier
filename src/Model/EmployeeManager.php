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
    public function insertEmployee(array $employee): int
    {
        $statement = $this->pdo->prepare("INSERT INTO "
            . self::TABLE .
            " (`firstname`), (`lastname`), (`post`), (`picture`)
        VALUES (:firstname), (:lastname), (:post), (:picture)");
        $statement->bindValue('firstname', $employee['firstname'], PDO::PARAM_STR);
        $statement->bindValue('lastname', $employee['lastname'], PDO::PARAM_STR);
        $statement->bindValue('post', $employee['post'], PDO::PARAM_STR);
        $statement->bindValue('picture', $employee['picture'], PDO::PARAM_STR);

        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    public function updateEmployee(array $employe): bool
    {
        $statement = $this->pdo->prepare("UPDATE " . self::TABLE .
            " SET `firstname` = :firstname,
        `lastname` = :lastname,
        `post` = :post,
        `picture` = :picture,
         WHERE id=:id");
        $statement->bindValue('id', $employe['id'], PDO::PARAM_INT);
        $statement->bindValue('firstname', $employe['firstname'], PDO::PARAM_STR);
        $statement->bindValue('lastname', $employe['lastname'], PDO::PARAM_STR);
        $statement->bindValue('post', $employe['post'], PDO::PARAM_STR);
        $statement->bindValue('picture', $employe['picture'], PDO::PARAM_STR);

        return $statement->execute();
    }
}
