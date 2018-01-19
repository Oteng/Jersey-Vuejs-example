<template>
  <div>

    <div>
      <div class="row">
        <h3>Xrays</h3>
        <button v-on:click="save()" v-show="xray_count != xrays.length" style="margin-left: 10%;"
                class="pull-right btn btn-info">Save
        </button>
      </div>
      <hr/>

      <div class="row">
        <div class="col-md-4">
          <h4>Systems Xray</h4>
          <table class="table table-striped">
            <thead>
            <tr>
              <th>Name</th>
              <th>Action</th>
            </tr>
            </thead>

            <tbody>
            <tr v-for="sysxray in sysXrays" :key="sysxray.id">
              <td>{{sysxray.name}}</td>
              <td>
                <button v-on:click="add(sysXrays.indexOf(sysxray))"><i class="fa fa-arrow-right" aria-hidden="true"></i>
                </button>
              </td>
            </tr>
            </tbody>
          </table>
        </div>

        <div class="col-md-4">
          <h4>Hospitals Xray</h4>
          <table class="table table-striped">
            <thead>
            <tr>
              <th>Name</th>
              <th>Action</th>
            </tr>
            </thead>

            <tbody>
            <tr v-for="xray in xrays" :key="xray.id">
              <td>{{xray.name}}</td>
              <td><input type="text" :value="(xray.cost)? xray.cost:''" :id="xray.id" placeholder="Cost (GHC)"></td>
              <td>
                <button v-on:click="remove(labs.indexOf(xray))"><i class="fa fa-trash" aria-hidden="true"></i></button>
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
        sysXrays: [],
        xrays: [],
        server_xrays: [],
        xray_count: 0
      }
    },


    mounted() {
      this.$root.$emit('modules:subNav', subNav);
    },

    created() {
      this.$Progress.start();
      this.$Progress.set(30);

      axios.get('/settings/xray').then(function (res) {
        console.log(res);
        this.$Progress.finish();
        this.sysXrays = res.data;
      }.bind(this));

      this.$Progress.start();
      this.$Progress.set(30);
      axios.get('/settings/service/xray').then(function (res) {
        console.log(res);
        this.$Progress.finish();
        this.xrays = res.data;
        this.xray_count = res.data.length;

      }.bind(this));
    },

    methods: {
      add(index) {
        this.xrays.push(this.sysXrays.splice(index, 1)[0]);
        console.log(this.xrays)
      },

      remove(index) {
        this.sysXrays.push(this.xrays.splice(index, 1)[0]);
      },

      save() {
        let xrays = [];
        let err = false;
        this.xrays.forEach(function (xray) {
          let tmp = {};
          tmp.lookup = xray.id;
          let cost = document.getElementById(xray.id).value;
          if (isNaN(parseFloat(cost))) {
            err = true;
            return this.$root.$emit('error:custom', {err: 'err', mgs: "All labs should have a cost"});
          }
          tmp.cost = parseFloat(cost);
          xrays.push(tmp)
        }.bind(this));

        if(err)
          return;
        this.$Progress.start();
        this.$Progress.set(30);
        axios.post('/settings/xray', {data:xrays}).then(function (res) {
//          console.log(res);
          this.$Progress.finish();

          location.href = "#/settings/xray";

        }.bind(this));

      }
    }
  }
</script>

