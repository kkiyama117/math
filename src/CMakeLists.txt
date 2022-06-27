cmake_minimum_required(VERSION 3.0)
project(Math)

# Check if not running in source dir
if (${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
    message(FATAL_ERROR "DO NOT BUILD in-tree.")
endif ()

#get_filename_component (Fortran_COMPILER_NAME ${CMAKE_Fortran_COMPILER} NAME)

## folder
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER "cmake")

file(GLOB C_FILES *.c)

set (PROGRAMS ${C_FILES})

# build executables
foreach (p ${PROGRAMS})
    get_filename_component(title "${p}" NAME_WE) # title
    get_filename_component(relativePath "${p}" NAME) # title
    message("building ${relativePath}")
    add_executable (${title} "${relativePath}")
    target_link_libraries(${title} m)
    #    set(EXECUTABLES "${EXECUTABLES} ${title}")
endforeach (p)

# install executables and scripts
install (TARGETS ${EXECUTABLES}
        RUNTIME DESTINATION "bin")
install (PROGRAMS ${SCRIPTS}
        DESTINATION "bin")
