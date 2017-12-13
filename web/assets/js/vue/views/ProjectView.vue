<template>
    <main v-if="project">
        <section id="project">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>
                            Projeto

                            <b-dropdown
                                    id="ddown-split"
                                    split
                                    size="md"
                                    v-bind:variant="project.status == 0 ? 'warning' : (project.status == 2 ? 'success' : 'primary')"
                                    v-bind:text="project.status == 0 ? 'Iniciar projeto' : (project.status == 2 ? 'Projeto encerrado' : 'Finalizar projeto')"
                                    class="m-2 pull-right"
                                    @click="updateStatus(project.status == 0 ? 1 : (project.status == 1 ? 2 : 1))">
                                <b-dropdown-item v-if="project.status == 1" href="#">Pausar</b-dropdown-item>
                                <b-dropdown-item href="#">Apagar</b-dropdown-item>
                            </b-dropdown>
                        </h2>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <p id="project-title">{{ project.title }}</p>

                        <p id="project-description">{{ project.description }}</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-4">
                        <h3>Data de criação</h3>

                        <p>
                            <formatter v-bind:value="project.createdAt.date" fn="date"></formatter>
                        </p>
                    </div>

                    <div class="col-4">
                        <h3>Prazo de entrega</h3>

                        <p>
                            <formatter v-bind:value="project.deadline.date" fn="date"></formatter>
                        </p>
                    </div>

                    <div class="col-4">
                        <h3>Gestor</h3>

                        <p>{{ project.manager }}</p>
                    </div>
                </div>
            </div>
        </section>

        <section id="team">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Equipe</h2>
                        <team-list v-bind:team="project.team"></team-list>
                    </div>
                </div>
            </div>
        </section>

        <section id="tasks">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Tasks</h2>
                        <task-list v-bind:tasks="project.tasks"></task-list>
                    </div>
                </div>
            </div>
        </section>
    </main>
</template>

<style lang="scss" scoped>
    @import '../../../scss/helpers/flexbox';
    @import '../../../scss/helpers/mixins';
    @import '../../../scss/components/buttons';
    @import '../../../scss/components/list';

    p {
        color: #79849a;
        font-size: 1rem;
        margin-bottom: 0;
    }

    #project-title {
        color: #263238;
        font-size: 3rem;
        font-weight: 700;
    }
</style>

<script>
    import TeamList from '../components/TeamList.vue'
    import TaskList from '../components/TaskList.vue'
    import Formatter from '../helpers/Formatter.vue'

    export default {
        name: 'project-view',
        components: {
            'team-list': TeamList,
            'task-list': TaskList,
            'formatter': Formatter
        },
        data: function () {
            return {
                project: null
            }
        },
        methods: {
            getProjectData: function (id) {
                this.$http
                        .get('/api/v1/projects/' + id)
                        .then(function (response) {
                            console.log(response.data);
                            this.project = response.data;
                        }, function (error) {
                            console.log(error);
                        })
            },
            updateStatus: function (status) {
                if (status == 0 || status == 1 || status == 2) {
                    this.$http.put('/api/v1/projects/status', {
                        status: status,
                        id: this.project.id
                    }, {headers: {'Content-Type': 'application/json'}})
                            .then(function (response) {
                                console.log(response.data);

                                if (response.status == 200) {
                                    this.project.status = status;
                                } else {
                                    console.log('Error', response.data.message);
                                }
                            }, function (error) {
                                console.log('Error', error.message);
                            });
                }
            }
        },
        mounted: function () {
            this.getProjectData(this.$route.params.id);
        }
    }
</script>
