From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v4 00/14] Introduce support for Dell SMBIOS over WMI
Date: Wed,  4 Oct 2017 17:48:26 -0500
Message-ID: <cover.1507156392.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

The existing way that the dell-smbios helper module and associated
other drivers (dell-laptop, dell-wmi) communicate with the platform
really isn't secure.  It requires creating a buffer in physical
DMA32 memory space and passing that to the platform via SMM.

Since the platform got a physical memory pointer, you've just got
to trust that the platform has only modified (and accessed) memory
within that buffer.

Dell Platform designers recognize this security risk and offer a
safer way to communicate with the platform over ACPI.  This is
in turn exposed via a WMI interface to the OS.

When communicating over WMI-ACPI the communication doesn't occur
with physical memory pointers.  When the ASL is invoked, the fixed
length ACPI buffer is copied to a small operating region.  The ASL
will invoke the SMI, and SMM will only have access to this operating
region.  When the ASL returns the buffer is copied back for the OS
to process.

This method of communication should also deprecate the usage of the
dcdbas kernel module and software dependent upon it's interface.
Instead offer a character device interface for communicating with this
ASL method to allow userspace to use instead.

To faciliate that this patch series introduces a generic way for WMI
drivers to be able to create discoverable character devices with
a predictable IOCTL interface through the WMI bus when desired.
Requiring WMI drivers to explicitly ask for this functionality will
act as an effective vendor whitelist to character device creation.

Some of this work is the basis for what will be a proper interpreter
of MOF in the kernel and controls for what drivers will be able to
do with that MOF.

NOTE: This patch is intended to go on top of the 6 patches already in
Darren's review tree.

For convenience the entire series including those is also available here:
https://github.com/dell/linux/tree/wmi-smbios

I also have some PoC application use around this here:
https://github.com/superm1/smbios-wmi-poc

changes between v3 and v4:
 * Make Dell WMI notifications driver fail notifications fail
   when WMI descriptor driver is unavailable.
 * Add a patch to check for Dell OEM string to stop dell-smbios 
   module from being loaded in unsupported systems manually.
 * Split Dell WMI descriptor into it's own driver for others to
   query.
 * Test the misc BIOS flags table to decide whether to run in WMI
   or SMI mode.
 * s/dell-wmi-smbios/dell-smbios/ in a few patch titles
 * Add missing Suggested-by to a patch from v2 (Sorry Andy S!)
 * Adjust cleanup order of wmi character device.
 * Fix a remaining reference to /dev/wmi-$driver
 * Use get_order to get size for pages
 * Split up dell-smbios into 3 drivers:
   dell-smbios
   -> dell-smbios-smm
   -> dell-smbios-wmi
   If either of the two dispatcher drivers is unloaded but
   the other still works, gracefully fall back to that driver
 * Remove unneded open and release on file operations in WMI
   driver
 * Switch to misc character device in WMI bus.
 * Query the size of the calling interface buffer from WMI
   descriptor driver.
 * Require userspace to use this information to build an
   appropriately sized buffer.
 * Verify the size of buffer passed from userspace matches
   expectation of buffer processed in kernel.
 * Add more documentation about the IOCTL API.
 * Add in a recommendation from Andy S about outputing tokens
 * Add a patch to test for non-functional SMM due to WSMT
 * Define macros for IOCTL's through the WMI bus.
 * Pass all IOCTL calls for WMI drivers through WMI bus
   WMI bus will guarantee instance count matches and prevent
   creating too many more IOCTLs.
changes between v2 and v3:
 * Drop patches 1-7, they're in Darren's review tree now
 * Add missing newline on new Documentation
 * Add Reviewed by from Edward O'Callaghan
 * Adjust path of character device from /dev/wmi-$driver to
   /dev/wmi/$driver
 * Store wmi_device pointer rather than using a boolean has_wmi
   to indicate driver is running in WMI mode
 * Don't guard free_page from freeing NULL (this is OK)
 * New patch: add wmidev_evaluate_method to wmi bus as recommended
   by Andy L
 * Adjust ACPI-WMI interface for this patch change ^
 * Add back in sysfs token patch, drop 2nd and 3rd ioctls per discussion
   on mailing list.
 * On sysfs interface: adjust the delimiter to be tabs
 * Drop the rename dell-smbios -> dell-wmi-smbios patch
 * Remove/move some unnecessary tests for CONFIG_DCDBAS
 * Reword s/platform/SMM/ in the WMI-ACPI patch.
 * Update Kconfig to recommend using CONFIG_DCDBAS on old machines.
 * Allocate buffer to the same pointer regardless of the struct 
   assigned to it.  Keep track of the buffer size for cleaning up.
 * Explain policy around character device creation in commit message
changes between v1 and v2:
 * Introduce another patch to sort the includes in wmi.c
 * Introduce another patch to cleanup dell_wmi_check_descriptor_buffer
   checks.
 * Add a commit message to the pr_fmt commit
 * Introduce includes to wmi.c in proper location
 * Add Reviewed-by to relevant patches from Pali
 * Make the WMI introduction patch fallback to legacy SMI
   if compiled with CONFIG_DCDBAS
 * Separate format of WMI and SMI buffers.  WMI buffer supports more
   arguments and data.
 * Adjust the rename patch for changes to fallback
 * Drop sysfs token creation patch
 * Adjust WMI descriptor check patch for changes to fallback
 * introduce another patch to remove needless includes in dell-smbios.c
 * Add token ioctl interface to character device.
   - Can query number of tokens
   - Can query values in all tokens
 * Expose format of all buffers and IOCTL commands to uapi header
 * Drop the read interface from character device.  It doesn't make
   sense with multiple different ioctl methods.
 * Default WMI interface to 32k (This would normally be queried via
   MOF, but that's not possible yet)
 * Create separate buffers for WMI and SMI.  If WMI is available,
   free the SMI buffer.
 * Reorder patches so all fixups come first in the series.



Mario Limonciello (14):
  platform/x86: wmi: Add new method wmidev_evaluate_method
  platform/x86: dell-wmi: clean up wmi descriptor check
  platform/x86: dell-wmi: allow 32k return size in the descriptor
  platform/x86: dell-wmi: increase severity of some failures
  platform/x86: dell-wmi-descriptor: split WMI descriptor into it's own
    driver
  platform/x86: wmi: Don't allow drivers to get each other's GUIDs
  platform/x86: dell-smbios: only run if proper oem string is detected
  platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens
  platform/x86: dell-smbios: Introduce dispatcher for SMM calls
  platform/x86: dell-smbios-smm: test for WSMT
  platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver
  platform/x86: wmi: create character devices when requested by drivers
  platform/x86: dell-smbios-wmi: introduce userspace interface
  platform/x86: Kconfig: Set default for dell-smbios to ACPI_WMI

 Documentation/ABI/testing/dell-smbios-wmi          |  43 +++
 .../ABI/testing/sysfs-platform-dell-smbios         |  16 ++
 .../ABI/testing/sysfs-platform-dell-smbios-wmi     |  10 +
 MAINTAINERS                                        |  26 ++
 drivers/platform/x86/Kconfig                       |  44 ++-
 drivers/platform/x86/Makefile                      |   3 +
 drivers/platform/x86/dell-laptop.c                 | 191 +++++++------
 drivers/platform/x86/dell-smbios-smm.c             | 172 +++++++++++
 drivers/platform/x86/dell-smbios-smm.h             |  22 ++
 drivers/platform/x86/dell-smbios-wmi.c             | 313 +++++++++++++++++++++
 drivers/platform/x86/dell-smbios-wmi.h             |  18 ++
 drivers/platform/x86/dell-smbios.c                 | 183 +++++++++---
 drivers/platform/x86/dell-smbios.h                 |  13 +-
 drivers/platform/x86/dell-wmi-descriptor.c         | 162 +++++++++++
 drivers/platform/x86/dell-wmi-descriptor.h         |  18 ++
 drivers/platform/x86/dell-wmi.c                    |  96 +------
 drivers/platform/x86/wmi.c                         | 112 ++++++--
 include/linux/wmi.h                                |  12 +-
 include/uapi/linux/dell-smbios-wmi.h               |  25 ++
 include/uapi/linux/wmi.h                           |  10 +
 20 files changed, 1233 insertions(+), 256 deletions(-)
 create mode 100644 Documentation/ABI/testing/dell-smbios-wmi
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-smbios
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-smbios-wmi
 create mode 100644 drivers/platform/x86/dell-smbios-smm.c
 create mode 100644 drivers/platform/x86/dell-smbios-smm.h
 create mode 100644 drivers/platform/x86/dell-smbios-wmi.c
 create mode 100644 drivers/platform/x86/dell-smbios-wmi.h
 create mode 100644 drivers/platform/x86/dell-wmi-descriptor.c
 create mode 100644 drivers/platform/x86/dell-wmi-descriptor.h
 create mode 100644 include/uapi/linux/dell-smbios-wmi.h
 create mode 100644 include/uapi/linux/wmi.h

-- 
2.14.1
