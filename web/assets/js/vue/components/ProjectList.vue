<template>
    <div class="row item-list">
        <div class="col col-xs-12 col-sm-4 col-lg-3" v-for="project in projects">
            <router-link
                    :to="{ name: 'project_detail', params: { id: project.id } }"
                    v-bind:class="project.status == 0 ? 'inactive' : (project.status == 2 ? 'finished' : 'active')">
                <h3>{{ project.title }}</h3>
                <p>{{ project.description }}</p>
            </router-link>
        </div>

        <div class="col" v-if="projects.length === 0">
            <p>Nenhum projeto encontrado</p>
        </div>
    </div>
</template>

<style lang="scss" scoped>
    @import '../../../scss/components/list';
    @import '../../../scss/helpers/variables';

    .item-list > div > a {
        border-bottom: 2px solid transparent;

        &.inactive {
            border-bottom-color: $yellow;
        }

        &.active {
            border-bottom-color: $blue;
        }

        &.finished {
            border-bottom-color: $green;
        }
    }
</style>

<script>
    export default {
        name: 'project-list',
        props: {
            'projects': {
                type: Array
            }
        }
    }
</script>