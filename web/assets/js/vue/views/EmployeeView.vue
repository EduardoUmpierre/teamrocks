<template>
    <main v-if="employee">
        <section id="project">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>
                            Funcionário
                        </h2>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <p id="title">{{ employee.name}}</p>

                        <skill-list v-bind:skills="employee.skills"></skill-list>
                    </div>
                </div>
            </div>
        </section>

        <section id="projects">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Projetos</h2>
                        <project-list v-bind:projects="employee.projects"></project-list>
                    </div>
                </div>
            </div>
        </section>
    </main>
</template>

<style lang="scss" scoped>
    @import '../../../scss/helpers/flexbox';
    @import '../../../scss/components/buttons';
    @import '../../../scss/components/list';

    p {
        color: #79849a;
        font-size: 1rem;
        margin-bottom: 0;
    }

    #title {
        color: #263238;
        font-size: 3rem;
        font-weight: 700;
    }
</style>

<script>
    import ProjectList from '../components/ProjectList.vue'
    import Formatter from '../helpers/Formatter.vue'
    import SkillList from '../components/SkillList.vue'

    export default {
        name: 'employee-view',
        components: {
            SkillList,
            'project-list': ProjectList,
            'formatter': Formatter,
            'skill-list': SkillList
        },
        data: function () {
            return {
                employee: null
            }
        },
        methods: {
            getEmployeeData: function (id) {
                this.$http
                    .get('/api/v1/employees/' + id)
                    .then(function (response) {
                        console.log(response.data);
                        this.employee = response.data;
                    }, function (error) {
                        console.log(error);
                    })
            }
        },
        mounted: function () {
            this.getEmployeeData(this.$route.params.id);
        }
    }
</script>
