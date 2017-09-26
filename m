From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v2 00/14] Introduce support for Dell SMBIOS over WMI
Date: Tue, 26 Sep 2017 13:49:58 -0500
Message-ID: <cover.1506451187.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
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
drivers to be able to create discoverable character devices through
the WMI bus when desired.
Requiring WMI drivers to explicitly ask for this functionality will
act as an effective vendor whitelist to character device creation.

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
  platform/x86: dell-wmi: label driver as handling notifications
  platform/x86: dell-smbios: drop needless includes
  platform/x86: dell-wmi: Don't match on descriptor GUID modalias
  platform/x86: dell-smbios: Add pr_fmt definition to driver
  platform/x86: wmi: sort include list
  platform/x86: wmi: Cleanup exit routine in reverse order of init
  platform/x86: wmi: destroy on cleanup rather than unregister
  platform/x86: dell-smbios: Introduce a WMI-ACPI interface
  platform/x86: dell-smbios: rename to dell-wmi-smbios
  platform/x86: dell-wmi-smbios: Use Dell WMI descriptor check
  platform/x86: wmi: create character devices when requested by drivers
  platform/x86: dell-wmi-smbios: introduce character device for
    userspace
  platform/x86: Kconfig: Change the default settings for dell-wmi-smbios
  platform/x86: dell-wmi-smbios: clean up wmi descriptor check

 Documentation/ABI/testing/dell-wmi-smbios          |  10 +
 MAINTAINERS                                        |   8 +-
 drivers/platform/x86/Kconfig                       |  13 +-
 drivers/platform/x86/Makefile                      |   2 +-
 drivers/platform/x86/dell-laptop.c                 |   2 +-
 drivers/platform/x86/dell-smbios.c                 | 213 ---------
 drivers/platform/x86/dell-wmi-smbios.c             | 481 +++++++++++++++++++++
 .../x86/{dell-smbios.h => dell-wmi-smbios.h}       |  28 +-
 drivers/platform/x86/dell-wmi.c                    |  78 +---
 drivers/platform/x86/wmi.c                         | 116 ++++-
 include/linux/wmi.h                                |   1 +
 include/uapi/linux/dell-wmi-smbios.h               |  55 +++
 12 files changed, 674 insertions(+), 333 deletions(-)
 create mode 100644 Documentation/ABI/testing/dell-wmi-smbios
 delete mode 100644 drivers/platform/x86/dell-smbios.c
 create mode 100644 drivers/platform/x86/dell-wmi-smbios.c
 rename drivers/platform/x86/{dell-smbios.h => dell-wmi-smbios.h} (74%)
 create mode 100644 include/uapi/linux/dell-wmi-smbios.h

-- 
2.14.1
