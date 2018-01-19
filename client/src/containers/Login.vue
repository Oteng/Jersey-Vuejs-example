<template>
  <div class="app flex-row align-items-center">
    <div class="container">
      <div class="row justify-content-center">

        <div v-show="flash" class="row">
          <div class="text-white bg-danger card">
            <div class="card-body">
              <div class="h4 m-0">Error</div>
              <p>{{flash}}</p>
            </div>
          </div>
        </div>

        <div class="col-md-6">
          <div class="card-group mb-0">
            <div class="card p-4">
              <div class="card-body">
                <h1>Login</h1>
                <p class="text-muted">Sign In to your account</p>
                <div class="input-group mb-3">
                  <span class="input-group-addon"><i class="icon-user"></i></span>
                  <input type="text" class="form-control" placeholder="Username or Admission number"
                         v-model.lazy.trim="username">
                </div>
                <div class="input-group mb-4">
                  <span class="input-group-addon"><i class="icon-lock"></i></span>
                  <input type="password" class="form-control" placeholder="Password" v-model.lazy="password">
                </div>
                <div class="row">
                  <div class="col-6">
                    <button type="button" class="btn btn-primary px-4" @click="doLogin">Login</button>
                  </div>
                  <div class="col-6 text-right">
                    <button type="button" class="btn btn-link px-0">Forgot password?</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'Login',

    data() {
      return {
        username: '',
        password: '',
//        csrf: '',
        flash: '',
      }
    },
    mounted () {
      //  [App.vue specific] When App.vue is finish loading finish the progress bar
      this.$Progress.finish()
    },

    created() {
      //  [App.vue specific] When App.vue is first loaded start the progress bar
//      this.$Progress.start();

//      this.getCSRF();
    },

    methods: {

//      getCSRF() {
//        this.$Progress.start();
//        this.$Progress.set(10);
//        const self = this;
//        axios.get('/csrfToken').then(function (res) {
//          self.csrf = res.data._csrf;
//          self.$Progress.finish();
//        })
//      },

      doLogin() {
        const self = this;
        this.$Progress.start();
        this.$Progress.set(30);
        axios.post('/access/', {
          username: this.username,
          password: this.password,
//          _csrf: this.csrf
        }).then(function (response,req) {
//          console.log(response, req);
          self.$Progress.finish();
          let data = response.data;
          if (data.job === 'validation') {
            self.flash = data.msg;
          }else{
            location.href = "#/dashboard";
          }

        })
      }

    }
  }
</script>
