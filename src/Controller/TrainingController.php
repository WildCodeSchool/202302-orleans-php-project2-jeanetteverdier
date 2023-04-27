<?php

namespace App\Controller;

use App\Model\TrainingManager;
use App\Model\SectorManager;

class TrainingController extends AbstractController
{
    public function index(): string
    {
        $trainingManager = new TrainingManager();
        $sectorManager = new SectorManager();

        $trainings = $trainingManager->selectAllTraining();
        $sectors = $sectorManager->selectAllSectors();

        return $this->twig->render(
            'Training/index.html.twig',
            [
                'trainings' => $trainings,
                'sectors' => $sectors,
            ]
        );
    }
}
