<?php

namespace App\Controller;

class HighSchoolController extends AbstractController
{
    public function index(): string
    {
        return $this->twig->render('Pages/highSchool.html.twig');
    }
}
