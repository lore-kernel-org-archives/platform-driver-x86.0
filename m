Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905B21624DD
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 May 2025 20:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253515; cv=none; b=Vkq8//5K+6sfXzYre54NKHbOlN+4NqimAk3FXiTzZQCgSuSoJmhn3pdS+TWTykMxSPrMMEIpXAgB+N1JLVr2Ynev9s2joYPHjMPELgiHcK56BxjItjV8NQLJHM0daP3uMfQiWx1DTjvENs6rt2ZTudl1gqY9Hz6xP5nrvTYSKoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253515; c=relaxed/simple;
	bh=rgf8aNHSOZ4F39zXKuuG+OfmHKu6Lk/SwQhUiJEaUqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WkAKFJNJYlpwvhnhPwoFW8CMXc31xM3BdBndTFHjinV1O1eEFOLmmRQaIehLHf+dOn1hgIFZezaXoFvn657f9YX36whVbLq3liCRgm3/ncAWFgxLo/n2NLFaD0bhkn6rGIkojYKg5QM61CW0bSlkc4tboKqJBrgWs8eYz+pv1KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hhuZvBH8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hhuZvBH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747253512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ghs3T/RciJuUmgUzArhsxO032e8BVIsuotMiEiD1jMQ=;
	b=hhuZvBH8Z8L06ebwLjvEoup0QulsHfJMB+D/WR3jg9RHHBa5+cTEoK0ZD+aGZhdNRDHX7w
	z6XYO8bz10qOmp7NLeZGAsE+URxN7IVKJivB+zumZAYyHbMs1DJnqbRv4PnbClR9+5/rcB
	wTBT1dAk2sSnx5wBXB2vO/STwn3tX4Q=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-58-Sj3tMye1OYulkbFzbPA_tQ-1; Wed,
 14 May 2025 16:11:49 -0400
X-MC-Unique: Sj3tMye1OYulkbFzbPA_tQ-1
X-Mimecast-MFC-AGG-ID: Sj3tMye1OYulkbFzbPA_tQ_1747253508
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 59587195608B;
	Wed, 14 May 2025 20:11:47 +0000 (UTC)
Received: from carbon.redhat.com (unknown [10.44.32.91])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C8F161953B80;
	Wed, 14 May 2025 20:11:42 +0000 (UTC)
From: Jelle van der Waa <jvanderwaa@redhat.com>
To: Ike Panhc <ikepanhc@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jvanderwaa@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v3] platform/x86: ideapad: Expose charge_types
Date: Wed, 14 May 2025 22:10:52 +0200
Message-ID: <20250514201054.381320-1-jvanderwaa@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

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
Suggested-By: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
---
V2 -> V3: Add Reviewed-By/Suggested-By

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

