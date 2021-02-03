# https://stackoverflow.com/a/55602125
cmake_minimum_required(VERSION 3.8)

# Setting the name of solution
set(PROJECT_NAME CinemaTicketsCompany)

project(${PROJECT_NAME} LANGUAGES CSharp)

# Include CMake utilities for CSharp, for WinForm and WPF application support.
include(CSharpUtilities)

# Define the executable, including any .cs files. 
# The .resx and other Properties files are optional here, but including them makes them visible in the VS solution for easy editing.
# Example:
# Program.cs
# Properties/Resources.Designer.cs
add_executable(${PROJECT_NAME}
    App.config
    Form.cs
    DB.cs
    Form.Designer.cs
    Form.resx
    Program.cs
    Properties/AssemblyInfo.cs
    Properties/Resources.Designer.cs
    Properties/Resources.resx
    Properties/Settings.Designer.cs
    Properties/Settings.settings
)

# Copy resources to binary
# Example:
# configure_file(ico/32.ico Resources/32.ico COPYONLY)

# Set the .NET Framework version for the executable.
set_property(TARGET ${PROJECT_NAME} PROPERTY VS_DOTNET_TARGET_FRAMEWORK_VERSION "v4.7.2")
# Set the executable to be 32-bit.
set_property(TARGET ${PROJECT_NAME} PROPERTY WIN32_EXECUTABLE TRUE)
# Set the C# language version (defaults to 3.0).
set(CMAKE_CSharp_FLAGS "/langversion:latest")

# Set the source file properties for Windows Forms use.
csharp_set_windows_forms_properties(
    DB.cs
    Form.cs
    Form.Designer.cs
    Form.resx
    Program.cs
    Properties/AssemblyInfo.cs
    Properties/Resources.Designer.cs
    Properties/Resources.resx
    Properties/Settings.Designer.cs
    Properties/Settings.settings
)

# Add in the .NET reference libraries.
set_property(TARGET ${PROJECT_NAME} PROPERTY VS_DOTNET_REFERENCES
    "Microsoft.CSharp"
    "System"
    "System.Linq"
    "System.Threading.Tasks"
    "System.Windows.Forms"
    "System.ComponentModel"
    "System.Data"
    "System.Drawing"
    "FirebirdSql.Data.FirebirdClient"
)
set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Configs" FORCE)
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${PROJECT_NAME})