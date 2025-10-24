# Hidden Characters GitHub Action

This action recursively checks all files within a directory for hidden characters. The action fails if any are found.

## Inputs

### `path`
**optional:** Used to specify a folder to analyze

## Outputs

none.

## Example usage

```yaml
uses: actions/hidden-characters@v1
with:
  path: "/site"
```