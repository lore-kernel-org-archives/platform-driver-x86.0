From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v2 09/11] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date: Tue, 14 Jul 2020 15:02:01 +0300
Message-ID: <20200714120203.10352-10-vadimp@mellanox.com>
References: <20200714120203.10352-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200714120203.10352-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Add documentation for the new attributes for exposing CPLDs part
numbers and CPLD minor versions.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v1->v2:
Changes added by Vadim:
- Update date and kernel version.
---
 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index b0d90cc696a8..fd9a8045bb0c 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -206,3 +206,20 @@ Description:	This file exposes the firmware version of burnable voltage
 		regulator devices.
 
 		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld1_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld2_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld3_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld4_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld1_version_min
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld2_version_min
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld3_version_min
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld4_version_min
+Date:		July 2020
+KernelVersion:	5.9
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show with which CPLD part numbers and minor
+		versions have been burned CPLD devices equipped on a
+		system.
+
+		The files are read only.
-- 
2.11.0
