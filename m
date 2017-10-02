From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH] platform/x86: peaq-wmi: Blacklist Lenovo ideapad 700-15ISK
Date: Mon,  2 Oct 2017 11:56:00 +0800
Message-ID: <20171002035600.9617-1-kai.heng.feng@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:38078 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751994AbdJBD4I (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 1 Oct 2017 23:56:08 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>

peaq-wmi on Lenovo ideapad 700-15ISK keeps sending KEY_SOUND,
which makes user's repeated keys gets interrupted.

The system does not have Dolby button, let's blacklist it.

BugLink: https://bugs.launchpad.net/bugs/1720219
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/platform/x86/peaq-wmi.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
index bc98ef95514a..5673d5daebc3 100644
--- a/drivers/platform/x86/peaq-wmi.c
+++ b/drivers/platform/x86/peaq-wmi.c
@@ -11,6 +11,7 @@
 #include <linux/input-polldev.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/dmi.h>
 
 #define PEAQ_DOLBY_BUTTON_GUID		"ABBC0F6F-8EA1-11D1-00A0-C90629100000"
 #define PEAQ_DOLBY_BUTTON_METHOD_ID	5
@@ -64,9 +65,22 @@ static void peaq_wmi_poll(struct input_polled_dev *dev)
 	}
 }
 
+static const struct dmi_system_id peaq_blacklist[] __initconst = {
+	{
+		/* Lenovo ideapad 700-15ISK does not have Dolby button */
+		.ident = "Lenovo ideapad 700-15ISK",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "80RU"),
+		},
+	},
+	{}
+};
+
 static int __init peaq_wmi_init(void)
 {
-	if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
+	if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID) ||
+	    dmi_check_system(peaq_blacklist))
 		return -ENODEV;
 
 	peaq_poll_dev = input_allocate_polled_device();
@@ -86,7 +100,8 @@ static int __init peaq_wmi_init(void)
 
 static void __exit peaq_wmi_exit(void)
 {
-	if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
+	if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID) ||
+	    dmi_check_system(peaq_blacklist))
 		return;
 
 	input_unregister_polled_device(peaq_poll_dev);
-- 
2.14.1
