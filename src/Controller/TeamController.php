<?php

namespace App\Controller;

use App\Model\TeamManager;

class TeamController extends AbstractController
{
    public function index(): string
    {
        $teamManager = new TeamManager();
        $teams = $teamManager->mySelectAll();
        $workDepartements = $teamManager->workDepartement();

        return $this->twig->render(
            'Pages/team.html.twig',
            [
                'teams' => $teams,
                'workDepartements' => $workDepartements
            ]
        );
    }
}
