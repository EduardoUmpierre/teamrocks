<template>
    <main>
        <div class="container" v-if="project">
            <div class="row">
                <div class="col-xs-12">
                    <h2>Projeto</h2>

                    <h1>{{ project.title }}</h1>
                    <p>{{ project.description }}</p>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <h2>Equipe</h2>
                    <team-list v-bind:team="project.team"></team-list>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <h2>Tasks</h2>
                    <task-list v-bind:tasks="project.tasks"></task-list>
                </div>
            </div>
        </div>
    </main>
</template>

<style lang="scss" scoped>
    @import '../../../scss/helpers/flexbox';
    @import '../../../scss/helpers/mixins';
    @import '../../../scss/components/buttons';
    @import '../../../scss/components/list';

    h1 {
        font-size: 4rem;
        font-weight: 700;
        margin: 0 0 0.5rem;
    }

    p {
        color: rgba(37, 42, 52, 0.65);
        margin: 0;
    }
</style>

<script>
    import TeamList from '../components/TeamList.vue'
    import TaskList from '../components/TaskList.vue'

    export default {
        name: 'project-view',
        components: {
            'team-list': TeamList,
            'task-list': TaskList
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
