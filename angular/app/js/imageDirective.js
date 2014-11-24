angular.module('imageDirective', [])
       .directive('image', function(){
  return {
    scope: { image: '=' },
    restrict: 'A',
    templateUrl: 'image.html',
    controller: function($scope, images){
      images.find($scope.image.id, function(image) {
        $scope.imageUrl = image.imageUrl;
      });
    }
  };
});