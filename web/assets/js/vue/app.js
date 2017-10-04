var app = new Vue({
    el: '#app',
    data: {
        vuemessage: 'Hello Vue!',
        projects: []
    },
    delimiters: ['${', '}'],
    methods: {
        getProjects: function () {
            this.$http
                .get('/api/v1/projects')
                .then(function (response) {
                    this.projects = response.data;
                }, function (error) {
                    console.log(error);
                });
        }
    },
    mounted: function() {
        this.getProjects();
    }
});