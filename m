From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] platform-driver-x86: fix wrong merge for compal-laptop.c
Date: Mon, 14 Mar 2011 18:53:14 +0800
Message-ID: <1300099994.3761.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

I found the commit 80183a4b
"compal-laptop/fujitsu-laptop/msi-laptop: make dmi_check_cb to return 1 instead of 0"
has wrong patch merge.

The original patch change the return value for dmi_check_cb():
https://lkml.org/lkml/2010/7/2/88
But commit 80183a4b changed the return value for set_backlight_level.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/compal-laptop.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 034572b..f90bdf7 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -275,7 +275,7 @@ static int set_backlight_level(int level)
 
 	ec_write(BACKLIGHT_LEVEL_ADDR, level);
 
-	return 1;
+	return 0;
 }
 
 static int get_backlight_level(void)
@@ -763,7 +763,7 @@ static int dmi_check_cb(const struct dmi_system_id *id)
 	printk(KERN_INFO DRIVER_NAME": Identified laptop model '%s'\n",
 		id->ident);
 	extra_features = false;
-	return 0;
+	return 1;
 }
 
 static int dmi_check_cb_extra(const struct dmi_system_id *id)
@@ -772,7 +772,7 @@ static int dmi_check_cb_extra(const struct dmi_system_id *id)
 		"enabling extra features\n",
 		id->ident);
 	extra_features = true;
-	return 0;
+	return 1;
 }
 
 static struct dmi_system_id __initdata compal_dmi_table[] = {
-- 
1.7.1
