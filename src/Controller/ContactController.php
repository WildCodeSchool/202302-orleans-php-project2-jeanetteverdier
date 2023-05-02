<?php

namespace App\Controller;

class ContactController extends AbstractController
{
    private array $options = [
        'Admission',
        'RDV avec le chef d\'établissement',
        'RDV avec la vie scolaire',
        'Questions sur le parascolaire',
        'Questions sur les frais de scolarité',
        'Autre',
    ];

    public function index()
    {
        $errors = $contact = [];
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $contact = array_map('trim', $_POST);
            $errors = $this->errors($contact);
        }


        return $this->twig->render('Contact/contactForm.html.twig', [
            'errors' => $errors,
            'options' => $this->options,
            'contact' => $contact,
        ]);
    }

    public function errors($contact)
    {
        $errors = [];
        if (empty($contact['lastname'])) {
            $errors['lastname'] = "Le nom est obligatoire";
        }

        if (empty($contact['firstname'])) {
            $errors['firstname'] = "Le prénom est obligatoire";
        }

        if (empty($contact['email']) || (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))) {
            $errors['email'] = "L' E-mail correct est obligatoire";
        }

        if (((empty($contact['about']))) || !in_array($contact['about'], $this->options)) {
            $errors['about'] = "Le sujet correct est obligatoire";
        }

        if (empty($contact['message'])) {
            $errors['message'] = "Le message est obligatoire";
        }
        return $errors;
    }

    public function getOption(): array
    {
        return $this->options;
    }
    public function setOption(array $options): void
    {
        $this->options = $options;
    }
}
