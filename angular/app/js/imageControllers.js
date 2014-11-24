var imageControllers = angular.module('imageControllers', []);

imageControllers.controller('imageListCtrl', function ($scope, images){
  images.list(function(images) {
    $scope.images = images;
  });
});

imageControllers.controller('imageDetailCtrl', function ($scope, $routeParams, images){
  images.find($routeParams.imageId, function(image) {
    $scope.image = image;
  });
});