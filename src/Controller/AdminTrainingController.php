<?php

namespace App\Controller;

use App\Model\SkillManager;
use App\Model\DegreeManager;
use App\Model\SectorManager;
use App\Model\TrainingManager;
use App\Model\NextTrainingManager;

class AdminTrainingController extends AbstractController
{
    public function index(): string
    {
        $trainingManager = new TrainingManager();
        $sectorManager = new SectorManager();

        $trainings = $trainingManager->selectAllTraining();
        $sectors = $sectorManager->selectAllSectors();

        return $this->twig->render(
            'Admin/Training/index.html.twig',
            [
                'trainings' => $trainings,
                'sectors' => $sectors,
            ]
        );
    }

    private function validate(array $training): array
    {
        $errors = [];

        if (empty($training['training_name'])) {
            $errors[] = 'Le titre de la formation est obligatoire';
        }
        $maxLentght = 255;
        if (mb_strlen($training['training_name']) > $maxLentght) {
            $errors[] = 'Le titre de la formation doit faire moin de ' . $maxLentght;
        }
        if (empty($training['nb_students'])) {
            $errors[] = 'Le nombre d\'étudiant est obligatoire';
        }
        if (is_numeric($training['success_rate']) && $training['success_rate'] < 0) {
            $errors[] = 'Le taux de succès doit être positif';
        }
        if (empty($training['success_rate'])) {
            $errors[] = 'Le taux de succès est obligatoire';
        }
        if (empty($training['stage_duration'])) {
            $errors[] = 'La durée du stage est obligatoire';
        }

        return $errors;
    }


    public function add(): string
    {
        $errors = $training = [];

        $degreeManager = new DegreeManager();
        $skillManager = new SkillManager();
        $nextTrainingManager = new NextTrainingManager();
        $sectorManager = new SectorManager();

        $degrees = $degreeManager->selectAll();
        $skills = $skillManager->selectAll();
        $nextTrainings = $nextTrainingManager->selectAll();
        $sectors = $sectorManager->selectAll();


        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $training = array_map('trim', $_POST);

            $errors = $this->validate($training);

            if (empty($errors)) {
                $trainingManager = new TrainingManager();

                $trainingManager->insertTraining($training);

                header('Location: /admin/formations');
            }
        }

        return $this->twig->render(
            'Admin/Training/add.html.twig',
            [
                'training' => $training,
                'errors' => $errors,
                'degrees' => $degrees,
                'skills' => $skills,
                'nextTrainings' => $nextTrainings,
                'sectors' => $sectors,
            ]
        );
    }
}
