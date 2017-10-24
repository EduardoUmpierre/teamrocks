import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'
import Notifications from 'vue-notification'

import Home from './routes/Home.vue'
import ProjectView from './routes/ProjectView.vue'
import ProjectNew from './routes/ProjectNew.vue'
import ProjectList from './routes/ProjectList.vue'

import MenuList from './components/MenuList.vue'
import Footer from './components/Footer.vue'

Vue.use(Notifications);
Vue.use(VueResource);
Vue.use(VueRouter);

const router = new VueRouter({
    routes: [
        {path: '/', component: Home},
        {path: '/projeto/novo', name: 'project_new', component: ProjectNew},
        {path: '/projeto/:id', name: 'project_detail', component: ProjectView},
        {path: '/projeto/listagem', name: 'project_list', component: ProjectList}
    ],
    mode: 'history',
})

const app = new Vue({
    router,
    components : {
        'menu-list' : MenuList,
        'footer-view' : Footer
    }
}).$mount('#app');