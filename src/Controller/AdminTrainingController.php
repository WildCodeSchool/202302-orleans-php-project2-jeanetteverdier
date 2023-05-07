<?php

namespace App\Controller;

use App\Model\TrainingManager;
use App\Model\SectorManager;

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

    public function add(): string
    {
        $errors = [];

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $training = array_map('trim', $_POST);

            if (empty($training['training_name'])) {
                $errors[] = 'Le titre de la formation est obligatoire';
            }
            // $maxLenght = 255;
            // if (mb_strlen($training['training_name']) > $maxLenght) {
            //     $errors[] = 'Le titre de la formation doit faire moin de ' . $maxLenght;
            // }
            if (empty($training['nb_students'])) {
                $errors[] = 'Le nombre d\'étudiant est obligatoire';
            }
            // if (is_numeric($training['nb_students']) && $training['nb_students'] < 0) {
            //     $errors[] = 'Le nombre d\'étudiant doit être positif';
            // }
            if (empty($training['success_rate'])) {
                $errors[] = 'Le taux de succès est obligatoire';
            }
            // if (is_numeric($training['success_rate']) && $training['success_rate'] < 0) {
            //     $errors[] = 'Le taux de succès doit être positif';
            // }
            if (empty($training['stage_duration'])) {
                $errors[] = 'La durée du stage est obligatoire';
            }
            if (is_numeric($training['stage_duration']) && $training['stage_duration'] < 0) {
                $errors[] = 'La durée du stage doit être positif';
            }

            if (empty($errors)) {
                $trainingManager = new TrainingManager();

                $trainingManager->insert($training);

                header('Location: /admin/formations');
            }
        }


        return $this->twig->render(
            'Admin/Training/add.html.twig',
            [
                'errors' => $errors,
            ]
        );
    }
}
