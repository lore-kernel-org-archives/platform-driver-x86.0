From: Kenneth Chan <kenneth.t.chan@gmail.com>
Subject: [PATCH 3/9] split MODULE_AUTHOR() by one author per macro call
Date: Sat, 22 Aug 2020 02:14:27 +0800
Message-ID: <20200821181433.17653-4-kenneth.t.chan@gmail.com>
References: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: laforge@gnumonks.org, Kenneth Chan <kenneth.t.chan@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

In reply to https://lkml.org/lkml/2020/8/19/186 to split MODULE_AUTHOR()
per macro call.


Signed-off-by: Kenneth Chan <kenneth.t.chan@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 7170c36577bf..162b6c560af1 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -13,6 +13,7 @@
  *
  * ChangeLog:
  *	Aug.18, 2020	Kenneth Chan <kenneth.t.chan@gmail.com>
+ *			split MODULE_AUTHOR() by one author per macro call
  *			replace ACPI prints with pr_*() macros
  *		-v0.97	add support for cdpower hardware switch
  *		-v0.96	merge Lucina's enhancement
@@ -125,7 +126,11 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/platform_device.h>
 
-MODULE_AUTHOR("Hiroshi Miura, David Bronaugh and Harald Welte");
+MODULE_AUTHOR("Hiroshi Miura <miura@da-cha.org>");
+MODULE_AUTHOR("David Bronaugh <dbronaugh@linuxboxen.org>");
+MODULE_AUTHOR("Harald Welte <laforge@gnumonks.org>");
+MODULE_AUTHOR("Martin Lucina <mato@kotelna.sk>");
+MODULE_AUTHOR("Kenneth Chan <kenneth.t.chan@gmail.com>");
 MODULE_DESCRIPTION("ACPI HotKey driver for Panasonic Let's Note laptops");
 MODULE_LICENSE("GPL");
 
-- 
2.17.5
