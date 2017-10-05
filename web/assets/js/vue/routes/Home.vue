<template>
    <div>
        <header class="tr_header_home" style="background-image: url('assets/images/d63b8b7f1ff71a1fec8d4059a034f08c.jpg');"
                data-speed="-6">
            <div class="tr_header_overlay">
                <div class="container">
                    <h4>Dê os primeiros passos</h4>

                    <h1>
                        Monte seu projeto e crie seu time dos sonhos!
                    </h1>

                    <a href="#" class="tr_button tr_button_green">Novo projeto</a>
                </div>
            </div>
        </header>

        <main class="tr_content_home">
            <div class="container">
                <h2>Projetos criados</h2>

                <project-list></project-list>
            </div>
        </main>
    </div>
</template>

<script>
    import ProjectList from '../components/ProjectList.vue'

    export default {
        name: 'home',
        components: {
            'project-list': ProjectList
        }
    }
</script>
