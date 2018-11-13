import Vue from 'vue/dist/vue.esm'
import VueResource from 'vue-resource'
import TurbolinksAdapter from 'vue-turbolinks'

import Buefy from 'buefy'

import FormStrategyEdit from './components/FormStrategyEdit.vue' 
import FormObjectiveEdit from './components/FormObjectiveEdit.vue' 

Vue.use(Buefy)

Vue.use(TurbolinksAdapter)
Vue.use(VueResource) 

document.addEventListener('turbolinks:load', () => {
    Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    var element = document.getElementById("editar_form_estrategia");
    if (element != null) {
        var estrategia = JSON.parse(element.dataset.strategy); 
        var id = element.dataset.id;
        const app = new Vue({
        el: element,
        data: {
            strategy: estrategia,
            id: id,
        },

        
        template: '<FormStrategyEdit :strategy="strategy" :id="id" />',
        components: {FormStrategyEdit}
        })
    }

    var element_new = document.getElementById("add_form_estrategia");
    if (element_new != null) {
      var estrategia = JSON.parse(element_new.dataset.estrategia); 
      var tipo = element_new.dataset.tipo;
      const app = new Vue({
        el: element_new,
        data: {
          estrategia: estrategia,
          tipo: tipo,
          errors: []
        },
        methods: {
            saveEstrategia(){
                this.$http.post('/strategies', { strategy: {
                    foda: this.estrategia.foda.toString(),
                    content: this.estrategia.content,
                    objective: 1,
                    tipo: this.tipo
                } 
                }).then(response => {
                    Snackbar.open({
                        duration: 3000,
                        message: 'La estrategia se modifico con exitó',
                        type: 'is-success',
                        position: 'is-top-right',
                        actionText: 'X'
                    })
                    window.location.href = '/strategies';
                }, response => {
                    console.log(response)
                    if (response.status = 422){
                    var json = JSON.parse(response.bodyText)
                    this.errors = json["content"]
                    console.log(this.errors)
                    }
                })
            }
        }
        
        //template: '<FormStrategy :strategy="estrategia" :tipo="tipo" />',
        //components: {FormStrategy}
      })
    }



    var element = document.getElementById("editar_form_objetivo");
    if (element != null) {
        var objectivo = JSON.parse(element.dataset.objectivo); 
        var estrategias = JSON.parse(element.dataset.estrategias); 
        var my_estrategies = JSON.parse(element.dataset.myestrategies); 
        var id = element.dataset.id;

        const app = new Vue({
            el: element,
            data: {
                id: id,
                objective: objectivo,
                strategies: estrategias,
                my_estrategies: my_estrategies
            },

            template: '<FormObjectiveEdit :objectivo="objective" :my_estrategies="my_estrategies" :id="id" :estrategias="strategies" />',
            components: {FormObjectiveEdit}
        })
    }


    var element_new = document.getElementById("add_form_objectivo");
    if (element_new != null) {
      var objectivo = JSON.parse(element_new.dataset.objectivo); 
      var estrategias = JSON.parse(element_new.dataset.estrategias); 
      var perspective_id = element_new.dataset.perspective; 
      var tipo = element_new.dataset.tipo;
      const app = new Vue({
        el: element_new,
        data: {
            filteredTags: [],
            objective: {},
            strategies: [],
            perspective_id: perspective_id,
            errors: []
        },
        mounted(){
            this.objective = objectivo;
            this.filteredTags = estrategias;
            console.log(estrategias)
        },
        methods: {
            getFilteredTags(text) {
                this.filteredTags = estrategias.filter((option) => {
                    return option.slug
                        .toString()
                        .toLowerCase()
                        .indexOf(text.toLowerCase()) >= 0
                })
            },
            submit(){
                this.$http.post('/objectives', { objective: {
                    content: this.objective.content,
                    perspective_id: this.perspective_id,                    
                },
                strategies: this.strategies 
                }).then(response => {
                    Turbolinks.visit('/objectives');
                }, response => {
                    console.log(response)
                    if (response.status = 422){
                    var json = JSON.parse(response.bodyText)
                    this.errors = json["content"]
                    console.log(this.errors)
                    }
                })
            }
        }
        
        //template: '<FormStrategy :strategy="objectivo" :tipo="tipo" />',
        //components: {FormStrategy}
      })
    }


});