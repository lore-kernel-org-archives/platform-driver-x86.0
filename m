From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v3 03/11] Documentation/ABI: Add missed attribute for mlxreg-io sysfs interfaces
Date: Mon, 13 Jan 2020 16:28:31 +0000
Message-ID: <20200113162839.18103-4-vadimp@mellanox.com>
References: <20200113162839.18103-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200113162839.18103-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Add missed "cpld4_version" attribute.

Fixes: 52675da1d087 ("Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces")
Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v2->v3:
 Comments pointed out by Andy:
 - add "Fixes" tag.
 - Drop blank line between "What" and "Date".
---
 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 8b1461fa3538..05601a90a9b6 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -121,6 +121,15 @@ Description:	These files show the system reset cause, as following: ComEx
 
 		The files are read only.
 
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld4_version
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
