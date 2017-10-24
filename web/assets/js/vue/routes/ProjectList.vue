<template>
    <div>
        <div v-if="project">
            <main class="project_view">
                <div class="container">
                    <h2>Projeto: <strong>{{ project.title }}</strong></h2>
                    <p>{{ project.description }}</p>
                    <hr>
                    <h3>Equipe</h3>
                    <team-list v-bind:team="project.team"></team-list>
                    <hr>
                    <h3>Tasks</h3>
                    <task-list v-bind:tasks="project.tasks"></task-list>
                </div>
            </main>
        </div>
    </div>
</template>

<script>
    import TeamList from '../components/TeamList.vue'
    import TaskList from '../components/TaskList.vue'

    export default {
        name: 'project-list',
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
            getProjectData: function () {
                this.$http
                        .get('/api/v1/projects/')
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
