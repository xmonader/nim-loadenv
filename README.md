# loadenv

Load your `.env` files easily into your nim application


## Example

```nim
  let envFile = """
SEND_GRID_TOK = 12312aeabasd123sad12r54
# COMMENTED = VALUE
SEND_GRID_USER = root
"""
  let envFilePath = getTempDir()/"testfile.env"
  writeFile(envFilePath, envFile)
  loadenv.loadEnv(envFilePath)

  assert os.existsEnv("SEND_GRID_USER") == true
  assert os.existsEnv("SEND_GRID_TOK") == true
  assert os.existsEnv("COMMENTED") == false
```

- In case of another separator other than `=` you can pass `sep` char to `loadEnv` function