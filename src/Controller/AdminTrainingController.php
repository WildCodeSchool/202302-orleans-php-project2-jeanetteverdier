<?php

namespace App\Controller;

use App\Model\TrainingManager;

class AdminTrainingController extends AbstractController
{
    public function index(): string
    {
        $trainingManager = new TrainingManager();
        $trainings = $trainingManager->selectAllTraining();

        return $this->twig->render(
            'Admin/Training/index.html.twig',
            [
                'trainings' => $trainings,
            ]
        );
    }
}
