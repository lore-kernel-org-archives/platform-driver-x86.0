From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v2 03/10] Documentation/ABI: Add missed attribute for mlxreg-io sysfs interfaces
Date: Sun, 12 Jan 2020 12:18:42 +0000
Message-ID: <20200112121849.7056-4-vadimp@mellanox.com>
References: <20200112121849.7056-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200112121849.7056-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Add missed "cpld4_version" attribute.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 8b1461fa3538..fe30fe505c9b 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -121,6 +121,16 @@ Description:	These files show the system reset cause, as following: ComEx
 
 		The files are read only.
 
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld4_version
+
+Date:		November 2018
+KernelVersion:	5.0
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show with which CPLD versions have been burned
+		on LED board.
+
+		The files are read only.
+
 Date:		June 2019
 KernelVersion:	5.3
 Contact:	Vadim Pasternak <vadimpmellanox.com>
-- 
2.11.0
