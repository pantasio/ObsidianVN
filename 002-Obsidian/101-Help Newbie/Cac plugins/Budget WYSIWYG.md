Tự động chuyển qua review mode nếu bạn không gõ gì trong 20s, kể cả khi bạn đang trong edit mode. Điều này giúp bạn không gõ nhầm.

Nice plugin, But this plugin has 1 issue: No setting for time before switching editing/preview. So you can modifer timing by yourseft like me. You edit main.js at line 89
```
let debouncef = obsidian.debounce(doneTyping, 20000, true);
```
20000 mean 20s.