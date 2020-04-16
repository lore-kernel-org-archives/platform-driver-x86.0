From: michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org
Subject: [PATCH v1 4/4] Documentation/watchdog: Add description of new watchdog type 3
Date: Thu, 16 Apr 2020 19:35:14 +0300
Message-ID: <20200416163514.7334-5-michaelsh@mellanox.com>
References: <20200416163514.7334-1-michaelsh@mellanox.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200416163514.7334-1-michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

Add documentation with details of new type of Mellanox watchdog driver.

Signed-off-by: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

Reviewed-by: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
---
 Documentation/watchdog/mlx-wdt.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/watchdog/mlx-wdt.rst b/Documentation/watchdog/mlx-wdt.rst
index bf5bafac47f0..fa0a94e5c82e 100644
--- a/Documentation/watchdog/mlx-wdt.rst
+++ b/Documentation/watchdog/mlx-wdt.rst
@@ -24,10 +24,19 @@ Type 2:
   Maximum timeout is 255 sec.
   Get time-left is supported.
 
+Type 3:
+  Same as Type 2 with extended maximum timeout period.
+  Maximum timeout is 65535 sec.
+
 Type 1 HW watchdog implementation exist in old systems and
 all new systems have type 2 HW watchdog.
 Two types of HW implementation have also different register map.
 
+Type 3 HW watchdog implementation can exist on all Mellanox systems
+with new programmer logic device.
+It's differentiated by WD capability bit.
+Old systems still have only one main watchdog.
+
 Mellanox system can have 2 watchdogs: main and auxiliary.
 Main and auxiliary watchdog devices can be enabled together
 on the same system.
-- 
2.11.0
