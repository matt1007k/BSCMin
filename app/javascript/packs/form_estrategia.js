import Vue from 'vue/dist/vue.esm'
import VueResource from 'vue-resource'
import TurbolinksAdapter from 'vue-turbolinks'
import Buefy from 'buefy'
//import 'buefy/dist/buefy.css'
//import AddFormEstrategia from './components/AddFormEstrategia'

Vue.use(Buefy)

Vue.use(TurbolinksAdapter)
Vue.use(VueResource)

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  var element_fo = document.getElementById("add_form_estrategia_fo");
  if (element_fo != null) {
    var estrategia = JSON.parse(element_fo.dataset.estrategia); 
    var tipo = element_fo.dataset.tipo;
    const app = new Vue({
      el: element_fo,
      data: {
        estrategia: estrategia,
        tipo: tipo,
        errors: [],
        tags: [
          'Auckland',
          'Wellington',
          'Napier'
        ]
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
        tags: [
          'Auckland',
          'Wellington',
          'Napier'
        ]
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
        tags: [
          'Auckland',
          'Wellington',
          'Napier'
        ]
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

      
      //template: '<AddFormEstrategia :estrategia="estrategia" />',
      //components: {AddFormEstrategia}
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
        tags: [
          'Auckland',
          'Wellington',
          'Napier'
        ]
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

      
      //template: '<AddFormEstrategia :estrategia="estrategia" />',
      //components: {AddFormEstrategia}
    })
  }
})
 