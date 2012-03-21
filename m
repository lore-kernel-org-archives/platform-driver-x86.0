From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: add quirk table for video backlight vendor mode
Date: Wed, 21 Mar 2012 14:13:35 +0800
Message-ID: <1332310415-1435-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:52460 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753913Ab2CUGPZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Mar 2012 02:15:25 -0400
Received: by obbeh20 with SMTP id eh20so493239obb.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Mar 2012 23:15:24 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

From: "Lee, Chun-Yi" <jlee@suse.com>

There have some acer laptop have broken _BCM implemenation, the AML
code wrote value to EC register but firmware didn't change brighenss.

Fortunately, the brightness control works on those machines with
vendor mode. So, add quirk table for video backlight vendor mode
and unregister acpi video interface on those machines.

Tested on Acer TravelMate 4750

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/Kconfig    |    4 ++++
 drivers/platform/x86/acer-wmi.c |   30 +++++++++++++++++++++++++++---
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 15dbd8c..fe3a494 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -26,6 +26,10 @@ config ACER_WMI
 	depends on RFKILL || RFKILL = n
 	depends on ACPI_WMI
 	select INPUT_SPARSEKMAP
+	# Acer WMI depends on ACPI_VIDEO when ACPI is enabled
+	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
+        select VIDEO_OUTPUT_CONTROL if ACPI
+        select ACPI_VIDEO if ACPI
 	---help---
 	  This is a driver for newer Acer (and Wistron) laptops. It adds
 	  wireless radio and bluetooth control, and on some laptops,
diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 1e5290b..b032556 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -43,6 +43,7 @@
 #include <linux/input/sparse-keymap.h>
 
 #include <acpi/acpi_drivers.h>
+#include <acpi/video.h>
 
 MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
@@ -478,6 +479,25 @@ static struct dmi_system_id acer_quirks[] = {
 	{}
 };
 
+static int video_set_backlight_video_vendor(const struct dmi_system_id *d)
+{
+	interface->capability &= ~ACER_CAP_BRIGHTNESS;
+	pr_info("Brightness must be controlled by generic video driver\n");
+	return 0;
+}
+
+static const struct dmi_system_id video_vendor_dmi_table[] = {
+	{
+		.callback = video_set_backlight_video_vendor,
+		.ident = "Acer TravelMate 4750",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 4750"),
+		},
+	},
+	{}
+};
+
 /* Find which quirks are needed for a particular vendor/ model pair */
 static void find_quirks(void)
 {
@@ -1981,9 +2001,13 @@ static int __init acer_wmi_init(void)
 	set_quirks();
 
 	if (acpi_video_backlight_support()) {
-		interface->capability &= ~ACER_CAP_BRIGHTNESS;
-		pr_info("Brightness must be controlled by "
-		       "generic video driver\n");
+		if (dmi_check_system(video_vendor_dmi_table)) {
+			acpi_video_unregister();
+		} else {
+			interface->capability &= ~ACER_CAP_BRIGHTNESS;
+			pr_info("Brightness must be controlled by "
+				"acpi video driver\n");
+		}
 	}
 
 	if (wmi_has_guid(WMID_GUID3)) {
-- 
1.7.7
