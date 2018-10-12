<template>
    <div>
        <div class="field">
            <label for="foda" class="label is-normal">Foda *</label>
            
            <div class="control">                                                     
                <input type="text" class="input is-info" />
            </div>
        </div>

        

        <div class="field">
            <label for="content" class="label is-normal">Estrategia </label>
            
            <div class="control"> 
                    <textarea class="textarea is-info" name="content" placeholder="Ingrese su estrategia"></textarea>
            </div>
        </div>

        <div class="actifield is-grouped margin-small-topons">
            
        </div>
    </div>
</template>

<script>
    export default{
        props: ['estrategia'],
        data: function () {
            return {
                message: "Hello Vue!"
            }
        }
    }
</script>
