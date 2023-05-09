<?php

namespace App\Model;

use PDO;

class TrainingNextTrainingManager extends AbstractManager
{
    public const TABLE = 'training_next_training';

    public function selectAllNextTraining(int $trainingId): array
    {
        $query = "SELECT
        nt.name AS next_training_name,
        nt.degree,
        nt.duration,
        nt.description AS next_training_description,
        nt.link AS next_training_link
        FROM " . self::TABLE . " tst
        JOIN " . NextTrainingManager::TABLE . " nt ON nt.id = tst.next_training_id
        WHERE tst.training_id = $trainingId";

        $statement = $this->pdo->query($query);

        return $statement->fetchAll();
    }

    public function selectAdminAllNextTraining(): array
    {
        $query = "SELECT
        t.name training_name,
        nt.name AS next_training_name,
        nt.degree,
        nt.duration
        FROM " . self::TABLE . " tst
        JOIN " . NextTrainingManager::TABLE . " nt ON nt.id = tst.next_training_id
        JOIN " . TrainingManager::TABLE . " t ON t.id = tst.next_training_id";

        $statement = $this->pdo->query($query);

        return $statement->fetchAll();
    }
}
