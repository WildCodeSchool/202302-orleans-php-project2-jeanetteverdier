<?php

namespace App\Controller;

use App\Model\EmployeeManager;
use App\Model\WorkDepartementsManager;

class AdminEmployeeController extends AbstractController
{
    public function index(): string
    {
        $employeeManager = new EmployeeManager();
        $employees = $employeeManager->selectEmployeeWithDepartment();
        $workDepartements = new WorkDepartementsManager();
        $workDepartements = $workDepartements->SelectAllWorkDepartement();

        return $this->twig->render(
            'Admin/employee/index.html.twig',
            [
                'employees' => $employees,
                'workDepartements' => $workDepartements
            ]
        );
    }

    public function add()
    {
        $errors = $employe = [];

        $workDepartements = new WorkDepartementsManager();
        $workDepartements = $workDepartements->SelectAllWorkDepartement();

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $employe = array_map('trim', $_POST);
            $errors = $this->errors($employe, $workDepartements);

            if (empty($errors)) {
                $employeManager = new EmployeeManager();
                $employe = $employeManager->insertEmploye($employe);

                header('Location:/admin/notre-equipe');
                return null;
            }
        }

        return $this->twig->render(
            'Admin/employee/add.html.twig',
            [
                'employe' => $employe,
                'errors' => $errors,
                'workDepartements' => $workDepartements
            ]
        );
    }

    public function errors($employe, $workDepartements)
    {
        $errors = [];
        if (empty($employe['lastname'])) {
            $errors['lastname'] = "Le nom est obligatoire";
        }

        if (empty($employe['firstname'])) {
            $errors['firstname'] = "Le prénom est obligatoire";
        }

        if (empty($employe['post'])) {
            $errors['post'] = "Le post est obligatoire";
        }

        foreach ($workDepartements as $workDepartement) {
            if (empty($employe['about']) || $employe['about'] === $workDepartement['id']) {
                $errors['about'] = "Le sujet correct est obligatoire";
            }
        }
        return $errors;
    }
}
