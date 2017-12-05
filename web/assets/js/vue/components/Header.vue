<template>
    <header id="header">
        <div class="container">
            <div class="row">
                <div class="col-xs-6">
                    <router-link :to="{ name: 'home' }">
                        <img src="/assets/images/team-rocks-logo.jpg" alt="TEAM ROCKS">
                    </router-link>
                </div>
                <div class="col-xs-6">
                    <p>Bem Vindo, <strong>TEAM ROCKS</strong></p>
                </div>
            </div>
        </div>
    </header>
</template>

<style lang="scss" scoped>
    @import '../../../scss/helpers/flexbox';

    #header {
        background-color: #252a34;
        left: 0;
        padding: 1rem 0;
        position: fixed;
        top: 0;
        width: 100%;
        z-index: 1;

        .row {
            @include align-items(center);
            @include flexbox;
        }

        img {
            max-width: 45px;
        }

        p {
            text-align: right;
            color: #FFF;
            margin-bottom: 0;
        }
    }
</style>

<script>
    export default {
        name: 'header'
    }
</script>