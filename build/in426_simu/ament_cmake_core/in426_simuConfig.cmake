# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_in426_simu_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED in426_simu_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(in426_simu_FOUND FALSE)
  elseif(NOT in426_simu_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(in426_simu_FOUND FALSE)
  endif()
  return()
endif()
set(_in426_simu_CONFIG_INCLUDED TRUE)

# output package information
if(NOT in426_simu_FIND_QUIETLY)
  message(STATUS "Found in426_simu: 1.0.0 (${in426_simu_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'in426_simu' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${in426_simu_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(in426_simu_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${in426_simu_DIR}/${_extra}")
endforeach()
