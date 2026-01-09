message(STATUS "Conan: Using CMakeDeps conandeps_legacy.cmake aggregator via include()")
message(STATUS "Conan: It is recommended to use explicit find_package() per dependency instead")

find_package(tether_sum)

set(CONANDEPS_LEGACY  tether_sum::tether_sum )