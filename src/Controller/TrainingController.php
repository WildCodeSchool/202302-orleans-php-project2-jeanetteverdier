<?php

namespace App\Controller;

use App\Model\TrainingSkillManager;
use App\Model\SectorManager;
use App\Model\TrainingManager;

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

        $training = $trainingManager->selectOneTraining($id);
        $skills = $skillManager->selectAllSkills();

        return $this->twig->render('Training/show.html.twig', [
            'training' => $training,
            'skills' => $skills,
        ]);
    }
}
