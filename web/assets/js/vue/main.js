import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'

import Home from './routes/Home.vue'
import ProjectView from './routes/ProjectView.vue'

Vue.use(VueResource)
Vue.use(VueRouter)

const router = new VueRouter({
    routes: [
        {path: '/', component: Home},
        {path: '/projeto/:id', name: 'project_detail', component: ProjectView}
    ]
})

const app = new Vue({
    router
}).$mount('#app')