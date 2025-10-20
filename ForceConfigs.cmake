# Force all configuration types early, before Qt overrides anything.
set(CMAKE_CONFIGURATION_TYPES "Debug;Release;RelWithDebInfo;MinSizeRel" CACHE STRING "" FORCE)
message(STATUS "✅ Forced configuration types from ForceConfigs.cmake: ${CMAKE_CONFIGURATION_TYPES}")
