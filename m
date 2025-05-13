Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF6020E032
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 May 2025 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125525; cv=none; b=KQ28nlaXhUZKV34QVVeDPt1wppZ0l+Xi0MkkrHLJ7dwCP+qB6w0879BpH6cQr8dcTxjMPxCy9qDKd+nbTnfAWEtZMfqmulC+OLX7edn9pOYd7kZcdNtj9JJR0XfDwvfGdz6Z8kux9ba4VJHTE7TC889+PUQLgxmtTkH9b1VAUMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125525; c=relaxed/simple;
	bh=w0Y9Skz7QHL5k0YbQDAmtu0In9UK2DryeqOaYUazFPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikP90EMecb+wdwfTvz76yMsCMgTLH5yBMHtZWlnsWvWGje5eQBPw3cXrRN0CL1VNe4/ri7XgQ7b40I9t5BS25SzmIYMw7fywktECjAIXcfwaZb9FdkPMpkS2VlBEMpbhM7ZocnKjz7GjLveVyH9R9kUG/ypOt0+ahGBL/U5hOpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=redhat.com; spf=fail smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=tBkSYe8F; arc=none smtp.client-ip=195.121.94.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="tBkSYe8F"
X-KPN-MessageId: bd4eb0c6-2fd5-11f0-a9b7-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id bd4eb0c6-2fd5-11f0-a9b7-00505699b430;
	Tue, 13 May 2025 10:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=xep5RU3/8Q9x+gCDpyxC34swlTmvScuZUDBKNLnwdHs=;
	b=tBkSYe8FO2mEnB5ym4QfppW4OUxuKuDnXYOGimoSAxD8OcEeMFbKqvpN6MwMzo5N7SzW9kGHmYAfG
	 6zVkay6XKbiGD1LXSv/Yhlj9LTWVTkNbmJAnuRNMA5gBfjO/1Bhe+bgUsUT783i0NHK+NgSZ7Xih9+
	 MPmhFT7DAv66Ag/0=
X-KPN-MID: 33|fJIsOu3aZlAdXvcX7EfZ/1qE+qAPUG/A7di1bOMywwIe5Qou+RRdLHlxK5dHr9n
 6PoyrkP6XTjW93FYcuGAnvjFPqxoO2QH2nVJvcEIKELo=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|qGf/iAkBDNI5Aw0uifSlq+yM7Y1ESAnO4pa532cqyxkafwNlP+RN6fVF0Dp2e1b
 g8OIkOSn6h/8B3GdllFRgUQ==
Received: from localhost.localdomain (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id a7ccc1f3-2fd5-11f0-9dc1-00505699b758;
	Tue, 13 May 2025 10:38:33 +0200 (CEST)
From: Jelle van der Waa <jvanderw@redhat.com>
To: Ike Panhc <ikepanhc@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jvanderwaa@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 1/1] platform/x86: ideapad: Expose charge_types
Date: Tue, 13 May 2025 10:38:14 +0200
Message-ID: <20250513083816.461771-2-jvanderw@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513083816.461771-1-jvanderw@redhat.com>
References: <20250513083816.461771-1-jvanderw@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jelle van der Waa <jvanderwaa@redhat.com>

Some Ideapad models support a battery conservation mode which limits the
battery charge threshold for longer battery longevity. This is currently
exposed via a custom conservation_mode attribute in sysfs.

The newly introduced charge_types sysfs attribute is a standardized
replacement for laptops with a fixed end charge threshold. Setting it to
`Long Life` would enable battery conservation mode. The standardized
user space API would allow applications such as UPower to detect laptops
which support this battery longevity mode and set it.

Tested on an Lenovo ideapad U330p.

Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>
---
 .../obsolete/sysfs-platform-ideapad-laptop    |   8 ++
 .../ABI/testing/sysfs-platform-ideapad-laptop |   9 --
 drivers/platform/x86/Kconfig                  |   1 +
 drivers/platform/x86/ideapad-laptop.c         | 110 +++++++++++++++++-
 4 files changed, 116 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-platform-ideapad-laptop

diff --git a/Documentation/ABI/obsolete/sysfs-platform-ideapad-laptop b/Documentation/ABI/obsolete/sysfs-platform-ideapad-laptop
new file mode 100644
index 000000000000..c1dbd19c679c
--- /dev/null
+++ b/Documentation/ABI/obsolete/sysfs-platform-ideapad-laptop
@@ -0,0 +1,8 @@
+What:		/sys/bus/platform/devices/VPC2004:*/conservation_mode
+Date:		Aug 2017
+KernelVersion:	4.14
+Contact:	platform-driver-x86@vger.kernel.org
+Description:
+		Controls whether the conservation mode is enabled or not.
+		This feature limits the maximum battery charge percentage to
+		around 50-60% in order to prolong the lifetime of the battery.
diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
index 4989ab266682..5ec0dee9e707 100644
--- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
+++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
@@ -27,15 +27,6 @@ Description:
 			* 1 -> Switched On
 			* 0 -> Switched Off
 
-What:		/sys/bus/platform/devices/VPC2004:*/conservation_mode
-Date:		Aug 2017
-KernelVersion:	4.14
-Contact:	platform-driver-x86@vger.kernel.org
-Description:
-		Controls whether the conservation mode is enabled or not.
-		This feature limits the maximum battery charge percentage to
-		around 50-60% in order to prolong the lifetime of the battery.
-
 What:		/sys/bus/platform/devices/VPC2004:*/fn_lock
 Date:		May 2018
 KernelVersion:	4.18
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 43407e76476b..5ea12d6cbb38 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -462,6 +462,7 @@ config IBM_RTL
 config IDEAPAD_LAPTOP
 	tristate "Lenovo IdeaPad Laptop Extras"
 	depends on ACPI
+	depends on ACPI_BATTERY
 	depends on RFKILL && INPUT
 	depends on SERIO_I8042
 	depends on BACKLIGHT_CLASS_DEVICE
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index ede483573fe0..21db9646443e 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -27,6 +27,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
+#include <linux/power_supply.h>
 #include <linux/rfkill.h>
 #include <linux/seq_file.h>
 #include <linux/sysfs.h>
@@ -34,6 +35,7 @@
 #include <linux/wmi.h>
 #include "ideapad-laptop.h"
 
+#include <acpi/battery.h>
 #include <acpi/video.h>
 
 #include <dt-bindings/leds/common.h>
@@ -162,6 +164,7 @@ struct ideapad_private {
 	struct backlight_device *blightdev;
 	struct ideapad_dytc_priv *dytc;
 	struct dentry *debug;
+	struct acpi_battery_hook battery_hook;
 	unsigned long cfg;
 	unsigned long r_touchpad_val;
 	struct {
@@ -589,6 +592,11 @@ static ssize_t camera_power_store(struct device *dev,
 
 static DEVICE_ATTR_RW(camera_power);
 
+static void show_conservation_mode_deprecation_warning(struct device *dev)
+{
+	dev_warn_once(dev, "conservation_mode attribute has been deprecated, see charge_types.\n");
+}
+
 static ssize_t conservation_mode_show(struct device *dev,
 				      struct device_attribute *attr,
 				      char *buf)
@@ -597,6 +605,8 @@ static ssize_t conservation_mode_show(struct device *dev,
 	unsigned long result;
 	int err;
 
+	show_conservation_mode_deprecation_warning(dev);
+
 	err = eval_gbmd(priv->adev->handle, &result);
 	if (err)
 		return err;
@@ -612,6 +622,8 @@ static ssize_t conservation_mode_store(struct device *dev,
 	bool state;
 	int err;
 
+	show_conservation_mode_deprecation_warning(dev);
+
 	err = kstrtobool(buf, &state);
 	if (err)
 		return err;
@@ -1973,10 +1985,90 @@ static const struct dmi_system_id ctrl_ps2_aux_port_list[] = {
 	{}
 };
 
-static void ideapad_check_features(struct ideapad_private *priv)
+static int ideapad_psy_ext_set_prop(struct power_supply *psy,
+				    const struct power_supply_ext *ext,
+				    void *ext_data,
+				    enum power_supply_property psp,
+				    const union power_supply_propval *val)
+{
+	struct ideapad_private *priv = ext_data;
+
+	switch (val->intval) {
+	case POWER_SUPPLY_CHARGE_TYPE_LONGLIFE:
+		return exec_sbmc(priv->adev->handle, SBMC_CONSERVATION_ON);
+	case POWER_SUPPLY_CHARGE_TYPE_STANDARD:
+		return exec_sbmc(priv->adev->handle, SBMC_CONSERVATION_OFF);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int ideapad_psy_ext_get_prop(struct power_supply *psy,
+				    const struct power_supply_ext *ext,
+				    void *ext_data,
+				    enum power_supply_property psp,
+				    union power_supply_propval *val)
+{
+	struct ideapad_private *priv = ext_data;
+	unsigned long result;
+	int err;
+
+	err = eval_gbmd(priv->adev->handle, &result);
+	if (err)
+		return err;
+
+	if (test_bit(GBMD_CONSERVATION_STATE_BIT, &result))
+		val->intval = POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
+	else
+		val->intval = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
+
+	return 0;
+}
+
+static int ideapad_psy_prop_is_writeable(struct power_supply *psy,
+					 const struct power_supply_ext *ext,
+					 void *data,
+					 enum power_supply_property psp)
+{
+	return true;
+}
+
+static const enum power_supply_property ideapad_power_supply_props[] = {
+	POWER_SUPPLY_PROP_CHARGE_TYPES,
+};
+
+static const struct power_supply_ext ideapad_battery_ext = {
+	.name			= "ideapad_laptop",
+	.properties		= ideapad_power_supply_props,
+	.num_properties		= ARRAY_SIZE(ideapad_power_supply_props),
+	.charge_types		= (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
+				   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
+	.get_property		= ideapad_psy_ext_get_prop,
+	.set_property		= ideapad_psy_ext_set_prop,
+	.property_is_writeable	= ideapad_psy_prop_is_writeable,
+};
+
+static int ideapad_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	struct ideapad_private *priv = container_of(hook, struct ideapad_private, battery_hook);
+
+	return power_supply_register_extension(battery, &ideapad_battery_ext,
+					       &priv->platform_device->dev, priv);
+}
+
+static int ideapad_battery_remove(struct power_supply *battery,
+				  struct acpi_battery_hook *hook)
+{
+	power_supply_unregister_extension(battery, &ideapad_battery_ext);
+
+	return 0;
+}
+
+static int ideapad_check_features(struct ideapad_private *priv)
 {
 	acpi_handle handle = priv->adev->handle;
 	unsigned long val;
+	int err;
 
 	priv->features.set_fn_lock_led =
 		set_fn_lock_led || dmi_check_system(set_fn_lock_led_list);
@@ -1991,8 +2083,16 @@ static void ideapad_check_features(struct ideapad_private *priv)
 	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
 		priv->features.fan_mode = true;
 
-	if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC"))
+	if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
 		priv->features.conservation_mode = true;
+		priv->battery_hook.add_battery = ideapad_battery_add;
+		priv->battery_hook.remove_battery = ideapad_battery_remove;
+		priv->battery_hook.name = "Ideapad Battery Extension";
+
+		err = devm_battery_hook_register(&priv->platform_device->dev, &priv->battery_hook);
+		if (err)
+			return err;
+	}
 
 	if (acpi_has_method(handle, "DYTC"))
 		priv->features.dytc = true;
@@ -2027,6 +2127,8 @@ static void ideapad_check_features(struct ideapad_private *priv)
 			}
 		}
 	}
+
+	return 0;
 }
 
 #if IS_ENABLED(CONFIG_ACPI_WMI)
@@ -2175,7 +2277,9 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	ideapad_check_features(priv);
+	err = ideapad_check_features(priv);
+	if (err)
+		return err;
 
 	ideapad_debugfs_init(priv);
 
-- 
2.49.0

