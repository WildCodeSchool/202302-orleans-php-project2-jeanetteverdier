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

    public function selectSector(): array
    {
        $query = "SELECT * FROM sector;";
        $statement = $this->pdo->query($query);

        return $statement->fetchAll();
    }

    public function selectDegree(): array
    {
        $query = 'SELECT * FROM degree;';
        $statement = $this->pdo->query($query);

        return $statement->fetchAll();
    }
}
