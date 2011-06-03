From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 17/25] sony-laptop: add resume from S4/S3 when opening the
 lid
Date: Fri, 03 Jun 2011 19:54:44 +0200
Message-ID: <4DE91FE4.5000806@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:58394 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750969Ab1FCRyr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 13:54:47 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

A few models offer the chance to set whether to resume from S3 and/or S4 
when opening the lid, this patch add a control file for this feature.

Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2270,6 +2270,78 @@ static void sony_nc_thermal_resume(void)
  		sony_nc_thermal_mode_set(th_handle->mode);
  }

+static struct device_attribute *lid_handle;
+
+static ssize_t sony_nc_lid_resume_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	unsigned int result;
+	unsigned long value;
+
+	if (count > 31)
+		return -EINVAL;
+	if (strict_strtoul(buffer, 10, &value) || value > 3)
+		return -EINVAL;
+
+	/* 00 <- disabled
+	   01 <- resume from S4
+	   10 <- resume from S3
+	   11 <- resume from S4 and S3
+	*/
+	/* we must set bit 1 and 2 (bit 0 is for S5), so shift one bit more */
+	if (sony_call_snc_handle(0x0119, value << 0x11 | 0x0100, &result))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_lid_resume_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int result;
+
+	if (sony_call_snc_handle(0x0119, 0x0000, &result))
+		return -EIO;
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", (result >> 1) & 0x03);
+
+	return count;
+}
+
+static int sony_nc_lid_resume_setup(struct platform_device *pd)
+{
+	lid_handle = kzalloc(sizeof(struct device_attribute), GFP_KERNEL);
+	if (!lid_handle)
+		return -ENOMEM;
+
+	sysfs_attr_init(&lid_handle->attr);
+	lid_handle->attr.name = "lid_resume_control";
+	lid_handle->attr.mode = S_IRUGO | S_IWUSR;
+	lid_handle->show = sony_nc_lid_resume_show;
+	lid_handle->store = sony_nc_lid_resume_store;
+
+	if (device_create_file(&pd->dev, lid_handle)) {
+		kfree(lid_handle);
+		lid_handle = NULL;
+		return -1;
+	}
+
+	return 0;
+}
+
+static int sony_nc_lid_resume_cleanup(struct platform_device *pd)
+{
+	if (lid_handle) {
+		device_remove_file(&pd->dev, lid_handle);
+		kfree(lid_handle);
+		lid_handle = NULL;
+	}
+
+	return 0;
+}
+

  static void sony_nc_backlight_ng_read_limits(int handle,
  		struct sony_backlight_props *props)
@@ -2412,6 +2484,9 @@ static void sony_nc_snc_setup_handles(st
  			sony_bc_handle = handle;
  			ret = sony_nc_battery_care_setup(pd);
  			break;
+		case 0x0119:
+			ret = sony_nc_lid_resume_setup(pd);
+			break;
  		case 0x0122:
  			ret = sony_nc_thermal_setup(pd);
  			break;
@@ -2462,6 +2537,9 @@ static void sony_nc_snc_cleanup_handles(
  		case 0x013f:
  			sony_nc_battery_care_cleanup(pd);
  			break;
+		case 0x0119:
+			sony_nc_lid_resume_cleanup(pd);
+			break;
  		case 0x0122:
  			sony_nc_thermal_cleanup(pd);
  			break;
