$ ->
	loadContentFromScriptTag =  ->
		content = $('#page-content').html()
		$('#content').html(content)

	setTimeout(loadContentFromScriptTag, 1000)