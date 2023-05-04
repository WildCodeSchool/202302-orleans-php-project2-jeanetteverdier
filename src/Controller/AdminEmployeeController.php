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

    public function add()
    {
        $errors = $employee = [];

        $workDepartement = new WorkDepartementsManager();
        $departements = $workDepartement->selectAll();

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $employee = array_map('trim', $_POST);
            $errors = $this->errors($employee);

            $departementsId = array_column($departements, 'id');

            if (!in_array($employee['departementId'], $departementsId)) {
                $errors['departementId'] = 'Le département est invalide';
            }

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

    public function errors($employee)
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

        return $errors;
    }
    public function edit(int $id): ?string
    {
        $errors = [];

        $employeeManager = new EmployeeManager();
        $employee = $employeeManager->selectOneById($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // clean $_POST data
            $employee = array_map('trim', $_POST);
            $errors = $this->errors($employee);

            // TODO validations (length, format...)

            if (empty($errors)) {
                $employeeManager = new EmployeeManager();
                $employee = $employeeManager->insertEmploye($employee);

                header('Location:/admin/notre-equipe');
                return null;
            }
            // if validation is ok, update and redirection
            $employeeManager->update($employee);


            header('Location: /items/show?id=' . $id);

            // we are redirecting so we don't want any content rendered
            return null;
        }

        return $this->twig->render('Item/edit.html.twig', [
            'employee' => $employee,
        ]);
    }
}
