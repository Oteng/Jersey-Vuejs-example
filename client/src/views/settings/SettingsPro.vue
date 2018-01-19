<template>
  <div>

    <div>
      <div class="row">
        <h3>Procedure</h3>
        <button v-on:click="save()" v-show="pro_count != pros.length" style="margin-left: 10%;"
                class="pull-right btn btn-info">Save
        </button>
      </div>
      <hr/>

      <div class="row">
        <div class="col-md-4">
          <h4>Systems Procedure</h4>
          <table class="table table-striped">
            <thead>
            <tr>
              <th>Name</th>
              <th>Action</th>
            </tr>
            </thead>

            <tbody>
            <tr v-for="syspro in sysPros" :key="syspro.id">
              <td>{{syspro.name}}</td>
              <td>
                <button v-on:click="add(sysPros.indexOf(syspro))"><i class="fa fa-arrow-right" aria-hidden="true"></i>
                </button>
              </td>
            </tr>
            </tbody>
          </table>
        </div>

        <div class="col-md-4">
          <h4>Hospitals Procedure</h4>
          <table class="table table-striped">
            <thead>
            <tr>
              <th>Name</th>
              <th>Action</th>
            </tr>
            </thead>

            <tbody>
            <tr v-for="pro in pros" :key="pro.id">
              <td>{{pro.name}}</td>
              <td><input type="text" :value="(pro.cost)? pro.cost:''" :id="pro.id" placeholder="Cost (GHC)"></td>
              <td>
                <button v-on:click="remove(pros.indexOf(pro))"><i class="fa fa-trash" aria-hidden="true"></i></button>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

  </div>
</template>

<script>

  let subNav = [
    {name: 'Labs', url: "#/settings/", id: '1'},
    {name: 'Procedures', url: "#/settings/pro", id: '2'},
    {name: 'Xrays', url: "#/settings/xray", id: '3'}
  ];

  export default {
    name: 'settings',

    data() {
      return {
        sysPros: [],
        pros: [],
        pro_count: 0
      }
    },


    mounted() {
      this.$root.$emit('modules:subNav', subNav);
    },

    created() {
      this.$Progress.start();
      this.$Progress.set(30);

      axios.get('/settings/pro').then(function (res) {
        console.log(res);
        this.$Progress.finish();
        this.sysPros = res.data;
      }.bind(this));

      this.$Progress.start();
      this.$Progress.set(30);
      axios.get('/settings/service/pro').then(function (res) {
        console.log(res);
        this.$Progress.finish();
        this.pros = res.data;
        this.pro_count = res.data.length;

      }.bind(this));
    },

    methods: {
      add(index) {
        this.pros.push(this.sysPros.splice(index, 1)[0]);
        console.log(this.pros)
      },

      remove(index) {
        this.sysPros.push(this.pros.splice(index, 1)[0]);
      },

      save() {
        let pros = [];
        let err = false;
        this.pros.forEach(function (pro) {
          let tmp = {};
          tmp.lookup = pro.id;
          let cost = document.getElementById(pro.id).value;
          if (isNaN(parseFloat(cost)))
            return this.$root.$emit('error:custom', {err: 'err', mgs: "All labs should have a cost"});
          tmp.cost = parseFloat(cost);
          pros.push(tmp)
        }.bind(this));

        if(err)
          return;

        this.$Progress.start();
        this.$Progress.set(30);
        axios.post('/settings/pro', {data:pros}).then(function (res) {
          console.log(res);
          this.$Progress.finish();

          location.href = "#/settings/pro";

        }.bind(this));

      }
    }
  }
</script>

