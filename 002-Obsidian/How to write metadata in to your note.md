![[Pasted image 20211113232548.png]]

## Example

The YAML is from the template for my daily note. I wanted a bunch of the data in YAML so I could compare weeks, months, and years.

The inline dataview is just a sample of a bunch of categories I use. These aren’t all in my daily note. Every note type has a different template with different YAML and Metadata sections.

## YAML

-   Aliases and tags are standard.
-   Overview of the day is just a short recap. Longer items are in the body of the note.
-   AOI is Areas of Intent. I wanted this to be a nested item. Then I could break it down to just AOI.Health.Exercise if I wanted to look at trends. I thought about making the keys under Exercise into an array so I could flatten it in Dataview. However, I doubted I would remember what each index represented. The values in this section varies a lot. There isn’t a need for tags or backlinks. Nesting was the priority. That is why it is in the YAML.

## Keywords

This is usually just an array of text and backlinks that highlight what this note should connect to. This is helpful when I haven’t gone through and created links or anything yet.  
This could also be where I add links if this note is for a project I’m working on.

## Status

My status section is like a to-do list for my notes. Not all statues are used in each note type.  
I do have an “NA” version of all statuses. If a certain note doesn’t need to go through that workflow, it is NA. This way I can search for notes that I forgot to use a template or have the wrong metadata version.  
For example, literature notes will all have a flash card status, but only a few actually need flash cards. So I use the NA status for all literature notes. Meeting notes never need flash cards. That status isn’t even in that template.  
I thought about having just one status for every note, but they all go through different workflows. I needed more of a check list than anything.  
It might seem like a lot of work. 1. I plan to work on the items in batches. 2. It is also just to tell me the state of a note. I watch a lot of YouTube videos for tips on things. Like I watched a video on how to do find and replace white space using a shell script. I probably don’t want to go through and link, reference, connect, flash-card, manage-file, or refactor that note unless I’m referencing it in a post or it becomes part of a large project. But at least if I go to that note I’ll know that I haven’t done any of those things.

### Tag Format

-   S is for status. I just didn’t want to type it out every time.
-   The next part is what I have to do such as write. The emoji is at the end of the second word so I can start to type the word and it will appear in the list. I never type the last word. I just find it in the list, which is why that can start with an emoji.
-   The third word is kind of a kanban list.
    -   NA
    -   Complete
    -   Backlog
    -   Queue
    -   Archive
    -   Partial
    -   Current

### Meanings

-   Write - These are for notes like my daily note or scripting notes. These tags are for notes I am creating.
-   Consume - These tags are for literature type notes. I even have a tag for this that is buy. This could be if I start a note for a book or course that I am thinking about purchasing.
-   Link - These tags remind me to go back through my note and make backlinks.
-   Progress - These are true status tags. This is for knowing what notes I should be working on and what ones I can get to later.
-   Reference - These notes tell me to make sure I am adding links to DevonThink, Zotero, and creating citations.
-   Connect - These statues remind me to go back and make connections. This is beyond just creating backlinks. This is more like creating aggregations of information or maps of content.
-   Flash-card - These are for creating flash cards using the Anki plugin.
-   Manage-file - These are for when I just take notes on something but don’t actual put the file in DevonThink. This reminds me to go back an do that.
-   Refactor - I haven’t decided how atomic I want my notes to become. This would let me know if this is a note that I need to refactor or not.

## Priority

This lets me know what notes to work on. If a note has a priority of none, then I’m not going to spend time working on any of the status items for it.

## Template

My system is changing a lot as new plugins come out, and I learn what my workflow is. The goals is to reach a steady state and spend time working with my system rather than on it. To keep track of what version template this note was made with, I have a backlink to the template.  
This will help me if I’m looking for something in Dataview that I added to a new version template that doesn’t exist on older notes. If it is important enough, I could pull up the older version and update them.

## Review

To me, the whole point of having notes is to engage with them. Having connections, dataview, and search will surface many notes when I need them. There are some notes I would like to remember that I have. I am setting up a very loose spaced repetition/review system. I’m just creating a dataview table of notes to look at again at intervals (1w, 1m, 3m, 6m, 1y, 2y). I don’t want to memorize what is in the notes. I just want to be aware that they exist. These notes will probably all have an abstract that I pull out in dataview too.

Hope some of that was helpful.

````ad-abstract
title: Yaml example syntax
collapse: close

~~~terminal
---
 doe: "a deer, a female deer"
 ray: "a drop of golden sun"
 pi: 3.14159
 xmas: true
 french-hens: 3
 calling-birds:
   - huey
   - dewey
   - louie
   - fred
 xmas-fifth-day:
   calling-birds: four
   french-hens: 3
   golden-rings: 5
   partridges:
     count: 1
     location: "a pear tree"
   turtle-doves: two
~~~
````