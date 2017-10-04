Vue.component('project-item', {
    props: ['project'],
    template: '<li>{{ project.title }}</li>'
});