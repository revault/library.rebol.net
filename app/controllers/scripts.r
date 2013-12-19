REBOL [
	Title: "Words Controller"
	Date: 16-Jul-2013
	Author: "Christopher Ross-Gill"
	Type: 'controller
	Template: %templates/library.rsp
]

route () to %scripts [
	get [print "SCRIPTS"]
]

route (script: string! [wordify]) to %script [
	verify [
		description: attempt [
			require %shell/curl.r
			curl/fail join http://www.rebol.org/download-a-script.r?script-name= [script %.r]
		][
			reject 404 "Unable to Locate Script"
		]
	]

	get []

	get %.r [print description]
]

