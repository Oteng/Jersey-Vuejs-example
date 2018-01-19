<template>
  <div>
    <button v-on:click="banUser()" class="btn btn-danger">{{ban}}</button>
    <button v-on:click="showPassForm = !showPassForm" class="btn btn-danger">Reset Password</button>
    <div class="col-md-8 row">
      <div class="col-md-3 align-right">
        <label class="label line-height-2 col" for="username">username *</label>
        <label class="label line-height-2 col" for="name">Full Name *</label>
        <label class="label line-height-2 col" for="role">Role *</label>
      </div>
      <div class="col-md-9">
        <input class="form-control" id="username" v-model="username" placeholder="username"/>
        <input class="form-control" id="name" v-model="name" placeholder="Full Name"/>
        <input class="form-control" id="role" v-model="role" placeholder="Role"/>
      </div>
    </div>

    <div v-show="showPassForm">
      <hr/>

      <div id="reset" class="col-md-8 row">
        <div class="col-md-3 align-right">
          <label class="label line-height-2 col" for="password">Password *</label>
        </div>
        <div class="col-md-9">
          <input type="password" class="form-control" id="password" v-model="password" placeholder="password"/>
          <button v-on:click="resetPassword()" class="btn btn-danger pull-right">Update Password</button>
        </div>

      </div>
    </div>
  </div>
</template>

<script>


  let subNav = [
    {name: '<- Back', url: "#/users/", id: '1'}
  ];


  export default {
    name: 'UsersDetails',

    data() {
      return {
        username: "",
        name: "",
        role: "",
        ban: "",
        userId: "",
        banRaw: false,
        password: "",
        showPassForm: false
      }
    },

    created() {
      this.userId = this.$route.params.id;
      axios.get('/users/' + this.userId).then(function (res) {
        //process responds
        this.username = res.data.username;
        this.name = res.data.name;
        this.role = (res.data.role === 'a') ? "Admin" : "Doctor";
        this.ban = (res.data.ban) ? "Unbanned User" : "Ban User";
        this.banRaw = res.data.ban;
        console.log(this.banRaw)
      }.bind(this));
    },
    mounted() {
      this.$root.$emit('modules:subNav', subNav);
    },

    methods: {
      banUser() {
        axios.patch('/users/ban/' + this.userId, {ban: !this.banRaw}).then(function (res) {
          this.banRaw = !this.banRaw;
          this.ban = (this.banRaw) ? "Unbanned User" : "Ban User";
          this.$root.$emit('error:custom', {err: 'info', mgs: "Users has been banned"});
        }.bind(this))
      },

      resetPassword() {
        if(this.password.length < 2){
          return this.$root.$emit('error:custom', {err: 'err', mgs: "Password can't be empty"});
        }
        axios.patch('/users/reset/' + this.userId, {password: this.password}).then(function (res) {
          this.showPassForm = false;
          return this.$root.$emit('error:custom', {err: 'info', mgs: "Password has been reset"});
        }.bind(this))
      }
    }

  }
</script>

