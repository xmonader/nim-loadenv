# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import os, ospaths
import unittest
import loadenv 

test "loads testfile.env file":
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
  