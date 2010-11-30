From: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
Subject: [RFC][PATCH] New ACPI-WMI driver for shuttle machines
Date: Tue, 30 Nov 2010 15:27:19 -0200
Message-ID: <20101130152719.6f4f64b2@gotham.conectiva>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from perninha.conectiva.com.br ([187.115.55.249]:49188 "EHLO
	perninha.conectiva.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754884Ab0K3SAE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 30 Nov 2010 13:00:04 -0500
Received: from localhost (perninha.conectiva.com.br [127.0.0.1])
	by perninha.conectiva.com.br (Postfix) with ESMTP id DB0091634A
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2010 15:27:21 -0200 (BRST)
Received: from perninha.conectiva.com.br ([127.0.0.1])
	by localhost (perninha.conectiva.com.br [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id ksWahp0zGMtl for <platform-driver-x86@vger.kernel.org>;
	Tue, 30 Nov 2010 15:27:20 -0200 (BRST)
Received: from fox.conectiva (firewall.conectiva [187.115.55.253])
	by perninha.conectiva.com.br (Postfix) with ESMTP id 0919616337
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2010 15:27:20 -0200 (BRST)
Received: from gotham.conectiva (gotham.conectiva [10.0.2.23])
	by fox.conectiva (Postfix) with ESMTP id 015DC2F032
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2010 15:27:19 -0200 (BRST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Hi,

Recently, I received some shuttle machines that are mostly a notebook "glued"
to a desktop form factor. They are notebook hardware, have a webcam, wireless,
etc., but they don't have a notebook keyboard, and because of this no way to
control the hardware, like webcam on/off, etc. So, a driver is needed.

The machines I have here is similar (not same) to this on shuttle website:
http://us.shuttle.com/X50v2.aspx

What follows is a patch which adds a driver which exposes the controls
available through ACPI-WMI. For now just a RFC to get feedback. Also, on some
shuttle machines, fn+<function> can have different values, and I need to
implement a more flexible way to change command numbers (fn+n) depending on
model of shuttle machine, so it isn't a final version yet. And on Shuttle
DA18IE, the interface for video switch isn't final and could change, which
may affect the driver.

[PATCH] Add shuttle-wmi driver

This adds a new platform driver for shuttle machines. On some desktop
machines, shuttle is using laptop hardware, but without laptop keyboard.
Thus, for some features like turn on/off webcam, a way is need to
control the hardware. The driver uses ACPI-WMI interface provided to
export available controls through sysfs.

Signed-off-by: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
---
 .../ABI/testing/sysfs-platform-shuttle-wmi         |  161 ++++
 drivers/platform/x86/Kconfig                       |   16 +
 drivers/platform/x86/Makefile                      |    1 +
 drivers/platform/x86/shuttle-wmi.c                 |  843 ++++++++++++++++++++
 4 files changed, 1021 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-shuttle-wmi
 create mode 100644 drivers/platform/x86/shuttle-wmi.c

diff --git a/Documentation/ABI/testing/sysfs-platform-shuttle-wmi b/Documentation/ABI/testing/sysfs-platform-shuttle-wmi
new file mode 100644
index 0000000..63a8c8b
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-shuttle-wmi
@@ -0,0 +1,161 @@
+What:		/sys/devices/platform/shuttle_wmi/brightness_down
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		This is a write only option (accepts any single value, eg.
+		"echo 1 > brightness_down") that is equivalent of pressing
+		fn+<brightness down> function on notebooks. This option exists
+		because of shuttle machines that are notebooks in desktop form
+		factor, and which don't have the notebook keyboard, thus no
+		way to use fn+<brightness down>.
+
+What:		/sys/devices/platform/shuttle_wmi/brightness_up
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		This is a write only option (accepts any single value, eg.
+		"echo 1 > brightness_up") that is equivalent of pressing
+		fn+<brightness up> function on notebooks. This option exists
+		because of shuttle machines that are notebooks in desktop form
+		factor, and which don't have the notebook keyboard, thus no
+		way to use fn+<brightness up>.
+
+What:		/sys/devices/platform/shuttle_wmi/cut_lvds
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		This is a write only option. Writing any single non-zero value
+		to it enables main screen output, 0 to disable.
+
+What:		/sys/devices/platform/shuttle_wmi/lcd_auto_adjust
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		This is a write only option (accepts any single value, eg.
+		"echo 1 > lcd_auto_adjust") that starts LCD auto-adjust
+		function. Some shuttle machines have LCD attached to analog
+		VGA connector, so uses/needs auto-adjust.
+
+What:		/sys/devices/platform/shuttle_wmi/lbar_brightness_down
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		This is a write only option (accepts any single value, eg.
+		"echo 1 > lbar_brightness_down"). Decreases one step of lightbar
+		brightness.
+
+What:		/sys/devices/platform/shuttle_wmi/lbar_brightness_up
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		This is a write only option (accepts any single value, eg.
+		"echo 1 > lbar_brightness_up"). Increases one step of lightbar
+		brightness.
+
+What:		/sys/devices/platform/shuttle_wmi/model_name
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		This is a read only attribute which outputs a string with model
+		name of the machine. When shuttle-wmi can't determine which
+		model it is, "Unknown" is returned. Otherwise, the possible
+		models are "Shuttle MA", "Shuttle DA18IE" or "Shuttle DA18IM".
+
+What:		/sys/devices/platform/shuttle_wmi/panel_set_default
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		This is a write only option (accepts any single value, eg.
+		"echo 1 > panel_set_default"). Probably resets panel/lcd to
+		default configuration, function not explained in shuttle wmi
+		documentation.
+
+What:		/sys/devices/platform/shuttle_wmi/powersave
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		Control powersave state. 1 means on, 0 means off.
+		When enabled, it basically forces the cpu to stay on powersave
+		state (similar to powersave governor in cpufreq) when machine is
+		only running on battery. If not running on battery, this
+		function isn't expected to work, any attempt to enable this
+		returns -EIO. The function is equal to fn+<cpu> switch on some
+		notebooks.
+
+What:		/sys/devices/platform/shuttle_wmi/sleep
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		This is a write only option (accepts any single value, eg.
+		"echo 1 > sleep") that is equivalent of pressing fn+<sleep>
+		function on notebooks.
+
+What:		/sys/devices/platform/shuttle_wmi/sound_mute
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		This is a write only option (accepts any single value, eg.
+		"echo 1 > sound_mute") that is equivalent of pressing fn+<mute>
+		function on notebooks.
+
+What:		/sys/devices/platform/shuttle_wmi/switch_video
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		This is a write only option (accepts any single value, eg.
+		"echo 1 > switch_video") that is equivalent of pressing
+		fn+<display switch> function on notebooks.
+
+What:		/sys/devices/platform/shuttle_wmi/touchpad
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		Control touchpad state. 1 means on, 0 means off.
+
+What:		/sys/devices/platform/shuttle_wmi/volume_down
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		This is a write only option (accepts any single value, eg.
+		"echo 1 > volume_down") that is equivalent of pressing
+		fn+<volume down> function on notebooks.
+
+What:		/sys/devices/platform/shuttle_wmi/volume_up
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		This is a write only option (accepts any single value, eg.
+		"echo 1 > volume_up") that is equivalent of pressing
+		fn+<volume up> function on notebooks.
+
+What:		/sys/devices/platform/shuttle_wmi/webcam
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		Control webcam state. 1 means on, 0 means off.
+
+What:		/sys/devices/platform/shuttle_wmi/white_balance
+Date:		November 2010
+KernelVersion:	2.6.37
+Contact:	"Herton Ronaldo Krzesinski" <herton@mandriva.com.br>
+Description:
+		This is a write only option (accepts any single value, eg.
+		"echo 1 > white_balance"). Probably triggers an automatic
+		white balance adjustment for lcd, function not explained in
+		shuttle	wmi documentation.
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index faec777..ef84a4d 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -639,4 +639,20 @@ config XO1_RFKILL
 	  Support for enabling/disabling the WLAN interface on the OLPC XO-1
 	  laptop.
 
+config SHUTTLE_WMI
+	tristate "Shuttle WMI Extras"
+	depends on ACPI
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on RFKILL
+	depends on INPUT
+	select ACPI_WMI
+	select INPUT_SPARSEKMAP
+	---help---
+	  This is a driver for Shuttle machines (mainly for laptops in desktop
+	  form factor). It adds controls for wireless, bluetooth, and 3g control
+	  radios, webcam switch, backlight controls, among others.
+
+	  If you have an Shuttle machine with ACPI-WMI interface say Y or M
+	  here.
+
 endif # X86_PLATFORM_DEVICES
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 9950ccc..6a8fa82 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -33,3 +33,4 @@ obj-$(CONFIG_INTEL_IPS)		+= intel_ips.o
 obj-$(CONFIG_GPIO_INTEL_PMIC)	+= intel_pmic_gpio.o
 obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
 obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
+obj-$(CONFIG_SHUTTLE_WMI)	+= shuttle-wmi.o
diff --git a/drivers/platform/x86/shuttle-wmi.c b/drivers/platform/x86/shuttle-wmi.c
new file mode 100644
index 0000000..389a16d
--- /dev/null
+++ b/drivers/platform/x86/shuttle-wmi.c
@@ -0,0 +1,843 @@
+/*
+ * ACPI-WMI driver for Shuttle DA18IE/DA18IM/MA
+ *
+ * Copyright (c) 2009 Herton Ronaldo Krzesinski <herton@mandriva.com.br>
+ *
+ * Development of this driver was funded by Positivo Informatica S.A.
+ * Parts of the driver were based on some WMI documentation provided by Shuttle
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/acpi.h>
+#include <linux/platform_device.h>
+#include <linux/rfkill.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/backlight.h>
+#include <linux/fb.h>
+
+MODULE_AUTHOR("Herton Ronaldo Krzesinski");
+MODULE_DESCRIPTION("Shuttle DA18IE/DA18IM/MA WMI Extras Driver");
+MODULE_LICENSE("GPL");
+
+#define SHUTTLE_WMI_SETGET_GUID "abbc0f6f-8ea1-11d1-00a0-c90629100000"
+#define SHUTTLE_WMI_EVENT_GUID "abbc0f72-8ea1-11d1-00a0-c90629100000"
+MODULE_ALIAS("wmi:"SHUTTLE_WMI_SETGET_GUID);
+MODULE_ALIAS("wmi:"SHUTTLE_WMI_EVENT_GUID);
+
+#define CMD_WRITEEC     0x00
+#define CMD_READEC      0x01
+#define CMD_SCMD        0x02
+#define CMD_INT15       0x03
+#define CMD_HWSW        0x07
+#define CMD_LCTRL       0x09
+#define CMD_CUTLVDS     0x11
+#define CMD_MA          0x18
+#define CMD_DA18IE      0x19
+#define CMD_DA18IM      0x20
+
+#define ECRAM_ER0       0x443
+#define ECRAM_ER1       0x47b
+#define ECRAM_ER2       0x758
+
+struct shuttle_id {
+	unsigned char cmd_id;
+	char *model_name;
+	bool step_brightness;
+};
+
+static struct shuttle_id shuttle_ids[] = {
+	{ CMD_MA, "Shuttle MA", false },
+	{ CMD_DA18IE, "Shuttle DA18IE", true },
+	{ CMD_DA18IM, "Shuttle DA18IM", false }
+};
+
+struct shuttle_wmi_priv {
+	struct platform_device *pdev;
+	struct input_dev *inputdev;
+	struct shuttle_id *id;
+	struct backlight_device *bd;
+};
+
+struct shuttle_cmd {
+	u16 param2;
+	u16 param1;
+	u8 arg;
+	u8 cmd;
+	u16 hdr;
+};
+
+static acpi_status wmi_setget_mtd(struct shuttle_cmd *scmd, u32 **res)
+{
+	acpi_status status;
+	union acpi_object *obj;
+	struct acpi_buffer input;
+	static DEFINE_MUTEX(mtd_lock);
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+
+	input.length = sizeof(struct shuttle_cmd);
+	scmd->hdr = 0xec00;
+	input.pointer = (u8 *) scmd;
+
+	mutex_lock(&mtd_lock);
+	status = wmi_evaluate_method(SHUTTLE_WMI_SETGET_GUID, 0, 2,
+				     &input, &output);
+	mutex_unlock(&mtd_lock);
+	if (ACPI_FAILURE(status))
+		return status;
+
+	obj = output.pointer;
+	if (obj) {
+		if (obj->type == ACPI_TYPE_INTEGER) {
+			if (*res)
+				**res = obj->integer.value;
+		} else
+			pr_err("Unsupported object returned (%s)", __func__);
+		kfree(obj);
+	} else {
+		if (*res) {
+			pr_warning("No result from WMI method (%s)", __func__);
+			*res = NULL;
+		}
+	}
+	return AE_OK;
+}
+
+static int wmi_ec_cmd(unsigned char cmd, unsigned char arg,
+		      unsigned short param1, unsigned short param2,
+		      u32 *res)
+{
+	struct shuttle_cmd scmd = {
+		.cmd = cmd,
+		.arg = arg,
+		.param1 = param1,
+		.param2 = param2
+	};
+
+	if (ACPI_FAILURE(wmi_setget_mtd(&scmd, &res)))
+		return -1;
+	return (res) ? 0 : 1;
+}
+
+struct shuttle_rfkill {
+	char *name;
+	struct rfkill *rfk;
+	enum rfkill_type type;
+	unsigned short fn;
+	u32 mask;
+	u32 list_on[3];
+	u32 list_off[3];
+};
+
+static struct shuttle_rfkill shuttle_rfk_list[] = {
+	{ "shuttle_wlan", NULL, RFKILL_TYPE_WLAN,
+	  0x04, 0x80, { 0x08 }, { 0x09 } },
+	{ "shuttle_bluetooth", NULL, RFKILL_TYPE_BLUETOOTH,
+	  0x0d, 0x20, { 0x0c, 0x29 }, { 0x0d, 0x2a } },
+	{ "shuttle_3g", NULL, RFKILL_TYPE_WWAN,
+	  0x05, 0x40, { 0x10, 0x29 }, { 0x11, 0x2a } },
+};
+
+static int rfkill_common_set_block(void *data, bool blocked)
+{
+	u32 val;
+	bool sw;
+	struct shuttle_rfkill *srfk = data;
+
+	if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1, &val))
+		return -EIO;
+	sw = val & srfk->mask;
+
+	if ((blocked && sw) || (!blocked && !sw))
+		wmi_ec_cmd(CMD_SCMD, 0, 0, srfk->fn, NULL);
+	else
+		return 0;
+
+	if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1, &val))
+		return -EIO;
+	return ((val & srfk->mask) != blocked) ? 0 : -EIO;
+}
+
+static const struct rfkill_ops rfkill_common_ops = {
+	.set_block = rfkill_common_set_block,
+};
+
+static int common_rfkill_init(struct shuttle_rfkill *srfk, struct device *dev,
+			      u32 init_val)
+{
+	int rc;
+
+	srfk->rfk = rfkill_alloc(srfk->name, dev, srfk->type,
+				 &rfkill_common_ops, srfk);
+	if (!srfk->rfk)
+		return -ENOMEM;
+
+	rfkill_init_sw_state(srfk->rfk, !(init_val & srfk->mask));
+
+	rc = rfkill_register(srfk->rfk);
+	if (rc) {
+		rfkill_destroy(srfk->rfk);
+		srfk->rfk = NULL;
+		return rc;
+	}
+
+	return 0;
+}
+
+static int shuttle_rfkill_init(struct platform_device *pdev)
+{
+	int rc, i;
+	u32 val;
+	struct shuttle_rfkill *srfk;
+
+	if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1, &val))
+		return -EIO;
+
+	for (i = 0; i < ARRAY_SIZE(shuttle_rfk_list); i++) {
+		srfk = &shuttle_rfk_list[i];
+
+		/* check that hardware is available (when missing we can't
+		 * unblock it), to avoid having rfkill switch when not needed;
+		 * after check, reset to initial setting */
+		if (rfkill_common_set_block(srfk, false))
+			continue;
+		if (!(val & srfk->mask))
+			rfkill_common_set_block(srfk, true);
+
+		rc = common_rfkill_init(srfk, &pdev->dev, val);
+		if (rc)
+			goto err_rfk_init;
+	}
+	return 0;
+
+err_rfk_init:
+	for (i--; i >= 0; i--) {
+		srfk = &shuttle_rfk_list[i];
+		if (srfk->rfk) {
+			rfkill_unregister(srfk->rfk);
+			rfkill_destroy(srfk->rfk);
+			srfk->rfk = NULL;
+		}
+	}
+	return rc;
+}
+
+static void shuttle_rfkill_remove(void)
+{
+	int i;
+	struct shuttle_rfkill *srfk;
+
+	for (i = 0; i < ARRAY_SIZE(shuttle_rfk_list); i++) {
+		srfk = &shuttle_rfk_list[i];
+		if (srfk->rfk) {
+			rfkill_unregister(srfk->rfk);
+			rfkill_destroy(srfk->rfk);
+			srfk->rfk = NULL;
+		}
+	}
+}
+
+static bool set_rfkill_sw(u32 *list, u32 code, struct rfkill *rfk, bool blocked)
+{
+	while (*list) {
+		if (*list == code) {
+			rfkill_set_sw_state(rfk, blocked);
+			return true;
+		}
+		list++;
+	}
+	return false;
+}
+
+static bool notify_switch_rfkill(u32 code)
+{
+	int i;
+	struct rfkill *rfk;
+	u32 *rfk_evnt;
+	bool res = false;
+
+	for (i = 0; i < ARRAY_SIZE(shuttle_rfk_list); i++) {
+		rfk = shuttle_rfk_list[i].rfk;
+		if (!rfk)
+			continue;
+
+		rfk_evnt = shuttle_rfk_list[i].list_on;
+		if (set_rfkill_sw(rfk_evnt, code, rfk, false)) {
+			res = true;
+			continue;
+		}
+
+		rfk_evnt = shuttle_rfk_list[i].list_off;
+		if (set_rfkill_sw(rfk_evnt, code, rfk, true))
+			res = true;
+	}
+	return res;
+}
+
+static bool notify_switch_attr(struct platform_device *pdev, u32 code)
+{
+	int i;
+	struct shuttle_switch {
+		u32 switch_on;
+		u32 switch_off;
+		char *sys_attr;
+	};
+	static const struct shuttle_switch codes[] = {
+		{ 0x04, 0x05, "touchpad" },
+		{ 0x12, 0x13, "webcam" },
+		{ 0x31, 0x32, "powersave" }
+	};
+
+	for (i = 0; i < ARRAY_SIZE(codes); i++) {
+		if (codes[i].switch_on == code || codes[i].switch_off == code) {
+			sysfs_notify(&pdev->dev.kobj, NULL, codes[i].sys_attr);
+			return true;
+		}
+	}
+	return false;
+}
+
+static void shuttle_wmi_notify(u32 value, void *data)
+{
+	acpi_status status;
+	union acpi_object *obj;
+	u8 type;
+	u32 code;
+	struct acpi_buffer res = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct shuttle_wmi_priv *priv = data;
+
+	status = wmi_get_event_data(value, &res);
+	if (status != AE_OK) {
+		pr_warning("unable to retrieve wmi event status"
+			   " (error=0x%x)\n", status);
+		return;
+	}
+
+	obj = (union acpi_object *) res.pointer;
+	if (!obj)
+		return;
+	if (obj->type != ACPI_TYPE_INTEGER) {
+		pr_info("unknown object returned in wmi event\n");
+		goto notify_exit;
+	}
+
+	type = (obj->integer.value >> 24) & 0xFF;
+	switch (type) {
+	case 0: /* OSD/Scancode event */
+		code = obj->integer.value & 0xFFFFFF;
+
+		/* update rfkill switches */
+		if (notify_switch_rfkill(code))
+			break;
+
+		/* send notification on state switch attributes */
+		if (notify_switch_attr(priv->pdev, code))
+			break;
+
+		if (priv->bd && (code == 0x14 || code == 0x15))
+			backlight_force_update(priv->bd,
+					       BACKLIGHT_UPDATE_HOTKEY);
+
+		if (!sparse_keymap_report_event(priv->inputdev, code, 1, true))
+			pr_info("unhandled scancode (0x%06x)\n", code);
+		break;
+	case 1: /* Power management event */
+		/* Events not used.
+		 * Possible values for obj->integer.value:
+		 * 0x01000000 - silent mode
+		 * 0x01010000 - brightness sync */
+	case 2: /* i-PowerXross event */
+		/* i-PowerXross is a overclocking feature, not
+		 * implemented, there are no further details, possible
+		 * values for obj->integer.value in documentation:
+		 * 0x02000000 - idle mode
+		 * 0x02010000 - action mode
+		 * 0x02020000 - entry s3 */
+		break;
+	case 0xec: /* Lost event */
+		if (printk_ratelimit())
+			pr_warning("lost event because of buggy BIOS");
+		break;
+	default:
+		pr_info("unknown wmi notification type (0x%02x)\n", type);
+	}
+
+notify_exit:
+	kfree(obj);
+}
+
+static const struct key_entry shuttle_wmi_keymap[] = {
+	{ KE_KEY, 0x14, { KEY_BRIGHTNESSUP } },
+	{ KE_KEY, 0x15, { KEY_BRIGHTNESSDOWN } },
+	{ KE_KEY, 0x16, { KEY_FASTFORWARD } },
+	{ KE_KEY, 0x17, { KEY_REWIND } },
+	{ KE_KEY, 0x18, { KEY_F13 } }, /* OSD Beep */
+	{ KE_KEY, 0x2b, { KEY_F14 } }, /* OSD menu 1 */
+	{ KE_KEY, 0x2c, { KEY_F15 } }, /* OSD menu 2 */
+	{ KE_KEY, 0x2d, { KEY_F16 } }, /* OSD menu 3 */
+	{ KE_KEY, 0x2e, { KEY_F17 } }, /* OSD menu 4 */
+	{ KE_KEY, 0x33, { KEY_F18 } }, /* Update OSD bar status */
+	{ KE_KEY, 0x90, { KEY_WWW } },
+	{ KE_KEY, 0x95, { KEY_PREVIOUSSONG } },
+	{ KE_KEY, 0xa0, { KEY_PROG1 } }, /* Call OSD software */
+	{ KE_KEY, 0xa1, { KEY_VOLUMEDOWN } },
+	{ KE_KEY, 0xa3, { KEY_MUTE } },
+	{ KE_KEY, 0xb2, { KEY_VOLUMEUP } },
+	{ KE_KEY, 0xb4, { KEY_PLAYPAUSE } },
+	{ KE_KEY, 0xbb, { KEY_STOPCD } },
+	{ KE_KEY, 0xc8, { KEY_MAIL } },
+	{ KE_KEY, 0xcd, { KEY_NEXTSONG } },
+	{ KE_KEY, 0xd0, { KEY_MEDIA } },
+
+	/* Known non hotkey events don't handled or that we don't care */
+	{ KE_IGNORE, 0x01, }, /* Caps Lock toggled */
+	{ KE_IGNORE, 0x02, }, /* Num Lock toggled */
+	{ KE_IGNORE, 0x03, }, /* Scroll Lock toggled */
+	{ KE_IGNORE, 0x06, }, /* Downclock/Silent on */
+	{ KE_IGNORE, 0x07, }, /* Downclock/Silent off */
+	{ KE_IGNORE, 0x0a, }, /* WiMax on */
+	{ KE_IGNORE, 0x0b, }, /* WiMax off */
+	{ KE_IGNORE, 0x0e, }, /* RF on */
+	{ KE_IGNORE, 0x0f, }, /* RF off */
+	{ KE_IGNORE, 0x1a, }, /* Auto Brightness on */
+	{ KE_IGNORE, 0x1b, }, /* Auto Brightness off */
+	{ KE_IGNORE, 0x1c, }, /* Auto-KB Brightness on */
+	{ KE_IGNORE, 0x1d, }, /* Auto-KB Brightness off */
+	{ KE_IGNORE, 0x1e, }, /* Light Bar Brightness up */
+	{ KE_IGNORE, 0x1f, }, /* Light Bar Brightness down */
+	{ KE_IGNORE, 0x20, }, /* China Telecom AP enable */
+	{ KE_IGNORE, 0x21, }, /* China Mobile AP enable */
+	{ KE_IGNORE, 0x22, }, /* Huawei AP enable */
+	{ KE_IGNORE, 0x23, }, /* Docking in */
+	{ KE_IGNORE, 0x24, }, /* Docking out */
+	{ KE_IGNORE, 0x25, }, /* Device no function */
+	{ KE_IGNORE, 0x26, }, /* i-PowerXross OverClocking */
+	{ KE_IGNORE, 0x27, }, /* i-PowerXross PowerSaving */
+	{ KE_IGNORE, 0x28, }, /* i-PowerXross off */
+	{ KE_IGNORE, 0x2f, }, /* Optimus on */
+	{ KE_IGNORE, 0x30, }, /* Optimus off */
+	{ KE_IGNORE, 0x91, }, /* ICO 2 on */
+	{ KE_IGNORE, 0x92, }, /* ICO 2 off */
+
+	{ KE_END, 0 }
+};
+
+static int shuttle_wmi_input_init(struct shuttle_wmi_priv *priv)
+{
+	struct input_dev *input;
+	int rc;
+
+	input = input_allocate_device();
+	if (!input)
+		return -ENOMEM;
+
+	input->name = "Shuttle WMI hotkeys";
+	input->phys = KBUILD_MODNAME "/input0";
+	input->id.bustype = BUS_HOST;
+
+	rc = sparse_keymap_setup(input, shuttle_wmi_keymap, NULL);
+	if (rc)
+		goto err_free_dev;
+
+	rc = input_register_device(input);
+	if (rc)
+		goto err_free_keymap;
+
+	priv->inputdev = input;
+	return 0;
+
+err_free_keymap:
+	sparse_keymap_free(input);
+err_free_dev:
+	input_free_device(input);
+	return rc;
+}
+
+static void shuttle_wmi_input_remove(struct shuttle_wmi_priv *priv)
+{
+	struct input_dev *input = priv->inputdev;
+
+	sparse_keymap_free(input);
+	input_unregister_device(input);
+}
+
+static int shuttle_wmi_get_bl(struct backlight_device *bd)
+{
+	u32 val;
+
+	if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER0, &val))
+		return -EIO;
+	return val & 0x7;
+}
+
+static int shuttle_wmi_update_bl(struct backlight_device *bd)
+{
+	int rc, steps;
+	u32 val;
+	struct shuttle_wmi_priv *priv = bl_get_data(bd);
+
+	if (!priv->id->step_brightness) {
+		rc = ec_write(0x79, bd->props.brightness);
+		if (rc)
+			return rc;
+	} else {
+		/* change brightness by steps, this is a quirk for shuttle
+		 * machines which don't accept direct write to ec for this */
+		if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER0, &val))
+			return -EIO;
+		val &= 0x7;
+		steps = bd->props.brightness - val;
+		while (steps > 0) {
+			wmi_ec_cmd(CMD_SCMD, 0, 0, 0x0c, NULL);
+			steps--;
+		}
+		while (steps < 0) {
+			wmi_ec_cmd(CMD_SCMD, 0, 0, 0x0b, NULL);
+			steps++;
+		}
+	}
+	return 0;
+}
+
+static const struct backlight_ops shuttle_wmi_bl_ops = {
+	.get_brightness = shuttle_wmi_get_bl,
+	.update_status = shuttle_wmi_update_bl,
+};
+
+static int shuttle_wmi_backlight_init(struct shuttle_wmi_priv *priv)
+{
+	u32 val;
+	struct backlight_properties props;
+	struct backlight_device *bd;
+
+	if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER0, &val))
+		return -EIO;
+	val &= 0x7;
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.max_brightness = 7;
+	props.brightness = val;
+	props.power = FB_BLANK_UNBLANK;
+
+	bd = backlight_device_register(KBUILD_MODNAME, &priv->pdev->dev, priv,
+				       &shuttle_wmi_bl_ops, &props);
+	if (IS_ERR(bd))
+		return PTR_ERR(bd);
+	priv->bd = bd;
+	return 0;
+}
+
+static void shuttle_wmi_backlight_exit(struct shuttle_wmi_priv *priv)
+{
+	if (priv->bd)
+		backlight_device_unregister(priv->bd);
+}
+
+static int __devinit shuttle_wmi_probe(struct platform_device *pdev)
+{
+	struct shuttle_wmi_priv *priv;
+	int rc, i;
+	acpi_status status;
+	u32 val;
+	static struct shuttle_id id_unknown = {
+		.model_name = "Unknown",
+	};
+
+	priv = kzalloc(sizeof(struct shuttle_wmi_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->pdev = pdev;
+	platform_set_drvdata(pdev, priv);
+
+	rc = shuttle_rfkill_init(pdev);
+	if (rc)
+		goto err_rfk;
+
+	rc = shuttle_wmi_input_init(priv);
+	if (rc)
+		goto err_input;
+
+	status = wmi_install_notify_handler(SHUTTLE_WMI_EVENT_GUID,
+					    shuttle_wmi_notify, priv);
+	if (ACPI_FAILURE(status)) {
+		rc = -EIO;
+		goto err_notify;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(shuttle_ids); i++) {
+		rc = wmi_ec_cmd(shuttle_ids[i].cmd_id, 0, 0, 0, &val);
+		if (!rc && val == 1) {
+			priv->id = &shuttle_ids[i];
+			break;
+		}
+	}
+	if (i == ARRAY_SIZE(shuttle_ids))
+		priv->id = &id_unknown;
+
+	if (!acpi_video_backlight_support()) {
+		rc = shuttle_wmi_backlight_init(priv);
+		if (rc)
+			goto err_backlight;
+	}
+	return 0;
+
+err_backlight:
+	wmi_remove_notify_handler(SHUTTLE_WMI_EVENT_GUID);
+err_notify:
+	shuttle_wmi_input_remove(priv);
+err_input:
+	shuttle_rfkill_remove();
+err_rfk:
+	kfree(priv);
+	return rc;
+}
+
+static int __devexit shuttle_wmi_remove(struct platform_device *pdev)
+{
+	struct shuttle_wmi_priv *priv = platform_get_drvdata(pdev);
+
+	shuttle_wmi_backlight_exit(priv);
+	wmi_remove_notify_handler(SHUTTLE_WMI_EVENT_GUID);
+	shuttle_wmi_input_remove(priv);
+	shuttle_rfkill_remove();
+	kfree(priv);
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int shuttle_wmi_resume(struct device *dev)
+{
+	u32 val;
+	int i;
+	struct shuttle_rfkill *srfk;
+
+	if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1, &val))
+		return -EIO;
+
+	for (i = 0; i < ARRAY_SIZE(shuttle_rfk_list); i++) {
+		srfk = &shuttle_rfk_list[i];
+		if (srfk->rfk)
+			rfkill_set_sw_state(srfk->rfk, !(val & srfk->mask));
+	}
+	return 0;
+}
+
+static const struct dev_pm_ops shuttle_wmi_pm_ops = {
+	.restore = shuttle_wmi_resume,
+	.resume = shuttle_wmi_resume,
+};
+#endif
+
+static struct platform_driver shuttle_wmi_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.owner = THIS_MODULE,
+#ifdef CONFIG_PM
+		.pm = &shuttle_wmi_pm_ops,
+#endif
+	},
+	.probe = shuttle_wmi_probe,
+	.remove = __devexit_p(shuttle_wmi_remove),
+};
+
+static struct platform_device *shuttle_wmi_device;
+
+static ssize_t show_state_common(char *buf, unsigned short ecram, u32 mask)
+{
+	u32 val;
+
+	if (wmi_ec_cmd(CMD_READEC, 0, 0, ecram, &val))
+		return -EIO;
+	return sprintf(buf, "%d\n", (val & mask) ? 1 : 0);
+}
+
+static ssize_t store_state_common(const char *buf, size_t count,
+				  unsigned short ecram, u32 mask,
+				  unsigned short fn)
+{
+	int enable;
+	int rc;
+	u32 val;
+
+	if (sscanf(buf, "%i", &enable) != 1)
+		return -EINVAL;
+
+	if (wmi_ec_cmd(CMD_READEC, 0, 0, ecram, &val))
+		return -EIO;
+	val &= mask;
+	if ((val && !enable) ||
+	    (!val && enable)) {
+		wmi_ec_cmd(CMD_SCMD, 0, 0, fn, NULL);
+		rc = wmi_ec_cmd(CMD_READEC, 0, 0, ecram, &val);
+		val &= mask;
+		if (rc || (!val && enable) ||
+		    (val && !enable))
+			return -EIO;
+	}
+	return count;
+}
+
+#define SHUTTLE_STATE_ATTR(_name, _ecram, _mask, _fn)			\
+	static ssize_t show_##_name(struct device *dev,			\
+				    struct device_attribute *attr,	\
+				    char *buf)				\
+	{								\
+		return show_state_common(buf, _ecram, _mask);		\
+	}								\
+	static ssize_t store_##_name(struct device *dev,		\
+				     struct device_attribute *attr,	\
+				     const char *buf, size_t count)	\
+	{								\
+		return store_state_common(buf, count, _ecram, _mask,	\
+					  _fn);				\
+	}								\
+	static DEVICE_ATTR(_name, 0644, show_##_name, store_##_name);
+
+SHUTTLE_STATE_ATTR(powersave, ECRAM_ER2, 0x10, 0x02)
+SHUTTLE_STATE_ATTR(touchpad, ECRAM_ER1, 0x02, 0x06)
+SHUTTLE_STATE_ATTR(webcam, ECRAM_ER1, 0x10, 0x07)
+
+#define SHUTTLE_CMD_ATTR(_name, _cmd, _arg, _fn)			\
+	static ssize_t store_##_name(struct device *dev,		\
+				     struct device_attribute *attr,	\
+				     const char *buf, size_t count)	\
+	{								\
+		wmi_ec_cmd(_cmd, _arg, 0, _fn, NULL);			\
+		return count;						\
+	}								\
+	static DEVICE_ATTR(_name, 0200, NULL, store_##_name);
+
+SHUTTLE_CMD_ATTR(sleep, CMD_SCMD, 0, 0x01)
+SHUTTLE_CMD_ATTR(switch_video, CMD_SCMD, 0, 0x03)
+SHUTTLE_CMD_ATTR(sound_mute, CMD_SCMD, 0, 0x08)
+SHUTTLE_CMD_ATTR(volume_down, CMD_SCMD, 0, 0x09)
+SHUTTLE_CMD_ATTR(volume_up, CMD_SCMD, 0, 0x0a)
+SHUTTLE_CMD_ATTR(brightness_down, CMD_SCMD, 0, 0x0b)
+SHUTTLE_CMD_ATTR(brightness_up, CMD_SCMD, 0, 0x0c)
+SHUTTLE_CMD_ATTR(lcd_auto_adjust, CMD_SCMD, 0, 0x81)
+SHUTTLE_CMD_ATTR(white_balance, CMD_SCMD, 0, 0x82)
+SHUTTLE_CMD_ATTR(panel_set_default, CMD_SCMD, 0, 0x83)
+SHUTTLE_CMD_ATTR(lbar_brightness_down, CMD_LCTRL, 1, 0)
+SHUTTLE_CMD_ATTR(lbar_brightness_up, CMD_LCTRL, 1, 1)
+
+static ssize_t show_model_name(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct shuttle_wmi_priv *priv = platform_get_drvdata(pdev);
+
+	return sprintf(buf, "%s\n", priv->id->model_name);
+}
+
+static DEVICE_ATTR(model_name, 0444, show_model_name, NULL);
+
+static ssize_t store_cut_lvds(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	int cut;
+
+	if (sscanf(buf, "%i", &cut) != 1)
+		return -EINVAL;
+
+	if (cut)
+		wmi_ec_cmd(CMD_CUTLVDS, 0, 0, 1, NULL);
+	else
+		wmi_ec_cmd(CMD_CUTLVDS, 0, 0, 0, NULL);
+
+	return count;
+}
+static DEVICE_ATTR(cut_lvds, 0200, NULL, store_cut_lvds);
+
+static struct attribute *shuttle_platform_attributes[] = {
+	&dev_attr_powersave.attr,
+	&dev_attr_touchpad.attr,
+	&dev_attr_webcam.attr,
+	&dev_attr_sleep.attr,
+	&dev_attr_switch_video.attr,
+	&dev_attr_sound_mute.attr,
+	&dev_attr_volume_down.attr,
+	&dev_attr_volume_up.attr,
+	&dev_attr_brightness_down.attr,
+	&dev_attr_brightness_up.attr,
+	&dev_attr_lcd_auto_adjust.attr,
+	&dev_attr_white_balance.attr,
+	&dev_attr_panel_set_default.attr,
+	&dev_attr_lbar_brightness_down.attr,
+	&dev_attr_lbar_brightness_up.attr,
+	&dev_attr_model_name.attr,
+	&dev_attr_cut_lvds.attr,
+	NULL
+};
+
+static struct attribute_group shuttle_attribute_group = {
+	.attrs = shuttle_platform_attributes
+};
+
+static int __init shuttle_wmi_init(void)
+{
+	int rc;
+	u32 val;
+
+	if (!wmi_has_guid(SHUTTLE_WMI_SETGET_GUID) ||
+	    !wmi_has_guid(SHUTTLE_WMI_EVENT_GUID)) {
+		pr_err("Required WMI GUID not available\n");
+		return -ENODEV;
+	}
+
+	/* Check that we are really on a shuttle BIOS */
+	rc = wmi_ec_cmd(CMD_INT15, 0, 0, 0, &val);
+	if (rc || val != 0x534c) {
+		pr_err("Shuttle WMI device not found or unsupported"
+		       " (val=0x%08x)\n", val);
+		return -ENODEV;
+	}
+
+	rc = platform_driver_register(&shuttle_wmi_driver);
+	if (rc)
+		goto err_driver_register;
+	shuttle_wmi_device = platform_device_alloc(KBUILD_MODNAME, -1);
+	if (!shuttle_wmi_device) {
+		rc = -ENOMEM;
+		goto err_device_alloc;
+	}
+	rc = platform_device_add(shuttle_wmi_device);
+	if (rc)
+		goto err_device_add;
+
+	rc = sysfs_create_group(&shuttle_wmi_device->dev.kobj,
+				&shuttle_attribute_group);
+	if (rc)
+		goto err_sysfs;
+
+	return 0;
+
+err_sysfs:
+	platform_device_del(shuttle_wmi_device);
+err_device_add:
+	platform_device_put(shuttle_wmi_device);
+err_device_alloc:
+	platform_driver_unregister(&shuttle_wmi_driver);
+err_driver_register:
+	return rc;
+}
+
+static void __exit shuttle_wmi_exit(void)
+{
+	sysfs_remove_group(&shuttle_wmi_device->dev.kobj,
+			   &shuttle_attribute_group);
+	platform_device_unregister(shuttle_wmi_device);
+	platform_driver_unregister(&shuttle_wmi_driver);
+}
+
+module_init(shuttle_wmi_init);
+module_exit(shuttle_wmi_exit);
-- 
1.7.3.2

-- 
[]'s
Herton
