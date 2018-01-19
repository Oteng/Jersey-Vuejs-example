<style>
  .alert{
    right: 0;
    margin-top: 10px;
  }
  .alert-danger {
    color: #fbe3e3 !important;
    background-color: #ff0900 !important;
    border-color: #f00 !important;
  }
  .close{
    margin-left: 15px;
  }
</style>
<template>
  <div>
    <div v-show="notice" class="alert" :class="{'alert-danger': notice === 'err', 'alert-success': notice === 'suc', 'alert-info': notice === 'info'}" role="alert" style="position: absolute; z-index: 20000;">
      <button type="button" class="close" @click="closeNotice()"><span
        aria-hidden="true">&times;</span></button>
      <span> {{notice_data}} </span>
    </div>
    <router-view></router-view>
    <vue-progress-bar></vue-progress-bar>
  </div>
</template>

<script>
  export default {
    name: 'app',

    data() {
      return {
        notice: '',
        notice_data: ''
      }
    },

    created () {
      this.$root.$on('error:custom', function (err) {
        this.notice = err.err;
        this.notice_data = err.mgs
      }.bind(this))
    },

    methods: {
      closeNotice (){
        this.notice = '';
        this.notice_data = '';
      }
    }

  }
</script>

<style>
  /* Import Font Awesome Icons Set */
  $fa-font-path: '~font-awesome/fonts/';
  @import '~font-awesome/css/font-awesome.min.css';
  /* Import Simple Line Icons Set */
  $simple-line-font-path: '~simple-line-icons/fonts/';
  @import '~simple-line-icons/css/simple-line-icons.css';
  /* Import Bootstrap Vue Styles */
  @import '~bootstrap-vue/dist/bootstrap-vue.css';
</style>
<style lang="scss">
  // Import Main styles for this application
  @import './scss/style';
</style>
