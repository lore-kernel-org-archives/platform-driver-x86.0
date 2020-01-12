From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v2 02/10] Documentation/ABI: Fix documentation inconsistency for mlxreg-io sysfs interfaces
Date: Sun, 12 Jan 2020 12:18:41 +0000
Message-ID: <20200112121849.7056-3-vadimp@mellanox.com>
References: <20200112121849.7056-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200112121849.7056-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Fix attribute name from "jtag_enable", which described twice to
"cpld3_version", which is expected to be instead of second appearance
of "jtag_enable".

Fixes: 2752e34442b5 ("Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces")
Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v1-v2:
 Comments pointed out by Andy:
 - Explain that patch fixes documentation inconsistency.
---
 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 8ca498447aeb..8b1461fa3538 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -29,13 +29,13 @@ Description:	This file shows the system fans direction:
 
 		The files are read only.
 
-What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/jtag_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld3_version
 
 Date:		November 2018
 KernelVersion:	5.0
 Contact:	Vadim Pasternak <vadimpmellanox.com>
 Description:	These files show with which CPLD versions have been burned
-		on LED board.
+		on LED or Gearbox board.
 
 		The files are read only.
 
-- 
2.11.0
