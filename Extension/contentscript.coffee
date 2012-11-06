getChromeValue = (name)->
	deferred = $.Deferred()
	chrome.storage.sync.get(name,(data)->deferred.resolve(data[name]))	
	deferred.promise()

upload = (data,filename)-> 
	deferred = $.Deferred()
	getChromeValue('uploadUrl').then (url)->
		$.ajax
			url: url 
			type: 'POST'
			contentType: 'application/json; charset=UTF-8'
			data: '{ "data": "'+data+'","fileName":"'+filename+'"}'
			processData:false
		.then (data)->deferred.resolve(data)
	deferred.promise()

isImage = (fileName)->
	[filename,extension] = fileName.split('.')
	switch extension.toLowerCase()
		when "png" then return true
		when "gif" then return true
		when "jpg" then return true
		when "jpeg" then return true
	return false

createContent = (data)->
	content = "[#{data.displayName}](#{data.fileUrl})"
	if isImage(data.displayName) then content = "!" + content
	content

$(document).ready ->


	for commentTextArea in $('[name="issue_comment[body]"],[name="comment[body]"],[name="issue[body]"]')
		do (commentTextArea)->
			fileHandler = (data,fileName)->
				upload(data,fileName).then (data)->
					$(commentTextArea).val($(commentTextArea).val()+createContent(data))
					$(commentTextArea).trigger('change')

			if(commentTextArea)
				DNDFileController(commentTextArea, fileHandler)
	
