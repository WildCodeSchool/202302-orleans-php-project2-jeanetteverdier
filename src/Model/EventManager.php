<?php

namespace App\Model;

use PDO;

class EventManager extends AbstractManager
{
    public const TABLE = 'actuality';

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
