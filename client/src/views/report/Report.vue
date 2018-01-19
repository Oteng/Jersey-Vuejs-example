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
        <tr v-for="d in data" class="clickable" @click="showUserDetails(d.id, d.service)">
          <td>{{d.name}}</td>
          <td>{{(d.service ==='lab')? "Lab":(d.service ==='xray')? "Xray":(d.service ==='pro')? "Procedure":""}}</td>
          <td>{{d.date}}</td>
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

  import moment from 'moment'

  export default {
    name: 'userAll',
    data() {
      return {
        columns: [
          {displayName: 'Patient Name', field: 'name', sort: true},
          {displayName: 'Service', field: 'service', sort: true},
          {displayName: 'Date', field: 'date', sort: true}
        ],
        query: {
          sort: 'asc'
        },

        data: []
      }

    },

    created() {
      const self = this;
      this.$Progress.start();
      this.$Progress.set(30);
      axios.get('/service/').then(function (res) {
        console.log(res);
        self.$Progress.finish();
        let data = [];
        res.data.map((item) => {
          data.push(
            {
              name: item.name,
              service: item.type ,
              date: moment(item.date_req).format("YYYY-MM-DD HH:mm"),
              id: item.serial_num
            }
          )
        });
        this.data = data;
      }.bind(this));
    },

    methods: {
      queryMethod(_field) {
        let field = (_field === 'Patient Name') ? 'name' : 'service';
        if (this.query.sort === 'asc') {
          this.query.sort = 'desc';
          this.data.sort((a, b) => a[field].localeCompare(b[field]))
        }
        else {
          this.query.sort = 'asc';
          this.data.sort((a, b) => b[field].localeCompare(a[field]))
        }

      },

      showUserDetails(id, type) {
//        console.log(id);
        location.href = '#/report/details/'+id + "/" + type;
      }
    }

  }
</script>

