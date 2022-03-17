dnl This is a GNU -*- autoconf -*- specification that is processed by Autoconf.
dnl Copyright Yahoo Inc, 2021.
dnl Licensed under the terms of the Apache-2.0 license.
dnl For terms, see the LICENSE file at https://github.com/yahoo/tunitas-montara/blob/master/LICENSE
dnl For terms, see the LICENSE file at https://git.tunitas.technology/all/services/montara/tree/LICENSE
dnl
dnl Build Instructions are in the nearby README.md
dnl
dnl ./maintenance/nearby is a developer-centric build recipe; it guesses about nearby source trees
dnl
dnl ./buildconf &&
dnl ./configure --prefix=/opt/tunitas &&
dnl make &&
dnl make check &&
dnl make install &&
dnl echo OK DONE
dnl
AC_INIT([montara], [0.3.0], [tunitas@yahooinc.com])
TF_INIT(AC_PACKAGE_NAME, AC_PACKAGE_VERSION, AC_PACKAGE_BUGREPORT)

dnl These options are also in the Makefile.am in AUTOMAKE_OPTIONS
dnl AM_INIT_AUTOMAKE([no-define subdir-objects foreign])
AM_SILENT_RULES([yes])

AC_CONFIG_SRCDIR([src/app/service/main.xcpp])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile systemd/montara.service])
#
# To have submodules
#   configure.ac: HGTW_CONFIG_SUBMODULES([submodules], [...list...])
#   Makefile.am:  SUBDIRS = @subdirs@
# to have no submodules
#   comment these schemes out in both places
#

TF_COMPONENT_METADIRECTORY_TIERS
TF_ENABLE_GNU
TF_ENABLE_GDB
TF_ENABLE_GCC
TF_ENABLE_LIBTOOL_NO_INSTALL
TF_ENABLE_MOCK_BUILD

TF_WITH_STD([scold])
TF_WITH_STD([tunitas])

TF_WITH_SUBSYSTEM([temerarious-flagship], [], [The Tunitas Build System])
TF_WITH_SUBSYSTEM([tunitas-basics], [], [The Tunitas Basics])
TF_WITH_SUBSYSTEM([microhttpd++], [], [Micro HTTPd Server])

dnl successors in v2-series world
TF_WITH_MODULE([langu])
TF_WITH_MODULE([nonstd])
TF_WITH_MODULE([options])
TF_WITH_MODULE([sys])
TF_WITH_MODULE([rigging]) dnl a.k.a. unit-rigging -> rigging-unit

dnl [[deprecating]] yet still mention in $(DEVELOPMENT_AREAS) in Makefile.am
TF_WITH_MODULE([cppunit])
TF_WITH_MODULE([format])
TF_WITH_MODULE([ip])
TF_WITH_MODULE([json])
TF_WITH_MODULE([posix])
TF_WITH_MODULE([std])
TF_WITH_MODULE([string]) dnl a.k.a. c-string

TF_MSG_VERBOSE([compiler-specific (alphabetical)])
TF_WITH_NONSTD([cppunit]) dnl [[deprecating]]
TF_WITH_NONSTD([gcc]) dnl but modern gcc-12 & beyond is fine
TF_WITH_NONSTD([jsoncpp]) dnl but modern jsoncpp-1.8.4 is fine

AM_PROG_AR
LT_PREREQ([2.4.2])
LT_INIT
AC_PROG_CC
AC_PROG_CXX
AM_PROG_CC_C_O
TF_PROG_DC

TF_CHECK_CPPUNIT
TF_CHECK_JSONCPP

dnl [[FIXTHIS,TODO]] move this into a captured macro, e.g. TF_CHECK_PACKAGE([microhttpd++-devel]) ... or such
dnl Just one (1) of these should be enough to probe that (package) microhttpd++-devel is installed, but just in case.
dnl this checkes whether libhttpd++devel is installed by probing to see if the "module-as-#include-header" so named exists for compilation
TF_CHECK_PACKAGES([microhttpd microhttpd.Daemon microhttpd.Render microhttpd.Request microhttpd.Response microhttpd.Router microhttpd.Service], [microhttpd++-devel])

m4_include([ac/with-pkgconfigdir.m4]) dnl [[FIXTHIS]] into temerarious-flagship (many packages have it)
MONTARA_WITH_PKGCONFIGDIR
tunitas_montara_pkgconfdir='${prefix}/etc/tunitas/montara'
AC_DEFINE_UNQUOTED([TUNITAS_MONTARA_PKGCONFDIR], ["$tunitas_montara_pkgconfdir"], [directory containing the configuration files, e.g. /etc/tunitas/montara])

TF_FINALIZE
