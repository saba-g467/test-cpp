########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(tether_sum_COMPONENT_NAMES "")
if(DEFINED tether_sum_FIND_DEPENDENCY_NAMES)
  list(APPEND tether_sum_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES tether_sum_FIND_DEPENDENCY_NAMES)
else()
  set(tether_sum_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(tether_sum_PACKAGE_FOLDER_RELEASE "C:/Users/User/.conan2/p/b/tethe837a262e3e306/p")
set(tether_sum_BUILD_MODULES_PATHS_RELEASE "${tether_sum_PACKAGE_FOLDER_RELEASE}/lib/cmake/tether_sum/modules/TetherAddExecutable.cmake")


set(tether_sum_INCLUDE_DIRS_RELEASE "${tether_sum_PACKAGE_FOLDER_RELEASE}/include")
set(tether_sum_RES_DIRS_RELEASE )
set(tether_sum_DEFINITIONS_RELEASE "-DTETHER_SUM_IMPORTS")
set(tether_sum_SHARED_LINK_FLAGS_RELEASE )
set(tether_sum_EXE_LINK_FLAGS_RELEASE )
set(tether_sum_OBJECTS_RELEASE )
set(tether_sum_COMPILE_DEFINITIONS_RELEASE "TETHER_SUM_IMPORTS")
set(tether_sum_COMPILE_OPTIONS_C_RELEASE )
set(tether_sum_COMPILE_OPTIONS_CXX_RELEASE )
set(tether_sum_LIB_DIRS_RELEASE "${tether_sum_PACKAGE_FOLDER_RELEASE}/lib")
set(tether_sum_BIN_DIRS_RELEASE "${tether_sum_PACKAGE_FOLDER_RELEASE}/bin")
set(tether_sum_LIBRARY_TYPE_RELEASE SHARED)
set(tether_sum_IS_HOST_WINDOWS_RELEASE 1)
set(tether_sum_LIBS_RELEASE tether_sum)
set(tether_sum_SYSTEM_LIBS_RELEASE )
set(tether_sum_FRAMEWORK_DIRS_RELEASE )
set(tether_sum_FRAMEWORKS_RELEASE )
set(tether_sum_BUILD_DIRS_RELEASE )
set(tether_sum_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(tether_sum_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${tether_sum_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${tether_sum_COMPILE_OPTIONS_C_RELEASE}>")
set(tether_sum_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${tether_sum_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${tether_sum_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${tether_sum_EXE_LINK_FLAGS_RELEASE}>")


set(tether_sum_COMPONENTS_RELEASE )