if(TARGET clipper2)
    return()
endif()

add_library(clipper2 STATIC IMPORTED)

set_target_properties(
    clipper2
    PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS
            "CLIPPER2_STATICLIB"
)

target_include_directories(
    clipper2
    SYSTEM INTERFACE
        "${CMAKE_CURRENT_LIST_DIR}/include"
)

target_compile_options(
    clipper2
    INTERFACE
        "$<$<CXX_COMPILER_ID:MSVC>:/external:W0>"
        "$<$<CXX_COMPILER_ID:MSVC>:/external:I${CMAKE_CURRENT_LIST_DIR}/include>"
)

if(MSVC)
    set_target_properties(
        clipper2
        PROPERTIES
            IMPORTED_LOCATION
                "${CMAKE_CURRENT_LIST_DIR}/lib/Clipper2.lib"
            IMPORTED_LOCATION_DEBUG
                "${CMAKE_CURRENT_LIST_DIR}/lib/Clipper2d.lib"
    )
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set_target_properties(
        clipper2
        PROPERTIES
            IMPORTED_LOCATION
                "${CMAKE_CURRENT_LIST_DIR}/lib/libClipper2.a"
            IMPORTED_LOCATION_DEBUG
                "${CMAKE_CURRENT_LIST_DIR}/lib/libClipper2d.a"
    )
endif()