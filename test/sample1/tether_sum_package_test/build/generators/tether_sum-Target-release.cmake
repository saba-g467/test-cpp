# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(tether_sum_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(tether_sum_FRAMEWORKS_FOUND_RELEASE "${tether_sum_FRAMEWORKS_RELEASE}" "${tether_sum_FRAMEWORK_DIRS_RELEASE}")

set(tether_sum_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET tether_sum_DEPS_TARGET)
    add_library(tether_sum_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET tether_sum_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${tether_sum_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${tether_sum_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### tether_sum_DEPS_TARGET to all of them
conan_package_library_targets("${tether_sum_LIBS_RELEASE}"    # libraries
                              "${tether_sum_LIB_DIRS_RELEASE}" # package_libdir
                              "${tether_sum_BIN_DIRS_RELEASE}" # package_bindir
                              "${tether_sum_LIBRARY_TYPE_RELEASE}"
                              "${tether_sum_IS_HOST_WINDOWS_RELEASE}"
                              tether_sum_DEPS_TARGET
                              tether_sum_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "tether_sum"    # package_name
                              "${tether_sum_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${tether_sum_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET tether_sum::tether_sum
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${tether_sum_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${tether_sum_LIBRARIES_TARGETS}>
                 )

    if("${tether_sum_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET tether_sum::tether_sum
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     tether_sum_DEPS_TARGET)
    endif()

    set_property(TARGET tether_sum::tether_sum
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${tether_sum_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET tether_sum::tether_sum
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${tether_sum_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET tether_sum::tether_sum
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${tether_sum_LIB_DIRS_RELEASE}>)
    set_property(TARGET tether_sum::tether_sum
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${tether_sum_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET tether_sum::tether_sum
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${tether_sum_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(tether_sum_LIBRARIES_RELEASE tether_sum::tether_sum)
