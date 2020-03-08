macro(run_conan)
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
              "${CMAKE_BINARY_DIR}/conan.cmake")
endif()
include(${CMAKE_BINARY_DIR}/conan.cmake)
conan_add_remote(NAME bincrafters
                  URL https://api.bintray.com/conan/bincrafters/public-conan)
conan_cmake_run(
  REQUIRES
  ${CONAN_EXTRA}
  catch2/2.11.1
  docopt.cpp/0.6.2
  fmt/6.1.2
  spdlog/1.5.0
  OPTIONS
  ${CONAN_OPTIONS}
  BASIC_SETUP
  CMAKE_TARGETS
  BUILD
  missing
)
endmacro()