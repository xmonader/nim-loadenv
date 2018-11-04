import os, strutils, tables

proc loadEnvFromFile*(path: string, sep='='): Table[string, string] =
  var res = initTable[string, string]()
  try:
    let lines = readFile(path).splitlines()
    for l in lines:
      let lstripped = l.strip()
      if lstripped == "" or lstripped.startsWith('#'):
        continue
      if lstripped.contains(sep):
        let parts = lstripped.split(sep, maxsplit=1)
        if len(parts) == 2:
          res.add(parts[0].strip(), parts[1].strip())
  except:
    echo getCurrentExceptionMsg()

  return res

proc loadEnv*(path:string, sep='='): void = 
  for k,v in loadEnvFromFile(path, sep).pairs:
    putEnv(k, v)



        