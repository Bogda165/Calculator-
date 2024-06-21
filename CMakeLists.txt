cmake_minimum_required(VERSION 3.28)
project(flexFirstTry)

set(CMAKE_CXX_STANDARD 17)

find_package(FLEX REQUIRED)
FLEX_TARGET(MyScanner lexer.l ${CMAKE_CURRENT_BINARY_DIR}/lexer.cpp)


add_executable(flexFirstTry lex.yy.c)
target_link_libraries(flexFirstTry ${FLEX_LIBRARIES})
