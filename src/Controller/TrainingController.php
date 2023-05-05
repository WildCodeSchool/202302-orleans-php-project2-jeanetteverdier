<?php

namespace App\Controller;

use App\Model\SectorManager;
use App\Model\TrainingManager;
use App\Model\TrainingNextTrainingManager;
use App\Model\TrainingSkillManager;

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

    public function show(int $id): string
    {
        $trainingManager = new TrainingManager();
        $skillManager = new TrainingSkillManager();
        $nextTrainingManager = new TrainingNextTrainingManager();

        $training = $trainingManager->selectOneTraining($id);
        $skills = $skillManager->selectAllSkills();
        $nextTrainings = $nextTrainingManager->selectAllNextTraining($training['id']);

        return $this->twig->render('Training/show.html.twig', [
            'training' => $training,
            'skills' => $skills,
            'nextTrainings' => $nextTrainings,
        ]);
    }
}
