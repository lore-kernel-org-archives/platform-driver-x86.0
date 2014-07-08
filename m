From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 1/2] asus-wmi: Disable acpi-video backlight on desktop machines
Date: Tue,  8 Jul 2014 10:47:21 +0200
Message-ID: <1404809242-8575-2-git-send-email-hdegoede@redhat.com>
References: <1404809242-8575-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:61477 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751931AbaGHIri (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Jul 2014 04:47:38 -0400
In-Reply-To: <1404809242-8575-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, Hans de Goede <hdegoede@redhat.com>

Some Asus motherboards for desktop PC-s export an acpi-video interface
advertising backlight support. Test the dmi chassis-type and tell acpi-video
to not register a backlight interface on desktops.

https://bugzilla.redhat.com/show_bug.cgi?id=1097436

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 3c6cced..70aec19 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -46,6 +46,7 @@
 #include <linux/platform_device.h>
 #include <linux/thermal.h>
 #include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <acpi/video.h>
 
 #include "asus-wmi.h"
@@ -1734,6 +1735,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 	struct platform_driver *pdrv = to_platform_driver(pdev->dev.driver);
 	struct asus_wmi_driver *wdrv = to_asus_wmi_driver(pdrv);
 	struct asus_wmi *asus;
+	const char *chassis_type;
 	acpi_status status;
 	int err;
 	u32 result;
@@ -1770,6 +1772,11 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_rfkill;
 
+	/* Some Asus desktop boards export an acpi-video backlight interface,
+	   stop this from showing up */
+	chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
+	if (chassis_type && !strcmp(chassis_type, "3"))
+		acpi_video_dmi_promote_vendor();
 	if (asus->driver->quirks->wmi_backlight_power)
 		acpi_video_dmi_promote_vendor();
 	if (!acpi_video_backlight_support()) {
-- 
2.0.0
