# Conan Profiles

This directory contains Conan 2 profiles for each platform/toolchain combination used in the CI/CD pipeline.

## Profile Naming Convention

`{os}_{arch}_{compiler}_{version}`

## Available Profiles

- **linux_x86_64_gcc_11** - Linux x86_64 with GCC 11
- **macos_x86_64_apple-clang_15** - macOS x86_64 with Apple Clang 15
- **macos_armv8_apple-clang_15** - macOS ARM64 (Apple Silicon) with Apple Clang 15
- **windows_x86_64_msvc_193** - Windows x86_64 with MSVC 193 (Visual Studio 2022)

## Usage

```bash
# Create lockfile with specific profile
conan lock create . --lockfile-out=conan.lock --profile:build=linux_x86_64_gcc_11

# Build package with specific profile
conan create . --profile:build=linux_x86_64_gcc_11 -s build_type=Release
```

## Profile Settings

Each profile captures the required settings:
- `os` - Operating system
- `arch` - Architecture (x86_64, armv8)
- `compiler` - Compiler (gcc, apple-clang, msvc)
- `compiler.version` - Compiler version
- `compiler.libcxx` - C++ standard library
- `build_type` - Build configuration (Release/Debug)