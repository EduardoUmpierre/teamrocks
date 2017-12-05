<template>
    <div class="row item-list">
        <div class="col-xs-12 col-sm-4 col-lg-3"
             v-for="project in projects">
            <router-link :to="{ name: 'project_detail', params: { id: project.id }}"
                         @click="getProjectData(project.id)">
                <h3>{{ project.title }}</h3>
                <p>{{ project.description }}</p>
            </router-link>
        </div>
    </div>
</template>

<style lang="scss" scoped>
    @import '../../../scss/components/list';
</style>

<script>
    export default {
        name: 'project-list',
        data: function () {
            return {
                projects: []
            }
        },
        methods: {
            getProjectsData: function () {
                this.$http
                    .get('/api/v1/projects')
                    .then(function (response) {
                        this.projects = response.data;
                    }, function (error) {
                        console.log(error);
                    })
            },
            getProjectData: function (id) {
                this.$http
                    .get('/api/v1/projects/' + id)
                    .then(function (response) {
                        console.log(response.data);
                        this.project = response.data;
                    }, function (error) {
                        console.log(error);
                    });
            }
        },
        mounted: function () {
            this.getProjectsData()
        }
    }
</script>