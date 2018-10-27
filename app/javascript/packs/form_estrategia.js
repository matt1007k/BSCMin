import Vue from 'vue/dist/vue.esm'
import VueResource from 'vue-resource'
import TurbolinksAdapter from 'vue-turbolinks'

import Buefy from 'buefy'
//import 'buefy/dist/buefy.css'
//import AddFormEstrategia from './components/AddFormEstrategia'
import { Snackbar } from 'buefy/dist/components/snackbar'


Vue.use(Buefy)

Vue.use(TurbolinksAdapter)
Vue.use(VueResource)

window.snackbar = Snackbar

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  var element_fo = document.getElementById("add_form_estrategia_fo");
  if (element_fo != null) {
    var estrategia = JSON.parse(element_fo.dataset.estrategia); 
    var tipo = element_fo.dataset.tipo;
    var id = element_fo.dataset.id;
    const app = new Vue({
      el: element_fo,
      data: {
        estrategia: estrategia,
        id: id,
        tipo: tipo,
        errors: [],
      },
      methods: {
        closeModal(){
          var modal = document.querySelector(".modal");
          modal.classList.remove('is-active');
        },
        saveEstrategia(){          
          this.$http.post('/strategies', { strategy: {
            foda: this.estrategia.foda.toString(),
            content: this.estrategia.content,
            objective: 1,
            tipo: this.tipo
          } 
          }).then(response => {
            Turbolinks.visit('/strategies');
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

      
      //template: '<AddFormEstrategia :estrategia="estrategia" />',
      //components: {AddFormEstrategia}
    })
  }

  var element = document.getElementById("editar_form_estrategia");
  if (element != null) {
    var estrategia = JSON.parse(element.dataset.estrategia); 
    var id = element.dataset.id;
    const app = new Vue({
      el: element,
      data: {
        estrategia: {
            foda: estrategia.foda.split(","),
            content: estrategia.content
        },
        id: id,
        errors: [],
      },
      methods: {
        closeModal(){
          var modal = document.querySelector(".modal");
          modal.classList.remove('is-active');
        },
        saveEstrategia(){
          if(this.id != null){
            this.$http.put(`/strategies/${this.id}`, { strategy: {
              foda: this.estrategia.foda.toString(),
              content: this.estrategia.content,
            } 
            }).then(response => {  
              Snackbar.open({
                duration: 3000,
                message: 'La estrategia se modifico con exitó',
                type: 'is-success',
                position: 'is-top-right',
                actionText: 'X'
              })            
              Turbolinks.visit('/strategies');
              
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
      }

      
      //template: '<AddFormEstrategia :estrategia="estrategia" />',
      //components: {AddFormEstrategia}
    })
  }


  var element_fa = document.getElementById("add_form_estrategia_fa");
  if (element_fa != null) {
    var estrategia = JSON.parse(element_fa.dataset.estrategia); 
    var tipo = element_fa.dataset.tipo;
    const app = new Vue({
      el: element_fa,
      data: {
        estrategia: estrategia,
        tipo: tipo,
        errors: [],
      },
      methods: {
        closeModal(){
          var modal = document.querySelector(".modal");
          modal.classList.remove('is-active');
        },
        saveEstrategia(){
          this.$http.post('/strategies', { strategy: {
              foda: this.estrategia.foda.toString(),
              content: this.estrategia.content,
              objective: 1,
              tipo: this.tipo
            } 
          }).then(response => {
            Turbolinks.visit('/strategies');
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

      
      //template: '<AddFormEstrategia :estrategia="estrategia" />',
      //components: {AddFormEstrategia}
    })
  }


  var element_do = document.getElementById("add_form_estrategia_do");
  if (element_do != null) {
    var estrategia = JSON.parse(element_do.dataset.estrategia); 
    var tipo = element_do.dataset.tipo;
    const app = new Vue({
      el: element_do,
      data: {
        estrategia: estrategia,
        tipo: tipo,
        errors: [],
      },
      methods: {
        closeModal(){
          var modal = document.querySelector(".modal");
          modal.classList.remove('is-active')
          console.log(this.estrategia.foda.toString())
          console.log(this.estrategia.content)
        },
        saveEstrategia(){
          this.$http.post('/strategies', { strategy: {
              foda: this.estrategia.foda.toString(),
              content: this.estrategia.content,
              objective: 1,
              tipo: this.tipo
            } 
          }).then(response => {
            Turbolinks.visit('/strategies');
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

    })
  }


  var element_da = document.getElementById("add_form_estrategia_da");
  if (element_da != null) {
    var estrategia = JSON.parse(element_da.dataset.estrategia); 
    var tipo = element_da.dataset.tipo;
    const app = new Vue({
      el: element_da,
      data: {
        estrategia: estrategia,
        tipo: tipo,
        errors: [],
      },
      methods: {
        closeModal(){
          var modal = document.querySelector(".modal");
          modal.classList.remove('is-active');
        },
        saveEstrategia(){
          this.$http.post('/strategies', { strategy: {
              foda: this.estrategia.foda.toString(),
              content: this.estrategia.content,
              objective: 1,
              tipo: this.tipo
            } 
          }).then(response => {
            Turbolinks.visit('/strategies');
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

    })
  }
})
 