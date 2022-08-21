Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB0BC32789
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Aug 2022 20:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbiHUUJl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Aug 2022 16:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbiHUUJl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Aug 2022 16:09:41 -0400
Received: from vorpal.se (vorpal.se [151.236.221.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42B317054
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Aug 2022 13:09:39 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id 67ED8147F4;
        Sun, 21 Aug 2022 20:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1661112578; bh=kQE168syXxJNCXzQ0WVGxrda5hnIeJdqNsWw0zR4CnQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BfRWwX8nH4sIR4rOE765ZbdiAWfS29DGn/cJW+R6C46hXNeFdI9fEWabfeD2mZFB8
         RwcrUVlT8zGRRvx9OOgyiN6LZ0bpQI71B+HecigXjXfynkLp2xoBSkaOnNKDXrAcsM
         7HH6LtZnG9LmEUzDnL1P7DmxVLUMGifItrDusgQj74ZObqKOBExh6WTgkvk7ImI/CW
         /u5V7yJjs7Yi9JKwwYXbWiOd1w8RPVCZ/I5DH7sQFnKkTR93uzWE7QXgIS9sCrMM41
         JT+nvIKbbrLsAKFmahsyCuLIHI5lDLRxWMxTMO5DoNTBGDI5qoQaMIalFjjpx7yrW3
         l+Xp+0Zxe6/gA==
From:   Arvid Norlander <lkml@vorpal.se>
To:     platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>,
        Arvid Norlander <lkml@vorpal.se>
Subject: [PATCH 2/2] platform/x86: Battery charge mode in toshiba_acpi
Date:   Sun, 21 Aug 2022 22:08:22 +0200
Message-Id: <20220821200821.1837460-3-lkml@vorpal.se>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220821200821.1837460-1-lkml@vorpal.se>
References: <20220821200821.1837460-1-lkml@vorpal.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Unlike for example ThinkPads where this control is granular here it is
just off/on. When off it charges to 100%. When on it charges to about 80%.

Controlling this setting is done via HCI register 0x00ba. Setting to value
1 will result in limiting the charing to 80% of the battery capacity,
while setting it to 0 will allow charging to 100%.

Reading the current state is a bit weird, and needs a 1 set in the last
position of the query for whatever reason. In addition, the read may
return 0x8d20 (Data not available) rarely, so a retry mechanism is needed.

According to the Windows program used to control the feature the setting
will not take effect until the battery has been discharged to around 50%.
However, in my testing it takes effect as soon as the charge drops below
80%. On Windows Toshiba branded this feature as "Eco charging".

Signed-off-by: Arvid Norlander <lkml@vorpal.se>
---
 drivers/platform/x86/toshiba_acpi.c | 110 ++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 6cc617b2940e..2e13f241538a 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -112,6 +112,7 @@ MODULE_LICENSE("GPL");
 #define HCI_KBD_ILLUMINATION		0x0095
 #define HCI_ECO_MODE			0x0097
 #define HCI_ACCELEROMETER2		0x00a6
+#define HCI_BATTERY_CHARGE_MODE		0x00ba
 #define HCI_SYSTEM_INFO			0xc000
 #define SCI_PANEL_POWER_ON		0x010d
 #define SCI_ILLUMINATION		0x014e
@@ -201,6 +202,7 @@ struct toshiba_acpi_dev {
 	unsigned int usb_three_supported:1;
 	unsigned int wwan_supported:1;
 	unsigned int cooling_method_supported:1;
+	unsigned int battery_charge_mode_supported:1;
 	unsigned int sysfs_created:1;
 	unsigned int special_functions;
 
@@ -1285,6 +1287,69 @@ static int toshiba_cooling_method_set(struct toshiba_acpi_dev *dev, u32 state)
 	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) ? 0 : -EIO;
 }
 
+/* Battery charge control */
+static void toshiba_battery_charge_mode_available(struct toshiba_acpi_dev *dev)
+{
+	u32 in[TCI_WORDS] = { HCI_GET, HCI_BATTERY_CHARGE_MODE, 0, 0, 0, 0 };
+	u32 out[TCI_WORDS];
+	acpi_status status;
+
+	dev->battery_charge_mode_supported = 0;
+
+	status = tci_raw(dev, in, out);
+	if (ACPI_FAILURE(status)) {
+		pr_err("ACPI call to get Battery Charge Mode failed\n");
+		return;
+	}
+
+	if (out[0] != TOS_SUCCESS && out[0] != TOS_SUCCESS2)
+		return;
+
+	dev->battery_charge_mode_supported = 1;
+}
+
+static int toshiba_battery_charge_mode_get(struct toshiba_acpi_dev *dev, u32 *state)
+{
+	u32 in[TCI_WORDS] = { HCI_GET, HCI_BATTERY_CHARGE_MODE, 0, 0, 0, 0x1 };
+	u32 out[TCI_WORDS];
+	int retries = 3;
+
+	do {
+		acpi_status status = tci_raw(dev, in, out);
+
+		if (ACPI_FAILURE(status))
+			pr_err("ACPI call to get Battery Charge Mode failed\n");
+		switch (out[0]) {
+		case TOS_SUCCESS:
+		case TOS_SUCCESS2:
+			*state = out[2];
+			return 0;
+		case TOS_NOT_SUPPORTED:
+			return -ENODEV;
+		case TOS_DATA_NOT_AVAILABLE:
+			retries--;
+			break;
+		default:
+			return -EIO;
+		}
+	} while (retries);
+
+	return -EIO;
+}
+
+static int toshiba_battery_charge_mode_set(struct toshiba_acpi_dev *dev, u32 state)
+{
+	u32 result = hci_write(dev, HCI_BATTERY_CHARGE_MODE, state);
+
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to set Battery Charge Mode failed\n");
+
+	if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+
+	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) ? 0 : -EIO;
+}
+
 /* Transflective Backlight */
 static int get_tr_backlight_status(struct toshiba_acpi_dev *dev, u32 *status)
 {
@@ -2334,6 +2399,44 @@ static ssize_t cooling_method_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(cooling_method);
 
+static ssize_t battery_charge_mode_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	int state;
+	int ret;
+
+	ret = toshiba_battery_charge_mode_get(toshiba, &state);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", state);
+}
+
+static ssize_t battery_charge_mode_store(struct device *dev,
+					    struct device_attribute *attr,
+					    const char *buf, size_t count)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	int state;
+	int ret;
+
+	ret = kstrtoint(buf, 0, &state);
+	if (ret)
+		return ret;
+
+	if (state != 0 && state != 1)
+		return -EINVAL;
+
+	ret = toshiba_battery_charge_mode_set(toshiba, state);
+	if (ret)
+		return ret;
+
+	return count;
+}
+static DEVICE_ATTR_RW(battery_charge_mode);
+
 static struct attribute *toshiba_attributes[] = {
 	&dev_attr_version.attr,
 	&dev_attr_fan.attr,
@@ -2350,6 +2453,7 @@ static struct attribute *toshiba_attributes[] = {
 	&dev_attr_panel_power_on.attr,
 	&dev_attr_usb_three.attr,
 	&dev_attr_cooling_method.attr,
+	&dev_attr_battery_charge_mode.attr,
 	NULL,
 };
 
@@ -2384,6 +2488,8 @@ static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 		exists = (drv->usb_three_supported) ? true : false;
 	else if (attr == &dev_attr_cooling_method.attr)
 		exists = (drv->cooling_method_supported) ? true : false;
+	else if (attr == &dev_attr_battery_charge_mode.attr)
+		exists = (drv->battery_charge_mode_supported) ? true : false;
 
 	return exists ? attr->mode : 0;
 }
@@ -2959,6 +3065,8 @@ static void print_supported_features(struct toshiba_acpi_dev *dev)
 		pr_cont(" wwan");
 	if (dev->cooling_method_supported)
 		pr_cont(" cooling-method");
+	if (dev->battery_charge_mode_supported)
+		pr_cont(" battery-charge-mode");
 
 	pr_cont("\n");
 }
@@ -3166,6 +3274,8 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 
 	toshiba_cooling_method_available(dev);
 
+	toshiba_battery_charge_mode_available(dev);
+
 	print_supported_features(dev);
 
 	ret = sysfs_create_group(&dev->acpi_dev->dev.kobj,
-- 
2.37.2

