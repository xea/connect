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
			var url = "/data";
			var request = {};
			$.getJSON(url, request, function(response) {
				
			});
		}
	});
});

// vim: sw=2:ts=2:noet
