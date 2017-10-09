import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'

import Home from './routes/Home.vue'
import ProjectView from './routes/ProjectView.vue'
import ProjectNew from './routes/ProjectNew.vue'

Vue.use(VueResource)
Vue.use(VueRouter)

const router = new VueRouter({
    routes: [
        {path: '/', component: Home},
        {path: '/projeto/novo', name: 'project_new', component: ProjectNew},
        {path: '/projeto/:id', name: 'project_detail', component: ProjectView}
    ]
})

const app = new Vue({
    router
}).$mount('#app')