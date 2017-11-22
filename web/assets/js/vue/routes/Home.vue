<template>
    <div>
        <header class="header_home" style="background-image: url('assets/images/d63b8b7f1ff71a1fec8d4059a034f08c.jpg');" data-speed="-6">
            <div class="header_overlay">
                <div class="container">
                    <h4>Dê os primeiros passos</h4>
                    <h1>
                        Monte seu projeto e crie seu time dos sonhos!
                    </h1>

                    <router-link
                            :to="{ name: 'project_new' }"
                            class="button button_green">
                        Novo projeto
                    </router-link>
                </div>
            </div>
        </header>
        <main class="tr_content_home">
            <div class="container">
                <h2>Projetos criados</h2>
                <project-list></project-list>

                <h2>Funcionários</h2>
                <team-list v-bind:team="employees"></team-list>
            </div>
        </main>
    </div>
</template>

<script>
    import ProjectList from '../components/ProjectList.vue'
    import TeamList from '../components/TeamList.vue'

    export default {
        name: 'home',
        components: {
            'project-list' : ProjectList,
            'team-list': TeamList
        },
        data: function () {
            return {
                employees: null
            }
        },
        methods: {
            getEmployees: function() {
                this.$http
                        .get('/api/v1/employees')
                        .then(function (response) {
                            this.employees = response.data;
                        }, function (error) {
                            console.log(error);
                        })
            }
        },
        mounted: function () {
            this.getEmployees();
        }
    }
</script>
