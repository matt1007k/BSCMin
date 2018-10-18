<template>
    <div>
        <div class="modal is-active">
            <div class="modal-background"></div>
            <div class="modal-card">
                <header class="modal-card-head">
                    <p class="modal-card-title">Nueva estrategía {{tipo}}</p>
                    <button class="button is-danger close-modal">
                        <span class="icon">
                            <div class="mdi mdi-close"></div>
                        </span>
                    </button>
                </header>
                
                    <section class="modal-card-body">                                       
                    
                        <div class="field">
                            <div class="control"> 
                                <b-field label="Foda">
                                    <b-taginput
                                        type="is-dark"
                                        v-model="estrategia.foda"
                                        attached>
                                    </b-taginput>
                                </b-field>                                                   
                            </div>
                        </div>

                        <input type="hidden" v-model="estrategia.objective_id" value="1" />

                        <div class="field">
                            <label for="content" class="label is-normal">Estrategia </label>
                            
                            <div class="control"> 
                                <textarea class="textarea is-info" placeholder="Ingrese su estrategia" v-model="estrategia.content"></textarea>
                                <div class="notification is-danger" v-if="errors.length > 0">                                                                                                        
                                    <p v-for="(error, index) in errors" :key="index">La estrategia {{error}}</p>                                                       
                                </div>  
                            </div>
                        </div>

                                           
                    </section>
                    <footer class="modal-card-foot">
                        <button class="button is-success" @click="saveEstrategia()">Guardar</button>
                        <button class="button is-danger" @click="closeModal()">
                            Cancelar
                        </button>
                    </footer>
               
            </div>
        </div>
    </div>
</template>

<script>
    export default{
        props: ['strategy', 'tipo'],
        data: function () {
            return {
                estrategia: strategy,
                errors: []
            }
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

    }
</script>
