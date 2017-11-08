<template>
    <div>
        <main class="project_view">
            <div class="container">
                <h2>Novo projeto</h2>

                <form v-on:submit.prevent="generateTeam">
                    <div class="group">
                        <label for="title">Título</label>
                        <input type="text" name="title" class="input" id="title" v-model="project.title">
                    </div>

                    <div class="group">
                        <label for="description">Descrição</label>
                        <textarea name="description" class="input" id="description"
                                  v-model="project.description"></textarea>
                    </div>

                    <div class="group">
                        <label for="deadline">Prazo</label>
                        <input type="text" name="deadline" class="input" id="deadline"
                               v-model="project.deadline">
                    </div>

                    <div class="group">
                        <label for="manager">Gestor</label>

                        <select id="manager" class="input" v-model="project.manager">
                            <option v-bind:value="manager.id" v-for="manager in managers">{{ manager.name }}</option>
                        </select>
                    </div>

                    <div class="group">
                        <label for="quantity">Quantidade máxima de componentes no time</label>
                        <input type="text" name="quantity" class="input" id="quantity"
                               v-model="project.quantity">
                    </div>

                    <h3>
                        Backlog
                        <button class="button button_green button_side pull-right" type="button" v-on:click="addTask">
                            Adicionar item
                        </button>
                    </h3>

                    <div class="func" v-for="(task, index) in project.backlog">
                        <div class="group">
                            <a href="#" v-on:click="removeTask(index, $event)">
                                <i class="fa fa-times"></i>
                            </a>
                            <label>Título</label>
                            <input type="text" class="input" v-model="task.title">
                        </div>
                        <div class="group">
                            <label>Descrição</label>
                            <input type="text" class="input" v-model="task.description">
                        </div>
                        <div class="group">
                            <label>Competência necessária</label>
                            <select class="input" v-model="task.skill">
                                <option v-bind:value="skill.id" v-for="skill in skills">{{ skill.name }}</option>
                            </select>
                        </div>
                        <div class="group">
                            <label>Nível</label>
                            <input type="text" class="input" v-model="task.level">
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-4">
                        <button type="submit" class="button button_green center-block">Gerar equipe</button>
                    </div>

                </form>
            </div>
        </main>

        <modal v-if="showModal" @close="showModal=false">
            <h3 slot="header">Time sugerido</h3>

            <div slot="body">
                <team-list v-bind:team="team"></team-list>
            </div>

            <div slot="footer">
                <button class="modal-default-button" @click="createProject()">
                    Finalizar
                </button>

                <button class="modal-default-button" @click="showModal = false">
                    Fechar
                </button>
            </div>
        </modal>

        <notifications group="message" position="bottom right" />
    </div>
</template>

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
                    deadline: '01/12/1996',
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
                this.$http.post('/api/v1/teams', {quantity: this.project.quantity, backlog: this.project.backlog}, {headers: {'Content-Type': 'application/json'}})
                    .then(function (response) {
                        console.log(response.data);

                        if (response.status == 200 && response.data.team) {
                            this.team = response.data.team;
                            this.showModal = true;
//                            this.$router.push({name: 'project_detail', params: {id: response.data.id}});
                        }
                    }, function (error) {
                        console.log(error);

                        this.$notify({
                            group: 'message',
                            title: 'Aviso',
                            text: error.body.message,
                            type: 'warn'
                        });
                    });
            },
            createProject: function() {
                this.$http.post('/api/v1/projects', {team: this.team, project: this.project}, {headers: {'Content-Type': 'application/json'}})
                    .then(function (response) {
                        console.log(response.data);

                        if (response.status == 201 && response.data.id) {
                            this.$router.push({name: 'project_detail', params: {id: response.data.id}});
                        }
                    }, function (error) {
                        console.log(error);

                        this.$notify({
                            group: 'message',
                            title: 'Aviso',
                            text: error.body.message,
                            type: 'warn'
                        });
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
            }
        },
        mounted: function () {
            this.getSkills();
            this.getManagers();
        }
    }
</script>
