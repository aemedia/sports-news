// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(function() {
	
	sports_name = 'basketball'
	getLeagues(sports_name)
	
	function getLeagues(sports_name){
		url = '/sports/'+sports_name+'.json'

		$.getJSON(url, function(data) {
			var template = $('#leagues-template').html();
			var info = Mustache.to_html(template, data);
			$('#sports').html(info);
			leagues = data["sports"][0]["leagues"]
			$.each(leagues, function(index, value) {
				league_name = value["abbreviation"]
				getTeams(sports_name,league_name)
			});
		});
	}
	
	function getTeams(sports_name,league_name){
		url = "http://sports-news.dev/sports/"+sports_name+"/leagues/"+league_name+"/teams.json"

		$.getJSON(url, function(data) {
			var teams_template = $('#teams-template').html();
			var info = Mustache.to_html(teams_template, data);
			$('#sports #leagues #'+league_name).append('<ul class="unstyled" id='+league_name+'>'+info+'</ul>')
		});
	}
	

	$(document).on("click", ".teams", function(e) { 
		league_name = $(this).parents('ul').attr('id')
		
		team = this.id.split('|')
		
		team_id = team[0]
		team_name = team[1]
		
		$('#news').html('<b>Please wait..</b>'+'<img src="/assets/loader.gif" height="50" width="50">');
		
		$('.teams').removeClass('pill')
		$(this).addClass('pill')
		
		url = "http://sports-news.dev/sports/"+sports_name+"/leagues/"+league_name+"/teams/"+team_id+"/headlines.json"
			
		$.getJSON(url, function(data) {
			var news_template = $('#news-template').html();
			var info = Mustache.to_html(news_template, data);
			$('#news').html(info)
			$('#news').prepend("<div class='row headline-header'><b>"+team_name+"</b></div>")
			
		})
		
		.done(function() {})
		.fail(function() {})
		.complete(function() {});
		

		
	});
		

	
	
});



