<template>
    <div class="row item-list">
        <div class="col-xs-12 col-sm-4 col-lg-3"
             v-for="person in team">
            <router-link :to="{ name: 'home'}" class="inline transparent">
                <img src="http://www.placehold.it/50" class="img-responsive">

                <div>
                    <h3>{{ person.name }}</h3>

                    <ul>
                        <li v-for="skill in person.skills">
                            {{ skill.name }}
                        </li>
                    </ul>
                </div>
            </router-link>
        </div>
    </div>
</template>

<style lang="scss" scoped>
    @import '../../../scss/components/list';
</style>

<script>
    export default {
        name: 'team-list',
        props: ['team']
    }
</script>