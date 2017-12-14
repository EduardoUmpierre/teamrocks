<template>
    <div class="row item-list">
        <div v-bind:class="'col-md-' + size" class="col col-xs-12 col-sm-4"
             v-for="person in sortedTeam">
            <router-link :to="{ name: 'home'}" class="inline transparent">
                <div class="image-container">
                    <img src="http://www.placehold.it/50" class="img-responsive">

                    <span class="status" v-if="person.hasOwnProperty('available')" v-bind:class="person.available ? 'green' : 'red'"></span>
                </div>

                <div class="content-container">
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
    import { orderBy, isEmpty } from 'lodash';

    export default {
        name: 'team-list',
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