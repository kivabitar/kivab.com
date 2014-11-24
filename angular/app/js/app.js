var imageApp = angular.module('imageApp', [
  'ngRoute',
  'imageControllers',
  'imageFactory',
  'imageDirective'
]);

imageApp.config(function($routeProvider) {
  $routeProvider.
    when('/', {
      templateUrl: 'image-list.html',
      controller: 'imageListCtrl'
    }).
    when('/:imageId', {
      templateUrl: 'image-detail.html',
      controller: 'imageDetailCtrl'
    }).
    otherwise({
      redirectTo: '/'
    });
});