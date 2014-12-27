$(function() {
	$.material.init();
});

var connectApp = angular.module('connectApp', []);

connectApp.directive('focusOn', function($timeout) {
  return function(scope, element, attrs) {
    scope.$watch(attrs.focusOn, 
      function (newValue) { 
        $timeout(function() {
            newValue && element.focus();
        });
      },true);
  };    
});

connectApp.controller('quoteController', function ($scope, $http) {
	$scope.reloadQuote = function() { $http.get('wisdom').success(function(data) {
		$scope.quotes = data;
	})};

	// initial load
	$scope.reloadQuote();
});

connectApp.controller('readingController', function($scope, $http) {
	$scope.readingState = "input";

	$scope.isState = function(state) {
		($scope.readingState == state) 
	};

	$scope.submitReading = function(reading) {  $http.post('reading', reading).success(function(result) {
		if (result.result == "ok") {
			$scope.readingState = "submitOK";
		} else if (result.result == "warn") {
			$scope.readingState = "submitWarn";
		} else {
			$scope.readingState = "submitError";
		}
	})};

	$scope.nextReading = function(reading) { $http.get('challenge/reading-jp/next').success(function(result) {
		$scope.challengeText = result.displayText;
		$scope.readingState = 'input';
		reading.responseText = '';
	})};

});

connectApp.controller('itemManagerController', function($scope, $http) {
	$scope.addReadingItem = function(item) { 
		item.answers = item.answers.trim().split(";");
		$http.post('item/reading-jp', item).success(function(data) {
	})};
});

// vim: sw=2:ts=2:noet
