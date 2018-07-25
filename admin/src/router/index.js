import Vue from 'vue'
import Router from 'vue-router'

// in development-env not use lazy-loading, because lazy-loading too many pages will cause webpack hot update too slow. so only in production use lazy-loading;
// detail: https://panjiachen.github.io/vue-element-admin-site/#/lazy-loading

Vue.use(Router)

/* Layout */
import Layout from '../views/layout/Layout'

/**
* hidden: true                   if `hidden:true` will not show in the sidebar(default is false)
* alwaysShow: true               if set true, will always show the root menu, whatever its child routes length
*                                if not set alwaysShow, only more than one route under the children
*                                it will becomes nested mode, otherwise not show the root menu
* redirect: noredirect           if `redirect:noredirect` will no redirct in the breadcrumb
* name:'router-name'             the name is used by <keep-alive> (must set!!!)
* meta : {
    title: 'title'               the name show in submenu and breadcrumb (recommend set)
    icon: 'svg-name'             the icon show in the sidebar,
  }
**/
export const constantRouterMap = [
  { path: '/login', component: () => import('@/views/login/index'), hidden: true },
  { path: '/404', component: () => import('@/views/404'), hidden: true },

  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    name: 'Dashboard',
    hidden: true,
    children: [{
      path: 'dashboard',
      component: () => import('@/views/dashboard/index')
    }]
  },

  {
    path: '/database',
    component: Layout,
    redirect: '/database/table',
    name: 'Database',
    meta: { title: '数据库', icon: 'form' },
    children: [
      {
        path: 'table',
        name: 'new-database',
        component: () => import('@/views/table/complexTable'),
        meta: { title: '新建数据库', icon: 'table' }
      },
      {
        path: 'tree',
        name: 'manage-database',
        component: () => import('@/views/tree/index'),
        meta: { title: '管理数据库', icon: 'tree' }
      }
    ]
  },

  {
    path: '/information',
    component: Layout,
    redirect: '/information/table',
    name: 'Information',
    meta: { title: '信息', icon: 'example' },
    children: [
      {
        path: 'tree',
        name: 'manage-information',
        component: () => import('@/views/table/index'),
        meta: { title: '管理信息', icon: 'table' }
      }
    ]
  },

  {
    path: '/user',
    component: Layout,
    redirect: '/user/table',
    name: 'User',
    meta: { title: '用户', icon: 'table' },
    children: [
      {
        path: 'table',
        name: 'Manage-user',
        component: () => import('@/views/table/index'),
        meta: { title: '用户管理', icon: 'table' }
      },
      {
        path: 'tree',
        name: 'Manage-role',
        component: () => import('@/views/tree/index'),
        meta: { title: '角色管理', icon: 'tree' }
      },
      {
        path: 'tree',
        name: 'Manage-institutions',
        component: () => import('@/views/tree/index'),
        meta: { title: '机构管理', icon: 'tree' }
      }
    ]
  },

  {
    path: '/system',
    component: Layout,
    redirect: '/system/table',
    name: 'System',
    meta: { title: '系统', icon: 'example' },
    children: [
      {
        path: 'table',
        name: 'Manage-email',
        component: () => import('@/views/table/index'),
        meta: { title: '邮箱管理', icon: 'table' }
      },
      {
        path: 'tree',
        name: 'Manage-SMS',
        component: () => import('@/views/tree/index'),
        meta: { title: '短信管理', icon: 'tree' }
      }
    ]
  },

  { path: '*', redirect: '/404', hidden: true }
]

export default new Router({
  // mode: 'history', //后端支持可开
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRouterMap
})

