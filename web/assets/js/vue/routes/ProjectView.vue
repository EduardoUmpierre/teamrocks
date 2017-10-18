<template>
    <div v-if="project">
        <main class="tr_content_home">
            <div class="container">
                <h2>Projeto</h2>

                <h3>{{ project.title }}</h3>
                <p>{{ project.description }}</p>

                <h2>Equipe</h2>
                <team-list v-bind:team="project.team"></team-list>

                <h2>Tasks</h2>
                <task-list v-bind:tasks="project.tasks"></task-list>
            </div>
        </main>
    </div>
</template>

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
