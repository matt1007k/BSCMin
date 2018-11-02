<template>
    <div>
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

        <div class="field">
            <label for="content" class="label is-normal">Estrategia </label>
            
            <div class="control"> 
                <textarea class="textarea is-info" placeholder="Ingrese su estrategia" v-model="estrategia.content"></textarea>
                <div class="notification is-danger" v-if="errors.length > 0">                                                                                                        
                    <p v-for="(error, index) in errors" :key="index">La estrategia {{error}}</p>                                                       
                </div>  
            </div>
        </div>
        <div class="actifield is-grouped margin-small-topons">            
            <button class="button is-success" @click="saveEstrategia()">Guardar</button>
        </div>
        <!--<a href="#" class="link link-info" @click.prevent="back()">Regresar</a>-->

    </div>
</template>

<script>
    import { Snackbar } from 'buefy/dist/components/snackbar'
    export default {
        name: 'FormStrategy',
        props: ['strategy', 'tipo'],
        data() {
            return {
                estrategia: this.strategy,
                errors: []
            }
        },
        mounted(){
            this.estrategia = this.strategy;   
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
