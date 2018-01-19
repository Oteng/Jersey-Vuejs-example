import Vue from 'vue'
import Router from 'vue-router'

// Containers
import Full from '@/containers/Full'
import Login from '@/containers/Login'

// Views
import Dashboard from '@/views/Dashboard'

import UsersPage from '@/views/users/UsersPage'
import UsersDetails from '@/views/users/details'
import UsersAdd from '@/views/users/add'

import SettingsPage from '@/views/settings/SettingsPage'
import Procedure from '@/views/settings/SettingsPro'
import Xrays from '@/views/settings/SettingsXrays'

import Report from '@/views/report/Report'
import Details from '@/views/report/Details'

import Service from '@/views/services/Service'

Vue.use(Router);

export default new Router({
  mode: 'hash',
  linkActiveClass: 'open active',
  scrollBehavior: () => ({y: 0}),
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login,
    },
    {
      path: '/dashboard',
      name: 'Dashboard',
      component: Full,
      children: [
        {
          path: 'dashboard',
          name: 'dashboard',
          component: Dashboard
        }
      ]
    },
    {
      path: '/users',
      name: 'Users',
      component: Full,
      children: [
        {
          path: '/users',
          name: 'users',
          component: UsersPage
        },
        {
          path: '/users/add',
          name: 'Add New User',
          component: UsersAdd
        },
        {
          path: '/users/details/:id',
          name: 'User Details',
          component: UsersDetails
        }
      ]
    },
    {
      path: '/settings',
      name: 'Settings',
      component: Full,
      children: [
        {
          path: '/settings/',
          name: 'Labs',
          component: SettingsPage
        },
        {
          path: '/settings/pro',
          name: 'Procedures',
          component: Procedure
        },
        {
          path: '/settings/xray',
          name: 'Xrays',
          component: Xrays
        }
      ]
    },
    {
      path: '/report',
      name: 'Report',
      component: Full,
      children: [
        {
          path: '/report/',
          name: 'Services',
          component: Report
        },
        {
          path: '/report/details/:id/:type',
          name: 'Report Details',
          component: Details
        }
      ]
    },
    {
      path: '/service',
      name: 'Service',
      component: Full,
      children: [
        {
          path: '/service/',
          name: 'Service',
          component: Service
        }
      ]
    }
  ]
})
