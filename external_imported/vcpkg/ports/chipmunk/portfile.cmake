vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO slembcke/Chipmunk2D
    REF 87340c216bf97554dc552371bbdecf283f7c540e
    SHA512 9094017755e9c140aa5bf8a1b5502077ae4fb2b0a3e12f1114e86d8591a6188f89822ecc578a2b5e95f61c555018f1b3273fe50e833fe2daf30e94b180a3d07c
    HEAD_REF master
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "static" KEYSTONE_BUILD_STATIC)
string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" KEYSTONE_BUILD_SHARED)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_DEMOS=OFF
        -DBUILD_SHARED=${KEYSTONE_BUILD_SHARED}
        -DBUILD_STATIC=${KEYSTONE_BUILD_STATIC}
        -DINSTALL_STATIC=${KEYSTONE_BUILD_STATIC}
)

vcpkg_cmake_install()

if (NOT VCPKG_BUILD_TYPE OR VCPKG_BUILD_TYPE STREQUAL debug)
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
endif()

file(GLOB DLLS "${CURRENT_PACKAGES_DIR}/lib/*.dll")
if(DLLS)
    file(COPY ${DLLS} DESTINATION "${CURRENT_PACKAGES_DIR}/bin")
    file(REMOVE ${DLLS})
endif()

file(INSTALL
    "${SOURCE_PATH}/include/chipmunk"
    DESTINATION "${CURRENT_PACKAGES_DIR}/include"
)

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)