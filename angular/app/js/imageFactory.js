angular.module('imageFactory', [])
       .factory('images', function($http){
  return {
    list: function (callback){
      $http({
        method: 'GET',
        url: '/json.cfc?method=images',
        cache: true
      }).success(callback);
    },
    find: function(id, callback){
      $http({
        method: 'GET',
        url: '/json.cfc?method=images&imageId=' + id,
        cache: true
      }).success(callback);
    }
  };
});