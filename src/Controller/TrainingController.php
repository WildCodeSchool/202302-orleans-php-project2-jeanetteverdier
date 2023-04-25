<?php

namespace App\Controller;

use App\Model\TrainingManager;

class TrainingController extends AbstractController
{
    public function index(): string
    {
        $trainingManager = new TrainingManager();
        $trainings = $trainingManager->selectAllTraining();
        $sectors = $trainingManager->selectSector();

        return $this->twig->render(
            'Training/index.html.twig',
            [
                'trainings' => $trainings,
                'sectors' => $sectors
            ]
        );
    }
}
