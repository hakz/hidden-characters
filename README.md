# Hidden Characters GitHub Action

This action recursively checks all files within a directory for hidden characters. The action fails if any are found.

## Inputs

### `path`
**optional:** Used to specify a folder to analyze

## Outputs

none.

## Example usage

```yaml
name: Check for hidden characters

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest # Specify the runner type (it will run on anything)

    steps:
      # STEP 1: This is a crucial step
      - name: Check out repository code
        uses: actions/checkout@v4 # requires a checkout of files before running

      - name: Check for hidden characters
        uses: actions/hidden-characters@v1
        with:
          path: "/directory-name" # optional. Default is root directory or "/"
```
