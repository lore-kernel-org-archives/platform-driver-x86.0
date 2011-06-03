From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 21/25] sony-laptop: add optical device power control
Date: Fri, 03 Jun 2011 20:50:54 +0200
Message-ID: <4DE92D0E.2060605@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:54055 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752308Ab1FCSu6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 14:50:58 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Vaio S and Z Series allow to turn off the optical device to save battery 
power, this patch exposes a control file to power on and off the device.


On Windows OS this feature is well integrated with the power management 
system, how to do the same on Linux? Moreover no media presence control 
and bus disconnection is performed (the DSDT provides the SATA 
controller the drive is connected to), should we do this in the driver 
or inside a userspace daemon?


Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2627,6 +2627,118 @@ static int sony_nc_fan_cleanup(struct pl
  	return 0;
  }

+struct odd {
+	unsigned int vendor_id;
+	unsigned int model_id;
+	struct device_attribute status_attr;
+};
+static struct odd *odd_handle;
+
+static ssize_t sony_nc_odd_status_store(struct device *dev,
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
+	/* 0x200 turn on (sysfs: 1), 0x300 turn off (sysfs: 0) */
+	value = (!value << 0x08) + 0x200;
+
+	/* the MSB have to be high */
+	if (sony_call_snc_handle(0x126, (1 << 0x10) | value, &result))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_odd_status_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int result;
+
+	if (sony_call_snc_handle(0x126, 0x100, &result))
+		return -EINVAL;
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", result & 0x01);
+	return count;
+}
+
+static int sony_nc_odd_setup(struct platform_device *pd)
+{
+#define ODD_TAB_SIZE 32
+	u8 list[ODD_TAB_SIZE] = { 0 };
+	int ret = 0;
+	int found = 0;
+	int i = 0;
+	unsigned int vendor = 0;
+	unsigned int model = 0;
+	u16 word = 0;
+
+	ret = sony_call_snc_handle_buffer(0x126, 0x0000, list, ODD_TAB_SIZE);
+	if (ret < 0) {
+		pr_info("unable to retrieve the odd table\n");
+		return -EIO;
+	}
+
+	/* parse the table looking for optical devices */
+	do {
+		word = (list[i+1] << 8) | list[i];
+
+		if (word == 1) { /* 1 DWord device data following */
+			vendor = (list[i+3] << 8) | list[i+2];
+			model = (list[i+5] << 8) | list[i+4];
+			found++;
+			i += 6;
+		} else {
+			i += 2;
+		}
+	} while (word != 0xff00);
+
+	if (found)
+		dprintk("one optical device found, connected to: %x:%x\n",
+				vendor, model);
+	else
+		return 0;
+
+	odd_handle = kzalloc(sizeof(*odd_handle), GFP_KERNEL);
+	if (!odd_handle)
+		return -ENOMEM;
+
+	odd_handle->vendor_id = vendor;
+	odd_handle->model_id = model;
+
+	sysfs_attr_init(&odd_handle->status_attr.attr);
+	odd_handle->status_attr.attr.name = "odd_power";
+	odd_handle->status_attr.attr.mode = S_IRUGO | S_IWUSR;
+	odd_handle->status_attr.show = sony_nc_odd_status_show;
+	odd_handle->status_attr.store = sony_nc_odd_status_store;
+
+	if (device_create_file(&pd->dev, &odd_handle->status_attr)) {
+		kfree(odd_handle);
+		odd_handle = NULL;
+		return -1;
+	}
+
+	return 0;
+}
+
+static int sony_nc_odd_cleanup(struct platform_device *pd)
+{
+	if (odd_handle) {
+		device_remove_file(&pd->dev, &odd_handle->status_attr);
+		kfree(odd_handle);
+		odd_handle = NULL;
+	}
+
+	return 0;
+}
+

  static void sony_nc_backlight_ng_read_limits(int handle,
  		struct sony_backlight_props *props)
@@ -2780,6 +2892,9 @@ static void sony_nc_snc_setup_handles(st
  		case 0x0122:
  			ret = sony_nc_thermal_setup(pd);
  			break;
+		case 0x0126:
+			ret = sony_nc_odd_setup(pd);
+			break;
  		case 0x0137:
  		case 0x0143:
  			sony_kbd_handle = handle;
@@ -2843,6 +2958,9 @@ static void sony_nc_snc_cleanup_handles(
  		case 0x0122:
  			sony_nc_thermal_cleanup(pd);
  			break;
+		case 0x0126:
+			sony_nc_odd_cleanup(pd);
+			break;
  		case 0x0137:
  		case 0x0143:
  			sony_nc_kbd_backlight_cleanup(pd);
