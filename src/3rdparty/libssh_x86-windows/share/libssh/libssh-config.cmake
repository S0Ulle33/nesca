get_filename_component(LIBSSH_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

if (EXISTS "${LIBSSH_CMAKE_DIR}/CMakeCache.txt")
    # In build tree
    include(${LIBSSH_CMAKE_DIR}/libssh-build-tree-settings.cmake)
else()
    set(LIBSSH_INCLUDE_DIR "${PACKAGE_PREFIX_DIR}/include/")
    set(LIBSSH_INCLUDE_DIRS "${PACKAGE_PREFIX_DIR}/include/")
endif()

if(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(LIBSSH_LIBRARY "${PACKAGE_PREFIX_DIR}/lib/ssh.lib")
    set(LIBSSH_LIBRARIES "${PACKAGE_PREFIX_DIR}/lib/ssh.lib")

    set(LIBSSH_THREADS_LIBRARY "${PACKAGE_PREFIX_DIR}/lib/ssh.lib")
elseif(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(LIBSSH_LIBRARY "${PACKAGE_PREFIX_DIR}/debug/lib/ssh.lib")
    set(LIBSSH_LIBRARIES "${PACKAGE_PREFIX_DIR}/debug/lib/ssh.lib")

    set(LIBSSH_THREADS_LIBRARY "${PACKAGE_PREFIX_DIR}/debug/lib/ssh.lib")
endif()
