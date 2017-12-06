<template>
    <span>{{ formatter[fn](value, format) }}</span>
</template>

<script>
    import moment from 'moment'

    export default {
        name: 'formatter',
        props: ['value', 'fn', 'format'],
        computed: {
            formatter: function() {
                var formatter = {
                    date: function (value, format) {
                        if (value) {
                            return moment(String(value)).format(format || 'DD/MM/YYYY')
                        }
                    },
                    time: function (value, format) {
                        if (value) {
                            return moment(String(value)).format(format || 'h:mm A');
                        }
                    }
                };

                return formatter;
            }
        }
    }
</script>