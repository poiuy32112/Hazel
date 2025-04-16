workspace "Hazel"
 	architecture "x86_64"
	startproject "Hazelnut"
 
 	configurations
 	{
 		"Debug",
 		"Release",
 		"Dist"
 	}

    flags
 	{
 		"MultiProcessorCompile"
 	}
 
 outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

 -- Include directories relative to root folder (solution directory)
 IncludeDir = {}
 IncludeDir["GLFW"] = "Hazel/vendor/GLFW/include"
 IncludeDir["Glad"] = "Hazel/vendor/Glad/include"
 IncludeDir["ImGui"] = "Hazel/vendor/imgui"
 IncludeDir["glm"] = "Hazel/vendor/glm"
 IncludeDir["stb_image"] = "Hazel/vendor/stb_image"
 IncludeDir["entt"] = "Hazel/vendor/entt/include"
 IncludeDir["yaml_cpp"] = "Hazel/vendor/yaml-cpp/include"

 group "Dependencies"
 	include "Hazel/vendor/GLFW"
 	include "Hazel/vendor/Glad"
 	include "Hazel/vendor/imgui"
 	include "Hazel/vendor/yaml-cpp"
 
 group ""
 
 include "Hazel/vendor/GLFW"
 include "Hazel/vendor/Glad"
 include "Hazel/vendor/imgui"
 include "Hazel/vendor/yaml-cpp"
 
 project "Hazel"
 	location "Hazel"
	kind "StaticLib"
 	language "C++"

    cppdialect "C++17"
 	staticruntime "off"
 
 	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
 	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "hzpch.h"
    pchsource "Hazel/src/hzpch.cpp"
 
 	files
 	{
 		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
        "%{prj.name}/vendor/stb_image/**.h",
 		"%{prj.name}/vendor/stb_image/**.cpp",
 		"%{prj.name}/vendor/glm/glm/**.hpp",
 		"%{prj.name}/vendor/glm/glm/**.inl",
 	}

	defines
 	{
 		"_CRT_SECURE_NO_WARNINGS"
 	}
 
 	includedirs
 	{
        "%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.glm}",
		"%{IncludeDir.stb_image}",
 		"%{IncludeDir.entt}",
		"%{IncludeDir.yaml_cpp}"
 	}
 
 	links 
 	{ 
 		"GLFW",
        "Glad",
        "ImGui",
		"yaml-cpp",
 		"opengl32.lib"
 	}
 
 	filter "system:windows"
		systemversion "latest"
 
 		defines
 		{
 			"HZ_PLATFORM_WINDOWS",
			"HZ_BUILD_DLL",
 			"GLFW_INCLUDE_NONE",
			"YAML_CPP_STATIC_DEFINE"
 		}
 
 	filter "configurations:Debug"
 		defines "HZ_DEBUG"
        buildoptions "/utf-8"
        runtime "Debug"
 		symbols "on"
 
 	filter "configurations:Release"
 		defines "HZ_RELEASE"
        buildoptions "/utf-8"
        runtime "Release"
 		optimize "on"
 
 	filter "configurations:Dist"
 		defines "HZ_DIST"
        buildoptions "/utf-8"
        runtime "Release"
 		optimize "on"
 
 project "Sandbox"
 	location "Sandbox"
 	kind "ConsoleApp"
 	language "C++"

    cppdialect "C++17"
 	staticruntime "off"
 
 	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
 	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
 
 	files
 	{
 		"%{prj.name}/src/**.h",
 		"%{prj.name}/src/**.cpp"
 	}
 
 	includedirs
 	{
 		"Hazel/vendor/spdlog/include",
		"Hazel/src",
        "Hazel/vendor",
 		"%{IncludeDir.glm}"
 	}
 
 	links
 	{
 		"Hazel"
 	}
 
 	filter "system:windows"
		systemversion "latest"
 
 		defines
 		{
 			"HZ_PLATFORM_WINDOWS"
 		}
 
 	filter "configurations:Debug"
 		defines "HZ_DEBUG"
        buildoptions "/utf-8"
        runtime "Debug"
 		symbols "on"
 
 	filter "configurations:Release"
 		defines "HZ_RELEASE"
        buildoptions "/utf-8"
        runtime "Release"
 		optimize "on"
 
 	filter "configurations:Dist"
 		defines "HZ_DIST"
        buildoptions "/utf-8"
        runtime "Release"
 		optimize "on"


project "Hazelnut"
 	location "Hazelnut"
 	kind "ConsoleApp"
 	language "C++"
 	cppdialect "C++17"
 	staticruntime "off"
 
 	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
 	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
 
 	files
 	{
 		"%{prj.name}/src/**.h",
 		"%{prj.name}/src/**.cpp"
 	}
 
 	includedirs
 	{
 		"Hazel/vendor/spdlog/include",
 		"Hazel/src",
 		"Hazel/vendor",
		"%{IncludeDir.glm}",
 		"%{IncludeDir.entt}",
		"%{IncludeDir.yaml_cpp}"
 	}
 
 	links
 	{
 		"Hazel",
		"yaml-cpp"
 	}
 
 	filter "system:windows"
 		systemversion "latest"
		
		defines
		{
			"HZ_PLATFORM_WINDOWS",
			"YAML_CPP_STATIC_DEFINE"
		}
 		
 	filter "configurations:Debug"
 		defines "HZ_DEBUG"
 		runtime "Debug"
		buildoptions "/utf-8"
 		symbols "on"
 
 	filter "configurations:Release"
 		defines "HZ_RELEASE"
 		runtime "Release"
		buildoptions "/utf-8"
 		optimize "on"
 
 	filter "configurations:Dist"
 		defines "HZ_DIST"
 		runtime "Release"
		buildoptions "/utf-8"
 		optimize "on"