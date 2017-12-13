<template>
    <div class="row item-list">
        <div class="col col-xs-12 col-sm-4 col-lg-3"
             v-for="task in tasks">
            <router-link :to="{ name: 'home'}">
                <h3>{{ task.title }} - {{ task.skill }}</h3>
                <p>{{ task.description }}</p>

                <span class="employee">
                    <img src="http://www.placehold.it/30">
                </span>
            </router-link>
        </div>
    </div>
</template>

<style lang="scss" scoped>
    @import '../../../scss/helpers/mixins';
    @import '../../../scss/components/list';

    .employee {
        bottom: 1rem;
        position: absolute;
        right: 1rem;

        > img {
            @include border-radius(50%);
        }
    }
</style>

<script>
    export default {
        name: 'task-list',
        props: ['tasks']
    }
</script>