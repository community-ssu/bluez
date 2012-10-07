#!/bin/sh
set -e
# Run this to set up the build system: configure, makefiles, etc.

srcdir=`dirname $0`
test -n "$srcdir" || srcdir=.

cd "$srcdir"

if test -n "$AUTOMAKE"; then
	: # don't override an explicit user request
elif automake-1.9 --version >/dev/null 2>/dev/null &&
	aclocal-1.9 --version >/dev/null 2>/dev/null; then
	AUTOMAKE=automake-1.9
	export AUTOMAKE
	ACLOCAL=aclocal-1.9
	export ACLOCAL
fi

autoreconf -i -f
