<?php

namespace App\Controller;

use App\Model\SectorManager;
use App\Model\TrainingManager;
use App\Model\TrainingSkillManager;
use App\Model\TrainingNextTrainingManager;

class AdminTrainingController extends AbstractController
{
    public function index(): string
    {
        $trainingManager = new TrainingManager();
        $sectorManager = new SectorManager();
        $skillManager = new TrainingSkillManager();
        $nextTrainingManager = new TrainingNextTrainingManager();

        $trainings = $trainingManager->selectAllTraining();
        $sectors = $sectorManager->selectAllSectors();
        $skills = $skillManager->selectAllSkills();
        $nextTrainings = $nextTrainingManager->selectAdminAllNextTraining();

        return $this->twig->render(
            'Admin/Training/index.html.twig',
            [
                'trainings' => $trainings,
                'sectors' => $sectors,
                'skills' => $skills,
                'nextTrainings' => $nextTrainings,
            ]
        );
    }
}
