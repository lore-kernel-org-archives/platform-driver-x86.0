From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 197/493] platform/x86: remove use of __devinit
Date: Mon, 19 Nov 2012 13:22:26 -0500
Message-ID: <1353349642-3677-197-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from viridian.itc.Virginia.EDU ([128.143.12.139]:41865 "EHLO
	viridian.itc.virginia.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754648Ab2KSSnF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Nov 2012 13:43:05 -0500
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: gregkh@linuxfoundation.org
Cc: Joey Lee <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>, Peter Feuerer <peter@piie.net>, Corentin Chary <corentincj@iksaif.net>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Robert Gerlach <khnz@gmx.de>, Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net

CONFIG_HOTPLUG is going away as an option so __devinit is no longer
needed.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: Joey Lee <jlee@novell.com> 
Cc: Matthew Garrett <mjg@redhat.com> 
Cc: Peter Feuerer <peter@piie.net> 
Cc: Corentin Chary <corentincj@iksaif.net> 
Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com> 
Cc: Robert Gerlach <khnz@gmx.de> 
Cc: Ike Panhc <ike.pan@canonical.com> 
Cc: platform-driver-x86@vger.kernel.org 
Cc: acpi4asus-user@lists.sourceforge.net 
---
 drivers/platform/x86/acer-wmi.c           |  6 +++---
 drivers/platform/x86/acerhdf.c            |  2 +-
 drivers/platform/x86/amilo-rfkill.c       |  2 +-
 drivers/platform/x86/apple-gmux.c         |  2 +-
 drivers/platform/x86/asus-laptop.c        |  6 +++---
 drivers/platform/x86/compal-laptop.c      |  4 ++--
 drivers/platform/x86/dell-laptop.c        |  2 +-
 drivers/platform/x86/eeepc-laptop.c       |  6 +++---
 drivers/platform/x86/fujitsu-tablet.c     | 12 ++++++------
 drivers/platform/x86/hp-wmi.c             |  8 ++++----
 drivers/platform/x86/ideapad-laptop.c     | 10 +++++-----
 drivers/platform/x86/intel_mid_powerbtn.c |  2 +-
 drivers/platform/x86/intel_oaktrail.c     |  2 +-
 drivers/platform/x86/intel_pmic_gpio.c    |  2 +-
 drivers/platform/x86/samsung-q10.c        |  2 +-
 drivers/platform/x86/toshiba_acpi.c       | 10 +++++-----
 drivers/platform/x86/xo1-rfkill.c         |  2 +-
 17 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 934d861..aa68a96 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1330,7 +1330,7 @@ static struct led_classdev mail_led = {
 	.brightness_set = mail_led_set,
 };
 
-static int __devinit acer_led_init(struct device *dev)
+static int acer_led_init(struct device *dev)
 {
 	return led_classdev_register(dev, &mail_led);
 }
@@ -1372,7 +1372,7 @@ static const struct backlight_ops acer_bl_ops = {
 	.update_status = update_bl_status,
 };
 
-static int __devinit acer_backlight_init(struct device *dev)
+static int acer_backlight_init(struct device *dev)
 {
 	struct backlight_properties props;
 	struct backlight_device *bd;
@@ -1961,7 +1961,7 @@ static u32 get_wmid_devices(void)
 /*
  * Platform device
  */
-static int __devinit acer_platform_probe(struct platform_device *device)
+static int acer_platform_probe(struct platform_device *device)
 {
 	int err;
 
diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index c2e3e63..f94467c 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -515,7 +515,7 @@ static int acerhdf_suspend(struct device *dev)
 	return 0;
 }
 
-static int __devinit acerhdf_probe(struct platform_device *device)
+static int acerhdf_probe(struct platform_device *device)
 {
 	return 0;
 }
diff --git a/drivers/platform/x86/amilo-rfkill.c b/drivers/platform/x86/amilo-rfkill.c
index 1deca7f..d2863c0 100644
--- a/drivers/platform/x86/amilo-rfkill.c
+++ b/drivers/platform/x86/amilo-rfkill.c
@@ -95,7 +95,7 @@ static const struct dmi_system_id __devinitconst amilo_rfkill_id_table[] = {
 static struct platform_device *amilo_rfkill_pdev;
 static struct rfkill *amilo_rfkill_dev;
 
-static int __devinit amilo_rfkill_probe(struct platform_device *device)
+static int amilo_rfkill_probe(struct platform_device *device)
 {
 	int rc;
 	const struct dmi_system_id *system_id =
diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 265d1ab..d323f3b 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -411,7 +411,7 @@ static int gmux_resume(struct pnp_dev *pnp)
 	return 0;
 }
 
-static int __devinit gmux_probe(struct pnp_dev *pnp,
+static int gmux_probe(struct pnp_dev *pnp,
 				const struct pnp_device_id *id)
 {
 	struct apple_gmux_data *gmux_data;
diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 4b568df..ec1d3bc 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1763,7 +1763,7 @@ static int asus_laptop_get_info(struct asus_laptop *asus)
 	return AE_OK;
 }
 
-static int __devinit asus_acpi_init(struct asus_laptop *asus)
+static int asus_acpi_init(struct asus_laptop *asus)
 {
 	int result = 0;
 
@@ -1823,7 +1823,7 @@ static int __devinit asus_acpi_init(struct asus_laptop *asus)
 	return result;
 }
 
-static void __devinit asus_dmi_check(void)
+static void asus_dmi_check(void)
 {
 	const char *model;
 
@@ -1839,7 +1839,7 @@ static void __devinit asus_dmi_check(void)
 
 static bool asus_device_present;
 
-static int __devinit asus_acpi_add(struct acpi_device *device)
+static int asus_acpi_add(struct acpi_device *device)
 {
 	struct asus_laptop *asus;
 	int result;
diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index a01a67d..b5265f7 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -713,7 +713,7 @@ static struct attribute_group compal_attribute_group = {
 	.attrs = compal_attributes
 };
 
-static int __devinit compal_probe(struct platform_device *);
+static int compal_probe(struct platform_device *);
 static int __devexit compal_remove(struct platform_device *);
 static struct platform_driver compal_driver = {
 	.driver = {
@@ -1015,7 +1015,7 @@ err_backlight:
 	return ret;
 }
 
-static int __devinit compal_probe(struct platform_device *pdev)
+static int compal_probe(struct platform_device *pdev)
 {
 	int err;
 	struct compal_data *data;
diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 927c33a..f6b50a0 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -503,7 +503,7 @@ static struct led_classdev touchpad_led = {
 	.flags = LED_CORE_SUSPENDRESUME,
 };
 
-static int __devinit touchpad_led_init(struct device *dev)
+static int touchpad_led_init(struct device *dev)
 {
 	return led_classdev_register(dev, &touchpad_led);
 }
diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index 5ca2641..528e949 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -1375,7 +1375,7 @@ static void cmsg_quirks(struct eeepc_laptop *eeepc)
 	cmsg_quirk(eeepc, CM_ASL_TPD, "TPD");
 }
 
-static int __devinit eeepc_acpi_init(struct eeepc_laptop *eeepc)
+static int eeepc_acpi_init(struct eeepc_laptop *eeepc)
 {
 	unsigned int init_flags;
 	int result;
@@ -1407,7 +1407,7 @@ static int __devinit eeepc_acpi_init(struct eeepc_laptop *eeepc)
 	return 0;
 }
 
-static void __devinit eeepc_enable_camera(struct eeepc_laptop *eeepc)
+static void eeepc_enable_camera(struct eeepc_laptop *eeepc)
 {
 	/*
 	 * If the following call to set_acpi() fails, it's because there's no
@@ -1419,7 +1419,7 @@ static void __devinit eeepc_enable_camera(struct eeepc_laptop *eeepc)
 
 static bool eeepc_device_present;
 
-static int __devinit eeepc_acpi_add(struct acpi_device *device)
+static int eeepc_acpi_add(struct acpi_device *device)
 {
 	struct eeepc_laptop *eeepc;
 	int result;
diff --git a/drivers/platform/x86/fujitsu-tablet.c b/drivers/platform/x86/fujitsu-tablet.c
index f7748452..313b8f5 100644
--- a/drivers/platform/x86/fujitsu-tablet.c
+++ b/drivers/platform/x86/fujitsu-tablet.c
@@ -192,7 +192,7 @@ static void fujitsu_reset(void)
 	fujitsu_send_state();
 }
 
-static int __devinit input_fujitsu_setup(struct device *parent,
+static int input_fujitsu_setup(struct device *parent,
 					 const char *name, const char *phys)
 {
 	struct input_dev *idev;
@@ -277,21 +277,21 @@ static irqreturn_t fujitsu_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void __devinit fujitsu_dmi_common(const struct dmi_system_id *dmi)
+static void fujitsu_dmi_common(const struct dmi_system_id *dmi)
 {
 	pr_info("%s\n", dmi->ident);
 	memcpy(fujitsu.config.keymap, dmi->driver_data,
 			sizeof(fujitsu.config.keymap));
 }
 
-static int __devinit fujitsu_dmi_lifebook(const struct dmi_system_id *dmi)
+static int fujitsu_dmi_lifebook(const struct dmi_system_id *dmi)
 {
 	fujitsu_dmi_common(dmi);
 	fujitsu.config.quirks |= INVERT_TABLET_MODE_BIT;
 	return 1;
 }
 
-static int __devinit fujitsu_dmi_stylistic(const struct dmi_system_id *dmi)
+static int fujitsu_dmi_stylistic(const struct dmi_system_id *dmi)
 {
 	fujitsu_dmi_common(dmi);
 	fujitsu.config.quirks |= FORCE_TABLET_MODE_IF_UNDOCK;
@@ -366,7 +366,7 @@ static const struct dmi_system_id dmi_ids[] __initconst = {
 	{ NULL }
 };
 
-static acpi_status __devinit
+static acpi_status
 fujitsu_walk_resources(struct acpi_resource *res, void *data)
 {
 	switch (res->type) {
@@ -390,7 +390,7 @@ fujitsu_walk_resources(struct acpi_resource *res, void *data)
 	}
 }
 
-static int __devinit acpi_fujitsu_add(struct acpi_device *adev)
+static int acpi_fujitsu_add(struct acpi_device *adev)
 {
 	acpi_status status;
 	int error;
diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 387183a..1dde7ac 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -72,7 +72,7 @@ enum hp_wmi_event_ids {
 	HPWMI_LOCK_SWITCH = 7,
 };
 
-static int __devinit hp_wmi_bios_setup(struct platform_device *device);
+static int hp_wmi_bios_setup(struct platform_device *device);
 static int __exit hp_wmi_bios_remove(struct platform_device *device);
 static int hp_wmi_resume_handler(struct device *device);
 
@@ -619,7 +619,7 @@ static void cleanup_sysfs(struct platform_device *device)
 	device_remove_file(&device->dev, &dev_attr_tablet);
 }
 
-static int __devinit hp_wmi_rfkill_setup(struct platform_device *device)
+static int hp_wmi_rfkill_setup(struct platform_device *device)
 {
 	int err;
 	int wireless = 0;
@@ -698,7 +698,7 @@ register_wifi_error:
 	return err;
 }
 
-static int __devinit hp_wmi_rfkill2_setup(struct platform_device *device)
+static int hp_wmi_rfkill2_setup(struct platform_device *device)
 {
 	int err, i;
 	struct bios_rfkill2_state state;
@@ -778,7 +778,7 @@ fail:
 	return err;
 }
 
-static int __devinit hp_wmi_bios_setup(struct platform_device *device)
+static int hp_wmi_bios_setup(struct platform_device *device)
 {
 	int err;
 
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 5ff4f2e..d49d8fc 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -298,7 +298,7 @@ static const struct file_operations debugfs_cfg_fops = {
 	.release = single_release,
 };
 
-static int __devinit ideapad_debugfs_init(struct ideapad_private *priv)
+static int ideapad_debugfs_init(struct ideapad_private *priv)
 {
 	struct dentry *node;
 
@@ -468,7 +468,7 @@ static void ideapad_sync_rfk_state(struct ideapad_private *priv)
 			rfkill_set_hw_state(priv->rfk[i], hw_blocked);
 }
 
-static int __devinit ideapad_register_rfkill(struct acpi_device *adevice,
+static int ideapad_register_rfkill(struct acpi_device *adevice,
 					     int dev)
 {
 	struct ideapad_private *priv = dev_get_drvdata(&adevice->dev);
@@ -519,7 +519,7 @@ static void ideapad_unregister_rfkill(struct acpi_device *adevice, int dev)
 /*
  * Platform device
  */
-static int __devinit ideapad_platform_init(struct ideapad_private *priv)
+static int ideapad_platform_init(struct ideapad_private *priv)
 {
 	int result;
 
@@ -569,7 +569,7 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_END, 0 },
 };
 
-static int __devinit ideapad_input_init(struct ideapad_private *priv)
+static int ideapad_input_init(struct ideapad_private *priv)
 {
 	struct input_dev *inputdev;
 	int error;
@@ -776,7 +776,7 @@ static void ideapad_sync_touchpad_state(struct acpi_device *adevice)
 	}
 }
 
-static int __devinit ideapad_acpi_add(struct acpi_device *adevice)
+static int ideapad_acpi_add(struct acpi_device *adevice)
 {
 	int ret, i;
 	int cfg;
diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 367f439..eac6618 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -56,7 +56,7 @@ static irqreturn_t mfld_pb_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __devinit mfld_pb_probe(struct platform_device *pdev)
+static int mfld_pb_probe(struct platform_device *pdev)
 {
 	struct input_dev *input;
 	int irq = platform_get_irq(pdev, 0);
diff --git a/drivers/platform/x86/intel_oaktrail.c b/drivers/platform/x86/intel_oaktrail.c
index 0dd625e..fadddb4 100644
--- a/drivers/platform/x86/intel_oaktrail.c
+++ b/drivers/platform/x86/intel_oaktrail.c
@@ -278,7 +278,7 @@ static void oaktrail_backlight_exit(void)
 		backlight_device_unregister(oaktrail_bl_device);
 }
 
-static int __devinit oaktrail_probe(struct platform_device *pdev)
+static int oaktrail_probe(struct platform_device *pdev)
 {
 	return 0;
 }
diff --git a/drivers/platform/x86/intel_pmic_gpio.c b/drivers/platform/x86/intel_pmic_gpio.c
index 1686c1e..6f4b728 100644
--- a/drivers/platform/x86/intel_pmic_gpio.c
+++ b/drivers/platform/x86/intel_pmic_gpio.c
@@ -230,7 +230,7 @@ static irqreturn_t pmic_irq_handler(int irq, void *data)
 	return ret;
 }
 
-static int __devinit platform_pmic_gpio_probe(struct platform_device *pdev)
+static int platform_pmic_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	int irq = platform_get_irq(pdev, 0);
diff --git a/drivers/platform/x86/samsung-q10.c b/drivers/platform/x86/samsung-q10.c
index 132994d..af622c7 100644
--- a/drivers/platform/x86/samsung-q10.c
+++ b/drivers/platform/x86/samsung-q10.c
@@ -77,7 +77,7 @@ static int samsungq10_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(samsungq10_pm_ops,
 			  samsungq10_suspend, samsungq10_resume);
 
-static int __devinit samsungq10_probe(struct platform_device *pdev)
+static int samsungq10_probe(struct platform_device *pdev)
 {
 
 	struct backlight_properties props;
diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 5f1256d..06908a5 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -875,7 +875,7 @@ static const struct file_operations version_proc_fops = {
 
 #define PROC_TOSHIBA		"toshiba"
 
-static void __devinit
+static void
 create_toshiba_proc_entries(struct toshiba_acpi_dev *dev)
 {
 	if (dev->backlight_dev)
@@ -979,7 +979,7 @@ static void toshiba_acpi_report_hotkey(struct toshiba_acpi_dev *dev,
 		pr_info("Unknown key %x\n", scancode);
 }
 
-static int __devinit toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
+static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 {
 	acpi_status status;
 	acpi_handle ec_handle, handle;
@@ -1069,7 +1069,7 @@ static int __devinit toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 	return error;
 }
 
-static int __devinit toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
+static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
 {
 	struct backlight_properties props;
 	int brightness;
@@ -1154,7 +1154,7 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev, int type)
 	return 0;
 }
 
-static const char * __devinit find_hci_method(acpi_handle handle)
+static const char *find_hci_method(acpi_handle handle)
 {
 	acpi_status status;
 	acpi_handle hci_handle;
@@ -1170,7 +1170,7 @@ static const char * __devinit find_hci_method(acpi_handle handle)
 	return NULL;
 }
 
-static int __devinit toshiba_acpi_add(struct acpi_device *acpi_dev)
+static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 {
 	struct toshiba_acpi_dev *dev;
 	const char *hci_method;
diff --git a/drivers/platform/x86/xo1-rfkill.c b/drivers/platform/x86/xo1-rfkill.c
index 39f4090..a3e97d6 100644
--- a/drivers/platform/x86/xo1-rfkill.c
+++ b/drivers/platform/x86/xo1-rfkill.c
@@ -40,7 +40,7 @@ static const struct rfkill_ops rfkill_ops = {
 	.set_block = rfkill_set_block,
 };
 
-static int __devinit xo1_rfkill_probe(struct platform_device *pdev)
+static int xo1_rfkill_probe(struct platform_device *pdev)
 {
 	struct rfkill *rfk;
 	int r;
-- 
1.8.0
