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
        $errors = $employee = [];

        $workDepartements = new WorkDepartementsManager();
        $departements = $workDepartements->SelectAllWorkDepartement();

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $employee = array_map('trim', $_POST);
            $errors = $this->errors($employee, $departements);

            if (empty($errors)) {
                $employeeManager = new EmployeeManager();
                $employee = $employeeManager->insertEmploye($employee);

                header('Location:/admin/notre-equipe');
                return null;
            }
        }

        return $this->twig->render(
            'Admin/employee/add.html.twig',
            [
                'employee' => $employee,
                'errors' => $errors,
                'departements' => $departements
            ]
        );
    }

    public function errors($employe, $departements)
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

        $departementExist = false;
        foreach ($departements as $departement) {
            if ($employe['about'] == $departement['id']) {
                $departementExist = true;
            }
        }
        if ($departementExist === false) {
            $errors['about'] = "Le sujet correct est obligatoire";
        }

        return $errors;
    }
}
