From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/3] Documentation: Add file about toshiba_haps module
Date: Mon,  4 Aug 2014 09:27:14 -0600
Message-ID: <1407166035-2020-3-git-send-email-coproscefalo@gmail.com>
References: <1407166035-2020-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:60789 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752242AbaHDP1Y (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Aug 2014 11:27:24 -0400
Received: by mail-oa0-f48.google.com with SMTP id m1so5037206oag.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Aug 2014 08:27:21 -0700 (PDT)
In-Reply-To: <1407166035-2020-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch provides information about the Toshiba HDD
Active Protection Sensor driver module toshiba_haps.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 Documentation/laptops/toshiba_haps.txt | 80 ++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/laptops/toshiba_haps.txt

diff --git a/Documentation/laptops/toshiba_haps.txt b/Documentation/laptops/toshiba_haps.txt
new file mode 100644
index 0000000..5e41d60
--- /dev/null
+++ b/Documentation/laptops/toshiba_haps.txt
@@ -0,0 +1,80 @@
+Kernel driver toshiba_haps
+Toshiba HDD Active Protection Sensor
+====================================
+
+Author: Azael Avalos <coproscefalo@gmail.com>
+
+
+0. Contents
+-----------
+
+1. Description
+2. Interface
+3. Accelerometer axes
+4. Supported devices
+5. Usage
+
+
+1. Description
+--------------
+
+This driver provides support for the accelerometer found in various Toshiba
+laptops, being called "Toshiba HDD Protection - Shock Sensor" officialy,
+and detects laptops automatically with this device.
+On Windows, Toshiba provided software monitors this device and provides
+automatic HDD protection (head unload) on sudden moves or harsh vibrations,
+however, this driver only provides a notification via a sysfs file to let
+userspace tools or daemons act accordingly, as well as providing a sysfs
+file to set the desired protection level or sensor sensibility.
+
+
+2. Interface
+------------
+
+This device comes with 3 methods:
+_STA -  Checks existence of the device, returning Zero if the device does not
+	exists or is not supported.
+PTLV -  Sets the desired protection level.
+RSSS -  Shuts down the HDD protection interface for a few seconds,
+	then restores normal operation.
+
+Note:
+The presence of Solid State Drives (SSD) can make this driver to fail loading,
+given the fact that such drives have no movable parts, and thus, not requiring
+any "protection" as well as failing during the evaluation of the _STA method
+found under this device.
+
+
+3. Accelerometer axes
+---------------------
+
+This device does not report any axes, however, to query the sensor position
+a couple HCI (Hardware Configuration Interface) calls (0x6D and 0xA6) are
+provided to query such information, handled by the kernel module toshiba_acpi
+since kernel version 3.15.
+
+
+4. Supported devices
+--------------------
+
+This driver binds itself to the ACPI device TOS620A, and any Toshiba laptop
+with this device is supported, given the fact that they have the presence of
+conventional HDD and not only SSD, or a combination of both HDD and SSD.
+
+
+5. Usage
+--------
+
+The sysfs files under /sys/devices/platform/toshiba_haps/ are:
+protection_level - The protection_level is readable and writeable, and
+		   provides a way to let userspace query the current protection
+		   level, as well as set the desired protection level, and the
+		   available protection levels are:
+		   0 - Disabled | 1 - Low | 2 - Medium | 3 - High
+reset_protection - The reset_protection entry is writeable only, being "1"
+		   the only parameter it accepts, it is used to trigger
+		   a reset of the protection interface.
+movement - The movement entry is readable only, it shows 1 whenever a
+	   "sudden movement" is detected, this being triggered by the ACPI
+	   notify event 0x80, and 0 whenever the device "stabilized" via the
+	   ACPI notify event 0x81.
-- 
2.0.0
