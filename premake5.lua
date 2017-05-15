function cppCliDll(projectName)
	project(projectName)
		kind "SharedLib"
		language "C++"
		clr "On"

		projectFiles(projectName)

		filter "configurations:Debug"
			defines { "DEBUG" }
			symbols "On"

		filter "configurations:Release"
			defines { "NDEBUG" }
			optimize "On"

		filter {}
end

function cppCliExe(projectName)
	project(projectName)
		kind "WindowedApp"
		language "C++"
		clr "On"
		entrypoint "Main"

		projectFiles(projectName)

		filter "configurations:Debug"
			defines { "DEBUG" }
			symbols "On"

		filter "configurations:Release"
			defines { "NDEBUG" }
			optimize "On"

		filter {}
end

function cppDll(projectName)
	project(projectName)
		kind "SharedLib"
		language "C++"

		projectFiles(projectName)

		filter "configurations:Debug"
			defines { "DEBUG" }
			symbols "On"

		filter "configurations:Release"
			defines { "NDEBUG" }
			optimize "On"

		filter {}
end

function projectFiles(projectName)
	files { projectName .. "/**.h", projectName .. "/**.cpp" }
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

cppCliDll "Cli"
	links { "Global" }
	includedirs { "Global" }

cppCliExe "CliExe"
	links { "System.Windows.Forms.dll", "cli" }

cppDll("Global")
