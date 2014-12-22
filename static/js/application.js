$(function() {
	$.material.init();
});

var connectApp = angular.module('connectApp', []);

connectApp.controller('quoteController', function ($scope, $http) {
	$scope.reloadQuote = function() { $http.get('wisdom').success(function(data) {
		$scope.quotes = data;
	})};

	// initial load
	$scope.reloadQuote();
});

connectApp.controller('readingController', function($scope, $http) {
	$scope.state = "default";
	$scope.submitReading = function(reading) {  $http.post('reading', reading).success(function(result) {
		if (result.result == "ok") {
		} else {

		}
	})};
});

connectApp.controller('itemManagerController', function($scope, $http) {
	$scope.addReadingItem = function() { $http.post('reading/item', { alma: 123 }).success(function(data) {
	})};
});

// vim: sw=2:ts=2:noet
