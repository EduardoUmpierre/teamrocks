import Home from '../views/Home.vue'
import ProjectNew from '../views/ProjectNew.vue'
import ProjectView from '../views/ProjectView.vue'

export default [
    {
        path: '/',
        name: 'home',
        component: Home
    },
    {
        path: '/projeto/novo',
        name: 'project_new',
        component: ProjectNew
    },
    {
        path: '/projeto/:id',
        name: 'project_detail',
        component: ProjectView
    }
]