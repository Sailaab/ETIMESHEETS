'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'products-list',
    url: '/products'
    templateUrl: 'client/products/products-list.view.html'
    controller: 'ProductsListCtrl'
  .state 'product-detail',
    url: '/products/:productId'
    templateUrl: 'client/products/product-detail.view.html'
    controller: 'ProductDetailCtrl'
