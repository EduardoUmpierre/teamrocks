<template>
    <main id="project-new">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2>Novo projeto</h2>

                    <form v-on:submit.prevent="generateTeam">
                        <!-- Basic informations -->
                        <h3>Informações básicas</h3>

                        <div class="form-group">
                            <label for="title">Título</label>
                            <input type="text" name="title" class="form-control" id="title" v-model="project.title">
                        </div>

                        <div class="form-group">
                            <label for="description">Descrição</label>
                            <textarea name="description"
                                      class="form-control"
                                      id="description"
                                      v-model="project.description"></textarea>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <label for="deadline">Prazo</label>
                                <input type="text" name="deadline" class="form-control" id="deadline"
                                       v-model="project.deadline">
                            </div>

                            <div class="col-4">
                                <div class="form-group">
                                    <label for="manager">Gestor</label>

                                    <select id="manager" class="form-control" v-model="project.manager">
                                        <option v-bind:value="manager.id" v-for="manager in managers">{{ manager.name }}</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-4">
                                <div class="form-group">
                                    <label for="quantity">Quantidade máxima de componentes no time</label>
                                    <input type="text" name="quantity" class="form-control" id="quantity"
                                           v-model="project.quantity">
                                </div>
                            </div>
                        </div>

                        <!-- Backlog-->
                        <h3 class="aside-button">
                            Backlog
                            <button class="button blue small pull-right" type="button" @click="addTask">
                                Adicionar item
                            </button>
                        </h3>

                        <div class="backlog-list" v-for="(task, index) in project.backlog">
                            <div class="row">
                                <div class="col-3">
                                    <div class="form-group">
                                        <label>Título</label>
                                        <input type="text" class="form-control" v-model="task.title">
                                    </div>
                                </div>

                                <div class="col-3">
                                    <div class="form-group">
                                        <label>Descrição</label>
                                        <input type="text" class="form-control" v-model="task.description">
                                    </div>
                                </div>

                                <div class="col-3">
                                    <div class="form-group">
                                        <label>Competência necessária</label>
                                        <select class="form-control" v-model="task.skill">
                                            <option v-bind:value="skill.id" v-for="skill in skills">{{ skill.name }}</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-2">
                                    <div class="form-group">
                                        <label>Nível</label>
                                        <input type="text" class="form-control" v-model="task.level">
                                    </div>
                                </div>

                                <div class="col-1">
                                    <a href="#" @click="removeTask(index, $event)">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <router-link :to="{ name: 'home' }" class="button transparent black">Voltar</router-link>
                        <button type="submit" class="button green">Gerar equipe</button>
                    </form>
                </div>
            </div>
        </div>

        <modal v-if="showModal" @close="showModal=false">
            <h3 slot="header">Time sugerido</h3>

            <div slot="body">
                <team-list v-bind:team="team" v-bind:size="4"></team-list>
            </div>

            <div slot="footer">
                <button class="button transparent black" @click="showModal = false">Fechar</button>
                <button class="button green" @click="createProject()">Finalizar</button>
            </div>
        </modal>

        <notifications group="message" position="bottom right"/>
    </main>
</template>

<style lang="scss">
    @import '../../../scss/components/modal';
</style>

<style lang="scss" scoped>
    @import '../../../scss/helpers/flexbox';
    @import '../../../scss/helpers/mixins';
    @import '../../../scss/components/buttons';
    @import '../../../scss/components/list';
    @import '../../../scss/components/inputs';

    .backlog-list {
        border-bottom: 1px solid #cfd8dc;
        margin-bottom: 2rem;
        padding-bottom: 2rem;

        > .row {
            @include align-items(center);
            @include flexbox();

            > .col-1 > a {
                color: #ffcdd2;
                display: block;
                font-size: 2rem;
                text-align: center;
                @include transition(color 300ms ease);

                &:focus,
                &:hover {
                    color: #e53935;
                }
            }
        }

        .form-group {
            margin-bottom: 0;
        }
    }
</style>

<script>
    import Modal from '../components/Modal.vue'
    import TeamList from '../components/TeamList.vue'

    export default {
        name: 'project-new',
        components: {
            'modal': Modal,
            'team-list': TeamList
        },
        data: function () {
            return {
                showModal: false,
                skills: [],
                managers: [],
                project: {
                    title: 'Título do projeto',
                    description: 'Descrição do projeto',
                    deadline: '01/02/2018',
                    manager: 1,
                    quantity: 2,
                    backlog: [
                        {
                            title: 'Exemplo',
                            description: 'O que deve ser feito',
                            skill: 1,
                            level: 3
                        },
                        {
                            title: 'Exemplo',
                            description: 'O que deve ser feito',
                            skill: 2,
                            level: 2
                        },
                        {
                            title: 'Exemplo',
                            description: 'O que deve ser feito',
                            skill: 4,
                            level: 2
                        }
                    ]
                },
                team: []
            }
        },
        methods: {
            generateTeam: function () {
                this.$http.post('/api/v1/teams', {
                    quantity: this.project.quantity,
                    backlog: this.project.backlog
                }, {headers: {'Content-Type': 'application/json'}})
                        .then(function (response) {
                            console.log('Teams', response.data);

                            if (response.status == 200 && response.data.team) {
                                this.team = response.data.team;
                                this.showModal = true;
                            } else {
                                this.showError(response.data.message);
                            }
                        }, function (error) {
                            this.showError(error.message);
                        });
            },
            createProject: function () {
                this.$http.post('/api/v1/projects', {
                    team: this.team,
                    project: this.project
                }, {headers: {'Content-Type': 'application/json'}})
                        .then(function (response) {
                            console.log(response.data);

                            if (response.status == 201 && response.data.id) {
                                this.$router.push({name: 'project_detail', params: {id: response.data.id}});
                            } else {
                                this.showError(response.data.message);
                            }
                        }, function (error) {
                            this.showError(error.message);
                        });
            },
            getSkills: function () {
                this.$http.get('/api/v1/skills')
                        .then(function (response) {
                            console.log(response.data);
                            this.skills = response.data;
                        }, function (error) {
                            console.log(error);
                        });
            },
            getManagers: function () {
                this.$http.get('/api/v1/managers')
                        .then(function (response) {
                            console.log(response.data);
                            this.managers = response.data;
                        }, function (error) {
                            console.log(error);
                        });
            },
            addTask: function () {
                this.project.backlog.push({
                    title: 'Exemplo',
                    description: 'O que deve ser feito',
                    skill: 1,
                    level: 1
                });
            },
            removeTask: function (id, event) {
                if (event)
                    event.preventDefault();

                this.project.backlog.splice(id, 1);
            },
            showError: function (message) {
                this.$notify({
                    group: 'message',
                    title: 'Aviso',
                    text: message,
                    type: 'warn'});
            }
        },
        mounted: function () {
            this.getSkills();
            this.getManagers();
        }
    }
</script>
