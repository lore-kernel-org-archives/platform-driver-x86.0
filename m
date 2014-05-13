From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] ideapad-laptop: Blacklist rfkill control on the Lenovo Yoga 2 11
Date: Tue, 13 May 2014 16:00:28 +0200
Message-ID: <1399989628-6077-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:12320 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933237AbaEMOl2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 May 2014 10:41:28 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>, Matthew Garrett <matthew.garrett@nebula.com>
Cc: Vincent Gerris <vgerris@gmail.com>, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

The Lenovo Yoga 2 11 always reports everything as blocked, causing userspace
to not even try to use the wlan / bluetooth even though they work fine.

Note this patch also removes the "else priv->rfk[i] = NULL;" bit of the
rfkill initialization, it is not necessary as the priv struct is allocated
with kzalloc.

Reported-and-tested-by: Vincent Gerris <vgerris@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 6dd060a..219eb28 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -36,6 +36,7 @@
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 #include <linux/i8042.h>
+#include <linux/dmi.h>
 
 #define IDEAPAD_RFKILL_DEV_NUM	(3)
 
@@ -819,6 +820,19 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 	}
 }
 
+/* Blacklist for devices where the ideapad rfkill interface does not work */
+static struct dmi_system_id rfkill_blacklist[] = {
+	/* The Lenovo Yoga 2 11 always reports everything as blocked */
+	{
+		.ident = "Lenovo Yoga 2 11",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Yoga 2 11"),
+		},
+	},
+	{}
+};
+
 static int ideapad_acpi_add(struct platform_device *pdev)
 {
 	int ret, i;
@@ -854,11 +868,10 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	if (ret)
 		goto input_failed;
 
-	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++) {
-		if (test_bit(ideapad_rfk_data[i].cfgbit, &priv->cfg))
-			ideapad_register_rfkill(priv, i);
-		else
-			priv->rfk[i] = NULL;
+	if (!dmi_check_system(rfkill_blacklist)) {
+		for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
+			if (test_bit(ideapad_rfk_data[i].cfgbit, &priv->cfg))
+				ideapad_register_rfkill(priv, i);
 	}
 	ideapad_sync_rfk_state(priv);
 	ideapad_sync_touchpad_state(priv);
-- 
1.9.0
