<template>
    <div>
        <main class="tr_content_home">
            <div class="container">
                <h2>Novo projeto</h2>

                <form v-on:submit.prevent="create">
                    <div class="form-group">
                        <label for="title">Título</label>
                        <input type="text" name="title" class="form-control" id="title" v-model="project.title">
                    </div>

                    <div class="form-group">
                        <label for="description">Descrição</label>
                        <input type="text" name="description" class="form-control" id="description"
                               v-model="project.description">
                    </div>

                    <div class="form-group">
                        <label for="deadline">Prazo</label>
                        <input type="text" name="deadline" class="form-control" id="deadline"
                               v-model="project.deadline">
                    </div>

                    <div class="form-group">
                        <label for="manager">Gestor</label>
                        <input type="text" name="manager" class="form-control" id="manager" v-model="project.manager">
                    </div>

                    <div class="form-group">
                        <label for="quantity">Quantidade máxima de componentes no time</label>
                        <input type="text" name="quantity" class="form-control" id="quantity"
                               v-model="project.quantity">
                    </div>

                    <h3>Backlog
                        <button class="btn btn-primary" type="button" v-on:click="addTask">
                            Adicionar item
                        </button>
                    </h3>

                    <ol>
                        <li v-for="(task, index) in project.backlog" class="row">
                            <div class="form-group col-xs-3">
                                <label>Título</label>
                                <input type="text" class="form-control" v-model="task.title">
                            </div>
                            <div class="form-group col-xs-3">
                                <label>Descrição</label>
                                <input type="text" class="form-control" v-model="task.description">
                            </div>
                            <div class="form-group col-xs-3">
                                <label>Competência necessária</label>

                                <select class="form-control" v-model="task.skill">
                                    <option v-bind:value="skill.id" v-for="skill in skills">{{ skill.name }}</option>
                                </select>
                            </div>
                            <div class="form-group col-xs-2">
                                <label>Nível</label>
                                <input type="text" class="form-control" v-model="task.level">
                            </div>
                            <div class="form-group col-xs-1">
                                <a href="#" v-on:click="removeTask(index, $event)">
                                    X
                                </a>
                            </div>
                        </li>
                    </ol>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Adicionar</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</template>

<script>
    export default {
        name: 'project-new',
        data: function () {
            return {
                skills: [],
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
                        }
                    ]
                }
            }
        },
        methods: {
            create: function () {
                this.$http.post('/api/v1/projects', this.project, {headers: {'Content-Type': 'application/json'}})
                        .then(function (response) {
                            console.log(response.data);

                            if (response.status == 201 && response.data.id) {
                                this.$router.push({name: 'project_detail', params: {id: response.data.id}});
                            }
                        }, function (error) {
                            console.log(error);
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
            addTask: function () {
                this.project.backlog.push({
                    title: 'Exemplo',
                    description: 'O que deve ser feito',
                    skill: 1,
                    level: 1
                });
            },
            removeTask: function(id, event) {
                if (event)
                    event.preventDefault();

                this.project.backlog.splice(id, 1);
            }
        },
        mounted: function () {
            this.getSkills();
        }
    }
</script>
