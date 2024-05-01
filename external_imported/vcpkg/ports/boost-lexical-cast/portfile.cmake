# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/lexical_cast
    REF boost-1.81.0
    SHA512 377420d3f3351cbf5d2e08d354f9507da16075c299c09a30e3d01fabe5d5e2c4e580d86a99f51861f0540e1255f3e3a7ddf7d5c4d306770e5c23182540621828
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})