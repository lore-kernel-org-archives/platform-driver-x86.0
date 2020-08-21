From: Kenneth Chan <kenneth.t.chan@gmail.com>
Subject: [PATCH 1/9] add support for optical driver power in Y and W series
Date: Sat, 22 Aug 2020 02:14:25 +0800
Message-ID: <20200821181433.17653-2-kenneth.t.chan@gmail.com>
References: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: laforge@gnumonks.org, Kenneth Chan <kenneth.t.chan@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

The physical optical drive switch is present in Y and W series that switches
on the drive but fails to turn it off. The idea is to be able to toggle the
drive power by software and/or hardware. This patch merges Martin Lucina
<mato@kotelna.sk>'s work that took care of the software part.

Code is also added for the physical switch to power off the drive.


Signed-off-by: Kenneth Chan <kenneth.t.chan@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 190 ++++++++++++++++++++++++
 1 file changed, 190 insertions(+)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 59e38a1d2830..21cdc2149a10 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -12,6 +12,13 @@
  *---------------------------------------------------------------------------
  *
  * ChangeLog:
+ *	Aug.18, 2020	Kenneth Chan <kenneth.t.chan@gmail.com>
+ *		-v0.97	add support for cdpower hardware switch
+ *		-v0.96	merge Lucina's enhancement
+ *			Jan.13, 2009 Martin Lucina <mato@kotelna.sk>
+ *				- add support for optical driver power in
+ *				  Y and W series
+ *
  *	Sep.23, 2008	Harald Welte <laforge@gnumonks.org>
  *		-v0.95	rename driver from drivers/acpi/pcc_acpi.c to
  *			drivers/misc/panasonic-laptop.c
@@ -115,6 +122,7 @@
 #include <linux/acpi.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
+#include <linux/platform_device.h>
 
 #ifndef ACPI_HOTKEY_COMPONENT
 #define ACPI_HOTKEY_COMPONENT	0x10000000
@@ -213,6 +221,7 @@ struct pcc_acpi {
 	struct acpi_device	*device;
 	struct input_dev	*input_dev;
 	struct backlight_device	*backlight;
+	struct platform_device	*platform;
 };
 
 /* method access functions */
@@ -345,6 +354,98 @@ static const struct backlight_ops pcc_backlight_ops = {
 };
 
 
+/* returns ACPI_SUCCESS if methods to control optical drive are present */
+
+static acpi_status check_optd_present(void)
+{
+	acpi_status status = AE_OK;
+	acpi_handle handle;
+
+	status = acpi_get_handle(NULL, "\\_SB.STAT", &handle);
+	if (ACPI_FAILURE(status))
+		goto out;
+	status = acpi_get_handle(NULL, "\\_SB.FBAY", &handle);
+	if (ACPI_FAILURE(status))
+		goto out;
+	status = acpi_get_handle(NULL, "\\_SB.CDDI", &handle);
+	if (ACPI_FAILURE(status))
+		goto out;
+
+out:
+	return status;
+}
+
+/* get optical driver power state */
+
+static int get_optd_power_state(void)
+{
+	acpi_status status;
+	unsigned long long state;
+	int result;
+
+	status = acpi_evaluate_integer(NULL, "\\_SB.STAT", NULL, &state);
+	if (ACPI_FAILURE(status)) {
+		pr_err("evaluation error _SB.STAT\n");
+		result = -EIO;
+		goto out;
+	}
+	switch (state) {
+	case 0: /* power off */
+		result = 0;
+		break;
+	case 0x0f: /* power on */
+		result = 1;
+		break;
+	default:
+		result = -EIO;
+		break;
+	}
+
+out:
+	return result;
+}
+
+/* set optical drive power state */
+
+static int set_optd_power_state(int new_state)
+{
+	int result;
+	acpi_status status;
+
+	result = get_optd_power_state();
+	if (result < 0)
+		goto out;
+	if (new_state == result)
+		goto out;
+
+	switch (new_state) {
+	case 0: /* power off */
+		/* Call CDDR instead, since they both call the same method
+		 * while CDDI takes 1 arg and we are not quite sure what it is.
+		 */
+		status = acpi_evaluate_object(NULL, "\\_SB.CDDR", NULL, NULL);
+		if (ACPI_FAILURE(status)) {
+			pr_err("evaluation error _SB.CDDR\n");
+			result = -EIO;
+		}
+		break;
+	case 1: /* power on */
+		status = acpi_evaluate_object(NULL, "\\_SB.FBAY", NULL, NULL);
+		if (ACPI_FAILURE(status)) {
+			pr_err("evaluation error _SB.FBAY\n");
+			result = -EIO;
+		}
+		break;
+	default:
+		result = -EINVAL;
+		break;
+	}
+
+out:
+	return result;
+}
+
+
 /* sysfs user interface functions */
 
 static ssize_t show_numbatt(struct device *dev, struct device_attribute *attr,
@@ -411,16 +512,36 @@ static ssize_t set_sticky(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static ssize_t cdpower_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	return snprintf(buf, PAGE_SIZE, "%d\n", get_optd_power_state());
+}
+
+static ssize_t cdpower_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	int err, val;
+
+	err = kstrtoint(buf, 10, &val);
+	if (err)
+		return err;
+	set_optd_power_state(val);
+	return count;
+}
+
 static DEVICE_ATTR(numbatt, S_IRUGO, show_numbatt, NULL);
 static DEVICE_ATTR(lcdtype, S_IRUGO, show_lcdtype, NULL);
 static DEVICE_ATTR(mute, S_IRUGO, show_mute, NULL);
 static DEVICE_ATTR(sticky_key, S_IRUGO | S_IWUSR, show_sticky, set_sticky);
+static DEVICE_ATTR_RW(cdpower);
 
 static struct attribute *pcc_sysfs_entries[] = {
 	&dev_attr_numbatt.attr,
 	&dev_attr_lcdtype.attr,
 	&dev_attr_mute.attr,
 	&dev_attr_sticky_key.attr,
+	&dev_attr_cdpower.attr,
 	NULL,
 };
 
@@ -476,6 +597,50 @@ static void acpi_pcc_hotkey_notify(struct acpi_device *device, u32 event)
 	}
 }
 
+static void pcc_optd_notify(acpi_handle handle, u32 event, void *data)
+{
+	if (event != ACPI_NOTIFY_EJECT_REQUEST)
+		return;
+
+	set_optd_power_state(0);
+}
+
+static int pcc_register_optd_notifier(struct pcc_acpi *pcc, char *node)
+{
+	acpi_status status;
+	acpi_handle handle;
+
+	status = acpi_get_handle(NULL, node, &handle);
+
+	if (ACPI_SUCCESS(status)) {
+		status = acpi_install_notify_handler(handle,
+				ACPI_SYSTEM_NOTIFY,
+				pcc_optd_notify, pcc);
+		if (ACPI_FAILURE(status))
+			pr_err("Failed to register notify on %s\n", node);
+	} else
+		return -ENODEV;
+
+	return 0;
+}
+
+static void pcc_unregister_optd_notifier(struct pcc_acpi *pcc, char *node)
+{
+	acpi_status status = AE_OK;
+	acpi_handle handle;
+
+	status = acpi_get_handle(NULL, node, &handle);
+
+	if (ACPI_SUCCESS(status)) {
+		status = acpi_remove_notify_handler(handle,
+				ACPI_SYSTEM_NOTIFY,
+				pcc_optd_notify);
+		if (ACPI_FAILURE(status))
+			pr_err("Error removing optd notify handler %s\n",
+					node);
+	}
+}
+
 static int acpi_pcc_init_input(struct pcc_acpi *pcc)
 {
 	struct input_dev *input_dev;
@@ -606,8 +771,27 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 	if (result)
 		goto out_backlight;
 
+	/* optical drive initialization */
+	if (ACPI_SUCCESS(check_optd_present())) {
+		pcc->platform = platform_device_register_simple("panasonic",
+			-1, NULL, 0);
+		if (IS_ERR(pcc->platform)) {
+			result = PTR_ERR(pcc->platform);
+			goto out_backlight;
+		}
+		result = device_create_file(&pcc->platform->dev,
+			&dev_attr_cdpower);
+		pcc_register_optd_notifier(pcc, "\\_SB.PCI0.EHCI.ERHB.OPTD");
+		if (result)
+			goto out_platform;
+	} else {
+		pcc->platform = NULL;
+	}
+
 	return 0;
 
+out_platform:
+	platform_device_unregister(pcc->platform);
 out_backlight:
 	backlight_device_unregister(pcc->backlight);
 out_input:
@@ -627,6 +811,12 @@ static int acpi_pcc_hotkey_remove(struct acpi_device *device)
 	if (!device || !pcc)
 		return -EINVAL;
 
+	if (pcc->platform) {
+		device_remove_file(&pcc->platform->dev, &dev_attr_cdpower);
+		platform_device_unregister(pcc->platform);
+	}
+	pcc_unregister_optd_notifier(pcc, "\\_SB.PCI0.EHCI.ERHB.OPTD");
+
 	sysfs_remove_group(&device->dev.kobj, &pcc_attr_group);
 
 	backlight_device_unregister(pcc->backlight);
-- 
2.17.5
