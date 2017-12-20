<template>
    <div class="row item-list">
        <div v-bind:class="'col-md-' + size" class="col col-xs-12 col-sm-4"
             v-for="person in sortedTeam">
            <router-link :to="{ name: 'employee_detail', params: { id: person.id } }" class="inline transparent">
                <div class="image-container">
                    <img src="http://www.placehold.it/50" class="img-responsive">

                    <span class="status" v-if="person.hasOwnProperty('available')" v-bind:class="person.available ? 'green' : 'red'"></span>
                </div>

                <div class="content-container">
                    <h3>{{ person.name }}</h3>

                    <skill-list v-bind:skills="person.skills"></skill-list>
                </div>
            </router-link>
        </div>

        <div class="col" v-if="sortedTeam.length === 0">
            <p>Nenhum funcionário encontrado</p>
        </div>
    </div>
</template>

<style lang="scss" scoped>
    @import '../../../scss/components/list';
</style>

<script>
    import { orderBy, isEmpty } from 'lodash';
    import SkillList from './SkillList.vue';

    export default {
        name: 'team-list',
        components: {
            'skill-list': SkillList
        },
        props: {
            'team': {
                type: Array | Object
            },
            'size': {
                type: Number,
                default: 3
            }
        },
        computed: {
            sortedTeam: function() {
                return _.orderBy(this.team, 'available', 'desc');
            }
        }
    }
</script>