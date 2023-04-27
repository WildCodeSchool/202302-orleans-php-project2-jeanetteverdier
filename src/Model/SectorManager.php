<?php

namespace App\Model;

class SectorManager extends AbstractManager
{
    public const TABLE = 'sector';

    public function selectAllSectors(): array
    {
        $query = 'SELECT * FROM ' . static::TABLE;

        return $this->pdo->query($query)->fetchAll();
    }
}
