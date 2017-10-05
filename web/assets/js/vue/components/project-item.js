Vue.component('project-item', {
    props: ['project'],
    template: '<div class="col-xs-12 col-sm-4 tr_eq" @click="getProjectData(project.id)">'+
    			'<figure><img src="" alt=""></figure>' +
    			'<h3>{{ project.title }}</h3>'+
    			'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. A architecto asperiores consectetur ipsa maiores natus nostrum obcaecati, perspiciatis sit? Commodi doloremque harum ipsam libero minima odio quia quis velit vitae.</p>' +
    			'</div>',
	methods: {
        getProjectData: function(id) {
            this.$http
                .get('/api/v1/projects/' + id)
                .then(function (response) {
                	console.log(response.data);
                    this.project = response.data;
                }, function (error) {
                    console.log(error);
                });
        }
	}
});