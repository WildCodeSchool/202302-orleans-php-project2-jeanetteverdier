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
        $workDepartements = $workDepartements->SelectAll();

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

        $workDepartement = new WorkDepartementsManager();
        $departements = $workDepartement->selectAll();

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

    public function errors($employee, $departements)
    {
        $errors = [];
        if (empty($employee['lastname'])) {
            $errors['lastname'] = "Le nom est obligatoire";
        }

        if (empty($employee['firstname'])) {
            $errors['firstname'] = "Le prénom est obligatoire";
        }

        if (empty($employee['post'])) {
            $errors['post'] = "Le poste est obligatoire";
        }

        $departementExist = false;
        foreach ($departements as $departement) {
            if ($employee['about'] == $departement['id']) {
                $departementExist = true;
            }
        }
        if ($departementExist === false) {
            $errors['about'] = "Le sujet est incorrect";
        }

        return $errors;
    }
}
