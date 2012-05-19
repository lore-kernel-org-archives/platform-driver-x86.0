From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 07/19] sony-laptop: support battery care functions
Date: Sat, 19 May 2012 22:35:50 +0900
Message-ID: <1337434562-12283-8-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47647 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757156Ab2ESNpN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:13 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Marco Chiappero <marco@absence.it>, Mattia Dongili <malattia@linux.it>

From: Marco Chiappero <marco@absence.it>

Allows limiting the maximum battery charge level to a selectable value
(100%, 80% and 50%).

[malattia@linux.it: group function specific variables in a struct, use
kstrtoul. Allow 0 to 100 values into sysfs files rounding to the actual
limit.]

Signed-off-by: Marco Chiappero <marco@absence.it>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |  178 ++++++++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 89e5cf9..0ac186e9 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -144,6 +144,10 @@ static void sony_nc_kbd_backlight_resume(void);
 static void sony_nc_kbd_backlight_setup(struct platform_device *pd);
 static int sony_nc_kbd_backlight_cleanup(struct platform_device *pd);
 
+static int sony_nc_battery_care_setup(struct platform_device *pd,
+		unsigned int handle);
+static void sony_nc_battery_care_cleanup(struct platform_device *pd);
+
 enum sony_nc_rfkill {
 	SONY_WIFI,
 	SONY_BLUETOOTH,
@@ -1270,6 +1274,14 @@ static void sony_nc_function_setup(struct acpi_device *device,
 			/* setup hotkeys */
 			sony_call_snc_handle(handle, 0x100, &result);
 			break;
+		case 0x0115:
+		case 0x0136:
+		case 0x013f:
+			result = sony_nc_battery_care_setup(pf_device, handle);
+			if (result)
+				pr_err("couldn't set up battery care function (%d)\n",
+						result);
+			break;
 		case 0x0124:
 		case 0x0135:
 			sony_nc_rfkill_setup(device);
@@ -1306,6 +1318,11 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 			continue;
 
 		switch (handle) {
+		case 0x0115:
+		case 0x0136:
+		case 0x013f:
+			sony_nc_battery_care_cleanup(pd);
+			break;
 		case 0x0124:
 		case 0x0135:
 			sony_nc_rfkill_cleanup();
@@ -1745,6 +1762,167 @@ static void sony_nc_kbd_backlight_resume(void)
 				&ignore);
 }
 
+struct battery_care_control {
+	struct device_attribute attrs[2];
+	unsigned int handle;
+};
+static struct battery_care_control *bcare_ctl;
+
+static ssize_t sony_nc_battery_care_limit_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	unsigned int result, cmd;
+	unsigned long value;
+
+	if (count > 31)
+		return -EINVAL;
+
+	if (kstrtoul(buffer, 10, &value))
+		return -EINVAL;
+
+	/*  limit values (2 bits):
+	 *  00 - none
+	 *  01 - 80%
+	 *  10 - 50%
+	 *  11 - 100%
+	 *
+	 *  bit 0: 0 disable BCL, 1 enable BCL
+	 *  bit 1: 1 tell to store the battery limit (see bits 6,7) too
+	 *  bits 2,3: reserved
+	 *  bits 4,5: store the limit into the EC
+	 *  bits 6,7: store the limit into the battery
+	 */
+
+	/*
+	 * handle 0x0115 should allow storing on battery too;
+	 * handle 0x0136 same as 0x0115 + health status;
+	 * handle 0x013f, same as 0x0136 but no storing on the battery
+	 *
+	 * Store only inside the EC for now, regardless the handle number
+	 */
+	if (value == 0)
+		/* disable limits */
+		cmd = 0x0;
+
+	else if (value <= 50)
+		cmd = 0x21;
+
+	else if (value <= 80)
+		cmd = 0x11;
+
+	else if (value <= 100)
+		cmd = 0x31;
+
+	else
+		return -EINVAL;
+
+	if (sony_call_snc_handle(bcare_ctl->handle, (cmd << 0x10) | 0x0100,
+				&result))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_battery_care_limit_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	unsigned int result, status;
+
+	if (sony_call_snc_handle(bcare_ctl->handle, 0x0000, &result))
+		return -EIO;
+
+	status = (result & 0x01) ? ((result & 0x30) >> 0x04) : 0;
+	switch (status) {
+	case 1:
+		status = 80;
+		break;
+	case 2:
+		status = 50;
+		break;
+	case 3:
+		status = 100;
+		break;
+	default:
+		status = 0;
+		break;
+	}
+
+	return snprintf(buffer, PAGE_SIZE, "%d\n", status);
+}
+
+static ssize_t sony_nc_battery_care_health_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int health;
+
+	if (sony_call_snc_handle(bcare_ctl->handle, 0x0200, &health))
+		return -EIO;
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", health & 0xff);
+
+	return count;
+}
+
+static int sony_nc_battery_care_setup(struct platform_device *pd,
+		unsigned int handle)
+{
+	int ret = 0;
+
+	bcare_ctl = kzalloc(sizeof(struct battery_care_control), GFP_KERNEL);
+	if (!bcare_ctl)
+		return -ENOMEM;
+
+	bcare_ctl->handle = handle;
+
+	sysfs_attr_init(&bcare_ctl->attrs[0].attr);
+	bcare_ctl->attrs[0].attr.name = "battery_care_limiter";
+	bcare_ctl->attrs[0].attr.mode = S_IRUGO | S_IWUSR;
+	bcare_ctl->attrs[0].show = sony_nc_battery_care_limit_show;
+	bcare_ctl->attrs[0].store = sony_nc_battery_care_limit_store;
+
+	ret = device_create_file(&pd->dev, &bcare_ctl->attrs[0]);
+	if (ret)
+		goto outkzalloc;
+
+	/* 0x0115 is for models with no health reporting capability */
+	if (handle == 0x0115)
+		return 0;
+
+	sysfs_attr_init(&bcare_ctl->attrs[1].attr);
+	bcare_ctl->attrs[1].attr.name = "battery_care_health";
+	bcare_ctl->attrs[1].attr.mode = S_IRUGO;
+	bcare_ctl->attrs[1].show = sony_nc_battery_care_health_show;
+
+	ret = device_create_file(&pd->dev, &bcare_ctl->attrs[1]);
+	if (ret)
+		goto outlimiter;
+
+	return 0;
+
+outlimiter:
+	device_remove_file(&pd->dev, &bcare_ctl->attrs[0]);
+
+outkzalloc:
+	kfree(bcare_ctl);
+	bcare_ctl = NULL;
+
+	return ret;
+}
+
+static void sony_nc_battery_care_cleanup(struct platform_device *pd)
+{
+	if (bcare_ctl) {
+		device_remove_file(&pd->dev, &bcare_ctl->attrs[0]);
+		if (bcare_ctl->handle != 0x0115)
+			device_remove_file(&pd->dev, &bcare_ctl->attrs[1]);
+
+		kfree(bcare_ctl);
+		bcare_ctl = NULL;
+	}
+}
+
 static void sony_nc_backlight_ng_read_limits(int handle,
 		struct sony_backlight_props *props)
 {
-- 
1.7.10
