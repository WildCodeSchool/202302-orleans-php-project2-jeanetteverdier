<?php

namespace App\Controller;

use App\Model\EmployeeManager;
use App\Model\WorkDepartementsManager;

class EmployeeController extends AbstractController
{
    public function index(): string
    {
        $employeeManager = new EmployeeManager();
        $employees = $employeeManager->selectEmployeeWithDepartment();
        $workDepartements = new WorkDepartementsManager();
        $workDepartements = $workDepartements->SelectAll();

        return $this->twig->render(
            'Pages/employee.html.twig',
            [
                'employees' => $employees,
                'workDepartements' => $workDepartements
            ]
        );
    }
}
