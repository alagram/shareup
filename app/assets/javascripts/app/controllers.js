angular.module('myApp.controllers', [])
  .controller('HomeController', function($scope, ArticleService, SessionService, session, Share) {
    $scope.user = session.user;
    ArticleService.getLatestFeed()
    .then(function(data) {
      $scope.articles = data;
    })
  });
