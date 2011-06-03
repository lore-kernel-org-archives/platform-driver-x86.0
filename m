From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 19/25] sony-laptop: add touchpad enable/disable control file
Date: Fri, 03 Jun 2011 20:16:52 +0200
Message-ID: <4DE92514.8080405@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:43305 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754490Ab1FCSQz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 14:16:55 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Handle 0x0105 allows to change (and store persistently) the touchpad 
state, while notebooks with handle 0x0148 also provides the Fn-F1 combo 
to change the touchpad state, but the key driven change is not handled 
by this patch.

Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2415,6 +2415,75 @@ static int sony_nc_highspeed_charging_cl
  	return 0;
  }

+static struct device_attribute *tpad_handle;
+static int sony_tpad_handle = -1;
+
+static ssize_t sony_nc_touchpad_store(struct device *dev,
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
+	/* sysfs: 0 disabled, 1 enabled; EC: 0 enabled, 1 disabled */
+	if (sony_call_snc_handle(sony_tpad_handle,
+				(!value << 0x10) | 0x100, &result))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_touchpad_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int result;
+
+	if (sony_call_snc_handle(sony_tpad_handle, 0x000, &result))
+		return -EINVAL;
+
+	/* 1 tpad off, 0 tpad on */
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", !(result & 0x01));
+	return count;
+}
+
+static int sony_nc_touchpad_setup(struct platform_device *pd)
+{
+	tpad_handle = kzalloc(sizeof(struct device_attribute), GFP_KERNEL);
+	if (!tpad_handle)
+		return -ENOMEM;
+
+	sysfs_attr_init(&tpad_handle->attr);
+	tpad_handle->attr.name = "touchpad";
+	tpad_handle->attr.mode = S_IRUGO | S_IWUSR;
+	tpad_handle->show = sony_nc_touchpad_show;
+	tpad_handle->store = sony_nc_touchpad_store;
+
+	if (device_create_file(&pd->dev, tpad_handle)) {
+		kfree(tpad_handle);
+		tpad_handle = NULL;
+		return -1;
+	}
+
+	return 0;
+}
+
+static int sony_nc_touchpad_cleanup(struct platform_device *pd)
+{
+	if (tpad_handle) {
+		device_remove_file(&pd->dev, tpad_handle);
+		kfree(tpad_handle);
+		tpad_handle = NULL;
+	}
+
+	return 0;
+}
+

  static void sony_nc_backlight_ng_read_limits(int handle,
  		struct sony_backlight_props *props)
@@ -2551,6 +2620,11 @@ static void sony_nc_snc_setup_handles(st
  		case 0x0102:
  			ret = sony_nc_function_setup(handle);
  			break;
+		case 0x0105:
+		case 0x0148: /* same as 0x0105 + Fn-F1 combo */
+			sony_tpad_handle = handle;
+			ret = sony_nc_touchpad_setup(pd);
+			break;
  		case 0x0115:
  		case 0x0136:
  		case 0x013f:
@@ -2608,6 +2682,10 @@ static void sony_nc_snc_cleanup_handles(
  		dprintk("looking at handle 0x%.4x\n", handle);

  		switch (handle) {
+		case 0x0105:
+		case 0x0148:
+			sony_nc_touchpad_cleanup(pd);
+			break;
  		case 0x0115:
  		case 0x0136:
  		case 0x013f:
