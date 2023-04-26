<?php

namespace App\Model;

class TrainingManager extends AbstractManager
{
    public const TABLE = 'training';

    public function selectAllTraining(): array
    {
        $query = "SELECT * FROM training";

        $statement = $this->pdo->query($query);

        return $statement->fetchAll();
    }
}
