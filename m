From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 14/25] sony-laptop: battery care functionality added
Date: Fri, 03 Jun 2011 17:46:19 +0200
Message-ID: <4DE901CB.8020609@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:52841 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753327Ab1FCPqW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 11:46:22 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

This functionality (handles 0x0115, 0x0136, 0x013f), present on almost 
every Vaio, allows to extend the battery life by limiting the maximum 
battery charge level to a selectable value (80% and 50%).

Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1611,6 +1611,143 @@ static void sony_nc_kbd_backlight_resume
  				(kbdbl_handle->timeout << 0x10), &result);
  }

+static struct device_attribute *bcare_attrs;
+static int sony_bc_handle = -1;
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
+	if (strict_strtoul(buffer, 10, &value))
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
+	switch (value) {
+	case 0:	/* disable */
+		cmd = 0x00;
+		break;
+	case 1: /* enable, 80% charge limit */
+		cmd = 0x11;
+		break;
+	case 2: /* enable, 50% charge limit */
+		cmd = 0x21;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (sony_call_snc_handle(sony_bc_handle, (cmd << 0x10) | 0x0100,
+				&result))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_battery_care_limit_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int result, status;
+
+	if (sony_call_snc_handle(sony_bc_handle, 0x0000, &result))
+		return -EIO;
+
+	/* if disabled 0, else take the limit bits */
+	status = !(result & 0x01) ? 0 : ((result & 0x30) >> 0x04);
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", status);
+	return count;
+}
+
+static ssize_t sony_nc_battery_care_health_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int health;
+
+	if (sony_call_snc_handle(sony_bc_handle, 0x0200, &health))
+		return -EIO;
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", health & 0xff);
+
+	return count;
+}
+
+static int sony_nc_battery_care_setup(struct platform_device *pd)
+{
+	bcare_attrs = kzalloc(sizeof(struct device_attribute) * 2, GFP_KERNEL);
+	if (!bcare_attrs)
+		return -ENOMEM;
+
+	sysfs_attr_init(&bcare_attrs[0].attr);
+	bcare_attrs[0].attr.name = "battery_care_limiter";
+	bcare_attrs[0].attr.mode = S_IRUGO | S_IWUSR;
+	bcare_attrs[0].show = sony_nc_battery_care_limit_show;
+	bcare_attrs[0].store = sony_nc_battery_care_limit_store;
+
+	if (device_create_file(&pd->dev, &bcare_attrs[0]))
+		goto outkzalloc;
+
+	if (sony_bc_handle == 0x0115) /* no health indication */
+		return 0;
+
+	sysfs_attr_init(&bcare_attrs[1].attr);
+	bcare_attrs[1].attr.name = "battery_care_health";
+	bcare_attrs[1].attr.mode = S_IRUGO;
+	bcare_attrs[1].show = sony_nc_battery_care_health_show;
+
+	if (device_create_file(&pd->dev, &bcare_attrs[1]))
+		goto outlimiter;
+
+	return 0;
+
+outlimiter:
+	device_remove_file(&pd->dev, &bcare_attrs[0]);
+outkzalloc:
+	kfree(bcare_attrs);
+	bcare_attrs = NULL;
+
+	return -1;
+}
+
+static int sony_nc_battery_care_cleanup(struct platform_device *pd)
+{
+	if (sony_bc_handle != -1) {
+		device_remove_file(&pd->dev, &bcare_attrs[0]);
+		if (sony_bc_handle != 0x0115)
+			device_remove_file(&pd->dev, &bcare_attrs[1]);
+
+		kfree(bcare_attrs);
+		bcare_attrs = NULL;
+	}
+
+	return 0;
+}
+
  static void sony_nc_backlight_ng_read_limits(int handle,
  		struct sony_backlight_props *props)
  {
@@ -1746,6 +1883,12 @@ static void sony_nc_snc_setup_handles(st
  		case 0x0102:
  			ret = sony_nc_function_setup(handle);
  			break;
+		case 0x0115:
+		case 0x0136:
+		case 0x013f:
+			sony_bc_handle = handle;
+			ret = sony_nc_battery_care_setup(pd);
+			break;
  		case 0x0137:
  		case 0x0143:
  			sony_kbd_handle = handle;
@@ -1783,6 +1926,11 @@ static void sony_nc_snc_cleanup_handles(
  		dprintk("looking at handle 0x%.4x\n", handle);

  		switch (handle) {
+		case 0x0115:
+		case 0x0136:
+		case 0x013f:
+			sony_nc_battery_care_cleanup(pd);
+			break;
  		case 0x0137:
  		case 0x0143:
  			sony_nc_kbd_backlight_cleanup(pd);
