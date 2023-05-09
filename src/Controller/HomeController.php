<?php

namespace App\Controller;

use App\Model\ActualityManager;

class HomeController extends AbstractController
{
    public function index(): string
    {
        $eventManager = new ActualityManager();
        $events = $eventManager->selectLastEvent();
        $lastActualities = $eventManager->selectLastActualities();

        return $this->twig->render(
            'Home/index.html.twig',
            [
                'events' => $events,
                'lastActualities' => $lastActualities
            ]
        );
    }
}
