<template>
    <header id="header">
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <router-link :to="{ name: 'home' }">
                        <img src="/assets/images/team-rocks-logo.jpg" alt="TEAM ROCKS">
                    </router-link>
                </div>
                <div class="col-6">
                    <p>Bem Vindo, <strong>TEAM ROCKS</strong></p>
                </div>
            </div>
        </div>
    </header>
</template>

<style lang="scss">
    @import '../../../scss/components/dropdown';

    html {
        font-size: 14px;
    }

    #app > main {
        padding-top: 7rem;
        min-height: 100vh;
        min-height: -webkit-calc(100vh - 306px);
        min-height:    -moz-calc(100vh - 306px);
        min-height:         calc(100vh - 306px);
    }

    .fade-enter-active, .fade-leave-active {
        transition-property: opacity;
        transition-duration: 300ms;
        min-height: 100%;
    }

    .fade-enter-active {
        transition-delay: 300ms;
        min-height: 100%;
    }

    .fade-enter, .fade-leave-active {
        opacity: 0;
        min-height: 100%;
    }
</style>

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
            color: #FFF;
            font-size: 1rem;
            margin-bottom: 0;
            text-align: right;
        }
    }
</style>

<script>
    export default {
        name: 'header'
    }
</script>