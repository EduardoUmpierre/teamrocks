<template>
    <ol class="row">
        <li
                class="col-xs-12 col-sm-4 tr_eq"
                v-for="task in tasks">
            <h3>{{ task.title }} - {{ task.skill }}</h3>
            <h4>{{ task.employee_name }}</h4>
            <p>{{ task.description }}</p>
        </li>
    </ol>
</template>

<script>
    export default {
        name: 'task-list',
        props: ['tasks']
    }
</script>