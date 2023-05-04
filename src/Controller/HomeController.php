<?php

namespace App\Controller;

use App\Model\ActualityManager;

class HomeController extends AbstractController
{
    public function index(): string
    {
        $actualitytManager = new ActualityManager();
        $actualities = $actualitytManager->selectLastEvent();

        return $this->twig->render('Home/index.html.twig', ['actualities' => $actualities]);
    }
}
