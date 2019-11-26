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

# Requirements

For log and stat: git and perl

For merge: jq

