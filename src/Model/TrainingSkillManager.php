<?php

namespace App\Model;

use PDO;

class TrainingSkillManager extends AbstractManager
{
    public const TABLE = 'training_skill';

    public function selectAllSkills(): array
    {
        $query = "SELECT t.name AS training_skill_name, s.name AS skill_name FROM " . self::TABLE . " ts
        JOIN " . SkillManager::TABLE . " s ON s.id = ts.skill_id
        JOIN " . TrainingManager::TABLE . " t ON t.id = ts.training_id";

        $statement = $this->pdo->query($query);

        return $statement->fetchAll();
    }
}
