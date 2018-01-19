<template>
  <div>
    <div class="row">
      <label for="type">Service:</label>
      <div class="col-sm-4">
        <select class="form-control" id="type" v-model="type">
          <option value="lab">Lab</option>
          <option value="xray">Xray</option>
          <option value="pro">Procedure</option>
        </select>
      </div>
      <label class="label">Requested Date: &nbsp</label>
      <input class="form-control col-md-3" readonly :value="req_date"/>
    </div>

    <hr/>
    <div class="col-sm-4">
      <label>Patient
        <select class="form-control" id="patient">
          <option v-for="pat in patients" :value="pat.id">{{"name: " + pat.name + " age: " + (pat.age).split(" ")[0]}}</option>
        </select>
      </label>
    </div>

    <!--lab-->
    <div  v-show="type == 'lab'">
      <table class="table table-striped">
        <thead>
        <tr>
          <th>Test</th>
          <th>
            Remarks
          </th>
          <th>
          <span style="cursor: pointer" v-on:click="add()"><i class="fa fa-plus-square-o font-2xl"
                                                              aria-hidden="true"></i> </span>
          </th>
        </tr>
        </thead>
        <tbody id="test_form">
        <component v-for="_tr in trs" v-bind:is="_tr[Object.keys(_tr)]" :labs="labs"
                   :index="Object.keys(_tr)"></component>
        </tbody>
      </table>
      <button class="btn btn-danger pull-right" @click="request()">Request</button>
    </div>

    <!--procedure-->
    <div   v-show="type == 'pro'">
      <table class="table table-striped">
        <thead>
        <tr>
          <th>Test</th>
          <th>
            Remarks
          </th>
          <th>
          <span style="cursor: pointer" v-on:click="addPro()"><i class="fa fa-plus-square-o font-2xl"
                                                                 aria-hidden="true"></i> </span>
          </th>
        </tr>
        </thead>
        <tbody>
        <component v-for="_pro in trs_pro" v-bind:is="_pro[Object.keys(_pro)]" :pros="pros" :index="Object.keys(_pro)"></component>
        </tbody>
      </table>
      <button class="btn btn-danger pull-right" @click="requestPro()">Request</button>
    </div>


    <!--xray-->
    <div v-show="type == 'xray'">
      <table class="table table-striped" >
        <thead>
        <tr>
          <th>Test</th>
          <th>
            Remarks
          </th>
          <th>
          <span style="cursor: pointer" v-on:click="addXray()"><i class="fa fa-plus-square-o font-2xl"
                                                                  aria-hidden="true"></i> </span>
          </th>
        </tr>
        </thead>
        <tbody id="">
        <component v-for="_xray in trs_xray" v-bind:is="_xray[Object.keys(_xray)]" :xrays="xrays"
                   :index="Object.keys(_xray)"></component>
        </tbody>
      </table>
      <button class="btn btn-danger pull-right" @click="requestXray()">Request</button>
    </div>


  </div>
</template>

<script>

  import moment from 'moment'

  export default {
    name: 'Service',

    data() {
      return {
        labs: [],
        xrays: [],
        pros: [],
        req_date: (new Date()).toLocaleDateString() + ", " + (new Date()).toLocaleTimeString(),
        patients: [],
        trs: [{0: 'labsTr'}],
        trs_pro: [{0: 'proTr'}],
        trs_xray: [{0: 'xrayTr'}],
        type: ""
      }
    },

    created() {

      this.$Progress.start();
      this.$Progress.set(30);

      axios.get('/settings/service/lab').then(function (res) {
//        console.log(res);
        this.$Progress.finish();
        this.labs = res.data;
      }.bind(this));
      axios.get('/settings/service/xray').then(function (res) {
//        console.log(res);
        this.$Progress.finish();
        this.xrays = res.data;
      }.bind(this));
      axios.get('/settings/service/pro').then(function (res) {
//        console.log(res);
        this.$Progress.finish();
        this.pros = res.data;
      }.bind(this));
      axios.get('/settings/patient').then(function (res) {
//        console.log(res);
        this.$Progress.finish();
        this.patients = res.data;
      }.bind(this));
    },

    methods: {
      remove(index) {
        this.trs.splice(index, 1);
      },
      request() {
        let trs = document.getElementsByClassName("trs");
        let request = [];
        if (trs.length < 1) {
          return this.$root.$emit('error:custom', {err: 'err', mgs: "You should request at lest one lab"});
        } else {
          for (let i = 0; i < trs.length; i++) {
            let tmp = {};
            tmp.lab = trs[i].children[0].children[0].value;
            tmp.msg = trs[i].children[1].children[0].value;
            request.push(tmp)
          }
        }
        console.log(request);
        let data = {};
        data.request = request;
        data.patient = document.getElementById("patient").value;
        data.req_date = moment(this.req_date).format('x');
        console.log(data);

        axios.post('/service/lab', data).then(function (res) {
          this.$Progress.finish();
          location.reload();
        }.bind(this));

      },
      requestPro() {
        let trs = document.getElementsByClassName("protrs");
        let request = [];
        if (trs.length < 1) {
          return this.$root.$emit('error:custom', {err: 'err', mgs: "You should request at lest one lab"});
        } else {
          for (let i = 0; i < trs.length; i++) {
            let tmp = {};
            tmp.lab = trs[i].children[0].children[0].value;
            tmp.msg = trs[i].children[1].children[0].value;
            request.push(tmp)
          }
        }

        let data = {};
        data.request = request;
        data.patient = document.getElementById("patient").value;
        data.req_date = moment(this.req_date).format('x');
        console.log(data);

        axios.post('/service/pro', data).then(function (res) {
//        console.log(res);
          this.$Progress.finish();
          location.reload();
        }.bind(this));

      },
      requestXray() {
        let trs = document.getElementsByClassName("xraytrs");
        let request = [];
        if (trs.length < 1) {
          return this.$root.$emit('error:custom', {err: 'err', mgs: "You should request at lest one lab"});
        } else {
          for (let i = 0; i < trs.length; i++) {
            let tmp = {};
            tmp.lab = trs[i].children[0].children[0].value;
            tmp.msg = trs[i].children[1].children[0].value;
            request.push(tmp)
          }
        }

        let data = {};
        data.request = request;
        data.patient = document.getElementById("patient").value;
        data.req_date = moment(this.req_date).format('x');
        console.log(data);

        axios.post('/service/xray', data).then(function (res) {
//        console.log(res);
          this.$Progress.finish();
          location.reload();
        }.bind(this));

      },

      addPro(){
        let tmp = {};
        tmp[(this.trs_pro.length)] = 'proTr';
        this.trs_pro.push(tmp);
      },
      addXray(){
        let tmp = {};
        tmp[(this.trs_xray.length)] = 'xrayTr';
        this.trs_xray.push(tmp);
      },add() {
        let tmp = {};
        tmp[(this.trs.length)] = 'labsTr';
        this.trs.push(tmp);
      }
    }

  }
</script>

