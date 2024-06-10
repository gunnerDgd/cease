function   (add_os)
    if    (UNIX AND NOT APPLE)
        set                    (PRESET_LINUX ON PARENT_SCOPE)
        set                    (PRESET_OS    ON PARENT_SCOPE)
        add_compile_definitions(PRESET_LINUX)
    elseif(WIN32)
        set                    (PRESET_WIN32 ON PARENT_SCOPE)
        set                    (PRESET_OS    ON PARENT_SCOPE)
        add_compile_definitions(PRESET_WIN32)
    endif ()
endfunction()