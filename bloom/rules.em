#!/usr/bin/make -f
# -*- makefile -*-
# Sample debian/rules that uses debhelper.
# This file was originally written by Joey Hess and Craig Small.
# As a special exception, when this file is copied by dh-make into a
# dh-make output file, you may use that output file without restriction.
# This special exception was added by Craig Small in version 0.37 of dh-make.

# Uncomment this to turn on verbose mode.
export DH_VERBOSE=1
export DH_OPTIONS=-v
export CMAKE_PREFIX_PATH="/opt/ros/fuerte"
CMAKE_FLAGS = \
	-DCMAKE_BUILD_TYPE=Release \
	-DUSE_ROS=ON
%:
	dh  $@

override_dh_auto_configure:
	dh_auto_configure -Scmake -- \
		-DCMAKE_INSTALL_PREFIX="/opt/ros/fuerte" \
		-DCMAKE_PREFIX_PATH="/opt/ros/fuerte" \
		$(CMAKE_FLAGS)

override_dh_auto_test:
	echo -- Running tests. Even if one of them fails the build is not canceled.
	-cat /proc/meminfo
	-cat /proc/cpuinfo
	dh_auto_test || true

