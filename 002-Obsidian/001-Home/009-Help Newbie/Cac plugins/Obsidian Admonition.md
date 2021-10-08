## Example 
````ad-info
title: Tham khảo các style cơ bản
collapse: close

```ad-note
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

```

```ad-abstract
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

```

```ad-info
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

```

```ad-tip
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

```

```ad-success
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

```

```ad-question
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

```

```ad-warning
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

```

```ad-failure
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

```
    
```ad-danger
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

```

```ad-bug
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

```

```ad-example
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

```

```ad-quote
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

```
````

```ad-abstract
title: Code
collapse: close

~~~javascript
throw new Error("Oops, I'm a bug.");
~~~
```

```ad-success
title: Ouput
collapse: close

console.log("Hello!");
```

## Custom Admonitions

Custom admonitions may be created in settings.

Creating a new admonition requires three things: the type, the icon to use, and the color of the admonition.

Only one admonition of each type may exist at any given time; if another admonition of the same type is created, it will override the previously created one.

If a default admonition is overridden, it can be restored by deleting the user-defined admonition.

Please note that by default, the background color of the title is simply the color of the admonition at 10% opacity. CSS must be used to update this.

## Customization

This is all of the CSS applied to the admonitions. Override these classes to customize the look.

### Base Classes[](https://github.com/valentine195/obsidian-admonition#base-classes)
The full CSS is located in [main.css](https://github.com/valentine195/obsidian-admonition/blob/master/src/assets/main.css).

Every admonition receives the following CSS classes:

```ad-question
title: More detail
collapse: close
~~~javascript
:root {
    --admonition-details-icon: url("data:image/svg+xml;charset=utf-8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'><path d='M8.59 16.58L13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.42z'/></svg>");
}

.admonition {
    margin: 1.5625em 0;
    padding: 0;
    overflow: hidden;
    color: var(--text-normal);
    page-break-inside: avoid;
    background-color: var(--background-secondary);
    border-left: 0.2rem solid rgb(var(--admonition-color));
    border-radius: 0.1rem;
    box-shadow: 0 0.2rem 0.5rem var(--background-modifier-box-shadow);
}

.admonition-title {
    position: relative;
    padding: 0.6rem 0.25em;
    font-weight: 700;
    background-color: rgba(var(--admonition-color), 0.1);
}

.admonition-title-content {
    display: flex;
    justify-content: flex-start;
    margin-top: 0 !important;
    margin-bottom: 0 !important;
}

.admonition-title-icon {
    color: rgb(var(--admonition-color));
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 0.5em 0 0.25em;
    min-width: 1em;
}

.admonition-title-markdown {
    display: block;
}

.admonition-title.no-title {
    display: none;
}

.admonition > .admonition-title.no-title + .admonition-content-holder {
    margin-top: 1rem;
    margin-bottom: 1rem;
}

.admonition-content-holder {
    position: relative;
}

.admonition-content {
    margin: 10px 15px;
    position: relative;
    overflow-x: auto;
}

.admonition-content-copy {
    color: var(--text-faint);
    cursor: pointer;
    opacity: 0;
    position: absolute;
    right: 0.375rem;
    top: -5px;
    transition: 0.3s opacity ease-in;
}

.admonition-content-copy:hover {
    color: var(--text-normal);
}

.admonition:hover .admonition-content-copy,
.admonition-content-copy:hover {
    opacity: 1;
}
.admonition-title:hover + .admonition-content .admonition-content-copy {
    opacity: 0;
}

~~~
```
