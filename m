From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] ideapad-laptop: Disable touchpad interface on Yoga models
Date: Fri, 18 Jul 2014 12:21:47 +0200
Message-ID: <1405678907-19465-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:4354 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1761253AbaGRKVw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Jul 2014 06:21:52 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Yoga models don't offer touchpad ctrl through the ideapad interface, causing
ideapad_sync_touchpad_state to send wrong touchpad enable/disable events.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index b0e3a2e..8464187 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -88,6 +88,7 @@ struct ideapad_private {
 	struct dentry *debug;
 	unsigned long cfg;
 	bool has_hw_rfkill_switch;
+	bool has_touchpad_control;
 };
 
 static bool no_bt_rfkill;
@@ -766,6 +767,9 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv)
 {
 	unsigned long value;
 
+	if (!priv->has_touchpad_control)
+		return;
+
 	/* Without reading from EC touchpad LED doesn't switch state */
 	if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value)) {
 		/* Some IdeaPads don't really turn off touchpad - they only
@@ -840,6 +844,28 @@ static struct dmi_system_id no_hw_rfkill_list[] = {
 	{}
 };
 
+/*
+ * Some models don't offer touchpad ctrl through the ideapad interface, causing
+ * ideapad_sync_touchpad_state to send wrong touchpad enable/disable events.
+ */
+static struct dmi_system_id no_touchpad_ctrl_list[] = {
+	{
+		.ident = "Lenovo Yoga 1 series",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo IdeaPad Yoga"),
+		},
+	},
+	{
+		.ident = "Lenovo Yoga 2 11 / 13 / Pro",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Yoga 2"),
+		},
+	},
+	{}
+};
+
 static int ideapad_acpi_add(struct platform_device *pdev)
 {
 	int ret, i;
@@ -863,6 +889,7 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	priv->adev = adev;
 	priv->platform_device = pdev;
 	priv->has_hw_rfkill_switch = !dmi_check_system(no_hw_rfkill_list);
+	priv->has_touchpad_control = !dmi_check_system(no_touchpad_ctrl_list);
 
 	ret = ideapad_sysfs_init(priv);
 	if (ret)
-- 
2.0.1
