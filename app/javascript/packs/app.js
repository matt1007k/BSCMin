
import Vue from 'vue/dist/vue.esm'
import VueResource from 'vue-resource'
import TurbolinksAdapter from 'vue-turbolinks'

import Buefy from 'buefy'

//import App from '../app.vue'
import FormObjective from './components/FormObjective.vue'
import FormStrategy from './components/FormStrategy.vue'
import FormStrategyEdit from './components/FormStrategyEdit.vue' 

Vue.use(Buefy)

Vue.use(TurbolinksAdapter)
Vue.use(VueResource) 




document.addEventListener('DOMContentLoaded', () => {
    Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    Vue.component('form-objective', FormObjective);
    Vue.component('form-estrategia', FormStrategy);
    Vue.component('form-estrategia-edit', FormStrategyEdit);
    
    const app = new Vue({
        el:'#app',
    })
    
})