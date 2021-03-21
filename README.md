# weblog_stat

---

weblog_stat is a viewing tool for web logs statistics.


How To install
----
---
```sh
$ bundle install
```

Quickstart
---
---
```sh
$ cd weblog_stat
```
<br/>
To see a list of webpages
with most page views ordered from most pages views to less page views
<br/>
and to list of webpages with most
unique page views also ordered.

```sh
$ ruby bin/cli.rb [filename]
```

Tests
---
---
To run tests use
```sh
$ rspec
```

Linter
---
---
To run linter use
```sh
$ rubocop
```

Approach
---
---
Log file is iterated line by line.
<br>
Each line is parsed to the `LogEntry` structure.
<br>
There is one hash with path keys from log and number values of path accesses
to calculate overall path addressing.
<br>
There is another hash with path keys from log and `Set` values to calculate unique path addressing. 
<br>
Results are converted into `StatEntry` array.
<br>
`StatEntry` array is sorted.

Improvements
---
---

* add more strict validations for `log entry` like check if path is valid.