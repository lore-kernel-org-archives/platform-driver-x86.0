From: michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org
Subject: [PATCH v1 0/4] support watchdog with longer timeout period
Date: Thu, 16 Apr 2020 19:35:10 +0300
Message-ID: <20200416163514.7334-1-michaelsh@mellanox.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

This patchset adds support of extended new watchdog type 3 of Mellanox
Ethernet and Infiniband switch systems.
This type of watchdog can have a timeout period longer than 255 or 32 sec.
as it was before.

Michael Shych (4):
  platform_data/mlxreg: support new watchdog type with longer timeout
    period
  platform/x86: mlx-platform: support new watchdog type with longer
    timeout
  watchdog: mlx-wdt: support new watchdog type with longer timeout
    period
  Documentation/watchdog: Add description of new watchdog type 3

 Documentation/watchdog/mlx-wdt.rst   |   9 +++
 drivers/platform/x86/mlx-platform.c  | 106 +++++++++++++++++++++++++++++++
 drivers/watchdog/mlx_wdt.c           |  75 +++++++++++++++++++++----
 include/linux/platform_data/mlxreg.h |   5 +-
 4 files changed, 183 insertions(+), 12 deletions(-)

-- 
2.11.0
