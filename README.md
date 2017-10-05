Team.rocks
==========

Aplicação de controle de projetos desenvolvida para a cadeira de Projeto de desenvolvimento da Faculdade Senac RS.

Equipe
------
* [André Carello][5];
* [Andrei Cruz][6];
* [Eduardo Umpierre][8];
* [Elias da Silva][7];
* [Phellipe da Silva][9].

Tecnologias utilizadas
----------------------
* [Symfony framework][1];
* [Vue.js][4];
* [Babel][10];
* [Webpack][11];
* [Doctrine ORM 2][2].

Requisitos
----------
* PHP >= 5.5.9;
* [NodeJS][12];
* [Composer][3].

Como rodar a aplicação
----------------------
* Clone o repositório;
* Crie o banco de dados (teamrocks);
* Instale as dependências da API ```composer install```;
* Instale as dependências de front-end ```npm install```;
* Gere as tabelas ```php bin/console doctrine:schema:create```;
* Importe o dump do banco de dados;
* Rode o servidor local ```php bin/console server:run```;
* Em outro console rode build do webpack ```npm run dev```;
* Pronto!

[1]:  https://symfony.com/
[2]:  http://docs.doctrine-project.org/projects/doctrine-orm/en/latest/
[3]:  https://getcomposer.org/
[4]:  https://vuejs.org/

[5]:  https://github.com/andrecarello
[6]:  https://github.com/andreicruz
[7]:  https://github.com/xeliasinfo
[8]:  https://github.com/eduardoumpierre
[9]:  https://github.com/phebaltha

[10]: https://babeljs.io/
[11]: https://webpack.js.org/
[12]: https://nodejs.org/