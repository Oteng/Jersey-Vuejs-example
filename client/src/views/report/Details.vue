<template>
  <div>

    <div class="row">
      <label>Service:</label>
      <div class="col-sm-2">{{(type == 'lab')? "Labs": (type == 'pro')? "Procedures": (type == 'xray')? "Xray":""}}</div>
      <label class="label">Requested Date: &nbsp</label>
      <h3 class="form-control col-md-3">{{req_date}}</h3>

      <label class="label">Serial Number: &nbsp</label>
      <h3 class="form-control col-md-3"> {{serial_num}} </h3>

    </div>
    <hr/>
    <div class="col-sm-4">
      <label>Patient
        <h3>{{name}}</h3>
      </label>
    </div>


    <!--lab-->
    <div>
      <table class="table table-striped">
        <thead>
        <tr>
          <th>Test</th>
          <th>Remarks</th>
          <th>Cost (GH₵)</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="test in tests">
          <td>{{test.name}}</td>
          <td>{{test.remarks}}</td>
          <td>{{test.cost}}</td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td><b>Total: GH₵</b> {{total}}</td>
        </tr>
        </tbody>
      </table>

    </div>

    <a  href="#/report" class="btn btn-info pull-right" style="margin:10px">Ok</a>

  </div>
</template>

<script>

  import moment from 'moment'

  let subNav = [
    {name: '<- Back', url: "#/report/", id: '1'}
  ];


  export default {
    name: 'UsersDetails',

    data() {
      return {
        serial_num: '',
        type: '',
        req_date: '',
        name: '',
        tests: [],
        total: 0.0
      }
    },

    created() {
      this.serial_num = this.$route.params.id;
      console.log(this.$route);

      axios.patch('/service/details/' + this.serial_num, {type: this.$route.params.type}).then(function (res) {
        //process responds
        console.log(res);
        let data = res.data;
        this.type = data[0].type;
        this.name = data[0].name;
        this.req_date = moment(data[0].date_req).format("YYYY-MM-DD HH:mm");


        data.forEach(function (item) {
          let tmp = {};
          tmp.cost = item.cost;
          this.total += item.cost;
          tmp.remarks = item.remarks;
          tmp.name = item.test;
          this.tests.push(tmp)
        }.bind(this));


      }.bind(this));
    },
    mounted() {
      this.$root.$emit('modules:subNav', subNav);
    },

    methods: {
    }

  }
</script>

