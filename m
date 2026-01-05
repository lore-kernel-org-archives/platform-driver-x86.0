Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775D13090E5
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Jan 2026 17:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767633118; cv=none; b=oNt+ApdmTt56/jilKpHGU39LT5+qn7x1xf5T2f+aQgKvGs6YQjJTDIYlTgwEb+PBth5bngVOmkWDH7SxLFC/NU2hV/5luLuSK47CmQJKIEK/cTdVJptkPAMs8HvQdUGfN+prCOQlTAvUXCPjE9qgVjHTbOcjDkrybBZx7HNXwBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767633118; c=relaxed/simple;
	bh=SWNiAz/QxYiWUxgJkg+5ulG9yWSOlmyUM1umcPZ+Yk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XnzSEYgJTJDl0gwlWwrv8M8fl55jNyg2P1DzQwD3K9M0t4xBYvTYUx2o9KvBNXIqdb2OtgvWxw7qRhxBKg+p8bYqR/GBYg+/FLhk1fTRwLtJNDozmRMkiE4+njuTbB1fOh7zucacQ8PLS00+vJ3q4jbmxe9x4p5t6/thvBXU918=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=fail smtp.mailfrom=vdwaa.nl; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=RshA4FRD; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="RshA4FRD"
X-KPN-MessageId: 79ac0131-ea59-11f0-89d8-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 79ac0131-ea59-11f0-89d8-00505699b430;
	Mon, 05 Jan 2026 18:10:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=oQnXzY47r3EXfdD/tSnqFInMFtOEnFOmXeLAFcCSUrI=;
	b=RshA4FRD8GKdF5FFptgT9qSfsblGk2tFx1feeLdoR004/7O+JIZnZrUNTZA7Jdnw/I2EF0sS2Zf9K
	 6hZvDQksDBBP7BFiakNUNvoJmLwx8DuxepUjw5pgpF6xvyIcU0EsigIl3YRiIw/hnzx13FQ+KkWoiM
	 NAI74FHMy0PzE5Ho=
X-KPN-MID: 33|5oaN9Iz6DMwDeZ9NZX2vBYvhJZfg0UlGqHrmMaHvmNB41PO7ZR/tC8/Q9JGzQUo
 6ZnFAOnMllIY36a2bK4xVL2d3rl2PZZOQNYTIk7XOGtk=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|ue9oM5hOKiCMKnNmict/Hc9Y7VgJ/K216/mSncAP9ZghEp3wFgVY1muLQlN4e8K
 JcMpRnRH8w4EP6HUPapMqRg==
Received: from natrium (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id 78f36269-ea59-11f0-86cb-005056998788;
	Mon, 05 Jan 2026 18:10:45 +0100 (CET)
From: Jelle van der Waa <jelle@vdwaa.nl>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jelle@vdwaa.nl>,
	platform-driver-x86@vger.kernel.org,
	Frederik Harwath <frederik@harwath.name>
Subject: [PATCH 1/1] platform/x86: add Acer battery control driver
Date: Mon,  5 Jan 2026 18:10:22 +0100
Message-ID: <20260105171024.227758-2-jelle@vdwaa.nl>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105171024.227758-1-jelle@vdwaa.nl>
References: <20260105171024.227758-1-jelle@vdwaa.nl>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Acer laptops can configure battery related features through Acer
Care Center on Windows. This driver uses the power supply extension to
set a battery charge limit and exposes the battery
temperature.

This driver is based on the existing acer-wmi-battery project on GitHub
and was tested on an Acer Aspire A315-510P.

Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
---
 drivers/platform/x86/Kconfig            |  12 +
 drivers/platform/x86/Makefile           |   1 +
 drivers/platform/x86/acer-wmi-battery.c | 345 ++++++++++++++++++++++++
 3 files changed, 358 insertions(+)
 create mode 100644 drivers/platform/x86/acer-wmi-battery.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 4cb7d97a9fcc..b3de6a2827e8 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -170,6 +170,18 @@ config ACER_WMI
 	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
 	  here.
 
+config ACER_WMI_BATTERY
+	tristate "Acer WMI Battery"
+	depends on ACPI_WMI
+	depends on ACPI_BATTERY
+	depends on HWMON
+	help
+	  This is a driver for Acer laptops with battery health control. It
+	  adds charge limit control and battery temperature reporting.
+
+	  If you have an ACPI-WMI Battery compatible Acer laptop, say Y or M
+	  here.
+
 source "drivers/platform/x86/amd/Kconfig"
 
 config ADV_SWBUTTON
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index d25762f7114f..9cf28baff3ae 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 obj-$(CONFIG_ACERHDF)		+= acerhdf.o
 obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
 obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
+obj-$(CONFIG_ACER_WMI_BATTERY)	+= acer-wmi-battery.o
 
 # AMD
 obj-y				+= amd/
diff --git a/drivers/platform/x86/acer-wmi-battery.c b/drivers/platform/x86/acer-wmi-battery.c
new file mode 100644
index 000000000000..fffa521cde27
--- /dev/null
+++ b/drivers/platform/x86/acer-wmi-battery.c
@@ -0,0 +1,345 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * acer-wmi-battery.c: Acer battery health control driver
+ *
+ * This is a driver for the WMI battery health control interface found
+ * on some Acer laptops.  This interface allows to enable/disable a
+ * battery charge limit ("health mode") and exposes the battery temperature.
+ *
+ * Based on acer-wmi-battery https://github.com/frederik-h/acer-wmi-battery/
+ * Copyright (C) 2022-2025  Frederik Harwath <frederik@harwath.name>
+ */
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/power_supply.h>
+#include <linux/version.h>
+#include <linux/wmi.h>
+#include <linux/unaligned.h>
+
+#include <acpi/battery.h>
+
+#define DRIVER_NAME	"acer-wmi-battery"
+
+#define ACER_BATTERY_GUID "79772EC5-04B1-4BFD-843C-61E7F77B6CC9"
+
+/*
+ * The Acer OEM software seems to always use this battery index,
+ * so we emulate this behaviour to not confuse the underlying firmware.
+ *
+ * However this also means that we only fully support devices with a
+ * single battery for now.
+ */
+#define ACER_BATTERY_INDEX	0x1
+
+struct get_battery_health_control_status_input {
+	u8 uBatteryNo;
+	u8 uFunctionQuery;
+	u8 uReserved[2];
+} __packed;
+
+struct get_battery_health_control_status_output {
+	u8 uFunctionList;
+	u8 uReturn[2];
+	u8 uFunctionStatus[5];
+} __packed;
+
+struct set_battery_health_control_input {
+	u8 uBatteryNo;
+	u8 uFunctionMask;
+	u8 uFunctionStatus;
+	u8 uReservedIn[5];
+} __packed;
+
+struct set_battery_health_control_output {
+	u8 uReturn;
+	u8 uReservedOut;
+} __packed;
+
+enum battery_mode { HEALTH_MODE = 1, CALIBRATION_MODE = 2 };
+
+struct acer_wmi_battery_data {
+	struct acpi_battery_hook hook;
+	struct wmi_device *wdev;
+};
+
+static int acer_wmi_battery_get_information(struct acer_wmi_battery_data *data,
+					    u32 index, u32 battery, u32 *result)
+{
+	u32 args[2] = { index, battery };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer input = { sizeof(args), args };
+	union acpi_object *obj;
+	int ret;
+
+	ret = wmi_evaluate_method(ACER_BATTERY_GUID, 0, 19, &input, &output);
+	if (ACPI_FAILURE(ret))
+		return -EIO;
+
+	obj = output.pointer;
+	if (!obj)
+		return -EIO;
+
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		ret = -EIO;
+		goto out_free_obj;
+	}
+
+	if (obj->buffer.length != sizeof(u32)) {
+		dev_err(&data->wdev->dev, "WMI battery information call returned buffer of unexpected length %u\n",
+			obj->buffer.length);
+		ret = -EINVAL;
+		goto out_free_obj;
+	}
+
+	*result = get_unaligned_le32(obj->buffer.pointer);
+
+out_free_obj:
+	kfree(obj);
+	return ret;
+}
+
+static int acer_wmi_battery_get_health_control_status(struct acer_wmi_battery_data *data,
+							      s8 *health_mode)
+{
+	/*
+	 * Acer Care Center seems to always call the WMI method
+	 * with fixed parameters. This yields information about
+	 * the availability and state of both health and
+	 * calibration mode. The modes probably apply to
+	 * all batteries of the system.
+	 */
+	struct get_battery_health_control_status_input params = {
+		.uBatteryNo = ACER_BATTERY_INDEX,
+		.uFunctionQuery = 0x1,
+		.uReserved = { 0x0, 0x0 }
+	};
+	struct acpi_buffer input = {
+		sizeof(struct get_battery_health_control_status_input), &params
+	};
+	struct get_battery_health_control_status_output status_output;
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	int ret;
+
+	ret = wmi_evaluate_method(ACER_BATTERY_GUID, 0, 20, &input, &output);
+	if (ACPI_FAILURE(ret))
+		return -EIO;
+
+	obj = output.pointer;
+	if (!obj)
+		return -EIO;
+	else if (obj->type != ACPI_TYPE_BUFFER) {
+		ret = -EIO;
+		goto out_free_obj;
+	}
+
+	status_output = *((struct get_battery_health_control_status_output *)
+			obj->buffer.pointer);
+	if (obj->buffer.length != 8) {
+		dev_err(&data->wdev->dev, "WMI battery status call returned a buffer of unexpected length %d\n",
+			obj->buffer.length);
+		ret = -EINVAL;
+		goto out_free_obj;
+	}
+
+	if (health_mode)
+		*health_mode = status_output.uFunctionList & HEALTH_MODE ?
+					  status_output.uFunctionStatus[0] > 0 :
+					  -1;
+
+out_free_obj:
+	kfree(obj);
+	return ret;
+}
+
+static int set_battery_health_control(struct acer_wmi_battery_data *data,
+					      u8 function, bool function_status)
+{
+	struct set_battery_health_control_input params = {
+		.uBatteryNo = ACER_BATTERY_INDEX,
+		.uFunctionMask = function,
+		.uFunctionStatus = (u8)function_status,
+		.uReservedIn = { 0x0, 0x0, 0x0, 0x0, 0x0 }
+	};
+	struct acpi_buffer input = {
+		sizeof(struct set_battery_health_control_input),
+		&params,
+	};
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	int ret;
+
+	ret = wmi_evaluate_method(ACER_BATTERY_GUID, 0, 21, &input, &output);
+	if (ACPI_FAILURE(ret))
+		return -EIO;
+
+	obj = output.pointer;
+
+	if (!obj)
+		return -EIO;
+
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		ret = -EIO;
+		goto out_free_obj;
+	}
+
+	if (obj->buffer.length != 4) {
+		dev_err(&data->wdev->dev, "WMI battery status set operation returned a buffer of unexpected length %d\n",
+			obj->buffer.length);
+		ret = -EINVAL;
+		goto out_free_obj;
+	}
+
+out_free_obj:
+	kfree(obj);
+	return ret;
+}
+
+static int acer_battery_ext_property_get(struct power_supply *psy,
+					 const struct power_supply_ext *ext,
+					 void *ext_data,
+					 enum power_supply_property psp,
+					 union power_supply_propval *val)
+{
+	struct acer_wmi_battery_data *data = ext_data;
+	s8 health_mode;
+	u32 value;
+	int ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+		ret = acer_wmi_battery_get_health_control_status(data, &health_mode);
+		if (ret)
+			return ret;
+
+		if (health_mode < 0)
+			return -EINVAL;
+
+		val->intval = health_mode ? POWER_SUPPLY_CHARGE_TYPE_LONGLIFE :
+				POWER_SUPPLY_CHARGE_TYPE_STANDARD;
+		break;
+	case POWER_SUPPLY_PROP_TEMP:
+		ret = acer_wmi_battery_get_information(data, 0x8, ACER_BATTERY_INDEX, &value);
+		if (ret)
+			return ret;
+
+		if (value > U16_MAX)
+			return -ERANGE;
+
+		val->intval = value - 2731;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int acer_battery_ext_property_set(struct power_supply *psy,
+					       const struct power_supply_ext *ext,
+					       void *ext_data,
+					       enum power_supply_property psp,
+					       const union power_supply_propval *val)
+{
+	struct acer_wmi_battery_data *data = ext_data;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+		return set_battery_health_control(data, HEALTH_MODE,
+				val->intval == POWER_SUPPLY_CHARGE_TYPE_LONGLIFE);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int acer_battery_ext_property_is_writeable(struct power_supply *psy,
+						  const struct power_supply_ext *ext,
+						  void *ext_data,
+						  enum power_supply_property psp)
+{
+	switch (psp) {
+	case POWER_SUPPLY_PROP_TEMP:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static const enum power_supply_property acer_battery_properties[] = {
+	POWER_SUPPLY_PROP_CHARGE_TYPES,
+	POWER_SUPPLY_PROP_TEMP,
+};
+
+static const struct power_supply_ext acer_wmi_battery_extension = {
+	.name			= "acer_laptop",
+	.properties		= acer_battery_properties,
+	.num_properties		= ARRAY_SIZE(acer_battery_properties),
+	.charge_types           = (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
+				   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
+	.get_property		= acer_battery_ext_property_get,
+	.set_property		= acer_battery_ext_property_set,
+	.property_is_writeable	= acer_battery_ext_property_is_writeable,
+};
+
+static int acer_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	struct acer_wmi_battery_data *data = container_of(hook, struct acer_wmi_battery_data, hook);
+
+	return power_supply_register_extension(battery, &acer_wmi_battery_extension,
+					       &data->wdev->dev, data);
+}
+
+static int acer_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	power_supply_unregister_extension(battery, &acer_wmi_battery_extension);
+
+	return 0;
+}
+
+static int acer_wmi_battery_battery_add(struct acer_wmi_battery_data *data)
+{
+	data->hook.name = "Acer Battery Extension";
+	data->hook.add_battery = acer_battery_add;
+	data->hook.remove_battery = acer_battery_remove;
+
+	return devm_battery_hook_register(&data->wdev->dev, &data->hook);
+}
+
+static int acer_wmi_battery_probe(struct wmi_device *wdev, const void *context)
+{
+	struct acer_wmi_battery_data *data;
+
+	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	dev_set_drvdata(&wdev->dev, data);
+	data->wdev = wdev;
+
+	return acer_wmi_battery_battery_add(data);
+}
+
+static const struct wmi_device_id acer_wmi_battery_id_table[] = {
+	{ ACER_BATTERY_GUID, NULL },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, acer_wmi_battery_id_table);
+
+static struct wmi_driver acer_wmi_battery_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = acer_wmi_battery_id_table,
+	.probe = acer_wmi_battery_probe,
+};
+module_wmi_driver(acer_wmi_battery_driver);
+
+MODULE_AUTHOR("Frederik Harwath <frederik@harwath.name>");
+MODULE_AUTHOR("Jelle van der Waa <jelle@vdwaa.nl>");
+MODULE_DESCRIPTION("Acer battery health control WMI driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0

