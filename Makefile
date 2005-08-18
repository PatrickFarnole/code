#$Id: Makefile,v 1.11.2.2 2005-08-18 13:12:36 kbk Exp $
#
# Makefile for making new release of GOTM.
#
# Before doing - make release - be sure to commit all files.

# Remember to update  - VERSION - for each new release


# 20010531
VERSION=2.3.5
# 20010531
VERSION=2.3.6
# 20010613
VERSION=2.3.7
# 20011118
VERSION=2.3.8
# 20030327
VERSION=3.1.0
# 20050627
VERSION=3.1.3
# 20050627
VERSION=3.1.3_bio
# 20050817
VERSION=3.2.0
# 20050818
VERSION=3.2.1

all: VERSION

VERSION: Makefile
	$(MAKE) distclean
	@echo $(VERSION) > $@
	@date > timestamp
	@echo \#define RELEASE \"$(VERSION)\" > .ver
	@mv -f .ver include/version.h

Makefile:

devel stable branch: distclean VERSION
	@echo
	@echo "making a new "$@" release: v"$(VERSION)
	@echo
	@. release.sh $@ $(VERSION)

distclean:
	make -C doc/ $@
	make -C src/ $@
	$(RM) timestep VERSION include/version.h
	$(RM) -r lib/ modules/

#-----------------------------------------------------------------------
# Copyright (C) 2001 - Hans Burchard and Karsten Bolding (BBH)         !
#-----------------------------------------------------------------------
