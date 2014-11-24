var imageControllers = angular.module('imageControllers', []);

imageControllers.controller('imageListCtrl', function ($scope, images){
  images.list(function(images) {
    $scope.images = images;
  });
});

imageControllers.controller('imageDetailCtrl', function ($scope, $routeParams, images){
  images.find($routeParams.imageId, function(image) {
    $scope.image = image;
    
    $scope.currentIndex = parseInt($routeParams.imageId);
    
    if($scope.currentIndex < 10){
    	 $scope.nextImage = parseInt($scope.currentIndex + 1);
     }
     else{
    	 $scope.nextImage = 1
     }
     
    if($scope.currentIndex > 1){
    	$scope.prevImage = parseInt($scope.currentIndex - 1);
    } 
    else{
    	$scope.prevImage = 10
    }
  });
});