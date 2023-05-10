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
            $id = $_POST['id'];
            $employeeManager = new EmployeeManager();
            $employee = $employeeManager->selectOneById($id);

            if (
                isset($employee['picture']) &&
                file_exists(__DIR__ . '/../../public/uploads/' . $employee['picture'])
            ) {
                unlink(__DIR__ . '/../../public/uploads/' . $employee['picture']);
            }
            $employeeManager->delete((int)$id);

            header('Location:/admin/notre-equipe');
        }
    }

    public function add()
    {
        $errors = $employee = $errorsImage = [];

        $workDepartement = new WorkDepartementsManager();
        $departements = $workDepartement->selectAll();

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $employee = array_map('trim', $_POST);
            $errors = $this->errors($employee, $departements);
            $errorsImage = $this->errorsImage();

            if (empty($errors) && empty($errorsImage)) {
                $extension = pathinfo($_FILES['picture']['name'], PATHINFO_EXTENSION);
                $baseFilename = pathinfo($_FILES['picture']['name'], PATHINFO_FILENAME);

                $imageName = uniqid($baseFilename, more_entropy: true) . '.' . $extension;

                $employee['picture'] = $imageName;

                $employeeManager = new EmployeeManager();
                $employee = $employeeManager->insertEmploye($employee);

                move_uploaded_file(
                    $_FILES['picture']['tmp_name'],
                    __DIR__ . '/../../public/uploads/' . $imageName
                );


                header('Location:/admin/notre-equipe');
                return null;
            }
        }

        return $this->twig->render(
            'Admin/employee/add.html.twig',
            [
                'employee' => $employee,
                'errors' => $errors,
                'departements' => $departements,
                'errorsImage' => $errorsImage
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

    public function errorsImage()
    {
        $errorsImage = [];
        if ($_FILES['picture']['error'] !== 0) {
            $errorsImage[] = 'Problème avec l\'upload, veillez réessayer';
        } else {
            $limitFilesSize = 2000000;
            if ($_FILES['picture']['size'] > $limitFilesSize) {
                $errorsImage[] = 'Le fichier doit faire moins de ' . $limitFilesSize  / 1000000 . 'Mo';
            }
            $authorizedMimes = ['image/jpeg', 'image/png', 'image/webp'];
            if (!in_array(mime_content_type($_FILES['picture']['tmp_name']), $authorizedMimes)) {
                $errorsImage[] = 'Le type de fichier est incorrect. il doit ' . implode(',', $authorizedMimes);
            }
            return $errorsImage;
        }
    }

    public function edit(int $id)
    {
        $errors = $errorsImage = [];

        $workDepartement = new WorkDepartementsManager();
        $departements = $workDepartement->selectAll();

        $employeeManager = new EmployeeManager();
        $employee = $employeeManager->selectOneById($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $employee = array_map('trim', $_POST);
            $errors = $this->errors($employee, $departements);
            $errorsImage = $this->errorsImage();
            $id = $_GET['id'];
            if (empty($errors) && empty($errorsImage)) {
                $employe = $employeeManager->selectOneById($id);
                if (
                    isset($employe['picture']) &&
                    file_exists(__DIR__ . '/../../public/uploads/' . $employe['picture'])
                ) {
                    unlink(__DIR__ . '/../../public/uploads/' . $employe['picture']);
                }

                $extension = pathinfo($_FILES['picture']['name'], PATHINFO_EXTENSION);
                $baseFilename = pathinfo($_FILES['picture']['name'], PATHINFO_FILENAME);

                $imageName = uniqid($baseFilename, more_entropy: true) . '.' . $extension;

                $employee['picture'] = $imageName;

                $employeeManager->updateEmployee($employee, $id);

                move_uploaded_file(
                    $_FILES['picture']['tmp_name'],
                    __DIR__ . '/../../public/uploads/' . $imageName
                );

                header('Location: /admin/notre-equipe');
                return null;
            }
        }

        return $this->twig->render(
            'Admin/employee/edit.html.twig',
            [
                'employee' => $employee,
                'errors' => $errors,
                'departements' => $departements,
                'errorsImage' => $errorsImage
            ]
        );
    }
}
