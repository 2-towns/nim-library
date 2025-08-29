{.pragma: exported, exportc, cdecl, raises: [].}
{.pragma: callback, cdecl, raises: [], gcsafe.}
{.passc: "-fPIC".}

when defined(linux):
  {.passl: "-Wl,-soname,libclock.so".}

import std/[atomics]
# import std/[locks, typetraits, tables, atomics], chronos, chronicles
# import
#   ./clock_thread/clock_thread,
#   ./alloc,
#   ./ffi_types,
#   ./clock_thread/inter_thread_communication/clock_thread_request,
#   ./clock_thread/inter_thread_communication/requests/
#     [clock_lifecycle_request, clock_alarm_request],
#   ../src/[clock],
#   ./events/[json_alarm_event]

################################################################################

################################################################################
### Library setup

# Required for Nim runtime initialization when using --nimMainPrefix
# TODO: rename to lib<YourLibraryName>NimMain
proc libclockNimMain() {.importc.}

# Atomic flag to prevent multiple initializations
var initialized: Atomic[bool]

# Initializes the Nim runtime and foreign-thread GC
proc initializeLibrary*() {.exportc, dynlib.} =
  if not initialized.exchange(true):
    ## Every Nim library must call `<prefix>NimMain()` once
    libclockNimMain()
#   when declared(setupForeignThreadGc):
#     setupForeignThreadGc()
#   when declared(nimGC_setStackBottom):
#     var locals {.volatile, noinit.}: pointer
#     locals = addr(locals)
#     nimGC_setStackBottom(locals)

proc clock_new*(): pointer {.exportc, dynlib.} =
    echo "Ok"