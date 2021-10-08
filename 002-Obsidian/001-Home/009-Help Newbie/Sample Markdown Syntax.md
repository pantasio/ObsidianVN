## Basic Text Formatting

_this is in italic_ and _so is this_

**this is in bold** and **so is this**

**_this is bold and italic_** and **_so is this_**

~~this is strike through text~~

## Neighborhood Blog Posts

You can view blog posts from all projects in a neighborhood. Max\_number (default is 5) and sort (default is timestamp) are optional:

\[\[neighborhood\_blog\_posts max\_number=10 sort=timestamp\]\]

## Project Blog Posts

You can view blog posts from all blogs in a project. Max\_number (default is 5), mount point (leave empty to view posts from all blog tools in a project), and sort (default is timestamp) are optional:

\[\[project\_blog\_posts max\_number=10 sort=timestamp mount\_point=news\]\]

## Links
Most URLs will automatically be turned into links. To be explicit, just write it like this:

<http://someurl>

<somebbob@example.com>

To use text for the link, write it:

[like this](http://someurl)

You can add a *title* (which shows up under the cursor):

[like this](http://someurl "this title shows up when you hover")

## Reference Links
You can also put the [link URL][1] below the current paragraph
like [this][2].

   [1]: http://url
   [2]: http://another.url "A funky title"


Here the text "link URL" gets linked to "http://url", and the lines showing "[1]: http://url" won't show anything.

Or you can use a [shortcut][] reference, which links the text "shortcut" to the link named "[shortcut]" on the next paragraph.

Or you can use a [shortcut][] reference, which links the text
"shortcut" to the link named "[shortcut]" on the next paragraph.

[shortcut]: http://goes/with/the/link/name/text

## Artifact Links

Any forge resource (artifact) can be linked with surrounding square brackets, e.g. [MyPage] or [#123]. These artifact links can take several forms.

Simple Links
Most commonly, the artifact identifier can simply be surrounded with square brackets. Here are some examples:

[MyWikiPage]       # Wiki - name of wiki page
[#123]             # Tracker - ticket number
[r10721]           # SVN - revision number
[3b9d48]           # Git & Mercurial - first 6 characters of revision hash
[2012/02/my-post]  # Blog - post slug, including YYYY/MM/ prefix
[a6d38f98]         # Discussion Thread - thread id
[a6d38f98#42f8]    # Discussion Post - thread_id#post_id

Two-part Links
To link to an artifact in a specific tool, use the form: `[tool:artifact]`, where `tool` is the name of the tool as it appears in the URL. Two-part links are useful when you have two tools of the same type installed. For example, let's say you have a 'bugs' tracker and a 'features' tracker installed, and you want to link to the first ticket in each:

[bugs:#1]
[features:#1]

Three-part Links
To link to an artifact in another project, use the form: `[project:tool:artifact]`, where `project` is the name of the project as it appears in the URL. For example:

[allura:wiki:Home]

To link to an artifact in a subproject, use the form: `[project/subproject:tool:artifact]`, where `subproject` is the name of the subproject as it appears in the URL. For example:

[allura/sub:code:3b9d48]

## User Mentions
An user can be mentioned using @ sign and the username. A rendered user mention has a link to the particular user and also an info tip on mouse hover.

  @test-user-1       # Mention test-user-1
  
## Blockquotes
Use the > character in front of a line, _just like in email_

> Use it if you're quoting a person, a song or whatever.

> You can use *italic* or lists inside them also.
And just like with other paragraphs,
all of these lines are still
part of the blockquote, even without the > character in front.

To end the blockquote, just put a blank line before the following
paragraph.

## Preformatted Text

If you want some text to show up exactly as you write it, without Markdown doing anything to it, just indent every line by at least 4 spaces (or 1 tab). As an alternative to indenting, you can make a code block use 3 or more tildes (~) or backticks (`) on a line before and after the text ([syntax details](https://python-markdown.github.io/extensions/fenced_code_blocks/)). See examples in the [Code Highlighting section](https://sourceforge.net/nf/markdown_syntax#md_ex_code).

This line won't *have any markdown* formatting applied.
    I can even write <b>HTML</b> and it will show up as text.
    This is great for showing program source code, or HTML or even
    Markdown. <b>this won't show up as HTML</b> but
    exactly <i>as you see it in this text file</i>.

Within a paragraph, you can use backquotes to do the same thing.
`This won't be *italic* or **bold** at all.`

## Lists
* an asterisk starts an unordered list
* and this is another item in the list
+ or you can also use the + character
- or the - character

To start an ordered list, write this:

1. this starts a list *with* numbers
+  this will show as number "2"
*  this will show as number "3."
9. any number, +, -, or * will keep the list going.
    * just indent by 4 spaces (or tab) to make a sub-list
        1. keep indenting for more sub lists
    * here i'm back to the second level

To start a check list, write this:

- [ ] this is not checked
- [ ] this is too
- [x] but this is checked

## Tables


## Images
![alternate text](https://a.fsdn.com/allura/nf/1626466075/_static_/images/up.png)

The "alternate text" will show up if the browser can't load the image.

You can also use a title if you want, like this:

![small up arrow](https://a.fsdn.com/allura/nf/1626466075/_static_/images/up.png "small up arrow")

To reference an attached image, just use the img macro. You can add more attributes:

[[img src=attached-image.jpg alt=foobar]]

## Videos

To embed a YouTube video, use the `embed` macro (only YouTube is supported at this time):

[[embed url=https://www.youtube.com/watch?v=6YbBmqUnoQM]]

## Escapes and HTML

What if you want to just show asterisks, not italics?

* this shows up in italics: **a happy day**
* this shows the asterisks: *a happy day*

## Table of Contents

You can display a list of links to jump to headers in a document. Sub-headers will be nested.

[TOC]

# Section 1
## Sub-section 1
# Section 2















