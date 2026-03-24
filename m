Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9689C2C324D;
	Tue, 24 Mar 2026 18:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774375485; cv=none; b=aaoR+rGW24wTTZ7u14ZCiywZmQm33N+a0PIIyVgdJVf4TzZDfQD4aAmVaJYHb2wGA2HIqHCjxIxC1MBn1ys4Uybr53AmySS7oktKuuLq/lmejSFcy7XyB86EAoIw3GKqgpcxXDeU6DKJSO3FpPSEEztrhLPCFcyX+cmiyB1L+sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774375485; c=relaxed/simple;
	bh=I4ABryHrbasROfE201/1tB1clu3QPZWQ5Fv7Igw6YiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XR3AFKp4C/NLyCMHw+QyW+pgLG+m1W96GKd2ubNzcAGzIiRQdXrmvzTV1VyZUWbp1oW8d4eEEwiF7+erhTbFngJk/R0GyMSzBHqWbACob5Lj07PNwENoO0eVoBcpNMrpeNVI3bRNoam9UJbwnIJ5qPnEV7CeyhqNroziCNEDmeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=alsRUiVG; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="alsRUiVG"
Received: from wse-pc.fritz.box (i5C75F50F.versanet.de [92.117.245.15])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id D9A4D2FC0219;
	Tue, 24 Mar 2026 19:04:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1774375482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/rEzyI48bpcU31JSZvR+zWDMk9bYkv6rOZGjTgMtLU=;
	b=alsRUiVGVrCK/ZwR8zDomu+T5ZovvddVwRQmFrz9cs4xJkQ5a/ugxB0EGJjOEgTC4wORfT
	5RQNRRqyLITlzujBlbB6vPuDwRqAypZfpM3ilC/zVyQi1K7YOzLERnnRaXYzBzYzX3fgL5
	HNRtTVO0STHKJVqowvy+vxzycszoMSc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v7 2/5] platform/x86: uniwill-laptop: Implement USB-C power priority setting
Date: Tue, 24 Mar 2026 19:02:37 +0100
Message-ID: <20260324180437.69594-3-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324180437.69594-1-wse@tuxedocomputers.com>
References: <20260324180437.69594-1-wse@tuxedocomputers.com>
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
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 145 +++++++++++++++++++-
 1 file changed, 138 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 048b265bff374..3a29fa8c54a00 100644
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
@@ -324,6 +324,12 @@
 #define UNIWILL_FEATURE_PRIMARY_FAN		BIT(7)
 #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(8)
 #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(9)
+#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(10)
+
+enum usb_c_power_priority_options {
+	USB_C_POWER_PRIORITY_CHARGING = 0,
+	USB_C_POWER_PRIORITY_PERFORMANCE,
+};
 
 struct uniwill_data {
 	struct device *dev;
@@ -343,6 +349,8 @@ struct uniwill_data {
 	struct mutex input_lock;	/* Protects input sequence during notify */
 	struct input_dev *input_device;
 	struct notifier_block nb;
+	struct mutex usb_c_power_priority_lock; /* Protects dependent bit write and state safe */
+	enum usb_c_power_priority_options last_usb_c_power_priority_option;
 };
 
 struct uniwill_battery_entry {
@@ -527,6 +535,7 @@ static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
 	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
 	case EC_ADDR_CTGP_DB_TPP_OFFSET:
 	case EC_ADDR_CTGP_DB_DB_OFFSET:
+	case EC_ADDR_USB_C_POWER_PRIORITY:
 		return true;
 	default:
 		return false;
@@ -565,6 +574,7 @@ static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
 	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
 	case EC_ADDR_CTGP_DB_TPP_OFFSET:
 	case EC_ADDR_CTGP_DB_DB_OFFSET:
+	case EC_ADDR_USB_C_POWER_PRIORITY:
 		return true;
 	default:
 		return false;
@@ -587,6 +597,7 @@ static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
 	case EC_ADDR_TRIGGER:
 	case EC_ADDR_SWITCH_STATUS:
 	case EC_ADDR_CHARGE_CTRL:
+	case EC_ADDR_USB_C_POWER_PRIORITY:
 		return true;
 	default:
 		return false;
@@ -883,6 +894,104 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
 	return 0;
 }
 
+static const char * const usb_c_power_priority_text[] = {
+	[USB_C_POWER_PRIORITY_CHARGING]		= "charging",
+	[USB_C_POWER_PRIORITY_PERFORMANCE]	= "performance",
+};
+
+static const u8 usb_c_power_priority_value[] = {
+	[USB_C_POWER_PRIORITY_CHARGING]		= 0,
+	[USB_C_POWER_PRIORITY_PERFORMANCE]	= USB_C_POWER_PRIORITY,
+};
+
+static ssize_t usb_c_power_priority_store(struct device *dev,
+					  struct device_attribute *attr,
+					  const char *buf, size_t count)
+{
+	struct uniwill_data *data = dev_get_drvdata(dev);
+	enum usb_c_power_priority_options option;
+	unsigned int value;
+	int ret;
+
+	option = sysfs_match_string(usb_c_power_priority_text, buf);
+	if (option < 0)
+		return option;
+
+	value = usb_c_power_priority_value[option];
+
+	guard(mutex)(&data->usb_c_power_priority_lock);
+
+	ret = regmap_update_bits(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY,
+				 USB_C_POWER_PRIORITY, value);
+	if (ret < 0)
+		return ret;
+
+	data->last_usb_c_power_priority_option = option;
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
+	int ret;
+
+	ret = regmap_read(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY, &value);
+	if (ret < 0)
+		return ret;
+
+	value &= USB_C_POWER_PRIORITY;
+
+	if (usb_c_power_priority_value[USB_C_POWER_PRIORITY_PERFORMANCE] == value)
+		return sysfs_emit(buf, "%s\n",
+				  usb_c_power_priority_text[USB_C_POWER_PRIORITY_PERFORMANCE]);
+
+	return sysfs_emit(buf, "%s\n", usb_c_power_priority_text[USB_C_POWER_PRIORITY_CHARGING]);
+}
+
+static DEVICE_ATTR_RW(usb_c_power_priority);
+
+static int usb_c_power_priority_restore(struct uniwill_data *data)
+{
+	unsigned int value;
+
+	value = usb_c_power_priority_value[data->last_usb_c_power_priority_option];
+
+	guard(mutex)(&data->usb_c_power_priority_lock);
+
+	return regmap_update_bits(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY,
+				  USB_C_POWER_PRIORITY, value);
+}
+
+static int usb_c_power_priority_init(struct uniwill_data *data)
+{
+	unsigned int value;
+	int ret;
+
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
+		return 0;
+
+	ret = devm_mutex_init(data->dev, &data->usb_c_power_priority_lock);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_read(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY, &value);
+	if (ret < 0)
+		return ret;
+
+	value &= USB_C_POWER_PRIORITY;
+
+	data->last_usb_c_power_priority_option =
+		usb_c_power_priority_value[USB_C_POWER_PRIORITY_PERFORMANCE] == value ?
+			USB_C_POWER_PRIORITY_PERFORMANCE :
+			USB_C_POWER_PRIORITY_CHARGING;
+
+	return 0;
+}
+
 static struct attribute *uniwill_attrs[] = {
 	/* Keyboard-related */
 	&dev_attr_fn_lock.attr,
@@ -893,6 +1002,7 @@ static struct attribute *uniwill_attrs[] = {
 	&dev_attr_breathing_in_suspend.attr,
 	/* Power-management-related */
 	&dev_attr_ctgp_offset.attr,
+	&dev_attr_usb_c_power_priority.attr,
 	NULL
 };
 
@@ -927,6 +1037,11 @@ static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct attribute *a
 			return attr->mode;
 	}
 
+	if (attr == &dev_attr_usb_c_power_priority.attr) {
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
+			return attr->mode;
+	}
+
 	return 0;
 }
 
@@ -1417,11 +1532,10 @@ static int uniwill_notifier_call(struct notifier_block *nb, unsigned long action
 
 		return NOTIFY_OK;
 	case UNIWILL_OSD_DC_ADAPTER_CHANGED:
-		/* noop for the time being, will change once charging priority
-		 * gets implemented.
-		 */
+		if (!uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
+			return NOTIFY_DONE;
 
-		return NOTIFY_OK;
+		return notifier_from_errno(usb_c_power_priority_restore(data));
 	case UNIWILL_OSD_FN_LOCK:
 		if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
 			return NOTIFY_DONE;
@@ -1515,10 +1629,15 @@ static int uniwill_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 
 	data->regmap = regmap;
+
 	ret = devm_mutex_init(&pdev->dev, &data->super_key_lock);
 	if (ret < 0)
 		return ret;
 
+	ret = usb_c_power_priority_init(data);
+	if (ret < 0)
+		return ret;
+
 	ret = uniwill_ec_init(data);
 	if (ret < 0)
 		return ret;
@@ -1681,6 +1800,14 @@ static int uniwill_resume_nvidia_ctgp(struct uniwill_data *data)
 			       CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE);
 }
 
+static int uniwill_resume_usb_c_power_priority(struct uniwill_data *data)
+{
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
+		return 0;
+
+	return usb_c_power_priority_restore(data);
+}
+
 static int uniwill_resume(struct device *dev)
 {
 	struct uniwill_data *data = dev_get_drvdata(dev);
@@ -1704,7 +1831,11 @@ static int uniwill_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	return uniwill_resume_nvidia_ctgp(data);
+	ret = uniwill_resume_nvidia_ctgp(data);
+	if (ret < 0)
+		return ret;
+
+	return uniwill_resume_usb_c_power_priority(data);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, uniwill_resume);
-- 
2.43.0

