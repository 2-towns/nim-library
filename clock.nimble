# Package

version       = "0.1.0"
author        = "Arnaud"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["clock"]


# Dependencies

requires "nim >= 2.2.4"
requires "chronicles"
requires "chronos"

proc buildLibrary(name: string, srcDir = "./", params = "", `type` = "static") =
  if not dirExists "build":
    mkDir "build"
  # allow something like "nim nimbus --verbosity:0 --hints:off nimbus.nims"
  var extra_params = params
  if `type` == "static":
    exec "nim c" & " --out:build/" & name &
      ".a --threads:on --app:staticlib --opt:size --noMain --mm:refc --header --undef:metrics --nimMainPrefix:libclock --skipParentCfg:on --nimcache:nimcache -d:asyncTimer=system " &
      extra_params & " " & srcDir & name & ".nim"
  else:
    exec "nim c" & " --out:build/" & name &
      ".so --threads:on --app:lib --opt:size --noMain --mm:refc --header --undef:metrics --nimMainPrefix:libclock --skipParentCfg:on --nimcache:nimcache -d:asyncTimer=system " &
      extra_params & " " & srcDir & name & ".nim"

# Tasks
task libclockDynamic, "Generate bindings":
  let name = "libclock"
  buildLibrary name, "library/", "", "dynamic"

task libclockStatic, "Generate bindings":
  let name = "libclock"
  buildLibrary name, "library/", "", "static"
