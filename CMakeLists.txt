cmake_minimum_required(VERSION 3.15)

project(bad_zapple_serv)

add_subdirectory(libbad-zapple)

if (NOT CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    message(STATUS "This project has a top-level one called [${CMAKE_PROJECT_NAME}]")
else()
    message(STATUS "This project is a top-level one")
endif()

set(SRCS
	src/main.cpp
)

set(HEADERS
)

add_executable(bad_zapple_serv ${SRCS} ${HEADERS})

target_link_libraries(bad_zapple_serv PUBLIC bad_zapple)
