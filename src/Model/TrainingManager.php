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
        // $tables = array(
        //     'training', 'degree', 'sector', 'next_training', 'skill',
        //     'training_skill', 'training_next_training'
        // );

        // $foreignKeys = array(
        //     "training" => array("degree_id", "sector_id"),
        //     "training_skill" => array("training_id"),
        //     "training_next_training" => array("training_id", "next_training_id")
        // );

        $query = "DELETE t, d, s, n, sk, ts, tnt
        FROM training t
        LEFT JOIN degree d ON t.degree_id = d.id
        LEFT JOIN sector s ON t.sector_id = s.id
        LEFT JOIN next_training n ON t.id = n.training_id
        LEFT JOIN skill sk ON t.id = sk.id
        LEFT JOIN training_skill ts ON t.id = ts.training_id
        LEFT JOIN training_next_training tnt ON t.id = tnt.training_id
        WHERE t.id = :id";

        $statement = $this->pdo->prepare($query);
        $statement->bindValue('id', $id, \PDO::PARAM_INT);
        $statement->execute();
    }
}
