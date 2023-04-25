<?php

namespace App\Model;

class TrainingManager extends AbstractManager
{
    public const TABLE = 'training';

    public function selectAllTraining(): array
    {
        $query = "SELECT d.name degree_name, t.name training_name, d.duration, t.stage_duration, s.name sector_name
        FROM training t
        JOIN degree d ON d.id = t.degree_id
        JOIN sector s ON s.id = t.sector_id
        ORDER BY d.name DESC, t.name ASC;";

        $statement = $this->pdo->query($query);

        return $statement->fetchAll();
    }

    public function selectSector(): array
    {
        $query = "SELECT name FROM sector;";
        $statement = $this->pdo->query($query);

        return $statement->fetchAll();
    }
}
