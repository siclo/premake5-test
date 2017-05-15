function cppCliDll(projectName)
	project(projectName)
		kind "SharedLib"
		language "C++"
		clr "On"
		processProperties()

		projectFiles(projectName)
end

function cppCliExe(projectName)
	project(projectName)
		kind "WindowedApp"
		language "C++"
		clr "On"
		entrypoint "Main"
		guiProperties()

		projectFiles(projectName)
end

function cppDll(projectName)
	project(projectName)
		kind "SharedLib"
		language "C++"
		guiProperties()

		projectFiles(projectName)
end

function projectFiles(projectName)
	files { projectName .. "/**.h", projectName .. "/**.cpp" }
end

function processProperties()
	filter "configurations:Debug"
		defines { "DEBUG" }
		symbols "On"

	filter "configurations:Release"
		defines { "NDEBUG" }
		optimize "On"

	filter {}
end

function guiProperties()
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

cppCliDll "Cli"
	links { "Global" }
	includedirs { "Global" }

cppCliExe "CliExe"
	links { "System.Windows.Forms.dll", "cli" }

cppDll("Global")

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
