#include "hzpch.h"
#include "OpenGLContext.h"

#include <GLFW/glfw3.h>
#include <glad/glad.h>
#include <GL/GL.h>

namespace Hazel
{

    OpenGLContext::OpenGLContext(GLFWwindow* windowHandle)
        : m_WindowHandle(windowHandle)
    {
        HZ_CORE_ASSERT(windowHandle, "Window handle is null!")
    }

    void OpenGLContext::Init()
    {
        HZ_PROFILE_FUNCTION();

        glfwMakeContextCurrent(m_WindowHandle);
        int status = gladLoadGLLoader((GLADloadproc)glfwGetProcAddress);
        HZ_CORE_ASSERT(status, "Failed to initialize Glad!");

        HZ_CORE_INFO("OpenGL Info:");
        //HZ_CORE_INFO("  Vendor: {0}", glGetString(GL_VENDOR));
        //HZ_CORE_INFO("  Renderer: {0}", glGetString(GL_RENDERER));
        //HZ_CORE_INFO("  Version: {0}", glGetString(GL_VERSION));
        HZ_CORE_INFO("  Vendor: {0}", (const char*)glGetString(GL_VENDOR));
        HZ_CORE_INFO("  Renderer: {0}", (const char*)glGetString(GL_RENDERER));
        HZ_CORE_INFO("  Version: {0}", (const char*)glGetString(GL_VERSION));

    }

    void OpenGLContext::SwapBuffers()
    {
        HZ_PROFILE_FUNCTION();

        glfwSwapBuffers(m_WindowHandle);
    }

}