# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mingrui/Mingrui/SLAMProject/stereo_slam_system

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mingrui/Mingrui/SLAMProject/stereo_slam_system/build

# Include any dependencies generated for this target.
include app/CMakeFiles/run_kitti_stereo.dir/depend.make

# Include the progress variables for this target.
include app/CMakeFiles/run_kitti_stereo.dir/progress.make

# Include the compile flags for this target's objects.
include app/CMakeFiles/run_kitti_stereo.dir/flags.make

app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o: app/CMakeFiles/run_kitti_stereo.dir/flags.make
app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o: ../app/run_kitti_stereo.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mingrui/Mingrui/SLAMProject/stereo_slam_system/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o"
	cd /home/mingrui/Mingrui/SLAMProject/stereo_slam_system/build/app && /usr/bin/g++-7  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o -c /home/mingrui/Mingrui/SLAMProject/stereo_slam_system/app/run_kitti_stereo.cpp

app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.i"
	cd /home/mingrui/Mingrui/SLAMProject/stereo_slam_system/build/app && /usr/bin/g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mingrui/Mingrui/SLAMProject/stereo_slam_system/app/run_kitti_stereo.cpp > CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.i

app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.s"
	cd /home/mingrui/Mingrui/SLAMProject/stereo_slam_system/build/app && /usr/bin/g++-7 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mingrui/Mingrui/SLAMProject/stereo_slam_system/app/run_kitti_stereo.cpp -o CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.s

app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o.requires:

.PHONY : app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o.requires

app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o.provides: app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o.requires
	$(MAKE) -f app/CMakeFiles/run_kitti_stereo.dir/build.make app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o.provides.build
.PHONY : app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o.provides

app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o.provides.build: app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o


# Object files for target run_kitti_stereo
run_kitti_stereo_OBJECTS = \
"CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o"

# External object files for target run_kitti_stereo
run_kitti_stereo_EXTERNAL_OBJECTS =

../bin/run_kitti_stereo: app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o
../bin/run_kitti_stereo: app/CMakeFiles/run_kitti_stereo.dir/build.make
../bin/run_kitti_stereo: ../lib/libmyslam.so
../bin/run_kitti_stereo: /usr/local/lib/libopencv_dnn.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_highgui.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_ml.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_objdetect.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_shape.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_stitching.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_superres.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_videostab.so.3.4.9
../bin/run_kitti_stereo: /home/mingrui/Pangolin/build/src/libpangolin.so
../bin/run_kitti_stereo: /usr/local/lib/libgtest.a
../bin/run_kitti_stereo: /usr/local/lib/libgtest_main.a
../bin/run_kitti_stereo: /usr/lib/x86_64-linux-gnu/libglog.so
../bin/run_kitti_stereo: /usr/lib/x86_64-linux-gnu/libgflags.so.2.2.1
../bin/run_kitti_stereo: /usr/lib/x86_64-linux-gnu/libcxsparse.so
../bin/run_kitti_stereo: /home/mingrui/caffe/build/lib/libcaffe.so
../bin/run_kitti_stereo: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
../bin/run_kitti_stereo: /usr/lib/x86_64-linux-gnu/libboost_system.so
../bin/run_kitti_stereo: /usr/local/lib/libopencv_calib3d.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_features2d.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_flann.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_photo.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_video.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_videoio.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_imgcodecs.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_imgproc.so.3.4.9
../bin/run_kitti_stereo: /usr/local/lib/libopencv_core.so.3.4.9
../bin/run_kitti_stereo: /usr/lib/x86_64-linux-gnu/libGL.so
../bin/run_kitti_stereo: /usr/lib/x86_64-linux-gnu/libGLU.so
../bin/run_kitti_stereo: /usr/lib/x86_64-linux-gnu/libGLEW.so
../bin/run_kitti_stereo: /usr/lib/x86_64-linux-gnu/libX11.so
../bin/run_kitti_stereo: /usr/lib/x86_64-linux-gnu/libXext.so
../bin/run_kitti_stereo: app/CMakeFiles/run_kitti_stereo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mingrui/Mingrui/SLAMProject/stereo_slam_system/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/run_kitti_stereo"
	cd /home/mingrui/Mingrui/SLAMProject/stereo_slam_system/build/app && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/run_kitti_stereo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
app/CMakeFiles/run_kitti_stereo.dir/build: ../bin/run_kitti_stereo

.PHONY : app/CMakeFiles/run_kitti_stereo.dir/build

app/CMakeFiles/run_kitti_stereo.dir/requires: app/CMakeFiles/run_kitti_stereo.dir/run_kitti_stereo.cpp.o.requires

.PHONY : app/CMakeFiles/run_kitti_stereo.dir/requires

app/CMakeFiles/run_kitti_stereo.dir/clean:
	cd /home/mingrui/Mingrui/SLAMProject/stereo_slam_system/build/app && $(CMAKE_COMMAND) -P CMakeFiles/run_kitti_stereo.dir/cmake_clean.cmake
.PHONY : app/CMakeFiles/run_kitti_stereo.dir/clean

app/CMakeFiles/run_kitti_stereo.dir/depend:
	cd /home/mingrui/Mingrui/SLAMProject/stereo_slam_system/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mingrui/Mingrui/SLAMProject/stereo_slam_system /home/mingrui/Mingrui/SLAMProject/stereo_slam_system/app /home/mingrui/Mingrui/SLAMProject/stereo_slam_system/build /home/mingrui/Mingrui/SLAMProject/stereo_slam_system/build/app /home/mingrui/Mingrui/SLAMProject/stereo_slam_system/build/app/CMakeFiles/run_kitti_stereo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : app/CMakeFiles/run_kitti_stereo.dir/depend
