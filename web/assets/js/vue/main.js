import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'
import Notifications from 'vue-notification'
import BootstrapVue from 'bootstrap-vue'

import router from './router';

import Header from './components/Header.vue'
import Footer from './components/Footer.vue'

Vue.use(BootstrapVue);
Vue.use(Notifications);
Vue.use(VueResource);
Vue.use(VueRouter);

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

const app = new Vue({
    router,
    components : {
        'header-view' : Header,
        'footer-view' : Footer
    }
}).$mount('#app');