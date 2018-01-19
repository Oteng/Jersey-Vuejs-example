<template>
  <div>

    <div>
      <div class="row">
        <h3>Labs</h3>
        <button v-on:click="save()" v-show="lab_count != labs.length" style="margin-left: 10%;"
                class="pull-right btn btn-info">Save
        </button>
      </div>
      <hr/>

      <div class="row">
        <div class="col-md-4">
          <h4>Systems Labs</h4>
          <table class="table table-striped">
            <thead>
            <tr>
              <th>Name</th>
              <th>Action</th>
            </tr>
            </thead>

            <tbody>
            <tr v-for="syslab in sysLabs" :key="syslab.id">
              <td>{{syslab.name}}</td>
              <td>
                <button v-on:click="add(sysLabs.indexOf(syslab))"><i class="fa fa-arrow-right" aria-hidden="true"></i>
                </button>
              </td>
            </tr>
            </tbody>
          </table>
        </div>

        <div class="col-md-4">
          <h4>Hospitals Labs</h4>
          <table class="table table-striped">
            <thead>
            <tr>
              <th>Name</th>
              <th>Action</th>
            </tr>
            </thead>

            <tbody>
            <tr v-for="lab in labs" :key="lab.id">
              <td>{{lab.name}}</td>
              <td><input type="text" :value="(lab.cost)? lab.cost:''" :id="lab.id" placeholder="Cost (GHC)"></td>
              <td>
                <button v-on:click="remove(labs.indexOf(lab))"><i class="fa fa-trash" aria-hidden="true"></i></button>
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
        sysLabs: [],
        labs: [],
        lab_count: 0
      }
    },


    mounted() {
      this.$root.$emit('modules:subNav', subNav);
    },

    created() {
      this.$Progress.start();
      this.$Progress.set(30);

      axios.get('/settings/lab').then(function (res) {
        console.log(res);
        this.$Progress.finish();
        this.sysLabs = res.data;
      }.bind(this));

      this.$Progress.start();
      this.$Progress.set(30);

      axios.get('/settings/service/lab').then(function (res) {
        console.log(res);
        this.$Progress.finish();
        this.labs = res.data;
        this.lab_count = res.data.length;

      }.bind(this));
    },

    methods: {
      add(index) {
        this.labs.push(this.sysLabs.splice(index, 1)[0]);
        console.log(this.labs)
      },

      remove(index) {
        this.sysLabs.push(this.labs.splice(index, 1)[0]);
      },

      save() {
        let labs = [];
        let err = false;
        this.labs.forEach(function (lab) {
          let tmp = {};
          tmp.lookup = lab.id;
          let cost = document.getElementById(lab.id).value;
          if (isNaN(parseFloat(cost)))
            return this.$root.$emit('error:custom', {err: 'err', mgs: "All labs should have a cost"});
          tmp.cost = parseFloat(cost);
          labs.push(tmp)
        }.bind(this));

        if(err)
          return;

        this.$Progress.start();
        this.$Progress.set(30);
        axios.post('/settings/lab', {data:labs}).then(function (res) {
          console.log(res);
          this.$Progress.finish();

          location.href = "#/settings";

        }.bind(this));

      }
    }
  }
</script>

