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

connectApp.controller('challengeController', function($scope, $http) {
	$scope.challengeState = "input";

	$scope.init = function(ref) {
		$scope.reference = ref;
	};

	$scope.isState = function(state) {
		($scope.challengeState == state) 
	};

	$scope.submitResponse = function(response) { $http.post('/api/challenge/' + $scope.reference, response).success(function(result) {
		if (result.result == "ok") {
			$scope.challengeState = "submitOK";
		} else if (result.result == "warn") {
			$scope.challengeState = "submitWarn";
		} else {
			$scope.challengeState = "submitError";
		}
	})};

	$scope.nextChallenge = function(response) { $http.get('/api/challenge/' + $scope.reference).success(function(result) {
		$scope.challengeText = result.displayText;
		$scope.challengeState = 'input';
		response.responseText = '';
	})};

});

connectApp.controller('inventoryController', ['$scope', '$http', function($scope, $http) {
	$scope.state = "default";

	$scope.init = function(ref) {
		$scope.reference = ref;
		$scope.getGroupItems();
	}

	$scope.createItem = function(item) { 
		$scope.state = "adding";
		item.answers = item.answers.trim().split(";");
		$http.post('/api/item/' + $scope.reference, item).success(function(data) {
			$scope.item.displayText = "";
			$scope.item.answers = "";
			$scope.state = "input";
			$scope.getGroupItems();
		}
	)};
	
	$scope.createCourse = function(course) { 
		course.tag = "Group";
		course.nodeChildren = [];
		$http.post('/api/courses', course).success(function(result) {
			homeController.refreshCourses();
	})};

	$scope.createSkill = function(skill) { 
		skill.tag = "Group";
		skill.nodeChildren = [];
		$http.post('/api/skill/' + $scope.reference, skill).success(function(result) {
	})};

	$scope.createLesson = function(lesson) { 
		lesson.tag = "ContentGroup";
		lesson.groupItems = [];
		$http.post('/api/lesson/' + $scope.reference, lesson).success(function(result) {
	})};
	
	$scope.getGroupItems = function() { $http.get('/api/item/' + $scope.reference).success(function(result) {
		$scope.groupItems = result.items;
	})};

}]);

connectApp.controller('homeController', function($scope, $http) {
	$scope.refreshCourses = function() { $http.get('/api/courses').success(function(response) {
		$scope.courses = response.courses;
	})};

	$scope.refreshCourses();
});

connectApp.controller('courseController', function($scope, $http) {
	$scope.init = function(ref) { 
		$scope.reference = ref; 
		$scope.getSkills();
	};

	$scope.getSkills = function() { 
		$http.get('/api/skill/' + $scope.reference).success(function(response) {
			$scope.skills = response.skills;
	})};

});

connectApp.controller('skillController', function($scope, $http) {
	$scope.init = function(ref) { 
		$scope.reference = ref; 
		$scope.getLessons();
	};

	$scope.getLessons = function() { 
		$http.get('/api/lesson/' + $scope.reference).success(function(response) {
			$scope.lessons = response.lessons;
	})};

});
// vim: sw=2:ts=2:noet
