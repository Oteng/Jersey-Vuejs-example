// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import App from './App'
import router from './router'
import axios from 'axios'
import VueProgressBar from 'vue-progressbar'

let _axios = axios.create({
  baseURL: 'http://178.79.154.213:8080/tomcat_war/',
  timeout: 5000,
  withCredentials: true,
  headers: {
    'Accept': 'application/json',
    'Content-type': 'application/json'
  }
});

const progressbar_opt = {
  color: '#f38d09',
  failedColor: '#ff2a36',
  thickness: '3px',
  transition: {
    speed: '0.2s',
    opacity: '0.6s',
    termination: 300
  },
  autoRevert: true,
  // inverse: false
};

//intercept and handle some things
_axios.interceptors.response.use(function (response) {
  //leave it to the controller to handle it
  return response;
}, function (error) {
  //errors have a common way of been handled for all so do it here

  if (error.response) {
    let data = error.response;
    if (data.status === 307) {
      location.href = data.data.location;
    } else if (data.status === 401) {
      location.href = '/';
    } else if (data.status === 501) {
      VueProgressBarEventBus.$Progress.fail();
      vm.$root.$emit('error:custom', {err: 'err', mgs: data.data.msg});
    }
    else {
      // console.log(error.response)
      VueProgressBarEventBus.$Progress.fail();
      vm.$root.$emit('error:custom', {
        err: 'err',
        mgs: 'Refresh the page and try again, if problem persist contact the developers'
      });
    }
  } else {
    VueProgressBarEventBus.$Progress.fail();
    vm.$root.$emit('error:custom', {
      err: 'err',
      mgs: 'A serious error occurred but no need to panic our supermen are currently working on it'
    });
  }
});

window.axios = _axios;

Vue.use(BootstrapVue);
Vue.use(VueProgressBar, progressbar_opt);

Vue.component(
  "labsTr", {
    template: ' <tr class="trs">' +
    '          <td>' +
    '            <select class="form-control" >' +
    '              <option :value="lab.id" v-for="lab in labs">{{lab.name}}</option>' +
    '            </select>' +
    '          </td>' +
    '          <td>' +
    '            <textarea class="form-control"></textarea>' +
    '          </td>' +
    '          <td>' +
    '            <span style="cursor: pointer"  v-on:click="remove()"><i class="fa fa-trash font-2xl" aria-hidden="true"></i> </span>' +
    '          </td>' +
    '        </tr>',

    props: ['labs', 'index'],

    methods: {
      remove(){
        this.$parent.remove(this.index);
      }

    }
  });
Vue.component(
  "proTr", {
    template: ' <tr class="protrs">' +
    '          <td>' +
    '            <select class="form-control" >' +
    '              <option :value="pro.id" v-for="pro in pros">{{pro.name}}</option>' +
    '            </select>' +
    '          </td>' +
    '          <td>' +
    '            <textarea class="form-control"></textarea>' +
    '          </td>' +
    '          <td>' +
    '            <span style="cursor: pointer"  v-on:click="remove()"><i class="fa fa-trash font-2xl" aria-hidden="true"></i> </span>' +
    '          </td>' +
    '        </tr>',

    props: ['pros', 'index'],

    methods: {
      remove(){
        this.$parent.remove(this.index);
      }

    }
  });
Vue.component(
  "xrayTr", {
    template: ' <tr class="xraytrs">' +
    '          <td>' +
    '            <select class="form-control" >' +
    '              <option :value="xray.id" v-for="xray in xrays">{{xray.name}}</option>' +
    '            </select>' +
    '          </td>' +
    '          <td>' +
    '            <textarea class="form-control"></textarea>' +
    '          </td>' +
    '          <td>' +
    '            <span style="cursor: pointer"  v-on:click="remove()"><i class="fa fa-trash font-2xl" aria-hidden="true"></i> </span>' +
    '          </td>' +
    '        </tr>',

    props: ['xrays', 'index'],

    methods: {
      remove(){
        this.$parent.remove(this.index);
      }

    }
  });


/* eslint-disable no-new */
const vm = new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: {
    App
  }
});
