Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72002DF138;
	Thu, 26 Feb 2026 00:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772066081; cv=none; b=EmMUmXG2KA/0lReYVHgjnu6qjUEoC42IGJPSa6S3OiBan+oVZrHPzyPsZD/pEFT5hlBIY0YIHjT7jzo5DSkkqNoIYjWRG6HbGCDQD4Vhyb9dbvkJaFp2Y13N7ozQ+FMKgVgT5LOgThSduLRr29vE1qjv6jekPDgj6xfF5VmTezc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772066081; c=relaxed/simple;
	bh=zdbnmz/3U1y5wZ/HVdei+juzvhgk2ZbDkKr+fLNYwsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tP9A/I3Gve/m86ijOLRdHe2GubTSDlq+OKrBdeKXzHrBy90NdUsnTf4z9iEKLskdxily3s/YcvdHtgdyXJLPPOA4A481TpaBbDXsasjYFZ4b/ugs56s6TkD0PaYiKfqDiWLWVt+hHzgaxfah1MwO7hatabygkFZI4caUS6n72ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=fXcdJyLt; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="fXcdJyLt"
Received: from wse-pc.fritz.box (i5C75F712.versanet.de [92.117.247.18])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 237CD2FC0050;
	Thu, 26 Feb 2026 01:34:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772066070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=czq+w5ESAMIoy3PLaoKx0DwAjxzcTrPfTufywz69GhM=;
	b=fXcdJyLt+9pjuVfEbZM0XEybwQmZ40gUE11FT8g/mNwbujD7ULH6cbUVOoK3BBZwwEQtRe
	efcwRxQzuBaqZi8wBDO483ou/9mI6s6VMgMpKY5b2LT7/GwEtSrYTStq8AxMmwxkLmqM+Z
	uYCFdpZ50ZJZUXAnkVBZPmWiw3ki/EE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] platform/x86/uniwill: Implement USB-C power priority setting
Date: Thu, 26 Feb 2026 01:31:38 +0100
Message-ID: <20260226003408.1623547-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226003408.1623547-1-wse@tuxedocomputers.com>
References: <20260226003408.1623547-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some devices Uniwill offers the option to set the USB-C port to
prioritise charging or performance. This patch exposes this setting to the
userspace via sysfs for all TUXEDO devices supporting it.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 99 +++++++++++++++++++--
 1 file changed, 94 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7ab82cf16f388..4d9657a3b8c10 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -266,8 +266,8 @@
 #define BATTERY_CHARGE_FULL_OVER_24H	BIT(3)
 #define BATTERY_ERM_STATUS_REACHED	BIT(4)
 
-#define EC_ADDR_CHARGE_PRIO		0x07CC
-#define CHARGING_PERFORMANCE		BIT(7)
+#define EC_ADDR_USB_C_POWER_PRIORITY	0x07CC
+#define USB_C_POWER_PRIORITY		BIT(7)
 
 /* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
 #define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
@@ -324,6 +324,7 @@
 #define UNIWILL_FEATURE_PRIMARY_FAN		BIT(7)
 #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(8)
 #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(9)
+#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(10)
 
 struct uniwill_data {
 	struct device *dev;
@@ -343,6 +344,7 @@ struct uniwill_data {
 	struct mutex input_lock;	/* Protects input sequence during notify */
 	struct input_dev *input_device;
 	struct notifier_block nb;
+	unsigned int last_usb_c_power_priority;
 };
 
 struct uniwill_battery_entry {
@@ -527,6 +529,7 @@ static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
 	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
 	case EC_ADDR_CTGP_DB_TPP_OFFSET:
 	case EC_ADDR_CTGP_DB_DB_OFFSET:
+	case EC_ADDR_USB_C_POWER_PRIORITY:
 		return true;
 	default:
 		return false;
@@ -565,6 +568,7 @@ static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
 	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
 	case EC_ADDR_CTGP_DB_TPP_OFFSET:
 	case EC_ADDR_CTGP_DB_DB_OFFSET:
+	case EC_ADDR_USB_C_POWER_PRIORITY:
 		return true;
 	default:
 		return false;
@@ -587,6 +591,7 @@ static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
 	case EC_ADDR_TRIGGER:
 	case EC_ADDR_SWITCH_STATUS:
 	case EC_ADDR_CHARGE_CTRL:
+	case EC_ADDR_USB_C_POWER_PRIORITY:
 		return true;
 	default:
 		return false;
@@ -883,6 +888,86 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
 	return 0;
 }
 
+enum usb_c_power_priority_options {
+	USB_C_POWER_PRIORITY_OPTIONS_CHARGING = 0,
+	USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE,
+};
+
+static const char * const USB_C_POWER_PRIORITY_OPTIONS_TEXT[] = {
+	[USB_C_POWER_PRIORITY_OPTIONS_CHARGING]		= "charging",
+	[USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE]	= "performance",
+};
+
+static const u8 USB_C_POWER_PRIORITY_OPTIONS_VALUE[] = {
+	[USB_C_POWER_PRIORITY_OPTIONS_CHARGING]		= 0,
+	[USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE]	= USB_C_POWER_PRIORITY,
+};
+
+static ssize_t usb_c_power_priority_store(struct device *dev,
+					  struct device_attribute *attr,
+					  const char *buf, size_t count)
+{
+	struct uniwill_data *data = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret = sysfs_match_string(USB_C_POWER_PRIORITY_OPTIONS_TEXT, buf);
+	if (ret < 0)
+		return ret;
+	value = USB_C_POWER_PRIORITY_OPTIONS_VALUE[ret];
+
+	ret = regmap_update_bits(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY,
+				 USB_C_POWER_PRIORITY, value);
+	if (ret < 0)
+		return ret;
+
+	data->last_usb_c_power_priority = value;
+
+	return count;
+}
+
+static ssize_t usb_c_power_priority_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct uniwill_data *data = dev_get_drvdata(dev);
+	unsigned int value;
+	ssize_t count = 0;
+	int ret;
+
+	ret = regmap_read(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY, &value);
+	if (ret < 0)
+		return ret;
+	value &= USB_C_POWER_PRIORITY;
+
+	for (int i = 0; i < ARRAY_SIZE(USB_C_POWER_PRIORITY_OPTIONS_VALUE); ++i) {
+		if (USB_C_POWER_PRIORITY_OPTIONS_VALUE[i] == value)
+			count += sysfs_emit_at(buf, count, "[%s] ",
+					       USB_C_POWER_PRIORITY_OPTIONS_TEXT[i]);
+		else
+			count += sysfs_emit_at(buf, count, "%s ",
+					       USB_C_POWER_PRIORITY_OPTIONS_TEXT[i]);
+	}
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(usb_c_power_priority);
+
+static int usb_c_power_priority_restore(struct uniwill_data *data)
+{
+	int ret;
+
+	ret = regmap_update_bits(data->regmap, EC_ADDR_OEM_4, USB_C_POWER_PRIORITY,
+				 data->last_usb_c_power_priority);
+	if (ret < 0)
+		return ret;
+
+	return ret;
+}
+
 static struct attribute *uniwill_attrs[] = {
 	/* Keyboard-related */
 	&dev_attr_fn_lock.attr,
@@ -893,6 +978,7 @@ static struct attribute *uniwill_attrs[] = {
 	&dev_attr_breathing_in_suspend.attr,
 	/* Power-management-related */
 	&dev_attr_ctgp_offset.attr,
+	&dev_attr_usb_c_power_priority.attr,
 	NULL
 };
 
@@ -927,6 +1013,11 @@ static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct attribute *a
 			return attr->mode;
 	}
 
+	if (attr == &dev_attr_usb_c_power_priority.attr) {
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
+			return attr->mode;
+	}
+
 	return 0;
 }
 
@@ -1417,9 +1508,7 @@ static int uniwill_notifier_call(struct notifier_block *nb, unsigned long action
 
 		return NOTIFY_OK;
 	case UNIWILL_OSD_DC_ADAPTER_CHANGED:
-		/* noop for the time being, will change once charging priority
-		 * gets implemented.
-		 */
+		usb_c_power_priority_restore(data);
 
 		return NOTIFY_OK;
 	case UNIWILL_OSD_FN_LOCK:
-- 
2.43.0

