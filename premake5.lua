function CppCliDLL(projectName)
	project "Cli"
		kind "SharedLib"
		language "C++"
		clr "On"

		files { projectName .. "/**.h", projectName .. "/**.cpp" }

		filter "configurations:Debug"
			defines { "DEBUG" }
			symbols "On"

		filter "configurations:Release"
			defines { "NDEBUG" }
			optimize "On"

		filter {}
end

workspace "HelloWorld"
	platforms { "x64" }
    configurations { "Debug", "Release" }

	dotnetframework "4.6.1"
	systemversion "10.0.15063.0"
	location "build"
	targetdir "bin/%{cfg.buildcfg}"

project "HelloWorld"
    kind "ConsoleApp"
    language "C++"

    files { "hello/**.h", "hello/**.cpp" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

CppCliDLL "Cli"
	links { "Global" }
	includedirs { "Global" }

project "CliExe"
	kind "WindowedApp"
	language "C++"
	clr "On"
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

    files { "global/**.h", "global/**.cpp" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"