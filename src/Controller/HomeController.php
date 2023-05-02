<?php

namespace App\Controller;

use App\Model\EventManager;

class HomeController extends AbstractController
{
    public function index(): string
    {
        $eventManager = new EventManager();
        $events = $eventManager->selectLastEvent();

        return $this->twig->render('Home/index.html.twig', ['events' => $events]);
    }
}
