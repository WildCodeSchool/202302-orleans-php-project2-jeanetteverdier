<?php

namespace App\Model;

use PDO;

class ActualityManager extends AbstractManager
{
    public const TABLE = 'actuality';

    public function selectAllActualities()
    {
        $query = "SELECT * FROM " . self::TABLE . " ORDER BY id DESC;";
        $statement = $this->pdo->query($query);
        return $statement->fetchAll();
    }

    public function selectLastEvent()
    {
        $query = "SELECT * FROM " . self::TABLE . " ORDER BY id DESC LIMIT 1;";
        $statement = $this->pdo->query($query);
        return $statement->fetch();
    }

    public function selectLastActualities()
    {
        $query = "SELECT * FROM " . self::TABLE . " ORDER BY `id` DESC LIMIT 6";
        $statement = $this->pdo->query($query);
        return $statement->fetchAll();
    }
}
