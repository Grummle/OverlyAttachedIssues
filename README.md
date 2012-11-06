OverlyAttachedIssues
====================

Chrome Extension to add file drag and drop for git hub issues.

Images are inserted using the ```![]()``` github markdown format. Other files are inserted as links ```[]()```.

This is was designed to be used internally, but its general enough that others can use it if they don't minda kludge on their webserver.

Github support has responded to inquiries while working on this that attachments in issues is on the roadmap, but no ETA was given.

It uploads files to the configured webserver by sending the file as a base64 encoded string.

Post format:

```
{
	"data":"base64encodedFilesContents",
	"fileName":"SomeFile.txt"
}
```

Response format:
```
{
	"displayName":"PrettyFileName.txt",
	"fileUrl":"https://yourdomain.com/issuescontent/1234-prettyfilename.txt"
}
```
