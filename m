From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 02/10] eeepc-wmi: add touchpad led support
Date: Mon, 29 Nov 2010 08:14:06 +0100
Message-ID: <1291014854-17961-3-git-send-email-corentincj@iksaif.net>
References: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:54475 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754961Ab0K2HPI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Nov 2010 02:15:08 -0500
Received: from relay4-v.mail.gandi.net (relay4-v.mail.gandi.net [217.70.178.78])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id C45C8862B1
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2010 08:15:07 +0100 (CET)
In-Reply-To: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, "David S. Miller" <davem@davemloft.net>, Yong Wang <yong.y.wang@intel.com>, Corentin Chary <corentincj@iksaif.net>

Most of the code comes from eeepc-laptop.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/Kconfig     |    2 +
 drivers/platform/x86/eeepc-wmi.c |  113 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index faec777..1c59fef 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -426,6 +426,8 @@ config EEEPC_WMI
 	depends on EXPERIMENTAL
 	depends on BACKLIGHT_CLASS_DEVICE
 	select INPUT_SPARSEKMAP
+	select LEDS_CLASS
+	select NEW_LEDS
 	---help---
 	  Say Y here if you want to support WMI-based hotkeys on Eee PC laptops.
 
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index dfbb295..f12a25d 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -34,6 +34,7 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/fb.h>
 #include <linux/backlight.h>
+#include <linux/leds.h>
 #include <linux/platform_device.h>
 #include <acpi/acpi_bus.h>
 #include <acpi/acpi_drivers.h>
@@ -60,6 +61,7 @@ MODULE_ALIAS("wmi:"EEEPC_WMI_MGMT_GUID);
 #define EEEPC_WMI_METHODID_CFVS	0x53564643
 
 #define EEEPC_WMI_DEVID_BACKLIGHT	0x00050012
+#define EEEPC_WMI_DEVID_TPDLED		0x00100011
 
 static const struct key_entry eeepc_wmi_keymap[] = {
 	/* Sleep already handled via generic ACPI code */
@@ -87,6 +89,11 @@ struct eeepc_wmi {
 	struct input_dev *inputdev;
 	struct backlight_device *backlight_device;
 	struct platform_device *platform_device;
+
+	struct led_classdev tpd_led;
+	int tpd_led_wk;
+	struct workqueue_struct *led_workqueue;
+	struct work_struct tpd_led_work;
 };
 
 /* Only used in eeepc_wmi_init() and eeepc_wmi_exit() */
@@ -176,6 +183,105 @@ static acpi_status eeepc_wmi_set_devstate(u32 dev_id, u32 ctrl_param)
 	return status;
 }
 
+/*
+ * LEDs
+ */
+/*
+ * These functions actually update the LED's, and are called from a
+ * workqueue. By doing this as separate work rather than when the LED
+ * subsystem asks, we avoid messing with the Eeepc ACPI stuff during a
+ * potentially bad time, such as a timer interrupt.
+ */
+static void tpd_led_update(struct work_struct *work)
+{
+	int ctrl_param;
+	struct eeepc_wmi *eeepc;
+
+	eeepc = container_of(work, struct eeepc_wmi, tpd_led_work);
+
+	ctrl_param = eeepc->tpd_led_wk;
+	eeepc_wmi_set_devstate(EEEPC_WMI_DEVID_TPDLED, ctrl_param);
+}
+
+static void tpd_led_set(struct led_classdev *led_cdev,
+			enum led_brightness value)
+{
+	struct eeepc_wmi *eeepc;
+
+	eeepc = container_of(led_cdev, struct eeepc_wmi, tpd_led);
+
+	eeepc->tpd_led_wk = !!value;
+	queue_work(eeepc->led_workqueue, &eeepc->tpd_led_work);
+}
+
+static int read_tpd_state(struct eeepc_wmi *eeepc)
+{
+	static u32 ctrl_param;
+	acpi_status status;
+
+	status = eeepc_wmi_get_devstate(EEEPC_WMI_DEVID_TPDLED, &ctrl_param);
+
+	if (ACPI_FAILURE(status))
+		return -1;
+	else if (!ctrl_param || ctrl_param == 0x00060000)
+		/*
+		 * if touchpad led is present, DSTS will set some bits,
+		 * usually 0x00020000.
+		 * 0x00060000 means that the device is not supported
+		 */
+		return -ENODEV;
+	else
+		/* Status is stored in the first bit */
+		return ctrl_param & 0x1;
+}
+
+static enum led_brightness tpd_led_get(struct led_classdev *led_cdev)
+{
+	struct eeepc_wmi *eeepc;
+
+	eeepc = container_of(led_cdev, struct eeepc_wmi, tpd_led);
+
+	return read_tpd_state(eeepc);
+}
+
+static int eeepc_wmi_led_init(struct eeepc_wmi *eeepc)
+{
+	int rv;
+
+	if (read_tpd_state(eeepc) < 0)
+		return 0;
+
+	eeepc->led_workqueue = create_singlethread_workqueue("led_workqueue");
+	if (!eeepc->led_workqueue)
+		return -ENOMEM;
+	INIT_WORK(&eeepc->tpd_led_work, tpd_led_update);
+
+	eeepc->tpd_led.name = "eeepc::touchpad";
+	eeepc->tpd_led.brightness_set = tpd_led_set;
+	eeepc->tpd_led.brightness_get = tpd_led_get;
+	eeepc->tpd_led.max_brightness = 1;
+
+	rv = led_classdev_register(&eeepc->platform_device->dev,
+				   &eeepc->tpd_led);
+	if (rv) {
+		destroy_workqueue(eeepc->led_workqueue);
+		return rv;
+	}
+
+	return 0;
+}
+
+static void eeepc_wmi_led_exit(struct eeepc_wmi *eeepc)
+{
+	if (eeepc->tpd_led.dev)
+		led_classdev_unregister(&eeepc->tpd_led);
+	if (eeepc->led_workqueue)
+		destroy_workqueue(eeepc->led_workqueue);
+}
+
+/*
+ * Backlight
+ */
 static int read_brightness(struct backlight_device *bd)
 {
 	static u32 ctrl_param;
@@ -402,6 +508,10 @@ static struct platform_device * __init eeepc_wmi_add(void)
 	if (err)
 		goto fail_input;
 
+	err = eeepc_wmi_led_init(eeepc);
+	if (err)
+		goto fail_leds;
+
 	if (!acpi_video_backlight_support()) {
 		err = eeepc_wmi_backlight_init(eeepc);
 		if (err)
@@ -423,6 +533,8 @@ static struct platform_device * __init eeepc_wmi_add(void)
 fail_wmi_handler:
 	eeepc_wmi_backlight_exit(eeepc);
 fail_backlight:
+	eeepc_wmi_led_exit(eeepc);
+fail_leds:
 	eeepc_wmi_input_exit(eeepc);
 fail_input:
 	eeepc_wmi_platform_exit(eeepc);
@@ -439,6 +551,7 @@ static int eeepc_wmi_remove(struct platform_device *device)
 	wmi_remove_notify_handler(EEEPC_WMI_EVENT_GUID);
 	eeepc_wmi_backlight_exit(eeepc);
 	eeepc_wmi_input_exit(eeepc);
+	eeepc_wmi_led_exit(eeepc);
 	eeepc_wmi_platform_exit(eeepc);
 
 	kfree(eeepc);
-- 
1.7.3.2
