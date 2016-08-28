From: Zino Lin <linzino7@gmail.com>
Subject: [PATCH] asus-wmi: fix asus ux303ub brightness issue
Date: Sun, 28 Aug 2016 16:12:06 +0800
Message-ID: <1472371926-7936-1-git-send-email-linzino7@gmai.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:32988 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755316AbcH1IMJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 28 Aug 2016 04:12:09 -0400
Received: by mail-pf0-f196.google.com with SMTP id i6so7394381pfe.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 28 Aug 2016 01:12:09 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org

From: zino lin <linzino7@gmail.com>

acpi_video0 doesn't work, asus-wmi brightness interface doesn't work, too.
So, we use native brightness interface to handle the brightness adjustion,
and add quirk_asus_ux303ub.

Signed-off-by: zino lin <linzino7@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
 drivers/platform/x86/asus-wmi.c    |  3 +++
 drivers/platform/x86/asus-wmi.h    |  1 +
 3 files changed, 17 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index adecc1c..456ad8e 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -87,6 +87,10 @@ static struct quirk_entry quirk_no_rfkill_wapf4 = {
 	.no_rfkill = true,
 };
 
+static struct quirk_entry quirk_asus_ux303ub = {
+	.wmi_backlight_native = true,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	quirks = dmi->driver_data;
@@ -351,6 +355,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_no_rfkill,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. UX303UB",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "UX303UB"),
+		},
+		.driver_data = &quirk_asus_ux303ub,
+	},
 	{},
 };
 
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 7c093a0..ce6ca31 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2084,6 +2084,9 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (asus->driver->quirks->wmi_backlight_power)
 		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
 
+	if (asus->driver->quirks->wmi_backlight_native)
+		acpi_video_set_dmi_backlight_type(acpi_backlight_native);
+
 	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
 		err = asus_wmi_backlight_init(asus);
 		if (err && err != -ENODEV)
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 5de1df5..5e22041 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -43,6 +43,7 @@ struct quirk_entry {
 	bool scalar_panel_brightness;
 	bool store_backlight_power;
 	bool wmi_backlight_power;
+	bool wmi_backlight_native;
 	int wapf;
 	/*
 	 * For machines with AMD graphic chips, it will send out WMI event
-- 
2.7.4
