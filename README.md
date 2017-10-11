# About

SmallMlValidator checks that a string conforms to a small subset of html that
is safe for embedding in html documents, xml documents and tsv files.

The exact format is defined in validator.pegjs which hopefully should be
self-explanatory.

For sanitizing the user input, you might try my other projects cnitize and
SmallMlSanitizer

# Compiling

No compiling is needed, and the precompiled grammar file is available as
validator.js.

There are non dependencies except for node.

# Running

## Command-line

    $ echo '<u><b>valid</b> string</u>'| node index.js
    OK

    $ echo '<i><i>invalid</b> string</u>'| node index.js
    KO, Column 15: Expected "tt" or [bui] but "/" found.

## As a node module

    var validator = require('./validator')
    validator.parse(txt)

# License

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; version 2 **only**.
