<?php

namespace App\Model;

use PDO;

class TrainingManager extends AbstractManager
{
    public const TABLE = 'training';

    public function selectAllTraining(): array
    {
        $query = "SELECT 
        t.*,
        t.name training_name,
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

    public function selectOneTraining(int $id): array|false
    {
        $query = "SELECT
        t.*, t.name training_name,
        s.name sector_name,
        d.name degree_name,
        d.duration degree_duration
        FROM training t
        JOIN sector s ON s.id = t.sector_id
        JOIN " . DegreeManager::TABLE . " d ON d.id = t.degree_id
        WHERE t.id=:id";

        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':id', $id, \PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetch();
    }

    public function deleteTraining(int $id): void
    {
        $query = "DELETE FROM training t
        WHERE t.id = :id";

        $statement = $this->pdo->prepare($query);
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();
    }
}
