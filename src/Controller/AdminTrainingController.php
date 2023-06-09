<?php

namespace App\Controller;

use App\Model\SkillManager;
use App\Model\DegreeManager;
use App\Model\SectorManager;
use App\Model\TrainingManager;
use App\Model\NextTrainingManager;
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

    private function validate(array $training): array
    {
        $errors = [];

        if (empty($training['training_name'])) {
            $errors[] = 'Le titre de la formation est obligatoire';
        }
        $maxLength = 255;
        if (mb_strlen($training['training_name']) > $maxLength) {
            $errors[] = 'Le titre de la formation doit faire moin de ' . $maxLength;
        }
        if (empty($training['nb_students'])) {
            $errors[] = 'Le nombre d\'étudiant est obligatoire';
        }
        if (is_numeric($training['nb_students']) && $training['nb_students'] < 0) {
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


    public function delete(int $id): void
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $trainingManager = new TrainingManager();

            $trainingManager->delete($id);

            header('Location:/admin/formations');
        }
    }
}
