<?php

namespace App\Controller;

class ContactController extends AbstractController
{
    private array $options = [
        'opt1',
        'opt2',
        'opt3',
        'opt4',
        'opt5',
        'opt6',
    ];
    private array $errors = [];

    public function index()
    {
        $this->errors();

        return $this->twig->render('Contact/contactForm.html.twig', [
            'errors' => $this->errors,
            'options' => $this->options,
            'post' => $_POST,
        ]);
    }

    public function errors()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $form = array_map('trim', $_POST);
            if (empty($form['lastname'])) {
                $this->errors['lastname'] = "Le nom est obligatoire";
            }

            if (empty($form['firstname'])) {
                $this->errors['firstname'] = "Le prénom est obligatoire";
            }

            if (empty($form['email']) || (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))) {
                $this->errors['email'] = "Un E-mail correct est obligatoire";
            }

            if (((empty($form['about']))) || !in_array($form['about'], $this->options)) {
                $this->errors['about'] = "Un sujet correct est obligatoire";
            }

            if (empty($form['message'])) {
                $this->errors['message'] = "Un message est obligatoire";
            }
        }
    }

    public function getOption(): array
    {
        return $this->options;
    }
    public function setOption(array $options): void
    {
        $this->options = $options;
    }

    public function getErrors(): array
    {
        return $this->errors;
    }
    public function setErrors(array $errors): void
    {
        $this->errors = $errors;
    }
}
