<template>
    <div class="row">
        <div
                class="col-xs-12 col-sm-4 tr_eq"
                v-for="person in team">
            <h3>{{ person.name }}</h3>

            <ul>
                <li v-for="skill in person.skills">
                    {{ skill.name }} - {{ skill.level }}
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'team-list',
        props: ['team']
    }
</script>