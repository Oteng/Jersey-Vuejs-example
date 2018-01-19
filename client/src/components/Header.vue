<style>
  .app-header.navbar .navbar-brand{
    background-image: none;
  }
</style>
<template>
  <header class="app-header navbar">
    <button class="navbar-toggler mobile-sidebar-toggler d-lg-none" type="button" @click="mobileSidebarToggle">&#9776;
    </button>
    <b-link class="navbar-brand" to="#">Service</b-link>
    <button class="navbar-toggler sidebar-toggler d-md-down-none mr-auto" type="button" @click="sidebarToggle">&#9776;
    </button>


    <b-nav is-nav-bar class="d-md-down-none">
      <b-nav-item v-for="subNav in subNavs" :key="subNav.id" :href="subNav.url" class="px-3 color-orange-nav">
        {{subNav.name}}
      </b-nav-item>

      <b-nav-item @click.prevent="doLogout()" class="px-3 color-orange-nav">
        <i class="fa fa-lock"></i> Logout
      </b-nav-item>
    </b-nav>

    <!--<b-nav is-nav-bar>-->
    <!--<b-nav-item-dropdown right>-->
    <!--<b-dropdown-item @click.prevent="doLogout()"><i class="fa fa-lock"></i> Logout</b-dropdown-item>-->
    <!--</b-nav-item-dropdown>-->

    <!--</b-nav>-->


    <!--<button class="navbar-toggler aside-menu-toggler d-md-down-none" type="button" @click="asideToggle">&#9776;</button>-->
  </header>
</template>
<script>
  export default {
    name: 'header',
    data() {
      return {
        subNavs: []
      }
    },

    created() {
      this.$root.$on('modules:subNav', function (nav) {
        this.subNavs = nav;
        console.log(nav)
      }.bind(this));
    },

    methods: {
      sidebarToggle(e) {
        e.preventDefault()
        document.body.classList.toggle('sidebar-hidden')
      },
      sidebarMinimize(e) {
        e.preventDefault()
        document.body.classList.toggle('sidebar-minimized')
      },
      mobileSidebarToggle(e) {
        e.preventDefault()
        document.body.classList.toggle('sidebar-mobile-show')
      },
      asideToggle(e) {
        e.preventDefault()
        document.body.classList.toggle('aside-menu-hidden')
      },
      doLogout() {
        //TODO: change the way redirect works
        axios.get('/access/logout').then(function (res) {
          location.href = "/"
        })
      },
    }
  }
</script>
