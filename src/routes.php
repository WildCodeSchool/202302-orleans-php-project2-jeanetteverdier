<?php

// list of accessible routes of your application, add every new route here
// key : route to match
// values : 1. controller name
//          2. method name
//          3. (optional) array of query string keys to send as parameter to the method
// e.g route '/item/edit?id=1' will execute $itemController->edit(1)
return [
    '' => ['HomeController', 'index',],
    'items' => ['ItemController', 'index',],
    'items/edit' => ['ItemController', 'edit', ['id']],
    'items/show' => ['ItemController', 'show', ['id']],
    'items/add' => ['ItemController', 'add',],
    'items/delete' => ['ItemController', 'delete',],
    'contact' => ['ContactController', 'index',],
    'formations' => ['TrainingController', 'index',],
    'formations/show' => ['TrainingController', 'show', ['id']],
    'notre-equipe' => ['EmployeeController', 'index',],
    'actualites' => ['ActualityController', 'index',],
    'notre-lycee' => ['HighSchoolController', 'index',],
    'admin/notre-equipe' => ['AdminEmployeeController', 'index',],
    'admin/notre-equipe/delete' => ['AdminEmployeeController', 'delete',],
    'admin/notre-equipe/ajouter' => ['AdminEmployeeController', 'add',],
    'admin/notre-equipe/modifier' => ['AdminEmployeeController', 'edit', ['id']],
];
