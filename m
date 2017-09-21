From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 00/12] Introduce support for Dell SMBIOS over WMI
Date: Thu, 21 Sep 2017 08:57:05 -0500
Message-ID: <cover.1505999739.git.mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa3.dell-outbound.iphmx.com ([68.232.153.94]:12291 "EHLO
        esa3.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751675AbdIUN51 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Sep 2017 09:57:27 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>

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
Instead offer a syfs interface for communicating with this ASL
method to allow userspace to use instead.

To faciliate that needs for userspace and kernel space this patch
series introduces a generic way for WMI drivers to be able to
create character devices through the WMI bus when desired.
Requiring WMI drivers to explictly ask for this functionality will
act as an effective vendor whitelist.

Mario Limonciello (12):
  platform/x86: dell-wmi: label driver as handling notifications
  platform/x86: dell-wmi: Don't match on descriptor GUID modalias
  platform/x86: dell-smbios: Add pr_fmt definition to driver
  platform/x86: dell-smbios: Switch to a WMI-ACPI interface
  platform/x86: dell-smbios: rename to dell-wmi-smbios
  platform/x86: dell-wmi-smbios: Add a sysfs interface for SMBIOS tokens
  platform/x86: dell-wmi-smbios: Use Dell WMI descriptor check
  platform/x86: wmi: Cleanup exit routine in reverse order of init
  platform/x86: wmi: create character devices when requested by drivers
  platform/x86: wmi: destroy on cleanup rather than unregister
  platform/x86: dell-wmi-smbios: introduce character device for
    userspace
  platform/x86: Kconfig: Change the default settings for dell-wmi-smbios

 Documentation/ABI/testing/dell-wmi-smbios          |  19 +
 .../ABI/testing/sysfs-platform-dell-wmi-smbios     |  16 +
 MAINTAINERS                                        |   8 +-
 drivers/platform/x86/Kconfig                       |  13 +-
 drivers/platform/x86/Makefile                      |   2 +-
 drivers/platform/x86/dell-laptop.c                 |   2 +-
 drivers/platform/x86/dell-smbios.c                 | 213 ----------
 drivers/platform/x86/dell-wmi-smbios.c             | 444 +++++++++++++++++++++
 .../x86/{dell-smbios.h => dell-wmi-smbios.h}       |  23 +-
 drivers/platform/x86/dell-wmi.c                    |  78 +---
 drivers/platform/x86/wmi.c                         | 104 ++++-
 include/linux/wmi.h                                |   1 +
 12 files changed, 610 insertions(+), 313 deletions(-)
 create mode 100644 Documentation/ABI/testing/dell-wmi-smbios
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-wmi-smbios
 delete mode 100644 drivers/platform/x86/dell-smbios.c
 create mode 100644 drivers/platform/x86/dell-wmi-smbios.c
 rename drivers/platform/x86/{dell-smbios.h => dell-wmi-smbios.h} (75%)

-- 
2.14.1
