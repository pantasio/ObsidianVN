CoffeeScript Logo

**CoffeeScript is a little language that compiles into JavaScript.** Underneath that awkward Java-esque patina, JavaScript has always had a gorgeous heart. CoffeeScript is an attempt to expose the good parts of JavaScript in a simple way.

The golden rule of CoffeeScript is: _“It’s just JavaScript.”_ The code compiles one-to-one into the equivalent JS, and there is no interpretation at runtime. You can use any existing JavaScript library seamlessly from CoffeeScript (and vice-versa). The compiled output is readable, pretty-printed, and tends to run as fast or faster than the equivalent handwritten JavaScript.

**Latest Version:** [2.5.1](https://github.com/jashkenas/coffeescript/tarball/2.5.1)

> ```
> 
> npm install --save-dev coffeescript
> 
> 
> npm install --global coffeescript
> ```

## Overview

_CoffeeScript on the topleft, compiled JavaScript output on the bottomright. The CoffeeScript is editable!_

## CoffeeScript 2

### What’s New In CoffeeScript 2?

The biggest change in CoffeeScript 2 is that now the CoffeeScript compiler produces modern JavaScript syntax (ES6, or ES2015 and later). A CoffeeScript `=>` becomes a JS `=>`, a CoffeeScript `class` becomes a JS `class` and so on. Major new features in CoffeeScript 2 include [async functions](http://coffeescript.org/#async-functions) and [JSX](http://coffeescript.org/#jsx). You can read more in the [announcement](http://coffeescript.org/announcing-coffeescript-2/). 

There are very few [breaking changes from CoffeeScript 1.x to 2](http://coffeescript.org/#breaking-changes); we hope the upgrade process is smooth for most projects.

### Compatibility

Most modern JavaScript features that CoffeeScript supports can run natively in Node 7.6+, meaning that Node can run CoffeeScript’s output without any further processing required. Here are some notable exceptions:

-   [Modules](http://coffeescript.org/#modules) and [JSX](http://coffeescript.org/#jsx) always require transpilation.
-   [Splats, a.k.a. object rest/spread syntax, for objects](https://coffeescript.org/#splats) are supported by Node 8.6+.
-   The [regular expression `s` (dotall) flag](https://github.com/tc39/proposal-regexp-dotall-flag) is supported by Node 9+.
-   [Async generator functions](https://github.com/tc39/proposal-async-iteration) are supported by Node 10+.

This list may be incomplete, and excludes versions of Node that support newer features behind flags; please refer to [node.green](http://node.green/) for full details. You can [run the tests in your browser](http://coffeescript.org/test.html) to see what your browser supports. It is your responsibility to ensure that your runtime supports the modern features you use; or that you [transpile](http://coffeescript.org/#transpilation) your code. When in doubt, transpile.

## Installation

The command-line version of `coffee` is available as a [Node.js](https://nodejs.org/) utility, requiring Node 6 or later. The [core compiler](http://coffeescript.org/v2/browser-compiler-modern/coffeescript.js) however, does not depend on Node, and can be run in any JavaScript environment, or in the browser (see [Try CoffeeScript](http://coffeescript.org/#try)).

To install, first make sure you have a working copy of the latest stable version of [Node.js](https://nodejs.org/). You can then install CoffeeScript globally with [npm](https://www.npmjs.com/):

```
 npm install --global coffeescript
```

This will make the `coffee` and `cake` commands available globally.

If you are using CoffeeScript in a project, you should install it locally for that project so that the version of CoffeeScript is tracked as one of your project’s dependencies. Within that project’s folder:

```
 npm install --save-dev coffeescript
```

The `coffee` and `cake` commands will first look in the current folder to see if CoffeeScript is installed locally, and use that version if so. This allows different versions of CoffeeScript to be installed globally and locally.

If you plan to use the `--transpile` option (see [Transpilation](http://coffeescript.org/#transpilation)) you will need to also install `@babel/core` either globally or locally, depending on whether you are running a globally or locally installed version of CoffeeScript.

## Usage

### Command Line

Once installed, you should have access to the `coffee` command, which can execute scripts, compile `.coffee` files into `.js`, and provide an interactive REPL. The `coffee` command takes the following options:

Option

Description

`-c, --compile`

Compile a `.coffee` script into a `.js` JavaScript file of the same name.

`-t, --transpile`

Pipe the CoffeeScript compiler’s output through Babel before saving or running the generated JavaScript. Requires `@babel/core` to be installed, and options to pass to Babel in a `.babelrc` file or a `package.json` with a `babel` key in the path of the file or folder to be compiled. See [Transpilation](http://coffeescript.org/#transpilation).

`-m, --map`

Generate source maps alongside the compiled JavaScript files. Adds `sourceMappingURL` directives to the JavaScript as well.

`-M, --inline-map`

Just like `--map`, but include the source map directly in the compiled JavaScript files, rather than in a separate file.

`-i, --interactive`

Launch an interactive CoffeeScript session to try short snippets. Identical to calling `coffee` with no arguments.

`-o, --output [DIR]`

Write out all compiled JavaScript files into the specified directory. Use in conjunction with `--compile` or `--watch`.

`-w, --watch`

Watch files for changes, rerunning the specified command when any file is updated.

`-p, --print`

Instead of writing out the JavaScript as a file, print it directly to **stdout**.

`-s, --stdio`

Pipe in CoffeeScript to STDIN and get back JavaScript over STDOUT. Good for use with processes written in other languages. An example:  
`cat src/cake.coffee | coffee -sc`

`-l, --literate`

Parses the code as Literate CoffeeScript. You only need to specify this when passing in code directly over **stdio**, or using some sort of extension-less file name.

`-e, --eval`

Compile and print a little snippet of CoffeeScript directly from the command line. For example:  
`coffee -e "console.log num for num in [10..1]"`

`-r, --require [MODULE]` 

`require()` the given module before starting the REPL or evaluating the code given with the `--eval` flag.

`-b, --bare`

Compile the JavaScript without the [top-level function safety wrapper](http://coffeescript.org/#lexical-scope).

`--no-header`

Suppress the “Generated by CoffeeScript” header.

`--nodejs`

The `node` executable has some useful options you can set, such as `--debug`, `--debug-brk`, `--max-stack-size`, and `--expose-gc`. Use this flag to forward options directly to Node.js. To pass multiple flags, use `--nodejs` multiple times.

`--ast`

Generate an abstract syntax tree of nodes of the CoffeeScript. Used for integrating with JavaScript build tools.

`--tokens`

Instead of parsing the CoffeeScript, just lex it, and print out the token stream. Used for debugging the compiler.

`-n, --nodes`

Instead of compiling the CoffeeScript, just lex and parse it, and print out the parse tree. Used for debugging the compiler.

#### Examples:

-   Compile a directory tree of `.coffee` files in `src` into a parallel tree of `.js` files in `lib`:  
    `coffee --compile --output lib/ src/`
-   Watch a file for changes, and recompile it every time the file is saved:  
    `coffee --watch --compile experimental.coffee`
-   Concatenate a list of files into a single script:  
    `coffee --join project.js --compile src/*.coffee`
-   Print out the compiled JS from a one-liner:  
    `coffee -bpe "alert i for i in [0..10]"`
-   All together now, watch and recompile an entire project as you work on it:  
    `coffee -o lib/ -cw src/`
-   Start the CoffeeScript REPL (`Ctrl-D` to exit, `Ctrl-V`for multi-line):  
    `coffee`

To use `--transpile`, see [Transpilation](http://coffeescript.org/#transpilation).

### Node.js

If you’d like to use Node.js’ CommonJS to `require` CoffeeScript files, e.g. `require './app.coffee'`, you must first “register” CoffeeScript as an extension:

> ```
> require 'coffeescript/register'
> 
> App = require './app' 
> ```

If you want to use the compiler’s API, for example to make an app that compiles strings of CoffeeScript on the fly, you can `require` the full module:

> ```
> CoffeeScript = require 'coffeescript'
> 
> eval CoffeeScript.compile 'console.log "Mmmmm, I could really go for some #{Math.pi}"'
> ```

The `compile` method has the signature `compile(code, options)` where `code` is a string of CoffeeScript code, and the optional `options` is an object with some or all of the following properties:

-   `options.sourceMap`, boolean: if true, a source map will be generated; and instead of returning a string, `compile` will return an object of the form `{js, v3SourceMap, sourceMap}`.
-   `options.inlineMap`, boolean: if true, output the source map as a base64-encoded string in a comment at the bottom.
-   `options.filename`, string: the filename to use for the source map. It can include a path (relative or absolute).
-   `options.bare`, boolean: if true, output without the [top-level function safety wrapper](http://coffeescript.org/#lexical-scope).
-   `options.header`, boolean: if true, output the `Generated by CoffeeScript` header.
-   `options.transpile`, **object**: if set, this must be an object with the [options to pass to Babel](https://babeljs.io/docs/usage/api/#options). See [Transpilation](http://coffeescript.org/#transpilation).
-   `options.ast`, boolean: if true, return an abstract syntax tree of the input CoffeeScript source code.

### Transpilation

CoffeeScript 2 generates JavaScript that uses the latest, modern syntax. The runtime or browsers where you want your code to run [might not support all of that syntax](http://coffeescript.org/#compatibility). In that case, we want to convert modern JavaScript into older JavaScript that will run in older versions of Node or older browsers; for example, `{ a } = obj` into `a = obj.a`. This is done via transpilers like [Babel](https://babeljs.io/), [Bublé](https://buble.surge.sh/) or [Traceur Compiler](https://github.com/google/traceur-compiler).

#### Quickstart

From the root of your project:

> ```
> npm install --save-dev @babel/core @babel/preset-env
> echo '{ "presets": ["@babel/env"] }' > .babelrc
> coffee --compile --transpile --inline-map some-file.coffee
> ```

#### Transpiling with the CoffeeScript compiler

To make things easy, CoffeeScript has built-in support for the popular [Babel](https://babeljs.io/) transpiler. You can use it via the `--transpile` command-line option or the `transpile` Node API option. To use either, `@babel/core` must be installed in your project:

> ```
> npm install --save-dev @babel/core
> ```

Or if you’re running the `coffee` command outside of a project folder, using a globally-installed `coffeescript` module, `@babel/core` needs to be installed globally:

> ```
> npm install --global @babel/core
> ```

By default, Babel doesn’t do anything—it doesn’t make assumptions about what you want to transpile to. You need to provide it with a configuration so that it knows what to do. One way to do this is by creating a [`.babelrc` file](https://babeljs.io/docs/usage/babelrc/) in the folder containing the files you’re compiling, or in any parent folder up the path above those files. (Babel supports [other ways](https://babeljs.io/docs/usage/babelrc/), too.) A minimal `.babelrc` file would be just `{ "presets": ["@babel/env"] }`. This implies that you have installed [`@babel/preset-env`](https://babeljs.io/docs/plugins/preset-env/):

> ```
> npm install --save-dev @babel/preset-env  
> ```

See [Babel’s website to learn about presets and plugins](https://babeljs.io/docs/plugins/) and the multitude of options you have. Another preset you might need is [`@babel/plugin-transform-react-jsx`](https://babeljs.io/docs/en/babel-plugin-transform-react-jsx/) if you’re using JSX with React (JSX can also be used with other frameworks).

Once you have `@babel/core` and `@babel/preset-env` (or other presets or plugins) installed, and a `.babelrc` file (or other equivalent) in place, you can use `coffee --transpile` to pipe CoffeeScript’s output through Babel using the options you’ve saved.

If you’re using CoffeeScript via the [Node API](http://coffeescript.org/nodejs_usage), where you call `CoffeeScript.compile` with a string to be compiled and an `options` object, the `transpile` key of the `options` object should be the Babel options:

> ```
> CoffeeScript.compile(code, {transpile: {presets: ['@babel/env']}})
> ```

You can also transpile CoffeeScript’s output without using the `transpile` option, for example as part of a build chain. This lets you use transpilers other than Babel, and it gives you greater control over the process. There are many great task runners for setting up JavaScript build chains, such as [Gulp](http://gulpjs.com/), [Webpack](https://webpack.github.io/), [Grunt](https://gruntjs.com/) and [Broccoli](http://broccolijs.com/).

#### Polyfills

Note that transpiling doesn’t automatically supply [polyfills](https://developer.mozilla.org/en-US/docs/Glossary/Polyfill) for your code. CoffeeScript itself will output [`Array.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf) if you use the `in` operator, or destructuring or spread/rest syntax; and [`Function.bind`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind) if you use a bound (`=>`) method in a class. Both are supported in Internet Explorer 9+ and all more recent browsers, but you will need to supply polyfills if you need to support Internet Explorer 8 or below and are using features that would cause these methods to be output. You’ll also need to supply polyfills if your own code uses these methods or another method added in recent versions of JavaScript. One polyfill option is [`@babel/polyfill`](https://babeljs.io/docs/en/babel-polyfill/), though there are many [other](https://hackernoon.com/polyfills-everything-you-ever-wanted-to-know-or-maybe-a-bit-less-7c8de164e423) [strategies](https://philipwalton.com/articles/loading-polyfills-only-when-needed/).

## Language Reference

_This reference is structured so that it can be read from top to bottom, if you like. Later sections use ideas and syntax previously introduced. Familiarity with JavaScript is assumed. In all of the following examples, the source CoffeeScript is provided on the left, and the direct compilation into JavaScript is on the right._

_Many of the examples can be run (where it makes sense) by pressing the_ ▶ _button on the right. The CoffeeScript on the left is editable, and the JavaScript will update as you edit._

First, the basics: CoffeeScript uses significant whitespace to delimit blocks of code. You don’t need to use semicolons `;` to terminate expressions, ending the line will do just as well (although semicolons can still be used to fit multiple expressions onto a single line). Instead of using curly braces `{ }` to surround blocks of code in [functions](http://coffeescript.org/#literals), [if-statements](http://coffeescript.org/#conditionals), [switch](http://coffeescript.org/#switch), and [try/catch](http://coffeescript.org/#try), use indentation.

You don’t need to use parentheses to invoke a function if you’re passing arguments. The implicit call wraps forward to the end of the line or block expression.  
`console.log sys.inspect object` → `console.log(sys.inspect(object));`

## Functions

Functions are defined by an optional list of parameters in parentheses, an arrow, and the function body. The empty function looks like this: `->`

Functions may also have default values for arguments, which will be used if the incoming argument is missing (`undefined`).

## Strings

Like JavaScript and many other languages, CoffeeScript supports strings as delimited by the `"` or `'` characters. CoffeeScript also supports string interpolation within `"`\-quoted strings, using `#{ … }`. Single-quoted strings are literal. You may even use interpolation in object keys.

Multiline strings are allowed in CoffeeScript. Lines are joined by a single space unless they end with a backslash. Indentation is ignored.

Block strings, delimited by `"""` or `'''`, can be used to hold formatted or indentation-sensitive text (or, if you just don’t feel like escaping quotes and apostrophes). The indentation level that begins the block is maintained throughout, so you can keep it all aligned with the body of your code.

Double-quoted block strings, like other double-quoted strings, allow interpolation.

## Objects and Arrays

The CoffeeScript literals for objects and arrays look very similar to their JavaScript cousins. When each property is listed on its own line, the commas are optional. Objects may be created using indentation instead of explicit braces, similar to [YAML](http://yaml.org/).

CoffeeScript has a shortcut for creating objects when you want the key to be set with a variable of the same name. Note that the `{` and `}` are required for this shorthand.

## Lexical Scoping and Variable Safety

The CoffeeScript compiler takes care to make sure that all of your variables are properly declared within lexical scope — you never need to write `var` yourself.

Notice how all of the variable declarations have been pushed up to the top of the closest scope, the first time they appear. `outer` is not redeclared within the inner function, because it’s already in scope; `inner` within the function, on the other hand, should not be able to change the value of the external variable of the same name, and therefore has a declaration of its own.

Because you don’t have direct access to the `var` keyword, it’s impossible to shadow an outer variable on purpose, you may only refer to it. So be careful that you’re not reusing the name of an external variable accidentally, if you’re writing a deeply nested function.

Although suppressed within this documentation for clarity, all CoffeeScript output (except in files with `import` or `export` statements) is wrapped in an anonymous function: `(function(){ … })();`. This safety wrapper, combined with the automatic generation of the `var` keyword, make it exceedingly difficult to pollute the global namespace by accident. (The safety wrapper can be disabled with the [`bare` option](http://coffeescript.org/#usage), and is unnecessary and automatically disabled when using modules.)

If you’d like to create top-level variables for other scripts to use, attach them as properties on `window`; attach them as properties on the `exports` object in CommonJS; or use an [`export` statement](http://coffeescript.org/#modules). If you’re targeting both CommonJS and the browser, the [existential operator](http://coffeescript.org/#existential-operator) (covered below), gives you a reliable way to figure out where to add them: `exports ? this`.

Since CoffeeScript takes care of all variable declaration, it is not possible to declare variables with ES2015’s `let` or `const`. [This is intentional](http://coffeescript.org/#unsupported-let-const); we feel that the simplicity gained by not having to think about variable declaration outweighs the benefit of having three separate ways to declare variables.

## If, Else, Unless, and Conditional Assignment

`if`/`else` statements can be written without the use of parentheses and curly brackets. As with functions and other block expressions, multi-line conditionals are delimited by indentation. There’s also a handy postfix form, with the `if` or `unless` at the end.

CoffeeScript can compile `if` statements into JavaScript expressions, using the ternary operator when possible, and closure wrapping otherwise. There is no explicit ternary statement in CoffeeScript — you simply use a regular `if` statement on a single line.

## Splats, or Rest Parameters/Spread Syntax

The JavaScript `arguments` object is a useful way to work with functions that accept variable numbers of arguments. CoffeeScript provides splats `...`, both for function definition as well as invocation, making variable numbers of arguments a little bit more palatable. ES2015 adopted this feature as their [rest parameters](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters).

Splats also let us elide array elements…

…and object properties.

In ECMAScript this is called [spread syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_operator), and has been supported for arrays since ES2015 and objects since ES2018.

## Loops and Comprehensions

Most of the loops you’ll write in CoffeeScript will be **comprehensions** over arrays, objects, and ranges. Comprehensions replace (and compile into) `for` loops, with optional guard clauses and the value of the current array index. Unlike for loops, array comprehensions are expressions, and can be returned and assigned.

Comprehensions should be able to handle most places where you otherwise would use a loop, `each`/`forEach`, `map`, or `select`/`filter`, for example:  
`shortNames = (name for name in list when name.length < 5)`  
If you know the start and end of your loop, or would like to step through in fixed-size increments, you can use a range to specify the start and end of your comprehension.

Note how because we are assigning the value of the comprehensions to a variable in the example above, CoffeeScript is collecting the result of each iteration into an array. Sometimes functions end with loops that are intended to run only for their side-effects. Be careful that you’re not accidentally returning the results of the comprehension in these cases, by adding a meaningful return value — like `true` — or `null`, to the bottom of your function.

To step through a range comprehension in fixed-size chunks, use `by`, for example: `evens = (x for x in [0..10] by 2)`

If you don’t need the current iteration value you may omit it: `browser.closeCurrentTab() for [0...count]`

Comprehensions can also be used to iterate over the keys and values in an object. Use `of` to signal comprehension over the properties of an object instead of the values in an array.

If you would like to iterate over just the keys that are defined on the object itself, by adding a `hasOwnProperty` check to avoid properties that may be inherited from the prototype, use `for own key, value of object`.

To iterate a generator function, use `from`. See [Generator Functions](http://coffeescript.org/#generator-iteration).

The only low-level loop that CoffeeScript provides is the `while` loop. The main difference from JavaScript is that the `while` loop can be used as an expression, returning an array containing the result of each iteration through the loop.

For readability, the `until` keyword is equivalent to `while not`, and the `loop` keyword is equivalent to `while true`.

When using a JavaScript loop to generate functions, it’s common to insert a closure wrapper in order to ensure that loop variables are closed over, and all the generated functions don’t just share the final values. CoffeeScript provides the `do` keyword, which immediately invokes a passed function, forwarding any arguments.

## Array Slicing and Splicing with Ranges

Ranges can also be used to extract slices of arrays. With two dots (`3..6`), the range is inclusive (`3, 4, 5, 6`); with three dots (`3...6`), the range excludes the end (`3, 4, 5`). Slices indices have useful defaults. An omitted first index defaults to zero and an omitted second index defaults to the size of the array.

The same syntax can be used with assignment to replace a segment of an array with new values, splicing it.

Note that JavaScript strings are immutable, and can’t be spliced.

## Everything is an Expression (at least, as much as possible)

You might have noticed how even though we don’t add return statements to CoffeeScript functions, they nonetheless return their final value. The CoffeeScript compiler tries to make sure that all statements in the language can be used as expressions. Watch how the `return` gets pushed down into each possible branch of execution in the function below.

Even though functions will always return their final value, it’s both possible and encouraged to return early from a function body writing out the explicit return (`return value`), when you know that you’re done.

Because variable declarations occur at the top of scope, assignment can be used within expressions, even for variables that haven’t been seen before:

Things that would otherwise be statements in JavaScript, when used as part of an expression in CoffeeScript, are converted into expressions by wrapping them in a closure. This lets you do useful things, like assign the result of a comprehension to a variable:

As well as silly things, like passing a `try`/`catch` statement directly into a function call:

There are a handful of statements in JavaScript that can’t be meaningfully converted into expressions, namely `break`, `continue`, and `return`. If you make use of them within a block of code, CoffeeScript won’t try to perform the conversion.

## Operators and Aliases

Because the `==` operator frequently causes undesirable coercion, is intransitive, and has a different meaning than in other languages, CoffeeScript compiles `==` into `===`, and `!=` into `!==`. In addition, `is` compiles into `===`, and `isnt` into `!==`.

You can use `not` as an alias for `!`.

For logic, `and` compiles to `&&`, and `or` into `||`.

Instead of a newline or semicolon, `then` can be used to separate conditions from expressions, in `while`, `if`/`else`, and `switch`/`when` statements.

As in [YAML](http://yaml.org/), `on` and `yes` are the same as boolean `true`, while `off` and `no` are boolean `false`.

`unless` can be used as the inverse of `if`.

As a shortcut for `this.property`, you can use `@property`.

You can use `in` to test for array presence, and `of` to test for JavaScript object-key presence.

In a `for` loop, `from` compiles to the [ES2015 `of`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...of). (Yes, it’s unfortunate; the CoffeeScript `of` predates the ES2015 `of`.)

To simplify math expressions, `**` can be used for exponentiation and `//` performs floor division. `%` works just like in JavaScript, while `%%` provides [“dividend dependent modulo”](https://en.wikipedia.org/wiki/Modulo_operation):

All together now:

CoffeeScript

JavaScript

`is`

`===`

`isnt`

`!==`

`not`

`!`

`and`

`&&`

`or`

`||`

`true`, `yes`, `on`

`true`

`false`, `no`, `off` 

`false`

`@`, `this`

`this`

`a in b`

`[].indexOf.call(b, a) >= 0`

`a of b`

`a in b`

`for a from b`

`for (a of b)`

`a ** b`

`a ** b`

`a // b`

`Math.floor(a / b)`

`a %% b`

`(a % b + b) % b`

## The Existential Operator

It’s a little difficult to check for the existence of a variable in JavaScript. `if (variable) …` comes close, but fails for zero, the empty string, and false (to name just the most common cases). CoffeeScript’s existential operator `?` returns true unless a variable is `null` or `undefined` or undeclared, which makes it analogous to Ruby’s `nil?`.

It can also be used for safer conditional assignment than the JavaScript pattern `a = a || value` provides, for cases where you may be handling numbers or strings.

Note that if the compiler knows that `a` is in scope and therefore declared, `a?` compiles to `a != null`, _not_ `a !== null`. The `!=` makes a loose comparison to `null`, which does double duty also comparing against `undefined`. The reverse also holds for `not a?` or `unless a?`.

If a variable might be undeclared, the compiler does a thorough check. This is what JavaScript coders _should_ be typing when they want to check if a mystery variable exists.

The accessor variant of the existential operator `?.` can be used to soak up null references in a chain of properties. Use it instead of the dot accessor `.` in cases where the base value may be `null` or `undefined`. If all of the properties exist then you’ll get the expected result, if the chain is broken, `undefined` is returned instead of the `TypeError` that would be raised otherwise.

For completeness:

Example

Definition

`a?`

tests that `a` is in scope and `a != null`

`a ? b`

returns `a` if `a` is in scope and `a != null`; otherwise, `b`

`a?.b` or `a?['b']`

returns `a.b` if `a` is in scope and `a != null`; otherwise, `undefined`

`a?(b, c)` or `a? b, c` 

returns the result of calling `a` (with arguments `b` and `c`) if `a` is in scope and callable; otherwise, `undefined`

`a ?= b`

assigns the value of `b` to `a` if `a` is not in scope or if `a == null`; produces the new value of `a`

## Chaining Function Calls

Leading `.` closes all open calls, allowing for simpler chaining syntax.

## Destructuring Assignment

Just like JavaScript (since ES2015), CoffeeScript has destructuring assignment syntax. When you assign an array or object literal to a value, CoffeeScript breaks up and matches both sides against each other, assigning the values on the right to the variables on the left. In the simplest case, it can be used for parallel assignment:

But it’s also helpful for dealing with functions that return multiple values.

Destructuring assignment can be used with any depth of array and object nesting, to help pull out deeply nested properties.

Destructuring assignment can even be combined with splats.

Expansion can be used to retrieve elements from the end of an array without having to assign the rest of its values. It works in function parameter lists as well.

Destructuring assignment is also useful when combined with class constructors to assign properties to your instance from an options object passed to the constructor.

The above example also demonstrates that if properties are missing in the destructured object or array, you can, just like in JavaScript, provide defaults. Note though that unlike with the existential operator, the default is only applied with the value is missing or `undefined`—[passing `null` will set a value of `null`](http://coffeescript.org/#breaking-changes-default-values), not the default.

## Bound (Fat Arrow) Functions

In JavaScript, the `this` keyword is dynamically scoped to mean the object that the current function is attached to. If you pass a function as a callback or attach it to a different object, the original value of `this` will be lost. If you’re not familiar with this behavior, [this Digital Web article](https://web.archive.org/web/20150316122013/http://www.digital-web.com/articles/scope_in_javascript) gives a good overview of the quirks.

The fat arrow `=>` can be used to both define a function, and to bind it to the current value of `this`, right on the spot. This is helpful when using callback-based libraries like Prototype or jQuery, for creating iterator functions to pass to `each`, or event-handler functions to use with `on`. Functions created with the fat arrow are able to access properties of the `this` where they’re defined.

If we had used `->` in the callback above, `@customer` would have referred to the undefined “customer” property of the DOM element, and trying to call `purchase()` on it would have raised an exception.

The fat arrow was one of the most popular features of CoffeeScript, and ES2015 [adopted it](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions); so CoffeeScript 2 compiles `=>` to ES `=>`.

## Generator Functions

CoffeeScript supports ES2015 [generator functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function*) through the `yield` keyword. There’s no `function*(){}` nonsense — a generator in CoffeeScript is simply a function that yields.

`yield*` is called `yield from`, and `yield return` may be used if you need to force a generator that doesn’t yield.

You can iterate over a generator function using `for…from`.

## Async Functions

ES2017’s [async functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function) are supported through the `await` keyword. Like with generators, there’s no need for an `async` keyword; an async function in CoffeeScript is simply a function that awaits.

Similar to how `yield return` forces a generator, `await return` may be used to force a function to be async.

## Classes

CoffeeScript 1 provided the `class` and `extends` keywords as syntactic sugar for working with prototypal functions. With ES2015, JavaScript has adopted those keywords; so CoffeeScript 2 compiles its `class` and `extends` keywords to ES2015 classes.

Static methods can be defined using `@` before the method name:

Finally, class definitions are blocks of executable code, which make for interesting metaprogramming possibilities. In the context of a class definition, `this` is the class object itself; therefore, you can assign static properties by using `@property: value`.

## Prototypal Inheritance

In addition to supporting ES2015 classes, CoffeeScript provides a shortcut for working with prototypes. The `::` operator gives you quick access to an object’s prototype:

## Switch/When/Else

`switch` statements in JavaScript are a bit awkward. You need to remember to `break` at the end of every `case` statement to avoid accidentally falling through to the default case. CoffeeScript prevents accidental fall-through, and can convert the `switch` into a returnable, assignable expression. The format is: `switch` condition, `when` clauses, `else` the default case.

As in Ruby, `switch` statements in CoffeeScript can take multiple values for each `when` clause. If any of the values match, the clause runs.

`switch` statements can also be used without a control expression, turning them in to a cleaner alternative to `if`/`else` chains.

## Try/Catch/Finally

`try` expressions have the same semantics as `try` statements in JavaScript, though in CoffeeScript, you may omit _both_ the catch and finally parts. The catch part may also omit the error parameter if it is not needed.

## Chained Comparisons

CoffeeScript borrows [chained comparisons](https://docs.python.org/3/reference/expressions.html#not-in) from Python — making it easy to test if a value falls within a certain range.

## Block Regular Expressions

Similar to block strings and comments, CoffeeScript supports block regexes — extended regular expressions that ignore internal whitespace and can contain comments and interpolation. Modeled after Perl’s `/x` modifier, CoffeeScript’s block regexes are delimited by `///` and go a long way towards making complex regular expressions readable. To quote from the CoffeeScript source:

## Tagged Template Literals

CoffeeScript supports [ES2015 tagged template literals](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Template_literals#Tagged_template_literals), which enable customized string interpolation. If you immediately prefix a string with a function name (no space between the two), CoffeeScript will output this “function plus string” combination as an ES2015 tagged template literal, which will [behave accordingly](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Template_literals#Tagged_template_literals): the function is called, with the parameters being the input text and expression parts that make up the interpolated string. The function can then assemble these parts into an output string, providing custom string interpolation.

## Modules

ES2015 modules are supported in CoffeeScript, with very similar `import` and `export` syntax:

[Dynamic import](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import#Dynamic_Imports) is also supported, with mandatory parentheses:

Note that the CoffeeScript compiler **does not resolve modules**; writing an `import` or `export` statement in CoffeeScript will produce an `import` or `export` statement in the resulting output. It is your responsibility to [transpile](http://coffeescript.org/#transpilation) this ES2015 syntax into code that will work in your target runtimes.

Also note that any file with an `import` or `export` statement will be output without a [top-level function safety wrapper](http://coffeescript.org/#lexical-scope); in other words, importing or exporting modules will automatically trigger [bare](http://coffeescript.org/#usage) mode for that file. This is because per the ES2015 spec, `import` or `export` statements must occur at the topmost scope.

## Embedded JavaScript

Hopefully, you’ll never need to use it, but if you ever need to intersperse snippets of JavaScript within your CoffeeScript, you can use backticks to pass it straight through.

Escape backticks with backslashes: ``\``` becomes `` ```.

Escape backslashes before backticks with more backslashes: ``\\\``` becomes ``\```.

You can also embed blocks of JavaScript using triple backticks. That’s easier than escaping backticks, if you need them inside your JavaScript block.

## JSX

[JSX](https://facebook.github.io/react/docs/introducing-jsx.html) is JavaScript containing interspersed XML elements. While conceived for [React](https://facebook.github.io/react/), it is not specific to any particular library or framework.

CoffeeScript supports interspersed XML elements, without the need for separate plugins or special settings. The XML elements will be compiled as such, outputting JSX that could be parsed like any normal JSX file, for example by [Babel with the React JSX transform](https://babeljs.io/docs/plugins/transform-react-jsx/). CoffeeScript does _not_ output `React.createElement` calls or any code specific to React or any other framework. It is up to you to attach another step in your build chain to convert this JSX to whatever function calls you wish the XML elements to compile to.

Just like in JSX and HTML, denote XML tags using `<` and `>`. You can interpolate CoffeeScript code inside a tag using `{` and `}`. To avoid compiler errors, when using `<` and `>` to mean “less than” or “greater than,” you should wrap the operators in spaces to distinguish them from XML tags. So `i < len`, not `i<len`. The compiler tries to be forgiving when it can be sure what you intend, but always putting spaces around the “less than” and “greater than” operators will remove ambiguity.

Older plugins or forks of CoffeeScript supported JSX syntax and referred to it as CSX or CJSX. They also often used a `.cjsx` file extension, but this is no longer necessary; regular `.coffee` will do.

## Type Annotations

Static type checking can be achieved in CoffeeScript by using [Flow](https://flow.org/)’s [Comment Types syntax](https://flow.org/en/docs/types/comments/):

CoffeeScript does not do any type checking itself; the JavaScript output you see above needs to get passed to Flow for it to validate your code. We expect most people will use a [build tool](http://coffeescript.org/#es2015plus-output) for this, but here’s how to do it the simplest way possible using the [CoffeeScript](http://coffeescript.org/#cli) and [Flow](https://flow.org/en/docs/usage/) command-line tools, assuming you’ve already [installed Flow](https://flow.org/en/docs/install/) and the [latest CoffeeScript](http://coffeescript.org/#installation) in your project folder:

> ```
> coffee --bare --no-header --compile app.coffee && npm run flow
> ```

`--bare` and `--no-header` are important because Flow requires the first line of the file to be the comment `// @flow`. If you configure your build chain to compile CoffeeScript and pass the result to Flow in-memory, you can get better performance than this example; and a proper build tool should be able to watch your CoffeeScript files and recompile and type-check them for you on save.

If you know of another way to achieve static type checking with CoffeeScript, please [create an issue](https://github.com/jashkenas/coffeescript/issues/new) and let us know.

## Literate CoffeeScript

Besides being used as an ordinary programming language, CoffeeScript may also be written in “literate” mode. If you name your file with a `.litcoffee` extension, you can write it as a Markdown document — a document that also happens to be executable CoffeeScript code. The compiler will treat any indented blocks (Markdown’s way of indicating source code) as executable code, and ignore the rest as comments. Code blocks must also be separated from comments by at least one blank line.

Just for kicks, a little bit of the compiler is currently implemented in this fashion: See it [as a document](https://gist.github.com/jashkenas/3fc3c1a8b1009c00d9df), [raw](https://raw.githubusercontent.com/jashkenas/coffeescript/master/src/scope.litcoffee), and [properly highlighted in a text editor](https://cl.ly/LxEu).

A few caveats:

-   Code blocks need to maintain consistent indentation relative to each other. When the compiler parses your Literate CoffeeScript file, it first discards all the non-code block lines and then parses the remainder as a regular CoffeeScript file. Therefore the code blocks need to be written as if the comment lines don’t exist, with consistent indentation (including whether they are indented with tabs or spaces).
-   Along those lines, code blocks within list items or blockquotes are not treated as executable code. Since list items and blockquotes imply their own indentation, it would be ambiguous how to treat indentation between successive code blocks when some are within these other blocks and some are not.
-   List items can be at most only one paragraph long. The second paragraph of a list item would be indented after a blank line, and therefore indistinguishable from a code block.

## Source Maps

CoffeeScript includes support for generating source maps, a way to tell your JavaScript engine what part of your CoffeeScript program matches up with the code being evaluated. Browsers that support it can automatically use source maps to show your original source code in the debugger. To generate source maps alongside your JavaScript files, pass the `--map` or `-m` flag to the compiler.

For a full introduction to source maps, how they work, and how to hook them up in your browser, read the [HTML5 Tutorial](https://www.html5rocks.com/en/tutorials/developertools/sourcemaps/).

## Cake, and Cakefiles

CoffeeScript includes a (very) simple build system similar to [Make](https://www.gnu.org/software/make/) and [Rake](http://rake.rubyforge.org/). Naturally, it’s called Cake, and is used for the tasks that build and test the CoffeeScript language itself. Tasks are defined in a file named `Cakefile`, and can be invoked by running `cake [task]` from within the directory. To print a list of all the tasks and options, just type `cake`.

Task definitions are written in CoffeeScript, so you can put arbitrary code in your Cakefile. Define a task with a name, a long description, and the function to invoke when the task is run. If your task takes a command-line option, you can define the option with short and long flags, and it will be made available in the `options` object. Here’s a task that uses the Node.js API to rebuild CoffeeScript’s parser:

If you need to invoke one task before another — for example, running `build` before `test`, you can use the `invoke` function: `invoke 'build'`. Cake tasks are a minimal way to expose your CoffeeScript functions to the command line, so [don’t expect any fanciness built-in](http://coffeescript.org/v2/annotated-source/cake.html). If you need dependencies, or async callbacks, it’s best to put them in your code itself — not the cake task.

## `"text/coffeescript"` Script Tags

While it’s not recommended for serious use, CoffeeScripts may be included directly within the browser using `<script type="text/coffeescript">` tags. The source includes a compressed and minified version of the compiler ([Download current version here, 77k when gzipped](http://coffeescript.org/v2/browser-compiler-legacy/coffeescript.js)) as `docs/v2/browser-compiler-legacy/coffeescript.js`. Include this file on a page with inline CoffeeScript tags, and it will compile and evaluate them in order.

The usual caveats about CoffeeScript apply — your inline scripts will run within a closure wrapper, so if you want to expose global variables or functions, attach them to the `window` object.

## Resources

-   [CoffeeScript on GitHub](https://github.com/jashkenas/coffeescript/)
-   [CoffeeScript Issues](https://github.com/jashkenas/coffeescript/issues)  
    Bug reports, feature proposals, and ideas for changes to the language belong here.
-   [CoffeeScript Google Group](https://groups.google.com/forum/#!forum/coffeescript)  
    If you’d like to ask a question, the mailing list is a good place to get help.
-   [The CoffeeScript Wiki](https://github.com/jashkenas/coffeescript/wiki)  
    If you’ve ever learned a neat CoffeeScript tip or trick, or ran into a gotcha — share it on the wiki. The wiki also serves as a directory of handy [text editor extensions](https://github.com/jashkenas/coffeescript/wiki/Text-editor-plugins), [web framework plugins](https://github.com/jashkenas/coffeescript/wiki/Web-framework-plugins), and general [CoffeeScript build tools](https://github.com/jashkenas/coffeescript/wiki/Build-tools).
-   [The FAQ](https://github.com/jashkenas/coffeescript/wiki/FAQ)  
    Perhaps your CoffeeScript-related question has been asked before. Check the FAQ first.
-   [JS2Coffee](http://js2.coffee/)  
    Is a very well done reverse JavaScript-to-CoffeeScript compiler. It’s not going to be perfect (infer what your JavaScript classes are, when you need bound functions, and so on…) — but it’s a great starting point for converting simple scripts.
-   [High-Rez Logo](https://github.com/jashkenas/coffeescript/tree/master/documentation/site)  
    The CoffeeScript logo is available in SVG for use in presentations.

## Books

There are a number of excellent resources to help you get started with CoffeeScript, some of which are freely available online.

-   [The Little Book on CoffeeScript](https://arcturo.github.io/library/coffeescript/) is a brief 5-chapter introduction to CoffeeScript, written with great clarity and precision by [Alex MacCaw](http://alexmaccaw.co.uk/).
-   [Smooth CoffeeScript](https://autotelicum.github.io/Smooth-CoffeeScript/) is a reimagination of the excellent book [Eloquent JavaScript](https://eloquentjavascript.net/), as if it had been written in CoffeeScript instead. Covers language features as well as the functional and object oriented programming styles. By [E. Hoigaard](https://github.com/autotelicum).
-   [CoffeeScript: Accelerated JavaScript Development](https://pragprog.com/book/tbcoffee/coffeescript) is [Trevor Burnham](http://trevorburnham.com/)’s thorough introduction to the language. By the end of the book, you’ll have built a fast-paced multiplayer word game, writing both the client-side and Node.js portions in CoffeeScript.
-   [CoffeeScript Programming with jQuery, Rails, and Node.js](https://www.packtpub.com/web-development/coffeescript-programming-jquery-rails-and-nodejs) is a new book by Michael Erasmus that covers CoffeeScript with an eye towards real-world usage both in the browser (jQuery) and on the server-side (Rails, Node).
-   [CoffeeScript Ristretto](https://leanpub.com/coffeescript-ristretto/read) is a deep dive into CoffeeScript’s semantics from simple functions up through closures, higher-order functions, objects, classes, combinators, and decorators. By [Reg Braithwaite](http://braythwayt.com/).
-   [Testing with CoffeeScript](https://efendibooks.com/minibooks/testing-with-coffeescript) is a succinct and freely downloadable guide to building testable applications with CoffeeScript and Jasmine.
-   [CoffeeScript Application Development](https://www.packtpub.com/web-development/coffeescript-application-development) from Packt, introduces CoffeeScript while walking through the process of building a demonstration web application. A [CoffeeScript Application Development Coookbook](https://www.packtpub.com/web-development/coffeescript-application-development-cookbook) with over 90 “recipes” is also available.
-   [CoffeeScript in Action](https://www.manning.com/books/coffeescript-in-action) from Manning Publications, covers CoffeeScript syntax, composition techniques and application development.
-   [CoffeeScript: Die Alternative zu JavaScript](https://www.dpunkt.de/buecher/4021/coffeescript.html) from dpunkt.verlag, is the first CoffeeScript book in Deutsch.

## Screencasts

-   [A Sip of CoffeeScript](http://coffeescript.codeschool.com/) is a [Code School Course](https://www.codeschool.com/) which combines 6 screencasts with in-browser coding to make learning fun. The first level is free to try out.
-   [Meet CoffeeScript](https://www.pluralsight.com/courses/meet-coffeescript) is a 75-minute long screencast by PeepCode, now [PluralSight](https://www.pluralsight.com/). Highly memorable for its animations which demonstrate transforming CoffeeScript into the equivalent JS.
-   If you’re looking for less of a time commitment, RailsCasts’ [CoffeeScript Basics](http://railscasts.com/episodes/267-coffeescript-basics) should have you covered, hitting all of the important notes about CoffeeScript in 11 minutes.

## Examples

The [best list of open-source CoffeeScript examples](https://github.com/trending?l=coffeescript&since=monthly) can be found on GitHub. But just to throw out a few more:

-   **GitHub**’s [Hubot](https://hubot.github.com/), a friendly IRC robot that can perform any number of useful and useless tasks.
-   **sstephenson**’s [Pow](http://pow.cx/), a zero-configuration Rack server, with comprehensive annotated source.
-   **technoweenie**’s [Coffee-Resque](https://github.com/technoweenie/coffee-resque), a port of [Resque](https://github.com/defunkt/resque) for Node.js.
-   **stephank**’s [Orona](https://github.com/stephank/orona), a remake of the Bolo tank game for modern browsers.
-   **GitHub**’s [Atom](https://atom.io/), a hackable text editor built on web technologies.
-   **Basecamp**’s [Trix](https://trix-editor.org/), a rich text editor for web apps.

## Web Chat (IRC)

Quick help and advice can often be found in the CoffeeScript IRC room `#coffeescript` on `irc.freenode.net`, which you can [join via your web browser](https://webchat.freenode.net/?channels=coffeescript).

## Annotated Source

You can browse the CoffeeScript 2.5.1 source in readable, annotated form [here](http://coffeescript.org/annotated-source/). You can also jump directly to a particular source file:

-   [Grammar Rules — src/grammar](http://coffeescript.org/annotated-source/grammar.html)
-   [Lexing Tokens — src/lexer](http://coffeescript.org/annotated-source/lexer.html)
-   [The Rewriter — src/rewriter](http://coffeescript.org/annotated-source/rewriter.html)
-   [The Syntax Tree — src/nodes](http://coffeescript.org/annotated-source/nodes.html)
-   [Lexical Scope — src/scope](http://coffeescript.org/annotated-source/scope.html)
-   [Helpers & Utility Functions — src/helpers](http://coffeescript.org/annotated-source/helpers.html)
-   [The CoffeeScript Module — src/coffeescript](http://coffeescript.org/annotated-source/coffeescript.html)
-   [Cake & Cakefiles — src/cake](http://coffeescript.org/annotated-source/cake.html)
-   [“coffee” Command-Line Utility — src/command](http://coffeescript.org/annotated-source/command.html)
-   [Option Parsing — src/optparse](http://coffeescript.org/annotated-source/optparse.html)
-   [Interactive REPL — src/repl](http://coffeescript.org/annotated-source/repl.html)
-   [Source Maps — src/sourcemap](http://coffeescript.org/annotated-source/sourcemap.html)

## Contributing

Contributions are welcome! Feel free to fork [the repo](https://github.com/jashkenas/coffeescript) and submit a pull request.

[Some features of ECMAScript are intentionally unsupported](http://coffeescript.org/#unsupported). Please review both the open and closed [issues on GitHub](https://github.com/jashkenas/coffeescript/issues) to see if the feature you’re looking for has already been discussed. As a general rule, we don’t support ECMAScript syntax for features that aren’t yet finalized (at Stage 4 in the [proposal approval process](https://github.com/tc39/proposals)) or implemented in major browsers and/or Node (which can sometimes happen for features in Stage 3). Any Stage 3 features that CoffeeScript chooses to support should be considered experimental, subject to breaking changes or removal until the feature reaches Stage 4.

For more resources on adding to CoffeeScript, please see [the Wiki](https://github.com/jashkenas/coffeescript/wiki/%5BHowto%5D-Hacking-on-the-CoffeeScript-Compiler), especially [How The Parser Works](https://github.com/jashkenas/coffeescript/wiki/%5BHowTo%5D-How-parsing-works).

There are several things you can do to increase your odds of having your pull request accepted:

-   Create tests! Any pull request should probably include basic tests to verify you didn’t break anything, or future changes won’t break your code.
-   Follow the style of the rest of the CoffeeScript codebase.
-   Ensure any ECMAScript syntax is mature (at Stage 4, or at Stage 3 with support in major browsers or runtimes).
-   Add only features that have broad utility, rather than a feature aimed at a specific use case or framework.

Of course, it’s entirely possible that you have a great addition, but it doesn’t fit within these constraints. Feel free to roll your own solution; you will have [plenty of company](https://github.com/jashkenas/coffeescript/wiki/In-The-Wild).

## Unsupported ECMAScript Features

There are a few ECMAScript features that CoffeeScript intentionally doesn’t support.

### `let` and `const`: block-scoped and reassignment-protected variables

When CoffeeScript was designed, `var` was [intentionally omitted](https://github.com/jashkenas/coffeescript/issues/238#issuecomment-153502). This was to spare developers the mental housekeeping of needing to worry about variable _declaration_ (`var foo`) as opposed to variable _assignment_ (`foo = 1`). The CoffeeScript compiler automatically takes care of declaration for you, by generating `var` statements at the top of every function scope. This makes it impossible to accidentally declare a global variable.

`let` and `const` add a useful ability to JavaScript in that you can use them to declare variables within a _block_ scope, for example within an `if` statement body or a `for` loop body, whereas `var` always declares variables in the scope of an entire function. When CoffeeScript 2 was designed, there was much discussion of whether this functionality was useful enough to outweigh the simplicity offered by never needing to consider variable declaration in CoffeeScript. In the end, it was decided that the simplicity was more valued. In CoffeeScript there remains only one type of variable.

Keep in mind that `const` only protects you from _reassigning_ a variable; it doesn’t prevent the variable’s value from changing, the way constants usually do in other languages:

> ```
> const obj = {foo: 'bar'};
> obj.foo = 'baz'; 
> obj = {}; 
> ```

### Named functions and function declarations

Newcomers to CoffeeScript often wonder how to generate the JavaScript `function foo() {}`, as opposed to the `foo = function() {}` that CoffeeScript produces. The first form is a [function declaration](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function), and the second is a [function expression](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/function). As stated above, in CoffeeScript [everything is an expression](http://coffeescript.org/#expressions), so naturally we favor the expression form. Supporting only one variant helps avoid confusing bugs that can arise from the [subtle differences between the two forms](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function#Function_declaration_hoisting).

Technically, `foo = function() {}` is creating an anonymous function that gets assigned to a variable named `foo`. Some very early versions of CoffeeScript named this function, e.g. `foo = function foo() {}`, but this was dropped because of compatibility issues with Internet Explorer. For a while this annoyed people, as these functions would be unnamed in stack traces; but modern JavaScript runtimes [infer the names of such anonymous functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/name) from the names of the variables to which they’re assigned. Given that this is the case, it’s simplest to just preserve the current behavior.

### `get` and `set` keyword shorthand syntax

`get` and `set`, as keywords preceding functions or class methods, are intentionally unimplemented in CoffeeScript.

This is to avoid grammatical ambiguity, since in CoffeeScript such a construct looks identical to a function call (e.g. `get(function foo() {})`); and because there is an [alternate syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty) that is slightly more verbose but just as effective:

## Breaking Changes From CoffeeScript 1.x to 2

CoffeeScript 2 aims to output as much idiomatic ES2015+ syntax as possible with as few breaking changes from CoffeeScript 1.x as possible. Some breaking changes, unfortunately, were unavoidable.

### Bound (fat arrow) functions

In CoffeeScript 1.x, `=>` compiled to a regular `function` but with references to `this`/`@` rewritten to use the outer scope’s `this`, or with the inner function bound to the outer scope via `.bind` (hence the name “bound function”). In CoffeeScript 2, `=>` compiles to [ES2015’s `=>`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions), which behaves slightly differently. The largest difference is that in ES2015, `=>` functions lack an `arguments` object:

### Default values for function parameters and destructured elements

Per the [ES2015 spec regarding function default parameters](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters) and [destructuring default values](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#Default_values), default values are only applied when a value is missing or `undefined`. In CoffeeScript 1.x, the default value would be applied in those cases but also if the value was `null`.

### Bound generator functions

Bound generator functions, a.k.a. generator arrow functions, [aren’t allowed in ECMAScript](https://stackoverflow.com/questions/27661306/can-i-use-es6s-arrow-function-syntax-with-generators-arrow-notation). You can write `function*` or `=>`, but not both. Therefore, CoffeeScript code like this:

> ```
> f = => yield this
> 
> ```

Needs to be rewritten the old-fashioned way:

### Classes are compiled to ES2015 classes

ES2015 classes and their methods have some restrictions beyond those on regular functions.

Class constructors can’t be invoked without `new`:

> ```
> (class)()
> 
> ```

ES2015 classes don’t allow bound (fat arrow) methods. The CoffeeScript compiler goes through some contortions to preserve support for them, but one thing that can’t be accommodated is calling a bound method before it is bound:

> ```
> class Base
>   constructor: ->
>     @onClick()      
>     clickHandler = @onClick
>     clickHandler()  
> 
> class Component extends Base
>   onClick: =>
>     console.log 'Clicked!', @
> ```

Class methods can’t be used with `new` (uncommon):

> ```
> class Namespace
>   @Klass = ->
> new Namespace.Klass  
> ```

Due to the hoisting required to compile to ES2015 classes, dynamic keys in class methods can’t use values from the executable class body unless the methods are assigned in prototype style.

> ```
> class A
>   name = 'method'
>   "#{name}": ->   
>   @::[name] = ->  
> ```

### `super` and `this`

In the constructor of a derived class (a class that `extends` another class), `this` cannot be used before calling `super`:

> ```
> class B extends A
>   constructor: -> this  
> ```

This also means you cannot pass a reference to `this` as an argument to `super` in the constructor of a derived class:

> ```
> class B extends A
>   constructor: (@arg) ->
>     super @arg  
> ```

This is a limitation of ES2015 classes. As a workaround, assign to `this` after the `super` call:

### `super` and `extends`

Due to a syntax clash with `super` with accessors, “bare” `super` (the keyword `super` without parentheses) no longer compiles to a super call forwarding all arguments.

> ```
> class B extends A
>   foo: -> super
>   
> ```

Arguments can be forwarded explicitly using splats:

Or if you know that the parent function doesn’t require arguments, just call `super()`:

CoffeeScript 1.x allowed the `extends` keyword to set up prototypal inheritance between functions, and `super` could be used manually prototype-assigned functions:

> ```
> A = ->
> B = ->
> B extends A
> B.prototype.foo = -> super arguments...
> 
> ```

Due to the switch to ES2015 `extends` and `super`, using these keywords for prototypal functions are no longer supported. The above case could be refactored to:

or

### JSX and the `<` and `>` operators

With the addition of [JSX](http://coffeescript.org/#jsx), the `<` and `>` characters serve as both the “less than” and “greater than” operators and as the delimiters for XML tags, like `<div>`. For best results, in general you should always wrap the operators in spaces to distinguish them from XML tags: `i < len`, not `i<len`. The compiler tries to be forgiving when it can be sure what you intend, but always putting spaces around the “less than” and “greater than” operators will remove ambiguity.

### Literate CoffeeScript parsing

CoffeeScript 2’s parsing of Literate CoffeeScript has been refactored to now be more careful about not treating indented lists as code blocks; but this means that all code blocks (unless they are to be interpreted as comments) must be separated by at least one blank line from lists.

Code blocks should also now maintain a consistent indentation level—so an indentation of one tab (or whatever you consider to be a tab stop, like 2 spaces or 4 spaces) should be treated as your code’s “left margin,” with all code in the file relative to that column.

Code blocks that you want to be part of the commentary, and not executed, must have at least one line (ideally the first line of the block) completely unindented.

### Argument parsing and shebang (`#!`) lines

In CoffeeScript 1.x, `--` was required after the path and filename of the script to be run, but before any arguments passed to that script. This convention is now deprecated. So instead of:

> ```
> coffee [options] path/to/script.coffee -- [args]
> ```

Now you would just type:

> ```
> coffee [options] path/to/script.coffee [args]
> ```

The deprecated version will still work, but it will print a warning before running the script.

On non-Windows platforms, a `.coffee` file can be made executable by adding a shebang (`#!`) line at the top of the file and marking the file as executable. For example:

> ```
> 
> 
> x = 2 + 2
> console.log x
> ```

If this were saved as `executable.coffee`, it could be made executable and run:

> ```
> ▶ chmod +x ./executable.coffee
> ▶ ./executable.coffee
> 4
> ```

In CoffeeScript 1.x, this used to fail when trying to pass arguments to the script. Some users on OS X worked around the problem by using `#!/usr/bin/env coffee --` as the first line of the file. That didn’t work on Linux, however, which cannot parse shebang lines with more than a single argument. While such scripts will still run on OS X, CoffeeScript will now display a warning before compiling or evaluating files that begin with a too-long shebang line. Now that CoffeeScript 2 supports passing arguments without needing `--`, we recommend simply changing the shebang lines in such scripts to just `#!/usr/bin/env coffee`.

## Changelog

### [2.5.1](https://github.com/jashkenas/coffeescript/compare/2.5.0...2.5.1) — January 31, 2020

-   Object splats can now include prototype shorthands, such as `a = {b::c...}`; and soaks, such as `a = {b?.c..., d?()...}`.
-   Bugfix for regression in 2.5.0 where compilation became much slower for files with Windows-style line endings.
-   Bugfix for an implicit object after a line continuation keyword like `or` inside a larger implicit object.

### [2.5.0](https://github.com/jashkenas/coffeescript/compare/2.4.1...2.5.0) — December 31, 2019

-   The compiler now supports a new `ast` option, available via `--ast` on the command line or `ast` via the Node API. This option outputs an “abstract syntax tree,” or a JSON-like representation of the input CoffeeScript source code. This AST follows [Babel’s spec](https://github.com/babel/babel/blob/master/packages/babel-parser/ast/spec.md) as closely as possible, for compatibility with tools that work with JavaScript source code. Two tools that use this new AST output are [`eslint-plugin-coffee`](https://github.com/helixbass/eslint-plugin-coffee), a plugin to lint CoffeeScript via [ESLint](https://eslint.org/); and [`prettier-plugin-coffeescript`](https://github.com/helixbass/prettier-plugin-coffeescript), a plugin to reformat CoffeeScript source code via [Prettier](https://prettier.io/). _The structure and properties of CoffeeScript’s AST are not final and may undergo breaking changes between CoffeeScript versions; please [open an issue](https://github.com/jashkenas/coffeescript/issues) if you are interested in creating new integrations._
-   [Numeric separators](https://github.com/tc39/proposal-numeric-separator) are now supported in CoffeeScript, following the same syntax as JavaScript: `1_234_567`.
-   [`BigInt` numbers](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) are now supported in CoffeeScript, following the same syntax as JavaScript: `42n`.
-   `'''` and `"""` strings are now output as more readable JavaScript template literals, or backtick (`` ` ``) strings, with actual newlines rather than `\n` escape sequences.
-   Classes can now contain computed properties, e.g. `[someVar]: ->` or `@[anotherVar]: ->`.
-   JSX tags can now contain XML-style namespaces, e.g. `<image xlink:href="data:image/png" />` or `<Something:Tag></Something:Tag>`.
-   Bugfixes for comments after colons not appearing the output; reserved words mistakenly being disallowed as JSX attributes; indented leading elisions in multiline arrays; and invalid location data in source maps.

### [2.4.1](https://github.com/jashkenas/coffeescript/compare/2.4.0...2.4.1) — April 8, 2019

-   Both the [traditional ES5](http://coffeescript.org/browser-compiler-legacy/coffeescript.js) and [modern ES module](http://coffeescript.org/browser-compiler-modern/coffeescript.js) versions of the CoffeeScript browser compiler are now published to NPM, enabling the browser compilers’ use via services that provide NPM modules’ code available via public CDN. The traditional version is referenced via the `package.json` `"browser"` field, and the ES module version via the `"module"` field.

### [2.4.0](https://github.com/jashkenas/coffeescript/compare/2.3.2...2.4.0) — March 29, 2019

-   Dynamic `import()` expressions are now supported. The parentheses are always required, to distinguish from `import` statements. See [Modules](http://coffeescript.org/#dynamic-import). Note that as of this writing, the JavaScript feature itself is still Stage 3; if it changes before being fully standardized, it may change in CoffeeScript too. Using `import()` before its upstream [ECMAScript proposal](https://github.com/tc39/proposal-dynamic-import) is finalized should be considered provisional, subject to breaking changes if the proposal changes or is rejected. We have also revised our [policy](http://coffeescript.org/#contributing) on Stage 3 ECMAScript features, to support them when the features are [shipped](https://caniuse.com/#feat=es6-module-dynamic-import) in significant runtimes such as major browsers or Node.js.
-   There are now two browser versions of the CoffeeScript compiler: the traditional one that’s been published for years, and a new [ES module version](http://coffeescript.org/browser-compiler-modern/coffeescript.js) that can be used via `import`. If your browser supports it, it is in effect on this page. A reference to the ES module browser compiler is in the `package.json` `"module"` field.
-   The Node API now exposes the previously private `registerCompiled` method, to allow plugins that use the `coffeescript` package to take advantage of CoffeeScript’s internal caching.
-   Bugfixes for commas in strings in block arrays, a reference to `@` not being maintained in a `do` block in a class, and function default parameters should no longer be wrapped by extraneous parentheses.

### [2.3.2](https://github.com/jashkenas/coffeescript/compare/2.3.1...2.3.2) — September 19, 2018

-   Babel 7 is now supported. With version 7, the Babel team moved from `babel-core` on NPM to `@babel/core`. Now the CoffeeScript `--transpile` option will first search for `@babel/core` (Babel versions 7 and above) and then search for `babel-core` (versions 6 and below) to try to find an installed version of Babel to use for transpilation.
-   The syntax [`new.target`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/new.target) is now supported.
-   You can now follow the keyword `yield` with an indented object, like has already been allowed for `return` and other keywords.
-   Previously, any comments inside a JSX tag or attribute would cause interpolation braces (`{` and `}`) to be output. This is only necessary for line (`#`, or `//` in JavaScript) comments, not here (`###`, or `/* */`) comments; so now the compiler checks if all the comments that would trigger the braces are here comments, and if so it doesn’t generate the unnecessary interpolation braces.

### [2.3.1](https://github.com/jashkenas/coffeescript/compare/2.3.0...2.3.1) — May 21, 2018

-   Returning a JSX tag that is adjacent to another JSX tag, as opposed to returning a root JSX tag or fragment, is invalid JSX syntax. Babel throws an error on this, and now the CoffeeScript compiler does too.
-   Invalid indentation inside a JSX interpolation (the middle of `<tag>{ ... }</tag>`) now throws an error.
-   The browser compiler, used in [Try CoffeeScript](https://coffeescript.org/#try) and similar web-based CoffeeScript editors, now evaluates code in a global scope rather than the scope of the browser compiler. This improves performance of code executed via the browser compiler.
-   Syntax cleanup: it is now possible for an implicit function call to take a body-less class as an argument, and `?::` now behaves identically to `::` with regard to implying a line continuation.

### [2.3.0](https://github.com/jashkenas/coffeescript/compare/2.2.4...2.3.0) — April 29, 2018

-   This release adds support for all the new features and syntaxes in ES2018 that weren’t already possible in CoffeeScript. For all of the below features, make sure that you [transpile](http://coffeescript.org/#transpilation) unless you know that your target runtime(s) support each feature.
-   Asynchronous iterators are now supported. You can now `yield` an `await` call, e.g. `do -> until file.EOF then yield await file.readLine()`.
-   Object splats/destructuring, a.k.a. object rest/spread syntax, has been standardized as part of ES2018 and therefore this release removes the polyfill that had previously been supporting this syntax. Code like `{a, b, rest...} = obj` now outputs more or less just like it appears, rather than being converted into an `Object.assign` call. Note that there are [some subtle differences](https://developers.google.com/web/updates/2017/06/object-rest-spread) between the `Object.assign` polyfill and the native implementation.
-   The exponentiation operator, `**`, and exponentiation assignment operator `**=` are new to JavaScript in ES2018. Now code like `a ** 3` is output as it appears, rather than being converted into `Math.pow(a, 3)` as it was before.
-   The `s` (dotAll) flag is now supported in regular expressions.

### [2.2.4](https://github.com/jashkenas/coffeescript/compare/2.2.3...2.2.4) — March 29, 2018

-   When the `by` value in a `for` loop is a literal number, e.g. `for x in [2..1] by -1`, fewer checks are necessary to determine if the loop is in range.
-   Bugfix for regression in 2.2.0 where a statement inside parentheses, e.g. `(fn(); break) while condition`, was compiling. Pure statements like `break` or `return` cannot turn a parenthesized block into an expression, and should throw an error.

### [2.2.3](https://github.com/jashkenas/coffeescript/compare/2.2.2...2.2.3) — March 11, 2018

-   Bugfix for object destructuring with an empty array as a key’s value: `{ key: [] } = obj`.
-   Bugfix for array destructuring onto targets attached to `this`: `[ @most... , @penultimate, @last ] = arr`.

### [2.2.2](https://github.com/jashkenas/coffeescript/compare/2.2.1...2.2.2) — February 21, 2018

-   Bugfix for regression in 2.2.0 where a range with a `by` (step) value that increments or decrements in the opposite direction as the range was returning an array containing the first value of the range, whereas it should be returning an empty array. In other words, `x for x in [2..1] by 1` should equal `[]`, not `[2]` (because the step value is positive 1, counting up, whereas the range goes from 2 to 1, counting down).
-   Bugfixes for allowing backslashes in `import` and `export` statements and lines that trigger the start of an indented block, like an `if` statement.

### [2.2.1](https://github.com/jashkenas/coffeescript/compare/2.2.0...2.2.1) — February 6, 2018

-   Bugfix for regression in 2.2.0 involving an error thrown by the compiler in certain cases when using destructuring with a splat or expansion in an array.
-   Bugfix for regression in 2.2.0 where in certain cases a range iterator variable was declared in the global scope.

### [2.2.0](https://github.com/jashkenas/coffeescript/compare/2.1.1...2.2.0) — February 1, 2018

-   This release fixes _all_ currently open bugs, dating as far back as 2014, 2012 and 2011.
-   **Potential breaking change:** An inline `if` or `switch` statement with an ambiguous `else`, such as `if no then if yes then alert 1 else alert 2`, now compiles where the `else` always corresponds to the closest open `then`. Previously the behavior of an ambiguous `else` was unpredictable. If your code has any `if … then` or `switch … then` statements with multiple `then`s (and one or more `else`s) the compiled output might be different now, unless you had resolved ambiguity via parentheses. We made this change because the previous behavior was inconsistent and basically a bug: depending on what grammar was where, for example if there was an inline function or something that implied a block, the `else` might bind to an earlier `then` rather than a later `then`. Now an `else` essentially closes a block opened by a `then`, similar to closing an open parenthesis.
-   When a required `then` is missing, the error more accurately points out the location of the mistake.
-   An error is thrown when the `coffee` command is run in an environment that doesn’t support some ES2015 JavaScript features that the CoffeeScript compiler itself requires. This can happen if CoffeeScript is installed in Node older than version 6.
-   Destructuring with a non-final splat/spread, e.g. `[open, contents..., close] = tag.split('')` is now output using ES2015 rest syntax.
-   Functions named `get` or `set` can be used without parentheses in more cases, including when attached to `this` or `@` or `?.`; or when the first argument is an implicit object, e.g. `@set key: 'val'`.
-   Statements such as `break` can now be used inside parentheses, e.g. `(doSomething(); break) while condition` or `(pick(key); break) for key of obj`.
-   Bugfix for assigning to a property attached to `this`/`@` in destructuring, e.g. `({@prop = yes, @otherProp = no}) ->`.
-   Bugfix for incorrect errors being thrown about calling `super` with a parameter attached to `this` when said parameter is in a lower scope, e.g. `class Child extends Parent then constructor: -> super(-> @prop)`.
-   Bugfix to prevent a possible infinite loop when a `for` loop is given a variable to step by, e.g. `for x in [1..3] by step` (as opposed to `by 0.5` or some other primitive numeric value).
-   Bugfix to no longer declare iterator variables twice when evaluating a range, e.g. `end = 3; fn [0..end]`.
-   Bugfix for incorrect scope of variables in chained calls, e.g. `start(x = 3).then(-> x = 4)`.
-   Bugfix for incorrect scope of variables in a function passed to `do`, e.g. `for [1..3] then masked = 10; do -> alert masked`.
-   Bugfix to no longer throw a syntax error for a trailing comma in a function call, e.g. `fn arg1, arg2,`.
-   Bugfix for an expression in a property access, e.g. `a[!b in c..]`.
-   Bugfix to allow a line continuation backslash (`\`) at any point in a `for` line.

### [2.1.1](https://github.com/jashkenas/coffeescript/compare/2.1.0...2.1.1) — December 29, 2017

-   Bugfix to set the correct context for executable class bodies. So in `class @B extends @A then @property = 1`, the `@` in `@property` now refers to the class, not the global object.
-   Bugfix where anonymous classes were getting created using the same automatic variable name. They now each receive unique names, so as not to override each other.

### [2.1.0](https://github.com/jashkenas/coffeescript/compare/2.0.3...2.1.0) — December 10, 2017

-   Computed property keys in object literals are now supported: `obj = { ['key' + i]: 42 }`, or `obj = [Symbol.iterator]: -> yield i++`.
-   Skipping of array elements, a.k.a. elision, is now supported: `arr = [a, , b]`, or `[, protocol] = url.match /^(.*):\/\//`.
-   [JSX fragments syntax](https://reactjs.org/blog/2017/11/28/react-v16.2.0-fragment-support.html) is now supported.
-   Bugfix where `///` within a `#` line comment inside a `///` block regex was erroneously closing the regex, rather than being treated as part of the comment.
-   Bugfix for incorrect output for object rest destructuring inside array destructuring.

### [2.0.3](https://github.com/jashkenas/coffeescript/compare/2.0.2...2.0.3) — November 26, 2017

-   Bugfix for `export default` followed by an implicit object that contains an explicit object, for example `exportedMember: { obj... }`.
-   Bugfix for `key, val of obj` after an implicit object member, e.g. `foo: bar for key, val of obj`.
-   Bugfix for combining array and object destructuring, e.g. `[ ..., {a, b} ] = arr`.
-   Bugfix for an edge case where it was possible to create a bound (`=>`) generator function, which should throw an error as such functions aren’t allowed in ES2015.
-   Bugfix for source maps: `.map` files should always have the same base filename as the requested output filename. So `coffee --map --output foo.js test.coffee` should generate `foo.js` and `foo.js.map`.
-   Bugfix for incorrect source maps generated when using `--transpile` with `--map` for multiple input files.
-   Bugfix for comments at the beginning or end of input into the REPL (`coffee --interactive`).

### [2.0.2](https://github.com/jashkenas/coffeescript/compare/2.0.1...2.0.2) — October 26, 2017

-   `--transpile` now also applies to `require`d or `import`ed CoffeeScript files.
-   `--transpile` can be used with the REPL: `coffee --interactive --transpile`.
-   Improvements to comments output that should now cover all of the [Flow comment-based syntax](https://flow.org/en/docs/types/comments/). Inline `###` comments near [variable](https://flow.org/en/docs/types/variables/) initial assignments are now output in the variable declaration statement, and `###` comments near a [class and method names](https://flow.org/en/docs/types/generics/) are now output where Flow expects them.
-   Importing CoffeeScript keywords is now allowed, so long as they’re aliased: `import { and as andFn } from 'lib'`. (You could also do `import lib from 'lib'` and then reference `lib.and`.)
-   Calls to functions named `get` and `set` no longer throw an error when given a bracketless object literal as an argument: `obj.set propertyName: propertyValue`.
-   In the constructor of a derived class (a class that `extends` another class), you cannot call `super` with an argument that references `this`: `class Child extends Parent then constructor: (@arg) -> super(@arg)`. This isn’t allowed in JavaScript, and now the CoffeeScript compiler will throw an error. Instead, assign to `this` after calling `super`: `(arg) -> super(arg); @arg = arg`.
-   Bugfix for incorrect output when backticked statements and hoisted expressions were both in the same class body. This allows a backticked line like `` `field = 3` ``, for people using the experimental [class fields](https://github.com/tc39/proposal-class-fields) syntax, in the same class along with traditional class body expressions like `prop: 3` that CoffeeScript outputs as part of the class prototype.
-   Bugfix for comments not output before a complex `?` operation, e.g. `@a ? b`.
-   All tests now pass in Windows.

### [2.0.1](https://github.com/jashkenas/coffeescript/compare/2.0.0...2.0.1) — September 26, 2017

-   `babel-core` is no longer listed in `package.json`, even as an `optionalDependency`, to avoid it being automatically installed for most users. If you wish to use `--transpile`, simply install `babel-core` manually. See [Transpilation](http://coffeescript.org/#transpilation).
-   `--transpile` now relies on Babel to find its options, i.e. the `.babelrc` file in the path of the file(s) being compiled. (Previously the CoffeeScript compiler was duplicating this logic, so nothing has changed from a user’s perspective.) This provides automatic support for additional ways to pass options to Babel in future versions, such as the `.babelrc.js` file coming in Babel 7.
-   Backticked expressions in a class body, outside any class methods, are now output in the JavaScript class body itself. This allows for passing through experimental JavaScript syntax like the [class fields proposal](https://github.com/tc39/proposal-class-fields), assuming your [transpiler supports it](https://babeljs.io/docs/plugins/transform-class-properties/).

### [2.0.0](https://github.com/jashkenas/coffeescript/compare/2.0.0-beta5...2.0.0) — September 18, 2017

-   Added `--transpile` flag or `transpile` Node API option to tell the CoffeeScript compiler to pipe its output through Babel before saving or returning it; see [Transpilation](http://coffeescript.org/#transpilation). Also changed the `-t` short flag to refer to `--transpile` instead of `--tokens`.
-   Always populate source maps’ `sourcesContent` property.
-   Bugfixes for destructuring and for comments in JSX.
-   _Note that these are only the changes between 2.0.0-beta5 and 2.0.0. See below for all changes since 1.x._

### [2.0.0-beta5](https://github.com/jashkenas/coffeescript/compare/2.0.0-beta4...2.0.0-beta5) — September 2, 2017

-   Node 6 is now supported, and we will try to maintain that as the minimum required version for CoffeeScript 2 via the `coffee` command or Node API. Older versions of Node, or non-evergreen browsers, can compile via the [legacy browser compiler](http://coffeescript.org/browser-compiler-legacy/coffeescript.js).
-   The command line `--output` flag now allows you to specify an output filename, not just an output folder.
-   The command line `--require` flag now properly handles filenames or module names that are invalid identifiers (like an NPM module with a hyphen in the name).
-   `Object.assign`, output when object destructuring is used, is polyfilled using the same polyfill that Babel outputs. This means that polyfills shouldn’t be required unless support for Internet Explorer 8 or below is desired (or your own code uses a feature that requires a polyfill). See [ES2015+ Output](http://coffeescript.org/#es2015plus-output).
-   A string or JSX interpolation that contains only a comment (`"a#{### comment ###}b"` or `<div>{### comment ###}</div>`) is now output (`` `a${/* comment */}b` ``)
-   Interpolated strings (ES2015 template literals) that contain quotation marks no longer have the quotation marks escaped: `` `say "${message}"` ``
-   It is now possible to chain after a function literal (for example, to define a function and then call `.call` on it).
-   The results of the async tests are included in the output when you run `cake test`.
-   Bugfixes for object destructuring; expansions in function parameters; generated reference variables in function parameters; chained functions after `do`; splats after existential operator soaks in arrays (`[a?.b...]`); trailing `if` with splat in arrays or function parameters (`[a if b...]`); attempting to `throw` an `if`, `for`, `switch`, `while` or other invalid construct.
-   Bugfixes for syntactical edge cases: semicolons after `=` and other “mid-expression” tokens; spaces after `::`; and scripts that begin with `:` or `*`.
-   Bugfixes for source maps generated via the Node API; and stack trace line numbers when compiling CoffeeScript via the Node API from within a `.coffee` file.

### [2.0.0-beta4](https://github.com/jashkenas/coffeescript/compare/2.0.0-beta3...2.0.0-beta4) — August 3, 2017

-   This release includes [all the changes from 1.12.6 to 1.12.7](http://coffeescript.org/#1.12.7).
-   [Line comments](http://coffeescript.org/#comments) (starting with `#`) are now output in the generated JavaScript.
-   [Block comments](http://coffeescript.org/#comments) (delimited by `###`) are now allowed anywhere, including inline where they previously weren’t possible. This provides support for [static type annotations](http://coffeescript.org/#type-annotations) using Flow’s comments-based syntax.
-   Spread syntax (`...` for objects) is now supported in JSX tags: `<div {props...} />`.
-   Argument parsing for scripts run via `coffee` is improved. See [breaking changes](http://coffeescript.org/#breaking-changes-argument-parsing-and-shebang-lines).
-   CLI: Propagate `SIGINT` and `SIGTERM` signals when node is forked.
-   `await` in the REPL is now allowed without requiring a wrapper function.
-   `do super` is now allowed, and other accesses of `super` like `super.x.y` or `super['x'].y` now work.
-   Splat/spread syntax triple dots are now allowed on either the left or the right (so `props...` or `...props` are both valid).
-   Tagged template literals are recognized as callable functions.
-   Bugfixes for object spread syntax in nested properties.
-   Bugfixes for destructured function parameter default values.

### [2.0.0-beta3](https://github.com/jashkenas/coffeescript/compare/2.0.0-beta2...2.0.0-beta3) — June 30, 2017

-   [JSX](http://coffeescript.org/#jsx) is now supported.
-   [Object rest/spread properties](http://coffeescript.org/#object-spread) are now supported.
-   Bound (fat arrow) methods are once again supported in classes; though an error will be thrown if you attempt to call the method before it is bound. See [breaking changes for classes](http://coffeescript.org/#breaking-changes-classes).
-   The REPL no longer warns about assigning to `_`.
-   Bugfixes for destructured nested default values and issues related to chaining or continuing expressions across multiple lines.

### [2.0.0-beta2](https://github.com/jashkenas/coffeescript/compare/2.0.0-beta1...2.0.0-beta2) — May 16, 2017

-   This release includes [all the changes from 1.12.5 to 1.12.6](http://coffeescript.org/#1.12.6).
-   Bound (fat arrow) methods in classes must be declared in the class constructor, after `super()` if the class is extending a parent class. See [breaking changes for classes](http://coffeescript.org/#breaking-changes-classes).
-   All unnecessary utility helper functions have been removed, including the polyfills for `indexOf` and `bind`.
-   The `extends` keyword now only works in the context of classes; it cannot be used to extend a function prototype. See [breaking changes for `extends`](http://coffeescript.org/#breaking-changes-super-extends).
-   Literate CoffeeScript is now parsed entirely based on indentation, similar to the 1.x implementation; there is no longer a dependency for parsing Markdown. See [breaking changes for Literate CoffeeScript parsing](http://coffeescript.org/#breaking-changes-literate-coffeescript).
-   JavaScript reserved words used as properties are no longer wrapped in quotes.
-   `require('coffeescript')` should now work in non-Node environments such as the builds created by Webpack or Browserify. This provides a more convenient way to include the browser compiler in builds intending to run in a browser environment.
-   Unreachable `break` statements are no longer added after `switch` cases that `throw` exceptions.
-   The browser compiler is now compiled using Babili and transpiled down to Babel’s `env` preset (should be safe for use in all browsers in current use, not just evergreen versions).
-   Calling functions `@get` or `@set` no longer throws an error about required parentheses. (Bare `get` or `set`, not attached to an object or `@`, [still intentionally throws a compiler error](http://coffeescript.org/#unsupported-get-set).)
-   If `$XDG_CACHE_HOME` is set, the REPL `.coffee_history` file is saved there.

### [2.0.0-beta1](https://github.com/jashkenas/coffeescript/compare/2.0.0-alpha1...2.0.0-beta1) — April 14, 2017

-   Initial beta release of CoffeeScript 2. No further breaking changes are anticipated.
-   Destructured objects and arrays now output using ES2015+ syntax whenever possible.
-   Literate CoffeeScript now has much better support for parsing Markdown, thanks to using [Markdown-It](https://github.com/markdown-it/markdown-it) to detect Markdown sections rather than just looking at indentation.
-   Calling a function named `get` or `set` now requires parentheses, to disambiguate from the `get` or `set` keywords (which are [disallowed](http://coffeescript.org/#unsupported-get-set)).
-   The compiler now requires Node 7.6+, the first version of Node to support asynchronous functions without requiring a flag.

### [2.0.0-alpha1](https://github.com/jashkenas/coffeescript/compare/1.12.4...2.0.0-alpha1) — February 21, 2017

-   Initial alpha release of CoffeeScript 2. The CoffeeScript compiler now outputs ES2015+ syntax whenever possible. See [breaking changes](http://coffeescript.org/#breaking-changes).
-   Classes are output using ES2015 `class` and `extends` keywords.
-   Added support for `async`/`await`.
-   Bound (arrow) functions now output as `=>` functions.
-   Function parameters with default values now use ES2015 default values syntax.
-   Splat function parameters now use ES2015 spread syntax.
-   Computed properties now use ES2015 syntax.
-   Interpolated strings (template literals) now use ES2015 backtick syntax.
-   Improved support for recognizing Markdown in Literate CoffeeScript files.
-   Mixing tabs and spaces in indentation is now disallowed.
-   Browser compiler is now minified using the Google Closure Compiler (JavaScript version).
-   Node 7+ required for CoffeeScript 2.

### [1.12.7](https://github.com/jashkenas/coffeescript/compare/1.12.6...1.12.7) — July 16, 2017

-   Fix regressions in 1.12.6 related to chained function calls and indented `return` and `throw` arguments.
-   The REPL no longer warns about assigning to `_`.

### [1.12.6](https://github.com/jashkenas/coffeescript/compare/1.12.5...1.12.6) — May 15, 2017

-   The `return` and `export` keywords can now accept implicit objects (defined by indentation, without needing braces).
-   Support Unicode code point escapes (e.g. `\u{1F4A9}`).
-   The `coffee` command now first looks to see if CoffeeScript is installed under `node_modules` in the current folder, and executes the `coffee` binary there if so; or otherwise it runs the globally installed one. This allows you to have one version of CoffeeScript installed globally and a different one installed locally for a particular project. (Likewise for the `cake` command.)
-   Bugfixes for chained function calls not closing implicit objects or ternaries.
-   Bugfixes for incorrect code generated by the `?` operator within a termary `if` statement.
-   Fixed some tests, and failing tests now result in a nonzero exit code.

### [1.12.5](https://github.com/jashkenas/coffeescript/compare/1.12.4...1.12.5) — April 10, 2017

-   Better handling of `default`, `from`, `as` and `*` within `import` and `export` statements. You can now import or export a member named `default` and the compiler won’t interpret it as the `default` keyword.
-   Fixed a bug where invalid octal escape sequences weren’t throwing errors in the compiler.

### [1.12.4](https://github.com/jashkenas/coffeescript/compare/1.12.3...1.12.4) — February 18, 2017

-   The `cake` commands have been updated, with new `watch` options for most tasks. Clone the [CoffeeScript repo](https://github.com/jashkenas/coffeescript) and run `cake` at the root of the repo to see the options.
-   Fixed a bug where `export`ing a referenced variable was preventing the variable from being declared.
-   Fixed a bug where the `coffee` command wasn’t working for a `.litcoffee` file.
-   Bugfixes related to tokens and location data, for better source maps and improved compatibility with downstream tools.

### [1.12.3](https://github.com/jashkenas/coffeescript/compare/1.12.2...1.12.3) — January 24, 2017

-   `@` values can now be used as indices in `for` expressions. This loosens the compilation of `for` expressions to allow the index variable to be an `@` value, e.g. `do @visit for @node, @index in nodes`. Within `@visit`, the index of the current node (`@node`) would be available as `@index`.
-   CoffeeScript’s patched `Error.prepareStackTrace` has been restored, with some revisions that should prevent the erroneous exceptions that were making life difficult for some downstream projects. This fixes the incorrect line numbers in stack traces since 1.12.2.
-   The `//=` operator’s output now wraps parentheses around the right operand, like the other assignment operators.

### [1.12.2](https://github.com/jashkenas/coffeescript/compare/1.12.1...1.12.2) — December 16, 2016

-   The browser compiler can once again be built unminified via `MINIFY=false cake build:browser`.
-   The error-prone patched version of `Error.prepareStackTrace` has been removed.
-   Command completion in the REPL (pressing tab to get suggestions) has been fixed for Node 6.9.1+.
-   The [browser-based tests](http://coffeescript.org/v2/test.html) now include all the tests as the Node-based version.

### [1.12.1](https://github.com/jashkenas/coffeescript/compare/1.12.0...1.12.1) — December 7, 2016

-   You can now import a module member named `default`, e.g. `import { default } from 'lib'`. Though like in ES2015, you cannot import an entire module and name it `default` (so `import default from 'lib'` is not allowed).
-   Fix regression where `from` as a variable name was breaking `for` loop declarations. For the record, `from` is not a reserved word in CoffeeScript; you may use it for variable names. `from` behaves like a keyword within the context of `import` and `export` statements, and in the declaration of a `for` loop; though you should also be able to use variables named `from` in those contexts, and the compiler should be able to tell the difference.

### [1.12.0](https://github.com/jashkenas/coffeescript/compare/1.11.1...1.12.0) — December 4, 2016

-   CoffeeScript now supports ES2015 [tagged template literals](http://coffeescript.org/#tagged-template-literals). Note that using tagged template literals in your code makes you responsible for ensuring that either your runtime supports tagged template literals or that you transpile the output JavaScript further to a version your target runtime(s) support.
-   CoffeeScript now provides a [`for…from`](http://coffeescript.org/#generator-iteration) syntax for outputting ES2015 [`for…of`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...of). (Sorry they couldn’t match, but we came up with `for…of` first for something else.) This allows iterating over generators or any other iterable object. Note that using `for…from` in your code makes you responsible for ensuring that either your runtime supports `for…of` or that you transpile the output JavaScript further to a version your target runtime(s) support.
-   Triple backticks ( ` ````) allow the creation of embedded JavaScript blocks where escaping single backticks is not required, which should improve interoperability with ES2015 template literals and with Markdown.
-   Within single-backtick embedded JavaScript, backticks can now be escaped via ``\```.
-   The browser tests now run in the browser again, and are accessible [here](http://coffeescript.org/v2/test.html) if you would like to test your browser.
-   CoffeeScript-only keywords in ES2015 `import`s and `export`s are now ignored.
-   The compiler now throws an error on trying to export an anonymous class.
-   Bugfixes related to tokens and location data, for better source maps and improved compatibility with downstream tools.

### [1.11.1](https://github.com/jashkenas/coffeescript/compare/1.11.0...1.11.1) — October 2, 2016

-   Bugfix for shorthand object syntax after interpolated keys.
-   Bugfix for indentation-stripping in `"""` strings.
-   Bugfix for not being able to use the name “arguments” for a prototype property of class.
-   Correctly compile large hexadecimal numbers literals to `2e308` (just like all other large number literals do).

### [1.11.0](https://github.com/jashkenas/coffeescript/compare/1.10.0...1.11.0) — September 24, 2016

-   CoffeeScript now supports ES2015 [`import` and `export` syntax](http://coffeescript.org/#modules).
-   Added the `-M, --inline-map` flag to the compiler, allowing you embed the source map directly into the output JavaScript, rather than as a separate file.
-   A bunch of fixes for `yield`:
    -   `yield return` can no longer mistakenly be used as an expression.
    -   `yield` now mirrors `return` in that it can be used stand-alone as well as with expressions. Where you previously wrote `yield undefined`, you may now write simply `yield`. However, this means also inheriting the same syntax limitations that `return` has, so these examples no longer compile:
        
        > ```
        > doubles = ->
        >   yield for i in [1..3]
        >     i * 2
        > six = ->
        >   yield
        >     2 * 3
        > ```
        
    -   The JavaScript output is a bit nicer, with unnecessary parentheses and spaces, double indentation and double semicolons around `yield` no longer present.
-   `&&=`, `||=`, `and=` and `or=` no longer accidentally allow a space before the equals sign.
-   Improved several error messages.
-   Just like `undefined` compiles to `void 0`, `NaN` now compiles into `0/0` and `Infinity` into `2e308`.
-   Bugfix for renamed destructured parameters with defaults. `({a: b = 1}) ->` no longer crashes the compiler.
-   Improved the internal representation of a CoffeeScript program. This is only noticeable to tools that use `CoffeeScript.tokens` or `CoffeeScript.nodes`. Such tools need to update to take account for changed or added tokens and nodes.
-   Several minor bug fixes, including:
    -   The caught error in `catch` blocks is no longer declared unnecessarily, and no longer mistakenly named `undefined` for `catch`\-less `try` blocks.
    -   Unassignable parameter destructuring no longer crashes the compiler.
    -   Source maps are now used correctly for errors thrown from .coffee.md files.
    -   `coffee -e 'throw null'` no longer crashes.
    -   The REPL no longer crashes when using `.exit` to exit it.
    -   Invalid JavaScript is no longer output when lots of `for` loops are used in the same scope.
    -   A unicode issue when using stdin with the CLI.

### [1.10.0](https://github.com/jashkenas/coffeescript/compare/1.9.3...1.10.0) — September 3, 2015

-   CoffeeScript now supports ES2015-style destructuring defaults.
-   `(offsetHeight: height) ->` no longer compiles. That syntax was accidental and partly broken. Use `({offsetHeight: height}) ->` instead. Object destructuring always requires braces.
-   Several minor bug fixes, including:
    -   A bug where the REPL would sometimes report valid code as invalid, based on what you had typed earlier.
    -   A problem with multiple JS contexts in the jest test framework.
    -   An error in io.js where strict mode is set on internal modules.
    -   A variable name clash for the caught error in `catch` blocks.

### [1.9.3](https://github.com/jashkenas/coffeescript/compare/1.9.2...1.9.3) — May 27, 2015

-   Bugfix for interpolation in the first key of an object literal in an implicit call.
-   Fixed broken error messages in the REPL, as well as a few minor bugs with the REPL.
-   Fixed source mappings for tokens at the beginning of lines when compiling with the `--bare` option. This has the nice side effect of generating smaller source maps.
-   Slight formatting improvement of compiled block comments.
-   Better error messages for `on`, `off`, `yes` and `no`.

### [1.9.2](https://github.com/jashkenas/coffeescript/compare/1.9.1...1.9.2) — April 15, 2015

-   Fixed a **watch** mode error introduced in 1.9.1 when compiling multiple files with the same filename.
-   Bugfix for `yield` around expressions containing `this`.
-   Added a Ruby-style `-r` option to the REPL, which allows requiring a module before execution with `--eval` or `--interactive`.
-   In `<script type="text/coffeescript">` tags, to avoid possible duplicate browser requests for .coffee files, you can now use the `data-src` attribute instead of `src`.
-   Minor bug fixes for IE8, strict ES5 regular expressions and Browserify.

### [1.9.1](https://github.com/jashkenas/coffeescript/compare/1.9.0...1.9.1) — February 18, 2015

-   Interpolation now works in object literal keys (again). You can use this to dynamically name properties.
-   Internal compiler variable names no longer start with underscores. This makes the generated JavaScript a bit prettier, and also fixes an issue with the completely broken and ungodly way that AngularJS “parses” function arguments.
-   Fixed a few `yield`\-related edge cases with `yield return` and `yield throw`.
-   Minor bug fixes and various improvements to compiler error messages.

### [1.9.0](https://github.com/jashkenas/coffeescript/compare/1.8.0...1.9.0) — January 29, 2015

-   CoffeeScript now supports ES2015 generators. A generator is simply a function that `yield`s.
-   More robust parsing and improved error messages for strings and regexes — especially with respect to interpolation.
-   Changed strategy for the generation of internal compiler variable names. Note that this means that `@example` function parameters are no longer available as naked `example` variables within the function body.
-   Fixed REPL compatibility with latest versions of Node and Io.js.
-   Various minor bug fixes.

### [1.8.0](https://github.com/jashkenas/coffeescript/compare/1.7.1...1.8.0) — August 26, 2014

-   The `--join` option of the CLI is now deprecated.
-   Source maps now use `.js.map` as file extension, instead of just `.map`.
-   The CLI now exits with the exit code 1 when it fails to write a file to disk.
-   The compiler no longer crashes on unterminated, single-quoted strings.
-   Fixed location data for string interpolations, which made source maps out of sync.
-   The error marker in error messages is now correctly positioned if the code is indented with tabs.
-   Fixed a slight formatting error in CoffeeScript’s source map-patched stack traces.
-   The `%%` operator now coerces its right operand only once.
-   It is now possible to require CoffeeScript files from Cakefiles without having to register the compiler first.
-   The CoffeeScript REPL is now exported and can be required using `require 'coffeescript/repl'`.
-   Fixes for the REPL in Node 0.11.

### [1.7.1](https://github.com/jashkenas/coffeescript/compare/1.7.0...1.7.1) — January 29, 2014

-   Fixed a typo that broke node module lookup when running a script directly with the `coffee` binary.

### [1.7.0](https://github.com/jashkenas/coffeescript/compare/1.6.3...1.7.0) — January 28, 2014

-   When requiring CoffeeScript files in Node you must now explicitly register the compiler. This can be done with `require 'coffeescript/register'` or `CoffeeScript.register()`. Also for configuration such as Mocha’s, use **coffeescript/register**.
-   Improved error messages, source maps and stack traces. Source maps now use the updated `//#` syntax.
-   Leading `.` now closes all open calls, allowing for simpler chaining syntax.
-   Added `**`, `//` and `%%` operators and `...` expansion in parameter lists and destructuring expressions.
-   Multiline strings are now joined by a single space and ignore all indentation. A backslash at the end of a line can denote the amount of whitespace between lines, in both strings and heredocs. Backslashes correctly escape whitespace in block regexes.
-   Closing brackets can now be indented and therefore no longer cause unexpected error.
-   Several breaking compilation fixes. Non-callable literals (strings, numbers etc.) don’t compile in a call now and multiple postfix conditionals compile properly. Postfix conditionals and loops always bind object literals. Conditional assignment compiles properly in subexpressions. `super` is disallowed outside of methods and works correctly inside `for` loops.
-   Formatting of compiled block comments has been improved.
-   No more `-p` folders on Windows.
-   The `options` object passed to CoffeeScript is no longer mutated.

### [1.6.3](https://github.com/jashkenas/coffeescript/compare/1.6.2...1.6.3) — June 2, 2013

-   The CoffeeScript REPL now remembers your history between sessions. Just like a proper REPL should.
-   You can now use `require` in Node to load `.coffee.md` Literate CoffeeScript files. In the browser, `text/literate-coffeescript` script tags.
-   The old `coffee --lint` command has been removed. It was useful while originally working on the compiler, but has been surpassed by JSHint. You may now use `-l` to pass literate files in over **stdio**.
-   Bugfixes for Windows path separators, `catch` without naming the error, and executable-class-bodies-with- prototypal-property-attachment.

### [1.6.2](https://github.com/jashkenas/coffeescript/compare/1.6.1...1.6.2) — March 18, 2013

-   Source maps have been used to provide automatic line-mapping when running CoffeeScript directly via the `coffee` command, and for automatic line-mapping when running CoffeeScript directly in the browser. Also, to provide better error messages for semantic errors thrown by the compiler — [with colors, even](https://cl.ly/NdOA).
-   Improved support for mixed literate/vanilla-style CoffeeScript projects, and generating source maps for both at the same time.
-   Fixes for **1.6.x** regressions with overriding inherited bound functions, and for Windows file path management.
-   The `coffee` command can now correctly `fork()` both `.coffee` and `.js` files. (Requires Node.js 0.9+)

### [1.6.1](https://github.com/jashkenas/coffeescript/compare/1.5.0...1.6.1) — March 5, 2013

-   First release of [source maps](http://coffeescript.org/#source-maps). Pass the `--map` flag to the compiler, and off you go. Direct all your thanks over to [Jason Walton](https://github.com/jwalton).
-   Fixed a 1.5.0 regression with multiple implicit calls against an indented implicit object. Combinations of implicit function calls and implicit objects should generally be parsed better now — but it still isn’t good _style_ to nest them too heavily.
-   `.coffee.md` is now also supported as a Literate CoffeeScript file extension, for existing tooling. `.litcoffee` remains the canonical one.
-   Several minor fixes surrounding member properties, bound methods and `super` in class declarations.

### [1.5.0](https://github.com/jashkenas/coffeescript/compare/1.4.0...1.5.0) — February 25, 2013

-   First release of [Literate CoffeeScript](http://coffeescript.org/#literate).
-   The CoffeeScript REPL is now based on the Node.js REPL, and should work better and more familiarly.
-   Returning explicit values from constructors is now forbidden. If you want to return an arbitrary value, use a function, not a constructor.
-   You can now loop over an array backwards, without having to manually deal with the indexes: `for item in list by -1`
-   Source locations are now preserved in the CoffeeScript AST, although source maps are not yet being emitted.

### [1.4.0](https://github.com/jashkenas/coffeescript/compare/1.3.3...1.4.0) — October 23, 2012

-   The CoffeeScript compiler now strips Microsoft’s UTF-8 BOM if it exists, allowing you to compile BOM-borked source files.
-   Fix Node/compiler deprecation warnings by removing `registerExtension`, and moving from `path.exists` to `fs.exists`.
-   Small tweaks to splat compilation, backticks, slicing, and the error for duplicate keys in object literals.

### [1.3.3](https://github.com/jashkenas/coffeescript/compare/1.3.1...1.3.3) — May 15, 2012

-   Due to the new semantics of JavaScript’s strict mode, CoffeeScript no longer guarantees that constructor functions have names in all runtimes. See [#2052](https://github.com/jashkenas/coffeescript/issues/2052) for discussion.
-   Inside of a nested function inside of an instance method, it’s now possible to call `super` more reliably (walks recursively up).
-   Named loop variables no longer have different scoping heuristics than other local variables. (Reverts #643)
-   Fix for splats nested within the LHS of destructuring assignment.
-   Corrections to our compile time strict mode forbidding of octal literals.

### [1.3.1](https://github.com/jashkenas/coffeescript/compare/1.2.0...1.3.1) — April 10, 2012

-   CoffeeScript now enforces all of JavaScript’s **Strict Mode** early syntax errors at compile time. This includes old-style octal literals, duplicate property names in object literals, duplicate parameters in a function definition, deleting naked variables, setting the value of `eval` or `arguments`, and more. See a full discussion at [#1547](https://github.com/jashkenas/coffeescript/issues/1547).
-   The REPL now has a handy new multi-line mode for entering large blocks of code. It’s useful when copy-and-pasting examples into the REPL. Enter multi-line mode with `Ctrl-V`. You may also now pipe input directly into the REPL.
-   CoffeeScript now prints a `Generated by CoffeeScript VERSION` header at the top of each compiled file.
-   Conditional assignment of previously undefined variables `a or= b` is now considered a syntax error.
-   A tweak to the semantics of `do`, which can now be used to more easily simulate a namespace: `do (x = 1, y = 2) -> …`
-   Loop indices are now mutable within a loop iteration, and immutable between them.
-   Both endpoints of a slice are now allowed to be omitted for consistency, effectively creating a shallow copy of the list.
-   Additional tweaks and improvements to `coffee --watch` under Node’s “new” file watching API. Watch will now beep by default if you introduce a syntax error into a watched script. We also now ignore hidden directories by default when watching recursively.

### [1.2.0](https://github.com/jashkenas/coffeescript/compare/1.1.3...1.2.0) — December 18, 2011

-   Multiple improvements to `coffee --watch` and `--join`. You may now use both together, as well as add and remove files and directories within a `--watch`’d folder.
-   The `throw` statement can now be used as part of an expression.
-   Block comments at the top of the file will now appear outside of the safety closure wrapper.
-   Fixed a number of minor 1.1.3 regressions having to do with trailing operators and unfinished lines, and a more major 1.1.3 regression that caused bound functions _within_ bound class functions to have the incorrect `this`.

### [1.1.3](https://github.com/jashkenas/coffeescript/compare/1.1.2...1.1.3) — November 8, 2011

-   Ahh, whitespace. CoffeeScript’s compiled JS now tries to space things out and keep it readable, as you can see in the examples on this page.
-   You can now call `super` in class level methods in class bodies, and bound class methods now preserve their correct context.
-   JavaScript has always supported octal numbers `010 is 8`, and hexadecimal numbers `0xf is 15`, but CoffeeScript now also supports binary numbers: `0b10 is 2`.
-   The CoffeeScript module has been nested under a subdirectory to make it easier to `require` individual components separately, without having to use **npm**. For example, after adding the CoffeeScript folder to your path: `require('coffeescript/lexer')`
-   There’s a new “link” feature in Try CoffeeScript on this webpage. Use it to get a shareable permalink for your example script.
-   The `coffee --watch` feature now only works on Node.js 0.6.0 and higher, but now also works properly on Windows.
-   Lots of small bug fixes from **[@michaelficarra](https://github.com/michaelficarra)**, **[@geraldalewis](https://github.com/geraldalewis)**, **[@satyr](https://github.com/satyr)**, and **[@trevorburnham](https://github.com/trevorburnham)**.

### [1.1.2](https://github.com/jashkenas/coffeescript/compare/1.1.1...1.1.2) — August 4, 2011

Fixes for block comment formatting, `?=` compilation, implicit calls against control structures, implicit invocation of a try/catch block, variadic arguments leaking from local scope, line numbers in syntax errors following heregexes, property access on parenthesized number literals, bound class methods and super with reserved names, a REPL overhaul, consecutive compiled semicolons, block comments in implicitly called objects, and a Chrome bug.

### [1.1.1](https://github.com/jashkenas/coffeescript/compare/1.1.0...1.1.1) — May 10, 2011

Bugfix release for classes with external constructor functions, see issue #1182.

### [1.1.0](https://github.com/jashkenas/coffeescript/compare/1.0.1...1.1.0) — May 1, 2011

When running via the `coffee` executable, `process.argv` and friends now report `coffee` instead of `node`. Better compatibility with **Node.js 0.4.x** module lookup changes. The output in the REPL is now colorized, like Node’s is. Giving your concatenated CoffeeScripts a name when using `--join` is now mandatory. Fix for lexing compound division `/=` as a regex accidentally. All `text/coffeescript` tags should now execute in the order they’re included. Fixed an issue with extended subclasses using external constructor functions. Fixed an edge-case infinite loop in `addImplicitParentheses`. Fixed exponential slowdown with long chains of function calls. Globals no longer leak into the CoffeeScript REPL. Splatted parameters are declared local to the function.

### [1.0.1](https://github.com/jashkenas/coffeescript/compare/1.0.0...1.0.1) — January 31, 2011

Fixed a lexer bug with Unicode identifiers. Updated REPL for compatibility with Node.js 0.3.7. Fixed requiring relative paths in the REPL. Trailing `return` and `return undefined` are now optimized away. Stopped requiring the core Node.js `util` module for back-compatibility with Node.js 0.2.5. Fixed a case where a conditional `return` would cause fallthrough in a `switch` statement. Optimized empty objects in destructuring assignment.

### [1.0.0](https://github.com/jashkenas/coffeescript/compare/0.9.6...1.0.0) — December 24, 2010

CoffeeScript loops no longer try to preserve block scope when functions are being generated within the loop body. Instead, you can use the `do` keyword to create a convenient closure wrapper. Added a `--nodejs` flag for passing through options directly to the `node` executable. Better behavior around the use of pure statements within expressions. Fixed inclusive slicing through `-1`, for all browsers, and splicing with arbitrary expressions as endpoints.

### [0.9.6](https://github.com/jashkenas/coffeescript/compare/0.9.5...0.9.6) — December 6, 2010

The REPL now properly formats stacktraces, and stays alive through asynchronous exceptions. Using `--watch` now prints timestamps as files are compiled. Fixed some accidentally-leaking variables within plucked closure-loops. Constructors now maintain their declaration location within a class body. Dynamic object keys were removed. Nested classes are now supported. Fixes execution context for naked splatted functions. Bugfix for inversion of chained comparisons. Chained class instantiation now works properly with splats.

### [0.9.5](https://github.com/jashkenas/coffeescript/compare/0.9.4...0.9.5) — November 21, 2010

0.9.5 should be considered the first release candidate for CoffeeScript 1.0. There have been a large number of internal changes since the previous release, many contributed from **satyr**’s [Coco](https://github.com/satyr/coco) dialect of CoffeeScript. Heregexes (extended regexes) were added. Functions can now have default arguments. Class bodies are now executable code. Improved syntax errors for invalid CoffeeScript. `undefined` now works like `null`, and cannot be assigned a new value. There was a precedence change with respect to single-line comprehensions: `result = i for i in list` used to parse as `result = (i for i in list)` by default … it now parses as `(result = i) for i in list`.

### [0.9.4](https://github.com/jashkenas/coffeescript/compare/0.9.3...0.9.4) — September 21, 2010

CoffeeScript now uses appropriately-named temporary variables, and recycles their references after use. Added `require.extensions` support for **Node.js 0.3**. Loading CoffeeScript in the browser now adds just a single `CoffeeScript` object to global scope. Fixes for implicit object and block comment edge cases.

### [0.9.3](https://github.com/jashkenas/coffeescript/compare/0.9.2...0.9.3) — September 16, 2010

CoffeeScript `switch` statements now compile into JS `switch` statements — they previously compiled into `if/else` chains for JavaScript 1.3 compatibility. Soaking a function invocation is now supported. Users of the RubyMine editor should now be able to use `--watch` mode.

### [0.9.2](https://github.com/jashkenas/coffeescript/compare/0.9.1...0.9.2) — August 23, 2010

Specifying the start and end of a range literal is now optional, eg. `array[3..]`. You can now say `a not instanceof b`. Fixed important bugs with nested significant and non-significant indentation (Issue #637). Added a `--require` flag that allows you to hook into the `coffee` command. Added a custom `jsl.conf` file for our preferred JavaScriptLint setup. Sped up Jison grammar compilation time by flattening rules for operations. Block comments can now be used with JavaScript-minifier-friendly syntax. Added JavaScript’s compound assignment bitwise operators. Bugfixes to implicit object literals with leading number and string keys, as the subject of implicit calls, and as part of compound assignment.

### [0.9.1](https://github.com/jashkenas/coffeescript/compare/0.9.0...0.9.1) — August 11, 2010

Bugfix release for **0.9.1**. Greatly improves the handling of mixed implicit objects, implicit function calls, and implicit indentation. String and regex interpolation is now strictly `#{ … }` (Ruby style). The compiler now takes a `--require` flag, which specifies scripts to run before compilation.

### [0.9.0](https://github.com/jashkenas/coffeescript/compare/0.7.2...0.9.0) — August 4, 2010

The CoffeeScript **0.9** series is considered to be a release candidate for **1.0**; let’s give her a shakedown cruise. **0.9.0** introduces a massive backwards-incompatible change: Assignment now uses `=`, and object literals use `:`, as in JavaScript. This allows us to have implicit object literals, and YAML-style object definitions. Half assignments are removed, in favor of `+=`, `or=`, and friends. Interpolation now uses a hash mark `#` instead of the dollar sign `$` — because dollar signs may be part of a valid JS identifier. Downwards range comprehensions are now safe again, and are optimized to straight for loops when created with integer endpoints. A fast, unguarded form of object comprehension was added: `for all key, value of object`. Mentioning the `super` keyword with no arguments now forwards all arguments passed to the function, as in Ruby. If you extend class `B` from parent class `A`, if `A` has an `extended` method defined, it will be called, passing in `B` — this enables static inheritance, among other things. Cleaner output for functions bound with the fat arrow. `@variables` can now be used in parameter lists, with the parameter being automatically set as a property on the object — useful in constructors and setter functions. Constructor functions can now take splats.

### [0.7.2](https://github.com/jashkenas/coffeescript/compare/0.7.1...0.7.2) — July 12, 2010

Quick bugfix (right after 0.7.1) for a problem that prevented `coffee` command-line options from being parsed in some circumstances.

### [0.7.1](https://github.com/jashkenas/coffeescript/compare/0.7.0...0.7.1) — July 11, 2010

Block-style comments are now passed through and printed as JavaScript block comments – making them useful for licenses and copyright headers. Better support for running coffee scripts standalone via hashbangs. Improved syntax errors for tokens that are not in the grammar.

### [0.7.0](https://github.com/jashkenas/coffeescript/compare/0.6.2...0.7.0) — June 28, 2010

Official CoffeeScript variable style is now camelCase, as in JavaScript. Reserved words are now allowed as object keys, and will be quoted for you. Range comprehensions now generate cleaner code, but you have to specify `by -1` if you’d like to iterate downward. Reporting of syntax errors is greatly improved from the previous release. Running `coffee` with no arguments now launches the REPL, with Readline support. The `<-` bind operator has been removed from CoffeeScript. The `loop` keyword was added, which is equivalent to a `while true` loop. Comprehensions that contain closures will now close over their variables, like the semantics of a `forEach`. You can now use bound function in class definitions (bound to the instance). For consistency, `a in b` is now an array presence check, and `a of b` is an object-key check. Comments are no longer passed through to the generated JavaScript.

### [0.6.2](https://github.com/jashkenas/coffeescript/compare/0.6.1...0.6.2) — May 15, 2010

The `coffee` command will now preserve directory structure when compiling a directory full of scripts. Fixed two omissions that were preventing the CoffeeScript compiler from running live within Internet Explorer. There’s now a syntax for block comments, similar in spirit to CoffeeScript’s heredocs. ECMA Harmony DRY-style pattern matching is now supported, where the name of the property is the same as the name of the value: `{name, length}: func`. Pattern matching is now allowed within comprehension variables. `unless` is now allowed in block form. `until` loops were added, as the inverse of `while` loops. `switch` statements are now allowed without switch object clauses. Compatible with Node.js **v0.1.95**.

### [0.6.1](https://github.com/jashkenas/coffeescript/compare/0.6.0...0.6.1) — April 12, 2010

Upgraded CoffeeScript for compatibility with the new Node.js **v0.1.90** series.

### [0.6.0](https://github.com/jashkenas/coffeescript/compare/0.5.6...0.6.0) — April 3, 2010

Trailing commas are now allowed, a-la Python. Static properties may be assigned directly within class definitions, using `@property` notation.

### [0.5.6](https://github.com/jashkenas/coffeescript/compare/0.5.5...0.5.6) — March 23, 2010

Interpolation can now be used within regular expressions and heredocs, as well as strings. Added the `<-` bind operator. Allowing assignment to half-expressions instead of special `||=`\-style operators. The arguments object is no longer automatically converted into an array. After requiring `coffeescript`, Node.js can now directly load `.coffee` files, thanks to **registerExtension**. Multiple splats can now be used in function calls, arrays, and pattern matching.

### [0.5.5](https://github.com/jashkenas/coffeescript/compare/0.5.4...0.5.5) — March 8, 2010

String interpolation, contributed by [Stan Angeloff](https://github.com/StanAngeloff). Since `--run` has been the default since **0.5.3**, updating `--stdio` and `--eval` to run by default, pass `--compile` as well if you’d like to print the result.

### [0.5.4](https://github.com/jashkenas/coffeescript/compare/0.5.3...0.5.4) — March 3, 2010

Bugfix that corrects the Node.js global constants `__filename` and `__dirname`. Tweaks for more flexible parsing of nested function literals and improperly-indented comments. Updates for the latest Node.js API.

### [0.5.3](https://github.com/jashkenas/coffeescript/compare/0.5.2...0.5.3) — February 27, 2010

CoffeeScript now has a syntax for defining classes. Many of the core components (Nodes, Lexer, Rewriter, Scope, Optparse) are using them. Cakefiles can use `optparse.coffee` to define options for tasks. `--run` is now the default flag for the `coffee` command, use `--compile` to save JavaScripts. Bugfix for an ambiguity between RegExp literals and chained divisions.

### [0.5.2](https://github.com/jashkenas/coffeescript/compare/0.5.1...0.5.2) — February 25, 2010

Added a compressed version of the compiler for inclusion in web pages as `/v2/browser-compiler-legacy/coffeescript.js`. It’ll automatically run any script tags with type `text/coffeescript` for you. Added a `--stdio` option to the `coffee` command, for piped-in compiles.

### [0.5.1](https://github.com/jashkenas/coffeescript/compare/0.5.0...0.5.1) — February 24, 2010

Improvements to null soaking with the existential operator, including soaks on indexed properties. Added conditions to `while` loops, so you can use them as filters with `when`, in the same manner as comprehensions.

### [0.5.0](https://github.com/jashkenas/coffeescript/compare/0.3.2...0.5.0) — February 21, 2010

CoffeeScript 0.5.0 is a major release, While there are no language changes, the Ruby compiler has been removed in favor of a self-hosting compiler written in pure CoffeeScript.

### [0.3.2](https://github.com/jashkenas/coffeescript/compare/0.3.0...0.3.2) — February 8, 2010

`@property` is now a shorthand for `this.property`. Switched the default JavaScript engine from Narwhal to Node.js. Pass the `--narwhal` flag if you’d like to continue using it.

### [0.3.0](https://github.com/jashkenas/coffeescript/compare/0.2.6...0.3.0) — January 26, 2010

CoffeeScript 0.3 includes major syntax changes: The function symbol was changed to `->`, and the bound function symbol is now `=>`. Parameter lists in function definitions must now be wrapped in parentheses. Added property soaking, with the `?.` operator. Made parentheses optional, when invoking functions with arguments. Removed the obsolete block literal syntax.

### [0.2.6](https://github.com/jashkenas/coffeescript/compare/0.2.5...0.2.6) — January 17, 2010

Added Python-style chained comparisons, the conditional existence operator `?=`, and some examples from _Beautiful Code_. Bugfixes relating to statement-to-expression conversion, arguments-to-array conversion, and the TextMate syntax highlighter.

### [0.2.5](https://github.com/jashkenas/coffeescript/compare/0.2.4...0.2.5) — January 13, 2010

The conditions in switch statements can now take multiple values at once — If any of them are true, the case will run. Added the long arrow `==>`, which defines and immediately binds a function to `this`. While loops can now be used as expressions, in the same way that comprehensions can. Splats can be used within pattern matches to soak up the rest of an array.

### [0.2.4](https://github.com/jashkenas/coffeescript/compare/0.2.3...0.2.4) — January 12, 2010

Added ECMAScript Harmony style destructuring assignment, for dealing with extracting values from nested arrays and objects. Added indentation-sensitive heredocs for nicely formatted strings or chunks of code.

### [0.2.3](https://github.com/jashkenas/coffeescript/compare/0.2.2...0.2.3) — January 11, 2010

Axed the unsatisfactory `ino` keyword, replacing it with `of` for object comprehensions. They now look like: `for prop, value of object`.

### [0.2.2](https://github.com/jashkenas/coffeescript/compare/0.2.1...0.2.2) — January 10, 2010

When performing a comprehension over an object, use `ino`, instead of `in`, which helps us generate smaller, more efficient code at compile time. Added `::` as a shorthand for saying `.prototype.` The “splat” symbol has been changed from a prefix asterisk `*`, to a postfix ellipsis `...` Added JavaScript’s `in` operator, empty `return` statements, and empty `while` loops. Constructor functions that start with capital letters now include a safety check to make sure that the new instance of the object is returned. The `extends` keyword now functions identically to `goog.inherits` in Google’s Closure Library.

### [0.2.1](https://github.com/jashkenas/coffeescript/compare/0.2.0...0.2.1) — January 5, 2010

Arguments objects are now converted into real arrays when referenced.

### [0.2.0](https://github.com/jashkenas/coffeescript/compare/0.1.6...0.2.0) — January 5, 2010

Major release. Significant whitespace. Better statement-to-expression conversion. Splats. Splice literals. Object comprehensions. Blocks. The existential operator. Many thanks to all the folks who posted issues, with special thanks to [Liam O’Connor-Davis](https://github.com/liamoc) for whitespace and expression help.

### [0.1.6](https://github.com/jashkenas/coffeescript/compare/0.1.5...0.1.6) — December 27, 2009

Bugfix for running `coffee --interactive` and `--run` from outside of the CoffeeScript directory. Bugfix for nested function/if-statements.

### [0.1.5](https://github.com/jashkenas/coffeescript/compare/0.1.4...0.1.5) — December 26, 2009

Array slice literals and array comprehensions can now both take Ruby-style ranges to specify the start and end. JavaScript variable declaration is now pushed up to the top of the scope, making all assignment statements into expressions. You can use `\` to escape newlines. The `coffeescript` command is now called `coffee`.

### [0.1.4](https://github.com/jashkenas/coffeescript/compare/0.1.3...0.1.4) — December 25, 2009

The official CoffeeScript extension is now `.coffee` instead of `.cs`, which properly belongs to [C#](https://en.wikipedia.org/wiki/C_Sharp_(programming_language)). Due to popular demand, you can now also use `=` to assign. Unlike JavaScript, `=` can also be used within object literals, interchangeably with `:`. Made a grammatical fix for chained function calls like `func(1)(2)(3)(4)`. Inheritance and super no longer use `__proto__`, so they should be IE-compatible now.

### [0.1.3](https://github.com/jashkenas/coffeescript/compare/0.1.2...0.1.3) — December 25, 2009

The `coffee` command now includes `--interactive`, which launches an interactive CoffeeScript session, and `--run`, which directly compiles and executes a script. Both options depend on a working installation of Narwhal. The `aint` keyword has been replaced by `isnt`, which goes together a little smoother with `is`. Quoted strings are now allowed as identifiers within object literals: eg. `{"5+5": 10}`. All assignment operators now use a colon: `+:`, `-:`, `*:`, etc.

### [0.1.2](https://github.com/jashkenas/coffeescript/compare/0.1.1...0.1.2) — December 24, 2009

Fixed a bug with calling `super()` through more than one level of inheritance, with the re-addition of the `extends` keyword. Added experimental [Narwhal](http://narwhaljs.org/) support (as a Tusk package), contributed by [Tom Robinson](http://blog.tlrobinson.net/), including **bin/cs** as a CoffeeScript REPL and interpreter. New `--no-wrap` option to suppress the safety function wrapper.

### [0.1.1](https://github.com/jashkenas/coffeescript/compare/0.1.0...0.1.1) — December 24, 2009

Added `instanceof` and `typeof` as operators.

### [0.1.0](https://github.com/jashkenas/coffeescript/compare/8e9d637985d2dc9b44922076ad54ffef7fa8e9c2...0.1.0) — December 24, 2009

Initial CoffeeScript release.