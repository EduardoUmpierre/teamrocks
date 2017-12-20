<template>
    <ul>
        <li v-for="skill in skills">
            {{ skill.name }}
        </li>
    </ul>
</template>

<style lang="scss" scoped>
    @import '../../../scss/helpers/mixins';

    ul {
        color: #546e7a;
        list-style: none;
        margin: 0.5rem 0 0;
        padding: 0;

        > li {
            background-color: #eceff1;
            @include border-radius(5px);
            float: left;
            font-size: 0.8rem;
            line-height: 1em;
            margin-right: 0.75rem;
            padding: 0.5rem;

            &:last-child {
                margin-right: 0;
            }
        }
    }
</style>

<script>
    export default {
        name: "skill-list",
        props: {
            'skills': {
                type: Array
            }
        }
    }
</script>