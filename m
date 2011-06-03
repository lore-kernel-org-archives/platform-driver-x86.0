From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 18/25] sony-laptop: add control file for the HighSpeed Charging
 feature
Date: Fri, 03 Jun 2011 20:02:48 +0200
Message-ID: <4DE921C8.9020600@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:53943 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751314Ab1FCSCv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 14:02:51 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>, Javier Achirica <jachirica@gmail.com>

Vaio TT models allow to enable the HighSpeed Charging feature, this 
patch adds a control file. Feature discovered and tested by Javier Achirica

Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2342,6 +2342,79 @@ static int sony_nc_lid_resume_cleanup(st
  	return 0;
  }

+static struct device_attribute *hsc_handle;
+
+static ssize_t sony_nc_highspeed_charging_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	unsigned int result;
+	unsigned long value;
+
+	if (count > 31)
+		return -EINVAL;
+	if (strict_strtoul(buffer, 10, &value) || value > 1)
+		return -EINVAL;
+
+	if (sony_call_snc_handle(0x0131, value << 0x10 | 0x0200, &result))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_highspeed_charging_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int result;
+
+	if (sony_call_snc_handle(0x0131, 0x0100, &result))
+		return -EIO;
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", result & 0x01);
+
+	return count;
+}
+
+static int sony_nc_highspeed_charging_setup(struct platform_device *pd)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(0x0131, 0x0000, &result) || !(result & 0x01)) {
+		pr_info("no High Speed Charging capability found\n");
+		return 0;
+	}
+
+	hsc_handle = kzalloc(sizeof(struct device_attribute), GFP_KERNEL);
+	if (!hsc_handle)
+		return -ENOMEM;
+
+	sysfs_attr_init(&hsc_handle->attr);
+	hsc_handle->attr.name = "battery_highspeed_charging";
+	hsc_handle->attr.mode = S_IRUGO | S_IWUSR;
+	hsc_handle->show = sony_nc_highspeed_charging_show;
+	hsc_handle->store = sony_nc_highspeed_charging_store;
+
+	if (device_create_file(&pd->dev, hsc_handle)) {
+		kfree(hsc_handle);
+		hsc_handle = NULL;
+		return -1;
+	}
+
+	return 0;
+}
+
+static int sony_nc_highspeed_charging_cleanup(struct platform_device *pd)
+{
+	if (hsc_handle) {
+		device_remove_file(&pd->dev, hsc_handle);
+		kfree(hsc_handle);
+		hsc_handle = NULL;
+	}
+
+	return 0;
+}
+

  static void sony_nc_backlight_ng_read_limits(int handle,
  		struct sony_backlight_props *props)
@@ -2495,6 +2568,9 @@ static void sony_nc_snc_setup_handles(st
  			sony_kbd_handle = handle;
  			ret = sony_nc_kbd_backlight_setup(pd);
  			break;
+		case 0x0131:
+			ret = sony_nc_highspeed_charging_setup(pd);
+			break;
  		case 0x0134:
  		case 0x0147:
  			sony_gs_handle = handle;
@@ -2547,6 +2623,9 @@ static void sony_nc_snc_cleanup_handles(
  		case 0x0143:
  			sony_nc_kbd_backlight_cleanup(pd);
  			break;
+		case 0x0131:
+			sony_nc_highspeed_charging_cleanup(pd);
+			break;
  		case 0x0134:
  		case 0x0147:
  			sony_nc_gsensor_cleanup(pd);
