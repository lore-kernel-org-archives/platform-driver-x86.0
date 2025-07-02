Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BEB2E49BA
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Jul 2025 18:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481016; cv=none; b=XySEwNOQXNdUa3J3PiZix9mW/8mp9T/bqUqnaKdVZY26HvifPymhTKUb34eMP6A/TjDxE6BAqZZ8VxaaBrWhVqnNiD2oho8oCP7JIZH0xhE9GCaWsJ1555S2uW9Yr9CMaMBartS2d2f3J4wrFPtr8PejRXSv8uHOCM3YJpwSuJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481016; c=relaxed/simple;
	bh=iNgjRnlWJUyTgumuiwM9IFYMRVi9fCVMBhQZrXEwJyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qbg2KrJYg3og9HT0BGf5QlYnJ1V9KMwCnvMmI92wjeOzvg6kGuoNkVs68C/+b5Y538p7qJ8+Gs+Tw71LcrNNFWh0ej1qMMWkTehs/0dZD44R2opPkOzADA2rKslXgz5yvUTO9NhEoLIOsrN4WYv1aczMMZ/EuP3CXJAjjXTMAuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jA/3PGDT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jA/3PGDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751481013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gnUoEwGRyRRCWbX+f+ZtGX4vj/F5dO/iBxWdtFcYrhQ=;
	b=jA/3PGDThg/08w/NBour8DfTCbeGy5WcrB3jo+gZbQ6Z9avyBDwZv0k8qDk2PzgeGgJM1L
	9J7rcLgaGLOXe6k68Hm3zSIlr2OZRJfyHdo/OGSn+YyqVjc6cdEaCVV0BU4n3IBiQmGYvP
	TFTVmt11IsDX77qN2ZGWp2kMLxKgiK4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-h12dAk_4MBSGfMRzuJvy5g-1; Wed,
 02 Jul 2025 14:30:11 -0400
X-MC-Unique: h12dAk_4MBSGfMRzuJvy5g-1
X-Mimecast-MFC-AGG-ID: h12dAk_4MBSGfMRzuJvy5g_1751481010
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3780618DBA29;
	Wed,  2 Jul 2025 18:30:10 +0000 (UTC)
Received: from carbon.redhat.com (unknown [10.44.32.40])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 69B9F19560AB;
	Wed,  2 Jul 2025 18:30:06 +0000 (UTC)
From: Jelle van der Waa <jvanderwaa@redhat.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jvanderwaa@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: samsung-laptop: Expose charge_types
Date: Wed,  2 Jul 2025 20:28:43 +0200
Message-ID: <20250702182844.107706-1-jvanderwaa@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Support the newly introduced charge_types sysfs attribute as a
replacement for the custom `battery_life_extender` attribute. Setting
charge_types to `Long Life` enables battery life extending mode.

This change is similar to the recent Ideapad patch adding support for
charge_types.

Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>
---
 .../ABI/obsolete/sysfs-driver-samsung-laptop  |  10 ++
 .../ABI/testing/sysfs-driver-samsung-laptop   |  11 --
 drivers/platform/x86/Kconfig                  |   1 +
 drivers/platform/x86/samsung-laptop.c         | 110 ++++++++++++++++++
 4 files changed, 121 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-driver-samsung-laptop

diff --git a/Documentation/ABI/obsolete/sysfs-driver-samsung-laptop b/Documentation/ABI/obsolete/sysfs-driver-samsung-laptop
new file mode 100644
index 000000000000..204c3f3a1d78
--- /dev/null
+++ b/Documentation/ABI/obsolete/sysfs-driver-samsung-laptop
@@ -0,0 +1,10 @@
+What:		/sys/devices/platform/samsung/battery_life_extender
+Date:		December 1, 2011
+KernelVersion:	3.3
+Contact:	Corentin Chary <corentin.chary@gmail.com>
+Description:	Max battery charge level can be modified, battery cycle
+		life can be extended by reducing the max battery charge
+		level.
+
+		- 0 means normal battery mode (100% charge)
+		- 1 means battery life extender mode (80% charge)
diff --git a/Documentation/ABI/testing/sysfs-driver-samsung-laptop b/Documentation/ABI/testing/sysfs-driver-samsung-laptop
index 28c9c040de5d..408cb0ddf4aa 100644
--- a/Documentation/ABI/testing/sysfs-driver-samsung-laptop
+++ b/Documentation/ABI/testing/sysfs-driver-samsung-laptop
@@ -20,17 +20,6 @@ Description:	Some Samsung laptops have different "performance levels"
 		and it's still unknown if this value even changes
 		anything, other than making the user feel a bit better.
 
-What:		/sys/devices/platform/samsung/battery_life_extender
-Date:		December 1, 2011
-KernelVersion:	3.3
-Contact:	Corentin Chary <corentin.chary@gmail.com>
-Description:	Max battery charge level can be modified, battery cycle
-		life can be extended by reducing the max battery charge
-		level.
-
-		- 0 means normal battery mode (100% charge)
-		- 1 means battery life extender mode (80% charge)
-
 What:		/sys/devices/platform/samsung/usb_charge
 Date:		December 1, 2011
 KernelVersion:	3.3
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index e5cbd58a99f3..f9fc09a034a0 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -825,6 +825,7 @@ config SAMSUNG_LAPTOP
 	tristate "Samsung Laptop driver"
 	depends on RFKILL || RFKILL = n
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	depends on ACPI_BATTERY
 	depends on BACKLIGHT_CLASS_DEVICE
 	select LEDS_CLASS
 	select NEW_LEDS
diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index decde4c9a3d9..9d43a12db73c 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -16,6 +16,7 @@
 #include <linux/leds.h>
 #include <linux/dmi.h>
 #include <linux/platform_device.h>
+#include <linux/power_supply.h>
 #include <linux/rfkill.h>
 #include <linux/acpi.h>
 #include <linux/seq_file.h>
@@ -23,6 +24,7 @@
 #include <linux/ctype.h>
 #include <linux/efi.h>
 #include <linux/suspend.h>
+#include <acpi/battery.h>
 #include <acpi/video.h>
 
 /*
@@ -348,6 +350,8 @@ struct samsung_laptop {
 
 	struct notifier_block pm_nb;
 
+	struct acpi_battery_hook battery_hook;
+
 	bool handle_backlight;
 	bool has_stepping_quirk;
 
@@ -697,6 +701,11 @@ static ssize_t set_performance_level(struct device *dev,
 static DEVICE_ATTR(performance_level, 0644,
 		   get_performance_level, set_performance_level);
 
+static void show_battery_life_extender_deprecation_warning(struct device *dev)
+{
+	dev_warn_once(dev, "battery_life_extender attribute has been deprecated, see charge_types.\n");
+}
+
 static int read_battery_life_extender(struct samsung_laptop *samsung)
 {
 	const struct sabi_commands *commands = &samsung->config->commands;
@@ -739,6 +748,8 @@ static ssize_t get_battery_life_extender(struct device *dev,
 	struct samsung_laptop *samsung = dev_get_drvdata(dev);
 	int ret;
 
+	show_battery_life_extender_deprecation_warning(dev);
+
 	ret = read_battery_life_extender(samsung);
 	if (ret < 0)
 		return ret;
@@ -753,6 +764,8 @@ static ssize_t set_battery_life_extender(struct device *dev,
 	struct samsung_laptop *samsung = dev_get_drvdata(dev);
 	int ret, value;
 
+	show_battery_life_extender_deprecation_warning(dev);
+
 	if (!count || kstrtoint(buf, 0, &value) != 0)
 		return -EINVAL;
 
@@ -766,6 +779,84 @@ static ssize_t set_battery_life_extender(struct device *dev,
 static DEVICE_ATTR(battery_life_extender, 0644,
 		   get_battery_life_extender, set_battery_life_extender);
 
+static int samsung_psy_ext_set_prop(struct power_supply *psy,
+				    const struct power_supply_ext *ext,
+				    void *ext_data,
+				    enum power_supply_property psp,
+				    const union power_supply_propval *val)
+{
+	struct samsung_laptop *samsung = ext_data;
+
+	switch (val->intval) {
+	case POWER_SUPPLY_CHARGE_TYPE_LONGLIFE:
+		return write_battery_life_extender(samsung, 1);
+	case POWER_SUPPLY_CHARGE_TYPE_STANDARD:
+		return write_battery_life_extender(samsung, 0);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int samsung_psy_ext_get_prop(struct power_supply *psy,
+				    const struct power_supply_ext *ext,
+				    void *ext_data,
+				    enum power_supply_property psp,
+				    union power_supply_propval *val)
+{
+	struct samsung_laptop *samsung = ext_data;
+	int ret;
+
+	ret = read_battery_life_extender(samsung);
+	if (ret < 0)
+		return ret;
+
+	if (ret == 1)
+		val->intval = POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
+	else
+		val->intval = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
+
+	return 0;
+}
+
+static int samsung_psy_prop_is_writeable(struct power_supply *psy,
+					 const struct power_supply_ext *ext,
+					 void *data,
+					 enum power_supply_property psp)
+{
+	return true;
+}
+
+static const enum power_supply_property samsung_power_supply_props[] = {
+	POWER_SUPPLY_PROP_CHARGE_TYPES,
+};
+
+static const struct power_supply_ext samsung_battery_ext = {
+	.name			= "samsung_laptop",
+	.properties		= samsung_power_supply_props,
+	.num_properties		= ARRAY_SIZE(samsung_power_supply_props),
+	.charge_types		= (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
+				   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
+	.get_property		= samsung_psy_ext_get_prop,
+	.set_property		= samsung_psy_ext_set_prop,
+	.property_is_writeable	= samsung_psy_prop_is_writeable,
+};
+
+static int samsung_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	struct samsung_laptop *samsung = container_of(hook, struct samsung_laptop, battery_hook);
+
+	return power_supply_register_extension(battery, &samsung_battery_ext,
+					       &samsung->platform_device->dev, samsung);
+}
+
+static int samsung_battery_remove(struct power_supply *battery,
+				  struct acpi_battery_hook *hook)
+{
+	power_supply_unregister_extension(battery, &samsung_battery_ext);
+
+	return 0;
+}
+
 static int read_usb_charge(struct samsung_laptop *samsung)
 {
 	const struct sabi_commands *commands = &samsung->config->commands;
@@ -1043,6 +1134,21 @@ static int __init samsung_lid_handling_init(struct samsung_laptop *samsung)
 	return retval;
 }
 
+static int __init samsung_battery_hook_init(struct samsung_laptop *samsung)
+{
+	int retval = 0;
+
+	if (samsung->config->commands.get_battery_life_extender != 0xFFFF) {
+		samsung->battery_hook.add_battery = samsung_battery_add;
+		samsung->battery_hook.remove_battery = samsung_battery_remove;
+		samsung->battery_hook.name = "Samsung Battery Extension";
+		retval = devm_battery_hook_register(&samsung->platform_device->dev,
+						    &samsung->battery_hook);
+	}
+
+	return retval;
+}
+
 static int kbd_backlight_enable(struct samsung_laptop *samsung)
 {
 	const struct sabi_commands *commands = &samsung->config->commands;
@@ -1604,6 +1710,10 @@ static int __init samsung_init(void)
 	if (ret)
 		goto error_lid_handling;
 
+	ret = samsung_battery_hook_init(samsung);
+	if (ret)
+		goto error_lid_handling;
+
 	samsung_debugfs_init(samsung);
 
 	samsung->pm_nb.notifier_call = samsung_pm_notification;
-- 
2.49.0

