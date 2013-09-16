From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH 2/2] thinkpad-acpi: support hardware mute and led
Date: Mon, 16 Sep 2013 15:45:15 +0800
Message-ID: <1379317515-25777-3-git-send-email-alex.hung@canonical.com>
References: <1379317515-25777-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:39623 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753738Ab3IPHpb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 Sep 2013 03:45:31 -0400
In-Reply-To: <1379317515-25777-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com, matthew.garrett@nebula.com, ibm-acpi@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Newer thinkpad models have a mute hotkey with a led to indicate
current mute states. Thinkpad BIOS provides ACPI interfaces for
getting and changing the hardware mute along with the led.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 89 ++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index adb3a4e..d39bf18 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8364,6 +8364,91 @@ static struct ibm_struct fan_driver_data = {
 	.resume = fan_resume,
 };
 
+/*************************************************************************
+ * Mute LED subdriver
+ */
+
+enum {
+	TPACPI_AML_MUTE_READ_MASK = 0x01,
+};
+
+static int mute_led_on_off(int state)
+{
+	int output;
+	acpi_handle temp;
+
+	if (!ACPI_SUCCESS(acpi_get_handle(hkey_handle, "SSMS", &temp))) {
+		pr_warn("Thinkpad ACPI has no GSMS interface.\n");
+		return -EIO;
+	}
+
+	if (!acpi_evalf(hkey_handle, &output, "SSMS", "dd", state))
+		return -EIO;
+
+	return 0;
+}
+
+static void mute_led_set(struct led_classdev *led_cdev,
+	enum led_brightness value)
+{
+	if (value > 0)
+		mute_led_on_off(1);
+	else
+		mute_led_on_off(0);
+}
+
+static enum led_brightness mute_led_get(struct led_classdev *led_cdev)
+{
+	int state = 0;
+	acpi_handle temp;
+
+	if (!ACPI_SUCCESS(acpi_get_handle(hkey_handle, "GSMS", &temp))) {
+		pr_warn("Thinkpad ACPI has no GSMS interface.\n");
+		return -EIO;
+	}
+
+	if (!acpi_evalf(hkey_handle, &state, "GSMS", "dd"))
+		pr_warn("failed to get hardware mute state.\n");
+
+	state &= TPACPI_AML_MUTE_READ_MASK;
+
+	return state;
+}
+
+static struct tpacpi_led_classdev tpacpi_led_mute = {
+	.led_classdev = {
+		.name = "tpacpi::mute",
+		.brightness_set = mute_led_set,
+		.brightness_get = mute_led_get,
+	}
+};
+
+static int mute_led_init(struct ibm_init_struct *iibm)
+{
+	acpi_handle temp;
+
+	if (!ACPI_SUCCESS(acpi_get_handle(hkey_handle, "GSMS", &temp)))
+		return 0;
+
+	return led_classdev_register(&tpacpi_pdev->dev,
+		&tpacpi_led_mute.led_classdev);
+}
+
+static void mute_led_exit(void)
+{
+	acpi_handle temp;
+
+	if (!ACPI_SUCCESS(acpi_get_handle(hkey_handle, "GSMS", &temp)))
+		return;
+
+	led_classdev_unregister(&tpacpi_led_mute.led_classdev);
+}
+
+static struct ibm_struct mute_led_driver_data = {
+	.name = "mute_led",
+	.exit = mute_led_exit,
+};
+
 /****************************************************************************
  ****************************************************************************
  *
@@ -8782,6 +8867,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = fan_init,
 		.data = &fan_driver_data,
 	},
+	{
+		.init = mute_led_init,
+		.data = &mute_led_driver_data,
+	},
 };
 
 static int __init set_ibm_param(const char *val, struct kernel_param *kp)
-- 
1.8.1.2
