# CMake project file

cmake_minimum_required (VERSION 3.0)
project (Math)
enable_language (Fortran)

## output
#set (CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib/)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib/)

# make sure that the default is a RELEASE
if (NOT CMAKE_BUILD_TYPE)
    set (CMAKE_BUILD_TYPE RELEASE CACHE STRING
            "Choose the type of build, options are: None Debug Release."
            FORCE)
endif (NOT CMAKE_BUILD_TYPE)

# default installation
# Same as #get_filename_component (default_prefix ".." ABSOLUTE)
set(default_prefix ${CMAKE_CURRENT_LIST_DIR})
set (CMAKE_INSTALL_PREFIX ${default_prefix} CACHE STRING
        "Choose the installation directory; by default it installs in the base directory."
        FORCE)

# FFLAGS depend on the compiler
get_filename_component (Fortran_COMPILER_NAME ${CMAKE_Fortran_COMPILER} NAME)

if (Fortran_COMPILER_NAME MATCHES "gfortran.*")
    # gfortran
    set (CMAKE_Fortran_FLAGS_RELEASE "-funroll-all-loops -fno-f2c -O3")
    set (CMAKE_Fortran_FLAGS_DEBUG   "-fno-f2c -O0 -g")
elseif (Fortran_COMPILER_NAME MATCHES "ifort.*")
#     ifort (untested)
    set (CMAKE_Fortran_FLAGS_RELEASE "-f90rtl -O3")
    set (CMAKE_Fortran_FLAGS_DEBUG   "-f90rtl -O0 -g")
elseif (Fortran_COMPILER_NAME MATCHES "g77")
#     g77
    set (CMAKE_Fortran_FLAGS_RELEASE "-funroll-all-loops -fno-f2c -O3 -m32")
    set (CMAKE_Fortran_FLAGS_DEBUG   "-fno-f2c -O0 -g -m32")
else (Fortran_COMPILER_NAME MATCHES "gfortran.*")
    message ("CMAKE_Fortran_COMPILER full path: " ${CMAKE_Fortran_COMPILER})
    message ("Fortran compiler: " ${Fortran_COMPILER_NAME})
    message ("No optimized Fortran compiler flags are known, we just try -O2...")
    set (CMAKE_Fortran_FLAGS_RELEASE "-O2")
    set (CMAKE_Fortran_FLAGS_DEBUG   "-O0 -g")
endif (Fortran_COMPILER_NAME MATCHES "gfortran.*")

## folder
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER "cmake")

# Add sub dir
add_subdirectory(src)
add_subdirectory(fortran)
#target_link_libraries(${PROJECT_NAME} src)

# build executables
#set (PROGRAMS ${FORTRAN_FILES})
#set (EXECUTABLES ${PROGRAMS})
#set (SCRIPTS "gen_pert.sh" "pert_multi_mode.sh")

# install executables and scripts
#install (TARGETS ${EXECUTABLES}
#        RUNTIME DESTINATION "bin")
#install (PROGRAMS ${SCRIPTS}
#        DESTINATION "bin")
