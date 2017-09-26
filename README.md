Team.rocks
==========

Aplicação de controle de projetos desenvolvida para a cadeira de Projeto de desenvolvimento da Faculdade Senac RS.

Tecnologias utilizadas
----------------------
* [Symfony framework][1]

Como rodar a aplicação
----------------------

* Clone o repositório;
* Crie o banco de dados;
* Composer install;
* Gere as tabelas ```php bin/console doctrine:schema:create```;
* Rode o servidor local ```php bin/console server:run```;
* Pronto!

[1]:  https://symfony.com/