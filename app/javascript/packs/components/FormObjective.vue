<template>
    <form @submit.prevent="submit">
        <div class="field">
            <label for="content" class="label is-normal">Objetivo</label>
            
            <div class="control">
                <textarea id="content" v-model="objective.content" cols="10" rows="5" class="textarea is-info"></textarea>    
                <div class="notification is-danger" v-if="errors.length > 0">                                                                                                        
                    <p v-for="(error, index) in errors" :key="index">El objetivo {{error}}</p>                                                       
                </div> 
            </div>
        </div>
        <b-field label="Asignar estrategias">
            <b-taginput
                v-model="strategies"
                :data="filteredTags"
                autocomplete
                field="slug"
                icon="label"
                placeholder="Agregar Estrategia"
                @typing="getFilteredTags">
            </b-taginput>
        </b-field>
        <pre>{{strategies}}</pre>
        <div class="field is-grouped margin-small-topons">
            <button type="submit" class="button is-success">Guardar</button>            
        </div>
        <!--<a href="#" class="link link-info" @click.prevent="back()">Regresar</a>-->
    </form>
</template>
<script>
export default {
    props: ['editar', 'id','objectivo','estrategias','perspective_id'],
    name: 'FormObjective',
    data(){
        return{
            filteredTags: [],
            edit: false,
            objective: {},
            strategies: [],
            errors: []
        }
    },
    methods: {
        back(){
            Turbolinks.visit('/objectives');
        },
        getFilteredTags(text) {
            this.filteredTags = this.estrategias.filter((option) => {
                return option.slug
                    .toString()
                    .toLowerCase()
                    .indexOf(text.toLowerCase()) >= 0
            })
        },
        submit(){
            this.$http.post('/objectives', { objective: {
                content: this.objective.content,
                perspective_id: this.perspective_id
            } 
            }).then(response => {
                Snackbar.open({
                    duration: 3000,
                    message: 'El objetivo se creo con exitó',
                    type: 'is-success',
                    position: 'is-top-right',
                    actionText: 'X'
                })
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
    },
    mounted(){
        this.edit = this.editar;
        this.objective = this.objectivo;
        this.filteredTags = this.estrategias;
        console.log(this.estrategias)
    }
}
</script>

<style scoped>

</style>
