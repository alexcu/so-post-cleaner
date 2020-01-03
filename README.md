# Stack Overflow Post Cleaner

Cleans Stack Overflow Post files. See example `data.csv`.

To run:

```
$ ruby clean.rb data.csv > ./new.csv
```

Inside `new.csv` there will be an added column called `bodytext` that strips
all the HTML tags out. It also removes all `<pre>`, `<code>`, `<img>`, `<a>`
and `<blockquote>` nodes.
