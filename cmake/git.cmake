if    (UNIX AND NOT APPLE)
        if    (NOT EXISTS "/usr/bin/git")
            message("No Git Installation Found")
            message(SEND_ERROR)
        endif ()
elseif(WIN32)
        if    (NOT EXISTS "C:/Program Files/Git/bin/git.exe")
            message("No Git Installation Found")
            message(SEND_ERROR "Abort")
        endif ()
endif()

function  (repo NAME AUTHOR VER PATH)
    string(APPEND URL "https://github.com/${AUTHOR}/${NAME}")
    string(APPEND DIR ${PATH}/${NAME})

    if   (NOT EXISTS ${DIR})
        execute_process(COMMAND git clone ${URL}/${NAME} -b ${VER} WORKING_DIRECTORY ${PATH})
    endif()

    if   (EXISTS ${DIR}/include)
        include_directories(${DIR}/include)
    endif()

    if   (EXISTS ${DIR}/${NAME}.cmake)
            include (${DIR}/${NAME}.cmake)
    endif()

    if   (EXISTS ${DIR}/CMakeLists.txt)
        add_subdirectory(${DIR})
    endif()
endfunction()