From: Konrad Zapalowicz <bergo.torino@gmail.com>
Subject: [PATCH 10/11] driver: thinkpad_acpi: fix minor checkpatch warnings
Date: Mon, 21 Apr 2014 21:10:55 +0200
Message-ID: <1398107456-31080-11-git-send-email-bergo.torino@gmail.com>
References: <1398107456-31080-1-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-2-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-3-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-4-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-5-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-6-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-7-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-8-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-9-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-10-git-send-email-bergo.torino@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49]:47165 "EHLO
	mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753812AbaDUTLR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Apr 2014 15:11:17 -0400
Received: by mail-ee0-f49.google.com with SMTP id c41so3824881eek.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2014 12:11:16 -0700 (PDT)
In-Reply-To: <1398107456-31080-10-git-send-email-bergo.torino@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Konrad Zapalowicz <bergo.torino@gmail.com>

This commit fixes the following checkpatch warnings:
    - Use #include <linux/uaccess.h> instead of <asm/uaccess.h>
    - __packed is preferred over __attribute__((packed))
    - static const char * array should probably be static const char *
      const

Signed-off-by: Konrad Zapalowicz <bergo.torino@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9456e3f..14da752 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -82,7 +82,7 @@
 #include <sound/core.h>
 #include <sound/control.h>
 #include <sound/initval.h>
-#include <asm/uaccess.h>
+#include <linux/uaccess.h>
 
 /* ThinkPad CMOS commands */
 #define TP_CMOS_VOLUME_DOWN	0
@@ -999,7 +999,7 @@ struct attribute_set {
 struct attribute_set_obj {
 	struct attribute_set s;
 	struct attribute *a;
-} __attribute__((packed));
+} __packed;
 
 static struct attribute_set *create_attr_set(unsigned int max_members,
 						const char *name)
@@ -1131,7 +1131,7 @@ enum tpacpi_rfk_id {
 	TPACPI_RFK_SW_MAX
 };
 
-static const char *tpacpi_rfkill_names[] = {
+static const char * const tpacpi_rfkill_names[] = {
 	[TPACPI_RFK_BLUETOOTH_SW_ID] = "bluetooth",
 	[TPACPI_RFK_WWAN_SW_ID] = "wwan",
 	[TPACPI_RFK_UWB_SW_ID] = "uwb",
@@ -2098,7 +2098,7 @@ static int hotkey_mask_get(void)
 	return 0;
 }
 
-void static hotkey_mask_warn_incomplete_mask(void)
+static void hotkey_mask_warn_incomplete_mask(void)
 {
 	/* log only what the user can fix... */
 	const u32 wantedmask = hotkey_driver_mask &
-- 
1.8.1.2
