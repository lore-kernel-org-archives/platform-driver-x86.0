From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 03/10] eeepc-wmi: add rfkill support for wlan, bluetooth and 3g
Date: Mon, 29 Nov 2010 08:14:07 +0100
Message-ID: <1291014854-17961-4-git-send-email-corentincj@iksaif.net>
References: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:56503 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755025Ab0K2HPJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Nov 2010 02:15:09 -0500
Received: from relay4-v.mail.gandi.net (relay4-v.mail.gandi.net [217.70.178.78])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id 68785862B2
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2010 08:15:08 +0100 (CET)
In-Reply-To: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, "David S. Miller" <davem@davemloft.net>, Yong Wang <yong.y.wang@intel.com>, Corentin Chary <corentincj@iksaif.net>

wimax support is missing because I don't have any DSDT
with WMI and wimax support.

Most of the code comes from eeepc-laptop.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/Kconfig     |    1 +
 drivers/platform/x86/eeepc-wmi.c |  138 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 139 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 1c59fef..9536f7e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -425,6 +425,7 @@ config EEEPC_WMI
 	depends on INPUT
 	depends on EXPERIMENTAL
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on RFKILL || RFKILL = n
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index f12a25d..fb548f4 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -35,6 +35,7 @@
 #include <linux/fb.h>
 #include <linux/backlight.h>
 #include <linux/leds.h>
+#include <linux/rfkill.h>
 #include <linux/platform_device.h>
 #include <acpi/acpi_bus.h>
 #include <acpi/acpi_drivers.h>
@@ -62,6 +63,9 @@ MODULE_ALIAS("wmi:"EEEPC_WMI_MGMT_GUID);
 
 #define EEEPC_WMI_DEVID_BACKLIGHT	0x00050012
 #define EEEPC_WMI_DEVID_TPDLED		0x00100011
+#define EEEPC_WMI_DEVID_WLAN		0x00010011
+#define EEEPC_WMI_DEVID_BLUETOOTH	0x00010013
+#define EEEPC_WMI_DEVID_WWAN3G		0x00010019
 
 static const struct key_entry eeepc_wmi_keymap[] = {
 	/* Sleep already handled via generic ACPI code */
@@ -94,6 +98,10 @@ struct eeepc_wmi {
 	int tpd_led_wk;
 	struct workqueue_struct *led_workqueue;
 	struct work_struct tpd_led_work;
+
+	struct rfkill *wlan_rfkill;
+	struct rfkill *bluetooth_rfkill;
+	struct rfkill *wwan3g_rfkill;
 };
 
 /* Only used in eeepc_wmi_init() and eeepc_wmi_exit() */
@@ -280,6 +288,129 @@ static void eeepc_wmi_led_exit(struct eeepc_wmi *eeepc)
 }
 
 /*
+ * Rfkill devices
+ */
+static int eeepc_rfkill_set(void *data, bool blocked)
+{
+	int dev_id = (unsigned long)data;
+	u32 ctrl_param = !blocked;
+
+	return eeepc_wmi_set_devstate(dev_id, ctrl_param);
+}
+
+static void eeepc_rfkill_query(struct rfkill *rfkill, void *data)
+{
+	int dev_id = (unsigned long)data;
+	u32 ctrl_param;
+	acpi_status status;
+
+	status = eeepc_wmi_get_devstate(dev_id, &ctrl_param);
+
+	if (ACPI_FAILURE(status))
+		return ;
+
+	rfkill_set_sw_state(rfkill, !(ctrl_param & 0x1));
+}
+
+static const struct rfkill_ops eeepc_rfkill_ops = {
+	.set_block = eeepc_rfkill_set,
+	.query = eeepc_rfkill_query,
+};
+
+static int eeepc_new_rfkill(struct eeepc_wmi *eeepc,
+			    struct rfkill **rfkill,
+			    const char *name,
+			    enum rfkill_type type, int dev_id)
+{
+	int result;
+	u32 ctrl_param;
+	acpi_status status;
+
+	status = eeepc_wmi_get_devstate(dev_id, &ctrl_param);
+
+	if (ACPI_FAILURE(status))
+		return -1;
+
+	/* If the device is present, DSTS will always set some bits
+	 * 0x00070000 - 1110000000000000000 - device supported
+	 * 0x00060000 - 1100000000000000000 - not supported
+	 * 0x00020000 - 0100000000000000000 - device supported
+	 * 0x00010000 - 0010000000000000000 - not supported / special mode ?
+	 */
+	if (!ctrl_param || ctrl_param == 0x00060000)
+		return -ENODEV;
+
+	*rfkill = rfkill_alloc(name, &eeepc->platform_device->dev, type,
+			       &eeepc_rfkill_ops, (void *)(long)dev_id);
+
+	if (!*rfkill)
+		return -EINVAL;
+
+	rfkill_init_sw_state(*rfkill, !(ctrl_param & 0x1));
+	result = rfkill_register(*rfkill);
+	if (result) {
+		rfkill_destroy(*rfkill);
+		*rfkill = NULL;
+		return result;
+	}
+	return 0;
+}
+
+static void eeepc_wmi_rfkill_exit(struct eeepc_wmi *eeepc)
+{
+	if (eeepc->wlan_rfkill) {
+		rfkill_unregister(eeepc->wlan_rfkill);
+		rfkill_destroy(eeepc->wlan_rfkill);
+		eeepc->wlan_rfkill = NULL;
+	}
+	if (eeepc->bluetooth_rfkill) {
+		rfkill_unregister(eeepc->bluetooth_rfkill);
+		rfkill_destroy(eeepc->bluetooth_rfkill);
+		eeepc->bluetooth_rfkill = NULL;
+	}
+	if (eeepc->wwan3g_rfkill) {
+		rfkill_unregister(eeepc->wwan3g_rfkill);
+		rfkill_destroy(eeepc->wwan3g_rfkill);
+		eeepc->wwan3g_rfkill = NULL;
+	}
+}
+
+static int eeepc_wmi_rfkill_init(struct eeepc_wmi *eeepc)
+{
+	int result = 0;
+
+	result = eeepc_new_rfkill(eeepc, &eeepc->wlan_rfkill,
+				  "eeepc-wlan", RFKILL_TYPE_WLAN,
+				  EEEPC_WMI_DEVID_WLAN);
+
+	if (result && result != -ENODEV)
+		goto exit;
+
+	result = eeepc_new_rfkill(eeepc, &eeepc->bluetooth_rfkill,
+				  "eeepc-bluetooth", RFKILL_TYPE_BLUETOOTH,
+				  EEEPC_WMI_DEVID_BLUETOOTH);
+
+	if (result && result != -ENODEV)
+		goto exit;
+
+	result = eeepc_new_rfkill(eeepc, &eeepc->wwan3g_rfkill,
+				  "eeepc-wwan3g", RFKILL_TYPE_WWAN,
+				  EEEPC_WMI_DEVID_WWAN3G);
+
+	if (result && result != -ENODEV)
+		goto exit;
+
+exit:
+	if (result && result != -ENODEV)
+		eeepc_wmi_rfkill_exit(eeepc);
+
+	if (result == -ENODEV)
+		result = 0;
+
+	return result;
+}
+
+/*
  * Backlight
  */
 static int read_brightness(struct backlight_device *bd)
@@ -512,6 +643,10 @@ static struct platform_device * __init eeepc_wmi_add(void)
 	if (err)
 		goto fail_leds;
 
+	err = eeepc_wmi_rfkill_init(eeepc);
+	if (err)
+		goto fail_rfkill;
+
 	if (!acpi_video_backlight_support()) {
 		err = eeepc_wmi_backlight_init(eeepc);
 		if (err)
@@ -533,6 +668,8 @@ static struct platform_device * __init eeepc_wmi_add(void)
 fail_wmi_handler:
 	eeepc_wmi_backlight_exit(eeepc);
 fail_backlight:
+	eeepc_wmi_rfkill_exit(eeepc);
+fail_rfkill:
 	eeepc_wmi_led_exit(eeepc);
 fail_leds:
 	eeepc_wmi_input_exit(eeepc);
@@ -552,6 +689,7 @@ static int eeepc_wmi_remove(struct platform_device *device)
 	eeepc_wmi_backlight_exit(eeepc);
 	eeepc_wmi_input_exit(eeepc);
 	eeepc_wmi_led_exit(eeepc);
+	eeepc_wmi_rfkill_exit(eeepc);
 	eeepc_wmi_platform_exit(eeepc);
 
 	kfree(eeepc);
-- 
1.7.3.2
