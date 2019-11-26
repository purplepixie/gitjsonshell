# gitjsonshell

Based on: https://gist.github.com/textarcana/1306223

## Usage

### git log (commits without files)

bin/git-log2json.sh

Runs based on git log in current directory context and outputs JSON for commits (no files) with hash

### git stat (files and changes in commit)

bin/git-stat2json.sh

Runs based on git log in current directory context and outputs JSON for files (stat) from commits with hash

### merge log and stat output

bin/git-mergejson.sh logfile.json statfile.json

Merges the two outputs from log and stat into data set including paths (unified JSON model)

### example combined use

```
./bin/git-log2json.sh > /tmp/log.json
./bin/git-stat2json.sh > /tmp/stat.json
./bin/git-merge.sh /tmp/log.json /tmp/stat.json
```

# Example Output

## Log

```
[{
  "commit": "b5267c3797f6ec02a7c8294dc04411c8369f063f",
  "author": "David Cutting <dcutting@purplepixie.org>",
  "date": "Tue Nov 26 10:50:02 2019 +0000",
  "message": "initial-files"
},
{
  "commit": "c20a7d82f6f9d039d88532e011cb42b7e3b31985",
  "author": "David Cutting <dcutting@purplepixie.org>",
  "date": "Tue Nov 26 10:46:58 2019 +0000",
  "message": "Update-README.md"
},
{
  "commit": "59222f57daeb2226e44ededd84d9d60e4e6c8ec3",
  "author": "David Cutting <dcutting@purplepixie.org>",
  "date": "Tue Nov 26 10:46:42 2019 +0000",
  "message": "Initial-commit"
}]
```

# Stat

```
{"b5267c3797f6ec02a7c8294dc04411c8369f063f": [ {"insertions": "10", "deletions": "0", "path": "bin/git-log2json.sh"}, {"insertions": "6", "deletions": "0", "path": "bin/git-mergejson.sh"}, {"insertions": "25", "deletions": "0", "path": "bin/git-stat2json.sh"}], "c20a7d82f6f9d039d88532e011cb42b7e3b31985": [ {"insertions": "3", "deletions": "1", "path": "README.md"}], "59222f57daeb2226e44ededd84d9d60e4e6c8ec3": [ {"insertions": "1", "deletions": "0", "path": "README.md"}]}
```

# Merge

```
[
  {
    "commit": "b5267c3797f6ec02a7c8294dc04411c8369f063f",
    "author": "David Cutting <dcutting@purplepixie.org>",
    "date": "Tue Nov 26 10:50:02 2019 +0000",
    "message": "initial-files",
    "paths": [
      {
        "insertions": "10",
        "deletions": "0",
        "path": "bin/git-log2json.sh"
      },
      {
        "insertions": "6",
        "deletions": "0",
        "path": "bin/git-mergejson.sh"
      },
      {
        "insertions": "25",
        "deletions": "0",
        "path": "bin/git-stat2json.sh"
      }
    ]
  },
  {
    "commit": "c20a7d82f6f9d039d88532e011cb42b7e3b31985",
    "author": "David Cutting <dcutting@purplepixie.org>",
    "date": "Tue Nov 26 10:46:58 2019 +0000",
    "message": "Update-README.md",
    "paths": [
      {
        "insertions": "3",
        "deletions": "1",
        "path": "README.md"
      }
    ]
  },
  {
    "commit": "59222f57daeb2226e44ededd84d9d60e4e6c8ec3",
    "author": "David Cutting <dcutting@purplepixie.org>",
    "date": "Tue Nov 26 10:46:42 2019 +0000",
    "message": "Initial-commit",
    "paths": [
      {
        "insertions": "1",
        "deletions": "0",
        "path": "README.md"
      }
    ]
  }
]
```

# Requirements

For log and stat: git and perl

For merge: jq

