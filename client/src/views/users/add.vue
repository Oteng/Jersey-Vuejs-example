<style>
  .dropdown-menu.show {
    max-height: 200px;
    overflow: auto;
  }

  .dropdown-toggle {
    padding: 2px 5px;
    background-color: #eeeeee;
  }

  /*input[type="file"] {*/
  /*display: none;*/
  /*}*/

  .custom-file-upload {
    /*border: 1px solid #ccc;*/
    display: inline-block;
    padding: 6px 12px;
    cursor: pointer;
  }
</style>
<template>

  <div>
    <div class="col-md-8 row">
      <div class="col-md-3 align-right">
        <label class="label line-height-2 col" for="username">username *</label>
        <label class="label line-height-2 col" for="name">Full Name *</label>
        <label class="label line-height-2 col" for="role">Role *</label>
        <label class="label line-height-2 col" for="password">Password *</label>
      </div>
      <div class="col-md-9">
        <input class="form-control" id="username" v-model="username" placeholder="username"/>
        <input class="form-control" id="name" v-model="name" placeholder="Full Name"/>
        <select id="role" class="form-control" v-model="role">
          <option value="a">Admin</option>
          <option value="d">Doctor</option>
        </select>
        <input type="password" class="form-control" id="password" v-model="password" placeholder="Password"/>

        <button v-on:click="saveNewUser()" class="btn btn-info pull-right">Create New User</button>
      </div>
    </div>
  </div>
</template>

<script>


  let subNav = [
    {name: '<- Back', url: "#/users/", id: '1'}
  ];

  import DatePicker from 'vue2-datepicker'
  import VueCropper from 'vue-cropperjs';


  export default {
    name: 'UsersAdd',
    components: {DatePicker},

    data() {
      return {
        username: "",
        name: "",
        role: "",
        ban: "",
        password: "",
      }
    },

    mounted() {
      this.$root.$emit('modules:subNav', subNav);
    },

    methods: {
      saveNewUser() {
        axios.post('/users/', {
          username: this.username,
          name: this.name,
          role: this.role,
          password: this.password
        }).then(function (res) {
          return location.href = '#/users'
        }.bind(this))
      }
    }

  }
</script>

