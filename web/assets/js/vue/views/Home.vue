<template>
    <main>
        <section id="home-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="subtitle">Dê os primeiros passos</div>
                        <div class="title">Monte seu projeto e crie seu time dos sonhos!</div>

                        <a href="#projetos"
                           class="button transparent white">
                            Listar projetos
                        </a>

                        <router-link :to="{ name: 'project_new' }" class="button green">
                            Novo projeto
                        </router-link>
                    </div>
                </div>
            </div>
        </section>

        <section>
            <div class="container">
                <div class="row" id="projetos">
                    <div class="col-12">
                        <h2>Projetos criados</h2>

                        <project-list v-bind:projects="projects"></project-list>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <h2 class="aside-button">
                            Funcionários

                            <button class="button green small pull-right" type="button">
                                Adicionar funcionário
                            </button>
                        </h2>

                        <team-list v-bind:team="employees"></team-list>
                    </div>
                </div>
            </div>
        </section>
    </main>
</template>

<style lang="scss" scoped>
    @import '../../../scss/helpers/flexbox';
    @import '../../../scss/components/buttons';
    @import '../../../scss/components/list';

    #home-header {
        background: #252a34 url(../../../../assets/images/gorilao.png) center center fixed no-repeat;
        color: #FFF;
        margin-top: -7rem;
        text-align: center;

        .row {
            @include align-items(center);
            @include flexbox;
            height: 100vh;
            min-height: 320px;
        }

        .subtitle {
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .title {
            font-size: 4rem;
            margin-bottom: 4rem;
        }

        .title,
        .subtitle {
            line-height: 1em;
        }
    }
</style>

<script>
    import ProjectList from '../components/ProjectList.vue'
    import TeamList from '../components/TeamList.vue'

    export default {
        name: 'home',
        components: {
            'project-list': ProjectList,
            'team-list': TeamList
        },
        data: function () {
            return {
                employees: [],
                projects: []
            }
        },
        methods: {
            getEmployees: function () {
                this.$http
                    .get('/api/v1/employees')
                    .then(function (response) {
                        this.employees = response.data;
                    }, function (error) {
                        console.log(error);
                    })
            },
            getProjects: function () {
                this.$http
                    .get('/api/v1/projects')
                    .then(function (response) {
                        this.projects = response.data;
                    }, function (error) {
                        console.log(error);
                    })
            }
        },
        mounted: function () {
            this.getEmployees();
            this.getProjects()
        }
    }
</script>
