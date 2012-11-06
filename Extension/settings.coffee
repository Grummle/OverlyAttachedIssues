getChromeValue = (name)->
	deferred = $.Deferred()
	chrome.storage.sync.get(name,(data)->deferred.resolve(data[name]))	
	deferred.promise()


saveUploadUrl = (event)->
	chrome.storage.sync.set
		'uploadUrl':$('#uploadUrl').val()
		, -> alert('Settings Saved')

$(document).ready ->
	getChromeValue('uploadUrl').then (url)->
		$('#uploadUrl').val(url)
	$('#save').click saveUploadUrl
	
