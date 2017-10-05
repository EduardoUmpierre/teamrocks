<template>
    <div v-if="project">
        <main class="tr_content_home">
            <div class="container">
                <h2>Projeto</h2>

                <h3>{{ project.title }}</h3>
                <p>{{ project.description }}</p>

                <h2>Equipe</h2>
                <team-list v-bind:team="project.team"></team-list>
            </div>
        </main>
    </div>
</template>

<script>
    import TeamList from '../components/TeamList.vue'

    export default {
        name: 'project-view',
        components: {
            'team-list': TeamList
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
