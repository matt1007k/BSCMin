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
            <button class="button is-success" @click="saveEstrategia()">Editar</button>
        </div>
        <!--<a href="#" class="link link-info" @click.prevent="back()">Regresar</a>-->

    </div>
</template>

<script>
    export default {
        name: 'FormStrategyEdit',
        props: ['strategy','id'],
        data() {
            return {
                estrategia: {
                    foda: this.strategy.foda.split(","),
                    content: this.strategy.content
                },
                errors: []
            }
        },
        mounted(){
            this.edit = this.editar;   
        },     
        methods: {
            saveEstrategia(){
                if(this.id != null){
                    this.$http.put(`/strategies/${this.id}`, { strategy: {
                        foda: this.estrategia.foda.toString(),
                        content: this.estrategia.content,
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

    }
</script>
