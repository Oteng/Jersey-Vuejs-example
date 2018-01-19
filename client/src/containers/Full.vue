<template>
  <div class="app">
    <AppHeader/>
    <div class="app-body">
      <Sidebar :navItems="nav"/>
      <main class="main">
        <breadcrumb :list="list"/>
        <div class="container-fluid">
          <router-view></router-view>
        </div>
      </main>
      <AppAside/>
    </div>
    <AppFooter/>
  </div>
</template>

<script>
  import nav from '../_nav'
  import {Header as AppHeader, Sidebar, Aside as AppAside, Footer as AppFooter, Breadcrumb} from '../components/'

  export default {
    name: 'full',
    components: {
      AppHeader,
      Sidebar,
      AppAside,
      AppFooter,
      Breadcrumb
    },
    data() {
      return {
        nav: nav.items
      }
    },
    created() {
      this.$Progress.start();

      this.getMenu();
    },

    computed: {
      name() {
        return this.$route.name
      },
      list() {
        return this.$route.matched
      }
    },

    methods: {
      getMenu() {
        let self = this;
        axios.get('/access/menu').then(function (res) {
          //process responds
          let _nav = [];
          let menus = res.data;
          for (let i = 0; i < menus.length; i++) {
            _nav.push(
              {
                name: menus[i].name,
                url: menus[i].url,
                icon: menus[i].icon,
              }
            )
          }
          self.nav = _nav;
        })
      }
    }
  }
</script>
