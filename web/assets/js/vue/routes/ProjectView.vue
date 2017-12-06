<template>
    <main v-if="project">
        <section id="project">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <h2>Projeto</h2>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12">
                        <p id="project-title">{{ project.title }}</p>
                        <p id="project-description">{{ project.description }}</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-4">
                        <h3>Data de criação</h3>
                        <p><formatter v-bind:value="project.createdAt.date" fn="date"></formatter></p>
                    </div>

                    <div class="col-xs-4">
                        <h3>Prazo de entrega</h3>
                        <p><formatter v-bind:value="project.deadline.date" fn="date"></formatter></p>
                    </div>

                    <div class="col-xs-4">
                        <h3>Gestor</h3>
                        <p>{{ project.manager }}</p>
                    </div>
                </div>
            </div>
        </section>

        <section id="team">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <h2>Equipe</h2>
                        <team-list v-bind:team="project.team"></team-list>
                    </div>
                </div>
            </div>
        </section>

        <section id="tasks">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
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
            }
        },
        mounted: function () {
            this.getProjectData(this.$route.params.id);
        }
    }
</script>
