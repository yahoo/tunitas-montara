# This is a GNU -*- Makefile -*- fragment that is included by Automake
# Copyright Yahoo Inc, 2021.
# Licensed under the terms of the Apache-2.0 license.
# For terms, see the LICENSE file at https://github.com/yahoo/tunitas-montara/blob/master/LICENSE
# For terms, see the LICENSE file at https://git.tunitas.technology/all/services/montara/tree/LICENSE
#
# [[FIXTHIS]] - ACLOCAL_AMFLAGS is evaluated by automake *before* make even runs
# It uses /bin/bash eval to evaluate the line ...
#    so make variables $(...) look like backticks
#    but make variables ${...} look like shell variables with defaults
#
# is a subshell
#    /usr/bin/libtoolize: line 3772: temerarious_flagship_datadir: command not found
#
# these must all be on a single line, no backslash continuations
#ACLOCAL_AMFLAGS = -I m4 -I ${temerarious_flagship_datadir:-/opt/tunitas/share/temerarious-flagship}/ac -I ${hypogeal_twilight_datadir:-/opt/scold/share/hypogeal-twilight}/m4
ACLOCAL_AMFLAGS = -I m4
AUTOMAKE_OPTIONS = no-define subdir-objects foreign

default:
include tests/Makefrag.am
include @temerarious_flagship_datadir@/am/build.am
#
# also configure.ac and HGTW_SUBMODULE_CONFIGURE
# SUBDIRS = @subdirs@

#
# There is addenda code for perl::split in microhttpd that MUST precede module-langu == 0.2
# REMOVEWHEN deprecating the addenda area and relying solely on the module-langu version of langu::ish::perl::split
#
# Witness:
#   src/microhttpd/path/actualities/prepare.xcpp: In lambda function:
#   src/microhttpd/path/actualities/prepare.xcpp:54:78: error: ‘Elide’ was not declared in this scope
#
DEVELOPMENT_AREAS_microhttpd_addenda_before_mainline_langu_FIXTHIS = $(microhttpd___prefix) $(module_langu_prefix) 
#
# These match with TF_WITH_MODULE in configure.ac
DEVELOPMENT_AREAS = \
  $(DEVELOPMENT_AREAS_microhttpd_addenda_before_mainline_langu_FIXTHIS) \
  \
  $(module_cli_core_prefix) \
  $(module_json_prefix) \
  $(module_langu_prefix) \
  $(module_nonstd_prefix) \
  $(module_sys_prefix) \
  $(microhttpd___prefix) \
  $(tunitas_basics_prefix) \
  $(deprecated_DEVELOPMENT_AREAS) \
  $(end)
TESTING_AREAS = \
  $(module_rigging_core_prefix) \
  $(deprecated_TESTING_AREAS) \
  $(end)
INSTALLATION_AREAS = \
  $(nonstd_gcc_prefix) \
  $(nonstd_jsoncpp_prefix) \
  $(std_scold_prefix) \
  $(std_tunitas_prefix) \
  $(deprecated_INSTALLATION_AREAS) \
  $(end)

default: all

INSTALL_MODULES = \
  $(filter-out %DUMMY_DATA.cpp, $(noinst_lib_libtunitas_montara_la_MODULES)) \
  $(noinst_lib_libwant_la_MODULES) \
  $(end)

.PHONY: clean-local mostlyclean-local distclean-local
clean-local mostlyclean-local distclean-local::
clean-dependencies::
clean-local:: clean-dependencies

include check/bin/unit.am
include check/bin/pong.am
include sbin/montara-service.am
include lib/libtunitas-montara.am
include noinst/lib/libtunitas-montara.am
include noinst/lib/libautotools-autoconf+tunitas-montara.am
include noinst/lib/libapp.am
include noinst/lib/libwant.am

# There is no point in defining systemddir to follow $(prefix) because
# the system's systemd won't look in odd places, e.g. /usr/local/lib/systemd/system
systemddir = /usr/lib/systemd
systemd_systemdir = $(systemddir)/system
systemd_system_DATA = systemd/montara.service

bin_PROGRAMS = $(none)
sbin_PROGRAMS = \
  sbin/montara-service \
  $(end)
lib_LTLIBRARIES = \
  lib/libtunitas-montara.la \
  $(end)
noinst_LTLIBRARIES = \
  noinst/lib/libautotools-autoconf+tunitas-montara.la \
  noinst/lib/libtunitas-montara.la \
  noinst/lib/libwant.la \
  noinst/lib/libapp.la \
  $(end)
check_PROGRAMS = \
  check/bin/unit \
  check/bin/pong \
  $(end)

# --- Mostly boilerplate beyond here
#
# -Wall      ... the language isn't complete without it
# -std=c++1y ... as close to C++14 and beyond as we can get
# -std=c++1z ... as close to C++17 and beyond as we can get
# -ggdb      ... and recall that -ggdb and -O2 don't play well together

Makefile_COMPILER_CPPFLAGS_SET =
Makefile_COMPILER_CFLAGS_SET   = -Wall   @CFLAGS_gcc@   @CFLAGS_gdb@ -pthread
Makefile_COMPILER_CXXFLAGS_SET = -Wall @CXXFLAGS_gcc@ @CXXFLAGS_gdb@ -pthread
Makefile_COMPILER_LDFLAGS_SET  = -Wall  @LDFLAGS_gcc@  @LDFLAGS_gdb@ -pthread

# configure.ac: TF_WITH_NONSTD([something-something])
Makefile_nonstd_PACKAGE_CPPFLAGS_SET = 
Makefile_nonstd_PACKAGE_CFLAGS_SET   = 
Makefile_nonstd_PACKAGE_CXXFLAGS_SET = 
Makefile_nonstd_PACKAGE_LDFLAGS_SET  = 

Makefile_PACKAGE_CPPFLAGS_SET = @CPPFLAGS_jsoncpp@
Makefile_PACKAGE_CFLAGS_SET   =   @CFLAGS_jsoncpp@
Makefile_PACKAGE_CXXFLAGS_SET = @CXXFLAGS_jsoncpp@
Makefile_PACKAGE_LDFLAGS_SET  =  @LDFLAGS_jsoncpp@

Makefile_nonstd_CHECK_CPPFLAGS_SET = 
Makefile_nonstd_CHECK_CFLAGS_SET   = 
Makefile_nonstd_CHECK_CXXFLAGS_SET = 
Makefile_nonstd_CHECK_LDFLAGS_SET  = 

#                                                  if    did not substitute away                      then use this
#                                                  |           |                                      |            else use the substitution
#                                                  |           |              @CPPFLAGS_no_install@   |            |
#                                                  |           |              |                       |            |
#                                                  |           |              |                       |            |
#                                                  v           v              v                       v            v
Makefile_CHECK_CPPFLAGS_SET = @CPPFLAGS_cppunit@ $(if $(filter %_no_install@, @CPPFLAGS_no_install@), $(empty),    @CPPFLAGS_no_install@)
Makefile_CHECK_CFLAGS_SET   =   @CFLAGS_cppunit@ $(if $(filter %_no_install@, @CFLAGS_no_install@),   $(empty),    @CFLAGS_no_install@)
Makefile_CHECK_CXXFLAGS_SET = @CXXFLAGS_cppunit@ $(if $(filter %_no_install@, @CXXFLAGS_no_install@), $(empty),    @CXXFLAGS_no_install@)
Makefile_CHECK_LDFLAGS_SET  =  @LDFLAGS_cppunit@ $(if $(filter %_no_install@, @LDFLAGS_no_install@),  -no-install, @LDFLAGS_no_install@)

# These are assembled by .../toolflags.mk within temerarious-flagship >= 1.9, which uses hypogeal-twilight >= 0.45
AM_CPPFLAGS = $(PACKAGE_CPPFLAGS_SET)
AM_CFLAGS   = $(PACKAGE_CFLAGS_SET)
AM_CXXFLAGS = $(PACKAGE_CXXFLAGS_SET)
AM_LDFLAGS  = $(V_LDFLAGS_avoid.VERBOSE_Veq$(V))
AM_LIBTOOLFLAGS = $(V_LIBTOOLFLAGS_VERBOSE_Veq$(V))

deprecated_DEVELOPMENT_AREAS = \
  $(module_format_prefix) \
  $(module_ip_prefix) \
  $(module_options_prefix) \
  $(module_posix_prefix) \
  $(module_std_prefix) \
  $(module_string_prefix) \
  $(end)
deprecated_TESTING_AREAS = \
  $(module_cppunit_prefix) \
  $(module_rigging_prefix) \
  $(end)
deprecated_INSTALLATION_AREAS = \
  $(nonstd_cppunit_prefix) \
  $(end)
