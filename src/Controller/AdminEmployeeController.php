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
        $workDepartements = $workDepartements->selectAll();

        return $this->twig->render(
            'Admin/employee/index.html.twig',
            [
                'employees' => $employees,
                'workDepartements' => $workDepartements
            ]
        );
    }

    public function delete(): void
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $id = trim($_POST['id']);
            $employeeManager = new EmployeeManager();
            $employeeManager->delete((int)$id);

            header('Location:/admin/notre-equipe');
        }
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

        $departementsId = array_column($departements, 'id');

        if (!in_array($employee['departementId'], $departementsId)) {
            $errors['departementId'] = 'Le département est invalide';
        }

        return $errors;
    }
    public function edit(int $id)
    {
        $errors = [];

        $workDepartement = new WorkDepartementsManager();
        $departements = $workDepartement->selectAll();

        $employeeManager = new EmployeeManager();
        $employee = $employeeManager->selectOneById($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $employee = array_map('trim', $_POST);
            $errors = $this->errors($employee, $departements);
            $id = $_GET['id'];

            if (empty($errors)) {
                $employeeManager->updateEmployee($employee, $id);
                header('Location: /admin/notre-equipe');
                return null;
            }
        }

        return $this->twig->render(
            'Admin/employee/edit.html.twig',
            [
                'employee' => $employee,
                'errors' => $errors,
                'departements' => $departements
            ]
        );
    }
}
