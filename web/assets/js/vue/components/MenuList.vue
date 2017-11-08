<template>
    <header>
        <nav class="main_menu">
            <div class="container">
                <router-link :to="{ name: 'home' }" class="main_menu_logo">
                    <img src="/assets/images/team-rocks-logo.jpg" alt="TEAM ROCKS">
                </router-link>

                <ul class="main_menu_nav">
                    <li>
                        <p>Bem Vindo, <strong>TEAM ROCKS</strong></p>
                    </li>
                    <li><a href="javascript:void(0)" class="open_menu"><i class="fa fa-bars"></i></a></li>
                </ul>
            </div><!-- end of /.container -->
        </nav>
        <nav class="menu">
            <ul>
                <li>
                    <router-link :to="{ name: 'project_new' }">
                        Novo projeto
                    </router-link>
                </li>
                <li>
                    <!--<router-link :to="{ name: 'project_list' }" class="open_projects">-->
                        <!--listar projetos-->
                    <!--</router-link>-->
                    <a href="javascript:void(0)" class="open_projects">listar projetos</a>
                </li>
            </ul>
        </nav>

        <aside class="sidebar">
            <ul>
                <li>
                    <router-link :to="{ name: 'project_new' }" class="cards" style="background-image: url('assets/images/pexels-photo-89955.jpeg');">
                        <div class="card_header">
                            Entrega até 08/10/2017
                        </div>
                        <div class="card_content">
                            <h3 class="card_title">Projeto I</h3>
                        </div>
                    </router-link>
                </li>
            </ul>
        </aside>
    </header>
</template>


<script>
    export default {
        name: 'menu-list'
    }
</script>