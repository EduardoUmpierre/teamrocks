<template>
    <div class="row">
        <router-link
                :to="{ name: 'project_detail', params: { id: project.id }}"
                class="col-xs-12 col-sm-4 tr_eq"
                v-for="project in projects"
                @click="getProjectData(project.id)">
            <figure>
                <img src="" alt="">
            </figure>

            <h3>{{ project.title }}</h3>

            <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. A architecto asperiores consectetur ipsa
                maiores natus nostrum obcaecati, perspiciatis sit? Commodi doloremque harum ipsam libero minima odio
                quia quis velit vitae.
            </p>
        </router-link>
    </div>
</template>

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