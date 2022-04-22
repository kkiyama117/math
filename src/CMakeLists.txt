# CMake project file

cmake_minimum_required (VERSION 3.0)
project (Math)
enable_language (Fortran)

# make sure that the default is a RELEASE
if (NOT CMAKE_BUILD_TYPE)
    set (CMAKE_BUILD_TYPE RELEASE CACHE STRING
            "Choose the type of build, options are: None Debug Release."
            FORCE)
endif (NOT CMAKE_BUILD_TYPE)

# build executables
set (PROGRAMS "test1")
set (EXECUTABLES ${PROGRAMS})
#set (SCRIPTS "gen_pert.sh" "pert_multi_mode.sh")

foreach (p ${PROGRAMS})
    add_executable (${p} "${p}.f90")
endforeach (p)

# install executables and scripts
install (TARGETS ${EXECUTABLES}
        RUNTIME DESTINATION "bin")
