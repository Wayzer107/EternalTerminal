# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/io
    REF boost-1.81.0
    SHA512 0228da375019989241b5febd99ff45855aa90c12ff5ee181249e7309f2a9ec21d9c77c89060d4fea41bd66a89ae06c9d3cf190301124a0362a9b4b57cc7f5871
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})