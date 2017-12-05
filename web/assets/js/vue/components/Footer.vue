<template>
    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-xs-6">
                    <h4>Tecnologias utilizadas</h4>

                    <ul>
                        <li>
                            <a href="https://symfony.com/" target="_blank">
                                <img src="/assets/images/logos/symfony.svg" alt="Symfony" class="img-responsive">
                            </a>
                        </li>
                        <li>
                            <a href="https://vuejs.org/" target="_blank">
                                <img src="/assets/images/logos/vue.svg" alt="vue.js" class="img-responsive">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</template>

<style lang="scss" scoped>
    @import '../../../scss/helpers/flexbox';

    #footer {
        background-color: #252a34;
        color: #FFF;
        margin-top: 4rem;
        padding: 8rem 0;

        h4 {
            font-size: 1.5rem;
            font-weight: 700;
            margin: 0 0 4rem;
            text-transform: uppercase;
        }

        ul {
            margin: 0;
            list-style: none;
            padding: 0;

            > li {
                float: left;
                margin-right: 1rem;

                &:last-child {
                    margin-right: 0;
                }

                > a {
                    display: block;

                    > img {
                        max-width: 50px;
                    }
                }
            }
        }
    }
</style>