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

	$scope.nextReading = function(reading) { $http.get('challenge/next').success(function(result) {
		reading.responseText = '';
		$scope.readingState = 'input';
		$scope.challengeText = result.displayText;
	})};

});

connectApp.controller('itemManagerController', function($scope, $http) {
	$scope.addReadingItem = function() { $http.post('reading/item', { alma: 123 }).success(function(data) {
	})};
});

// vim: sw=2:ts=2:noet
