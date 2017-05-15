workspace "HelloWorld"
	platforms { "x64" }
    configurations { "Debug", "Release" }

project "HelloWorld"
    kind "ConsoleApp"
    language "C++"
    targetdir "bin/%{cfg.buildcfg}"
	systemversion "10.0.15063.0"

    files { "hello/**.h", "hello/**.cpp" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"


project "Cli"
	kind "SharedLib"
	language "C++"
	clr "On"
	dotnetframework "4.6.1"
    targetdir "bin/%{cfg.buildcfg}"
	systemversion "10.0.15063.0"

    files { "cli/**.h", "cli/**.cpp" }

	links { "Global" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

project "CliExe"
	kind "WindowedApp"
	language "C++"
	clr "On"
	dotnetframework "4.6.1"
	targetdir "bin/%{cfg.buildcfg}"
	systemversion "10.0.15063.0"
	entrypoint "Main"

    files { "cliexe/**.h", "cliexe/**.cpp" }

	links { "System.Windows.Forms.dll", "cli" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

project "Global"
	kind "SharedLib"
	language "C++"
    targetdir "bin/%{cfg.buildcfg}"
	systemversion "10.0.15063.0"

    files { "global/**.h", "global/**.cpp" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"