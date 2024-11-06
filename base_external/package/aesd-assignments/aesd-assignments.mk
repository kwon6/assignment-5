
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
#AESD_ASSIGNMENTS_VERSION = '#COMMIT VERSION NUMBER'
AESD_ASSIGNMENTS_VERSION = '4b6bd47d5d53fea926030bed1d31f48c008580ae'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
#AESD_ASSIGNMENTS_SITE = '#GITHUB REPOSITORY LINK'
AESD_ASSIGNMENTS_SITE = 'git@github.com:kwon6/kwon6-assignment-3-kwon6.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

# Use your latest code to cross compile an aesdsocket application for the target by running make from the server subdirectory.
define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# Install your aesdsocket executable to /usr/bin
#
# Install your aesdsocket-start-stop script to /etc/init.d/S99aesdsocket
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
