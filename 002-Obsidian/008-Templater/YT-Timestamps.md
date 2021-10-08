<%*
// define function to replace timestamps in file
function replaceTimestamp () {
	const regexHHMM = /(YT=\d\d:[0-5]\d)/g; 
	// change "YT=" if you want a different search term. currently videos cannot be longer than 99m59s
	var content = tp.file.content; // *content of file*
	var matches = content.match(regexHHMM); // *find all regex matches in file*
	const matchesLength = matches.length; // *length of array containing all matches*
	for(var i = 0; i < matchesLength; i++){
		content = content.replace(
			matches[0], 
			"["+matches[0].slice(-5)+"]("+urlPrompt+"&t="+matches[0].slice(-5,-3)+"m"+matches[0].slice(-2)+"s)"
			); // *make YouTube URL from first match*
		matches = content.match(regexHHMM); // *find matches in altered content*
	}
	var file = app.workspace.activeLeaf.view.file; // *get current file*
	app.vault.modify(file, content); // *replace content with new content*
}

// if url is in frontmatter and contains youtube, check if it contains http then run function, else prompt user for url
var url = tp.frontmatter.url; // *get url field from frontmatter*
if(url != undefined && url.contains("youtube.com/watch?v=") === true){
	if (url.includes("https://www.") === false){
		url = "https://www." + url;
		};
	urlPrompt = url;
	replaceTimestamp();
} else {	
if(url === undefined){url = "Enter a YouTube URL"}; // *if url doesnt exist*
var urlPrompt;
while(urlPrompt == null || urlPrompt.length < 1 || urlPrompt.contains("youtube.com/watch?v=") === false){urlPrompt = (await tp.system.prompt("YouTube URL:", url, 1))}; 
// *proper conditions are not met, reprompt*
if (urlPrompt.includes("https://www.") === false){urlPrompt = "https://www." + urlPrompt}
replaceTimestamp();
}
%>