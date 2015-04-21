From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2] toshiba_acpi: Do not register vendor backlight when acpi_video bl is available
Date: Tue, 21 Apr 2015 12:01:32 +0200
Message-ID: <1429610492-22333-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:50333 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751586AbbDUKB7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Apr 2015 06:01:59 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Azael Avalos <coproscefalo@gmail.com>, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

commit a39f46df33c6 ("toshiba_acpi: Fix regression caused by backlight extra
check code") causes the backlight to no longer work on the Toshiba Z30,
reverting that commit fixes this but restores the original issue fixed
by that commit.

Looking at the toshiba_acpi backlight code for a fix for this I noticed that
the toshiba code is the only code under platform/x86 which unconditionally
registers a vendor acpi backlight interface, without checking for acpi_video
backlight support first.

This commit adds the necessary checks bringing toshiba_acpi in line with the
other drivers, and fixing the Z30 regression without needing to revert the
commit causing it.

Chances are that there will be some Toshiba models which have a non working
acpi-video implementation while the toshiba vendor backlight interface does
work, this commit adds an empty dmi_id table where such systems can be added,
this is identical to how other drivers handle such systems.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1206036
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=86521
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-and-tested-by: Azael Avalos <coproscefalo@gmail.com>
---
Changes in v2:
-Rebase on top of linux-platform-drivers-x86/for-next
-Add Azael's Reviewed-and-tested-by
---
 drivers/platform/x86/Kconfig        |  1 +
 drivers/platform/x86/toshiba_acpi.c | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9752761..f9f205c 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -614,6 +614,7 @@ config ACPI_TOSHIBA
 	depends on INPUT
 	depends on RFKILL || RFKILL = n
 	depends on SERIO_I8042 || SERIO_I8042 = n
+	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	select INPUT_POLLDEV
 	select INPUT_SPARSEKMAP
 	---help---
diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index f624dd5..9956b990 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -49,7 +49,9 @@
 #include <linux/workqueue.h>
 #include <linux/i8042.h>
 #include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/uaccess.h>
+#include <acpi/video.h>
 
 MODULE_AUTHOR("John Belmonte");
 MODULE_DESCRIPTION("Toshiba Laptop ACPI Extras Driver");
@@ -264,6 +266,14 @@ static const struct key_entry toshiba_acpi_alt_keymap[] = {
 };
 
 /*
+ * List of models which have a broken acpi-video backlight interface and thus
+ * need to use the toshiba (vendor) interface instead.
+ */
+static const struct dmi_system_id toshiba_vendor_backlight_dmi[] = {
+	{}
+};
+
+/*
  * Utility
  */
 
@@ -2624,6 +2634,20 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
 	ret = get_tr_backlight_status(dev, &enabled);
 	dev->tr_backlight_supported = !ret;
 
+	/*
+	 * Tell acpi-video-detect code to prefer vendor backlight on all
+	 * systems with transflective backlight and on dmi matched systems.
+	 */
+	if (dev->tr_backlight_supported ||
+	    dmi_check_system(toshiba_vendor_backlight_dmi))
+		acpi_video_dmi_promote_vendor();
+
+	if (acpi_video_backlight_support())
+		return 0;
+
+	/* acpi-video may have loaded before we called dmi_promote_vendor() */
+	acpi_video_unregister_backlight();
+
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_PLATFORM;
 	props.max_brightness = HCI_LCD_BRIGHTNESS_LEVELS - 1;
-- 
2.3.5
