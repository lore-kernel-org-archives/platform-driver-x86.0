From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v3 04/11] Documentation/ABI: Style changes
Date: Mon, 13 Jan 2020 16:28:32 +0000
Message-ID: <20200113162839.18103-5-vadimp@mellanox.com>
References: <20200113162839.18103-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200113162839.18103-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Remove blank lines between "What" and "Date" keywords.
Start each section with "What" keyword.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 05601a90a9b6..eb6db7382ae3 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -1,5 +1,4 @@
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic_health
-
 Date:		June 2018
 KernelVersion:	4.19
 Contact:	Vadim Pasternak <vadimpmellanox.com>
@@ -19,7 +18,6 @@ Description:	These files show with which CPLD versions have been burned
 		The files are read only.
 
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/fan_dir
-
 Date:		December 2018
 KernelVersion:	5.0
 Contact:	Vadim Pasternak <vadimpmellanox.com>
@@ -30,7 +28,6 @@ Description:	This file shows the system fans direction:
 		The files are read only.
 
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld3_version
-
 Date:		November 2018
 KernelVersion:	5.0
 Contact:	Vadim Pasternak <vadimpmellanox.com>
@@ -40,7 +37,6 @@ Description:	These files show with which CPLD versions have been burned
 		The files are read only.
 
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/jtag_enable
-
 Date:		November 2018
 KernelVersion:	5.0
 Contact:	Vadim Pasternak <vadimpmellanox.com>
@@ -108,7 +104,6 @@ What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_comex_pwr_fail
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_from_comex
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_system
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_voltmon_upgrade_fail
-
 Date:		November 2018
 KernelVersion:	5.0
 Contact:	Vadim Pasternak <vadimpmellanox.com>
@@ -130,6 +125,12 @@ Description:	These files show with which CPLD versions have been burned
 
 		The files are read only.
 
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_comex_thermal
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_comex_wd
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_from_asic
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_reload_bios
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_sff_wd
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_swb_wd
 Date:		June 2019
 KernelVersion:	5.3
 Contact:	Vadim Pasternak <vadimpmellanox.com>
@@ -142,10 +143,3 @@ Description:	These files show the system reset cause, as following:
 		only last reset cause.
 
 		The files are read only.
-
-What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_comex_thermal
-What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_comex_wd
-What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_from_asic
-What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_reload_bios
-What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_sff_wd
-What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_swb_wd
-- 
2.11.0
