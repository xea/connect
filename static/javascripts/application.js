$(function() {
	$.material.init();

	 $(document).keypress(function(event) { if (event.which == 13) { event.preventDefault(); } });
	 $(document).on("keyup", function(event) {
		 if (event.which == 13) {
			 event.preventDefault();
		 }
	 });

	$("#ajax-input").keypress(function(event) {
		if (event.which == 13) {
			var url = "/wisdom";
			var request = {};
			$.getJSON(url, request, function(response) {
			});
		}
	});
});

var connectApp = angular.module('connectApp', []);

connectApp.controller('quoteController', function ($scope, $http) {
	$http.get('wisdom').success(function(data) {
		$scope.quotes = data;
	});
});

// vim: sw=2:ts=2:noet
