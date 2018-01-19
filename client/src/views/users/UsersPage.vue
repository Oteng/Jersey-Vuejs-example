<template>
  <div>

    <div class="table-head">
      <table class="table " style="margin-bottom: 0px;">
        <thead>
        <tr>
          <td v-for="col in columns">
            <button @click="queryMethod(col.displayName)" v-show="col.sort" class="btn sort color-orange"><i
              class="fa pull-right"
              v-bind:class="{'fa-sort-amount-asc': query.sort == 'asc', 'fa-sort-amount-desc': query.sort == 'desc' }"
              aria-hidden="true"></i></button>
            {{col.displayName}}
          </td>
        </tr>
        </thead>
      </table>
    </div>

    <div class="table-body">
      <table class="table table-striped">
        <thead>
        <tr>
          <td v-for="col in columns">
            <button @click="queryMethod(col.displayName)" v-show="col.sort" class="btn sort color-orange"></button>

          </td>
        </tr>
        </thead>
        <tbody>
        <tr v-for="d in data" class="clickable" @click="showUserDetails(d.id)">
          <td><img style="width: 50px;" :src="(d.pic)? d.pic:'static/img/avatars/avatar_default.png'"/></td>
          <td>{{d.name}}</td>
          <td>{{d.role}}</td>
        </tr>
        </tbody>
      </table>
    </div>

    <div class="table-footer">
      <table class="table" style="margin-bottom: 0px;">
        <thead>
        <tr>
          <td v-for="col in columns">
            <button @click="queryMethod(col.displayName)" v-show="col.sort" class="btn sort color-orange"><i
              class="fa pull-right"
              v-bind:class="{'fa-sort-amount-asc': query.sort == 'asc', 'fa-sort-amount-desc': query.sort == 'desc' }"
              aria-hidden="true"></i></button>
            {{col.displayName}}
          </td>
        </tr>
        </thead>
      </table>
    </div>

  </div>
</template>

<script>


  let subNav = [
    {name: '+ Add', url: "#/users/add", id:'1'}
  ];

  export default {
    name: 'userAll',
    data() {
      return {
        columns: [
          {displayName: 'Full Name', field: 'name', sort: true},
          {displayName: 'Role', field: 'role', sort: true}
        ],
        query: {
          sort: 'asc'
        },

        data: []
      }

    },

    mounted() {
      this.$root.$emit('modules:subNav', subNav);
    },

    created() {
      const self = this;
      this.$Progress.start();
      this.$Progress.set(30);
      axios.get('/users').then(function (res) {
        console.log(res);
        self.$Progress.finish();
        let data = [];
        res.data.map((item) => {
          data.push(
            {
              name: item.name,
              role: (item.role === 'a')? "Admin":"Doctor",
              id: item.id
            }
          )
        });
        self.data = data;
      });
    },

    methods: {
      queryMethod(_field) {
        let field = (_field === 'Full Name') ? 'name' : 'role';
        if (this.query.sort === 'asc') {
          this.query.sort = 'desc';
          this.data.sort((a, b) => a[field].localeCompare(b[field]))
        }
        else {
          this.query.sort = 'asc';
          this.data.sort((a, b) => b[field].localeCompare(a[field]))
        }

      },

      showUserDetails(id) {
//        console.log(id);
        location.href = '#/users/details/'+id;
      }
    }

  }
</script>

