<?php

namespace App\Model;

class TrainingManager extends AbstractManager
{
    public const TABLE = 'training';

    public function selectAllTraining(): array
    {
        $query = "SELECT
        t.name training_name,
        t.stage_duration,
        t.image,
        s.name sector_name,
        d.name degree_name,
        d.duration degree_duration
        FROM " . static::TABLE . " t
        JOIN " . SectorManager::TABLE . " s ON s.id = t.sector_id
        JOIN " . DegreeManager::TABLE . " d ON d.id = t.degree_id
        ORDER BY d.name DESC, t.name ASC;";

        $statement = $this->pdo->query($query);

        return $statement->fetchAll();
    }
}
