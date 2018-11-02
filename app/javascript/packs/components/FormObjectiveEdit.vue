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
                :data="filteredTags"
                autocomplete
                field="objective_id"
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
    props: ['id','objectivo','estrategias','my_estrategies'],
    name: 'FormObjectiveEdit',
    data(){
        return{
            filteredTags: [],
            edit: false,
            objective: {},
            strategies: [],
            my_estrategies: [],
            errors: []
        }
    },
    methods: {
        getFilteredTags(text) {
            this.filteredTags = this.my_estrategies.filter((option) => {
                return option.objective_id
                    .toString()
                    .toLowerCase()
                    .indexOf(text.toLowerCase()) >= 0
            })
        },
        submit(){
            if(this.id != null){
                this.$http.put(`/objectives/${this.id}`, { objective: {
                        content: this.objective.content,
                        perspective_id: this.objective.perspective_id
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
    },
    mounted(){
        this.objective = this.objectivo;
        this.filteredTags = this.estrategias;
        console.log(this.estrategias)
    }
}
</script>

<style scoped>

</style>
