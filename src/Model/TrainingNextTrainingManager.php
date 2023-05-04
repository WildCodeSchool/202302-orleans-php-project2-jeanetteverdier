<?php

namespace App\Model;

use PDO;

class TrainingNextTrainingManager extends AbstractManager
{
    public const TABLE = 'training_next_training';

    public function selectAllNextTraining(): array
    {
        $query = "SELECT t.name AS training_name,
        nt.name AS next_training_name,
        nt.degree,
        nt.description AS next_training_description,
        nt.link AS next_training_link
        FROM " . self::TABLE . " tst
        JOIN " . NextTrainingManager::TABLE . " nt ON nt.id = tst.next_training_id
        JOIN " . TrainingManager::TABLE . " t ON t.id = tst.training_id";

        $statement = $this->pdo->query($query);

        return $statement->fetchAll();
    }
}
