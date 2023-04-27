<?php

namespace App\Model;

class TrainingManager extends AbstractManager
{
    public const TABLE = 'training';

    public function selectAllTraining(): array
    {
        $query = "SELECT t.name training_name, t.stage_duration, s.name sector_name
        FROM training t
        JOIN sector s ON s.id = t.sector_id
        ORDER BY t.name ASC;";

        $statement = $this->pdo->query($query);

        return $statement->fetchAll();
    }
}
