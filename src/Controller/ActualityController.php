<?php

namespace App\Controller;

use App\Model\ActualityManager;

class ActualityController extends AbstractController
{
    public function index(): string
    {
        $actualityManager = new ActualityManager();
        $actualities = $actualityManager->selectAllActualities();

        return $this->twig->render('Actuality/index.html.twig', ['actualities' => $actualities]);
    }
}
