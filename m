Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398692D7DF1
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786562678; cv=none; b=m6ueDgOXN/b6FTbnX0DtzZ+AnxsgOEgd+eeUTwS4VUE6Wo+7/5ULcKWug+NgeZmlSlKaZFYYdjFMXaJSm4gR5fA7OfPQWlkLfzJG9opzt149vV6gsZGDSKY9bjDVd85ian91FNifTD4bTJhGsyvzPyo9MkLqQvFoSapBtDEgW08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786562678; c=relaxed/simple;
	bh=5BMlcff57lxcwSD1cYDZYCoNKy0Sw+gY7cHs0VMbqNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BMyAdsO67bD9bqDyTULTJSkcG3NKGnA/7tvI8gR5tQuNrK1nM4RtBOIJCCLoLVtaACyKFPnC8FyOjLQjqRZiq5pkEj3EoDDZWX0j2X2Zi0RHT+fY5U3ry/tcL+bOsY1CAPHTSMr18PoD4bgaP3DYIspD39pAAVKOQ+G2ytemhvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=fail smtp.mailfrom=vdwaa.nl; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=CYlgqHGx; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="CYlgqHGx"
X-KPN-MessageId: 48ec4d21-9683-11f1-bfbb-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 48ec4d21-9683-11f1-bfbb-00505699b430;
	Wed, 12 Aug 2026 21:23:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=3n4q98orO7tE+6yxxa8MdJUf0VEn035EoL1jpcLTDJg=;
	b=CYlgqHGxhf7rMoYwrsDncKAI4NcGFXelksIHafuTKG9QtL2qxFBR2514pK3cLbBIpALCpNQtS2zzO
	 7bggmcJulr0UKdHPZHlNggrnTVzuGXbnjzqKdb+zuxjI6sUvmkzunrL9D3qMF/gDlQpvacNVM3zpCo
	 0x6CWxUQuNVvuDXc=
X-KPN-MID: 33|vw89+imGlFSgZ5rQIbu21zaLVFp8tmWuyhihxtX3cw8ME7UHlamQxPRS33qToAZ
 vJ4dIlRaDE045OzDyrCJ0I488+NeCZyVC7E9BbnSP7zw=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|KimRQyHGaC7zZjUZQYMuATMzdhsE3uUoIVjksiHtnAZL3A7r7uqUEZOrLT3aHg4
 fPFvkHQdyEidJ8kMySowfvA==
Received: from natrium (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id 48e4468c-9683-11f1-8097-005056998788;
	Wed, 12 Aug 2026 21:23:23 +0200 (CEST)
From: Jelle van der Waa <jelle@vdwaa.nl>
To: Armin Wolf <W_Armin@gmx.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jelle@vdwaa.nl>,
	platform-driver-x86@vger.kernel.org,
	Frederik Harwath <frederik@harwath.name>
Subject: [PATCH v6 1/1] platform/x86: add Acer battery control driver
Date: Wed, 12 Aug 2026 21:23:15 +0200
Message-ID: <20260812192319.276246-2-jelle@vdwaa.nl>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812192319.276246-1-jelle@vdwaa.nl>
References: <20260812192319.276246-1-jelle@vdwaa.nl>
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

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>

---
v6:
- Mark health_mode static and use __ro_after_init
- Convert output.data using kernel helper le32_to_cpup
- Drop unneeded if-statement for health_mode check
- Remove property_is_writeable for acer_wmi_battery_extension_v1
- Move DMI whitelist above acer_wmi_battery_module_init
v5:
- Add Acer WMI Battery Interface documentation
- Drop unneeded wmi_buffer output initialisation
- Drop get_unaligned_le32, as wmi core returns aligned data
- Derive temperature divider contsant from <linux/units.h> defines
- Add trailing commas to any non-terminating entry in DMI match table
- Remove duplicate DMI entry from DMI match table
- Update set_battery_health_control_output members to be __le16 not u8
  as WMI data suggests
- Replace sizeof(u32) with sizeof(*result)
- Add an empty line between if statements in POWER_SUPPLY_PROP_TEMP case
- Drop unneeded .set_property callback in acer_wmi_battery_extension_v1
- Introduce a force module parameter for easier testing of new notebook
  models
- Use "ret" instead of "r"
- Check the "uReturn" value of SetBatteryHealthControl
v4:
- Add additional DMI ids from https://github.com/frederik-h/acer-wmi-battery/blob/main/MODELS.md
  cross checked with DMI ids found in https://github.com/linuxhw/DMI
- Move DMI matching to __init and make the DMI table __initconst
- Port to the new wmidev_invoke_* API
v3:
- Add depends on DMI
- Rename CamelCase struct member names
- Simplify returning errors
- Add comma to non-terminating entries
- Simplified acer_wmi_battery_set_battery_health_control to acer_wmi_set_battery_health_control
- Use sizeof for acpi_object buffer
- Drop POWER_SUPPLY_EXTENSION macro
v2:
- Alphabetically sort linux headers
- Include headers for types / _packed
- Use cleanup.h instead of goto + label
- Add missing prefix for set_battery_health_control
- General code formatting fixes
- Remove HWMON dependency in Kconfig
- Use wmidev_evaluate_method()
- Accept oversized ACPI buffers
- Use DRIVER_NAME for battery extension name
- Set no_singleton = true
- Implement DMI matching to support laptops with only battery
  temperature support.
---
 .../wmi/devices/acer-wmi-battery.rst          |  70 +++
 drivers/platform/x86/Kconfig                  |  12 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/acer-wmi-battery.c       | 448 ++++++++++++++++++
 4 files changed, 531 insertions(+)
 create mode 100644 Documentation/wmi/devices/acer-wmi-battery.rst
 create mode 100644 drivers/platform/x86/acer-wmi-battery.c

diff --git a/Documentation/wmi/devices/acer-wmi-battery.rst b/Documentation/wmi/devices/acer-wmi-battery.rst
new file mode 100644
index 000000000000..8aa3e1334490
--- /dev/null
+++ b/Documentation/wmi/devices/acer-wmi-battery.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+====================================================
+Acer WMI Battery interface driver (acer-wmi-battery)
+====================================================
+
+Introduction
+============
+
+Some Acer laptops support setting battery charge control limits and allow a
+user to calibrate their battery.
+
+WMI interface description
+=========================
+
+The WMI interface description can be decoded from the embedded binary MOF (bmof)
+data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
+
+::
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Class used to control smart battery, Version 2.88"), guid("{79772EC5-04B1-4bfd-843C-61E7F77B6CC9}")]
+  class BatteryControl {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiMethodId(19), Implemented, read, write, Description("Get battery Information Interface.")] void GetBattInfoInterface([in] uint32 uBatteryInfoIndex, [in] uint32 uBatteryNo, [out] uint32 uReturn);
+    [WmiMethodId(20), Implemented, read, write, Description("Get Battery Health Control Status.")] void GetBatteryHealthControlStatus([in] uint8 uBatteryNo, [in] uint8 uFunctionQuery, [in] uint8 uReserved[2], [out] uint8 uFunctionList, [out] uint8 uReturn[2], [out] uint8 uFunctionStatus[5]);
+    [WmiMethodId(21), Implemented, read, write, Description("Set Battery Health Control.")] void SetBatteryHealthControl([in] uint8 uBatteryNo, [in] uint8 uFunctionMask, [in] uint8 uFunctionStatus, [in] uint8 uReservedIn[5], [out] uint16 uReturn, [out] uint16 uReservedOut);
+    [WmiMethodId(22), Implemented, read, write, Description("Get Battery Function Data.")] void GetBatteryFunctionData([in] uint8 uFunctionMask, [in] uint8 uReservedIn[3], [out] uint8 uReturnCode[2], [out] uint8 uBACStartTime[2], [out] uint8 uBACStopTime[2], [out] uint8 uBACStatus, [out] uint8 uReservedOut[9]);
+    [WmiMethodId(23), Implemented, read, write, Description("Set Battery Function Data.")] void SetBatteryFunctionData([in] uint8 uFunctionMask, [in] uint8 uBACSwitch, [in] uint8 uReservedIn[6], [out] uint16 uReturnCode, [out] uint8 uReservedOut[2]);
+  };
+
+For all methods the ``uBatteryNo`` is always ``0x1``, there are no known Acer
+laptop models with two batteries.
+
+WMI method GetBatteryInfoInterface()
+------------------------------------
+
+Returns additional battery information, the data seems to be based on the
+"Smart Battery Data Specification". The only known value for
+``uBatteryInfoIndex`` is ``0x8``, the battery temperature.
+
+WMI method GetBatteryHealthControlStatus()
+------------------------------------------
+
+This interface does not exist on all Acer laptops, it returns whether battery
+charge limiting or calibration mode is enabled.
+
+When calling this method, ``uFunctionList`` is a bitmask with known values:
+
++--------------------+------------------------------------+
+| Value              | Description                        |
++====================+====================================+
+| 0x01               | Health mode supported              |
++--------------------+------------------------------------+
+| 0x02               | Calibration mode supported         |
++--------------------+------------------------------------+
+
+``uFunctionStatus`` is a 5 byte array known elements are ``0`` for health mode
+and ``1`` for calibration mode. A non-zero value means the mode is enabled.
+
+WMI method SetBatteryHealthControl()
+------------------------------------
+
+This interface does not exist on all Acer laptops, it enables battery
+charge limiting or battery calibration.
+
+The argument ``uFunctionMask`` is known to accept either ``0x01`` for setting
+health mode or ``0x02`` for calibration mode; other values are unknown.
+``uFunctionStatus`` is an uint8 value, a non-zero value enables the given mode.
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b54b5212b204..d4a8294df5e1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -189,6 +189,18 @@ config ACER_WMI
 	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
 	  here.
 
+config ACER_WMI_BATTERY
+	tristate "Acer WMI Battery"
+	depends on ACPI_WMI
+	depends on ACPI_BATTERY
+	depends on DMI
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
index 872ac3842391..a877acd937cd 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_BITLAND_MIFS_WMI)		+= bitland-mifs-wmi.o
 obj-$(CONFIG_ACERHDF)		+= acerhdf.o
 obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
 obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
+obj-$(CONFIG_ACER_WMI_BATTERY)	+= acer-wmi-battery.o
 
 # AMD
 obj-y				+= amd/
diff --git a/drivers/platform/x86/acer-wmi-battery.c b/drivers/platform/x86/acer-wmi-battery.c
new file mode 100644
index 000000000000..c3f5fde7e356
--- /dev/null
+++ b/drivers/platform/x86/acer-wmi-battery.c
@@ -0,0 +1,448 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * acer-wmi-battery.c: Acer battery health control driver
+ *
+ * This is a driver for the WMI battery health control interface found
+ * on some Acer laptops.  This interface allows to enable/disable a
+ * battery charge limit ("health mode") and exposes the battery temperature.
+ *
+ * Based on acer-wmi-battery https://github.com/frederik-h/acer-wmi-battery/
+ *
+ * Copyright (C) 2022-2025  Frederik Harwath <frederik@harwath.name>
+ */
+
+#include <linux/acpi.h>
+#include <linux/byteorder/generic.h>
+#include <linux/cleanup.h>
+#include <linux/compiler_attributes.h>
+#include <linux/dmi.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/power_supply.h>
+#include <linux/types.h>
+#include <linux/units.h>
+#include <linux/version.h>
+#include <linux/wmi.h>
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
+static bool force;
+module_param_unsafe(force, bool, 0);
+MODULE_PARM_DESC(force, "Enable health mode control without checking for supported devices\n");
+
+struct get_battery_health_control_status_input {
+	u8 battery_no;
+	u8 function_query;
+	u8 reserved[2];
+} __packed;
+
+struct get_battery_health_control_status_output {
+	u8 function_list;
+	u8 ret[2];
+	u8 function_status[5];
+} __packed;
+
+struct set_battery_health_control_input {
+	u8 battery_no;
+	u8 function_mask;
+	u8 function_status;
+	u8 reserved_in[5];
+} __packed;
+
+struct set_battery_health_control_output {
+	__le16 ret;
+	__le16 reserved_out;
+} __packed;
+
+enum battery_mode {
+	HEALTH_MODE = 1,
+	CALIBRATION_MODE = 2,
+};
+
+struct acer_wmi_battery_data {
+	struct acpi_battery_hook hook;
+	struct wmi_device *wdev;
+	const struct power_supply_ext *battery_ext;
+};
+
+static bool health_mode __ro_after_init;
+
+static int acer_wmi_battery_get_information(struct acer_wmi_battery_data *data,
+					    u32 index, u32 battery, u32 *result)
+{
+	u32 args[2] = { index, battery };
+	struct wmi_buffer input = { .length = sizeof(args), .data = args };
+	struct wmi_buffer output;
+	int ret;
+
+	ret = wmidev_invoke_method(data->wdev, 0, 19, &input, &output, sizeof(*result));
+	if (ret)
+		return ret;
+
+	*result = le32_to_cpup((__le32 *)output.data);
+
+	kfree(output.data);
+
+	return 0;
+}
+
+static int acer_wmi_battery_get_health_control_status(struct acer_wmi_battery_data *data,
+						      bool *health_mode)
+{
+	/*
+	 * Acer Care Center seems to always call the WMI method
+	 * with fixed parameters. This yields information about
+	 * the availability and state of both health and
+	 * calibration mode. The modes probably apply to
+	 * all batteries of the system.
+	 */
+	struct get_battery_health_control_status_input args = {
+		.battery_no = ACER_BATTERY_INDEX,
+		.function_query = 0x1,
+		.reserved = { 0x0, 0x0 },
+	};
+	struct wmi_buffer input = { .length = sizeof(args), .data = &args };
+	struct wmi_buffer output;
+	int ret;
+
+	ret = wmidev_invoke_method(data->wdev, 0, 20, &input, &output,
+				   sizeof(struct get_battery_health_control_status_output));
+	if (ret)
+		return ret;
+
+	struct get_battery_health_control_status_output *status_output __free(kfree) = output.data;
+
+	if (!(status_output->function_list & HEALTH_MODE))
+		return -EINVAL;
+
+	*health_mode = status_output->function_status[0] > 0;
+
+	return 0;
+}
+
+static int acer_wmi_battery_set_health_control(struct acer_wmi_battery_data *data,
+					       u8 function, bool function_status)
+{
+	struct set_battery_health_control_input args = {
+		.battery_no = ACER_BATTERY_INDEX,
+		.function_mask = function,
+		.function_status = function_status ? 1 : 0,
+		.reserved_in = { 0x0, 0x0, 0x0, 0x0, 0x0 },
+	};
+	struct wmi_buffer input = { .length = sizeof(args), .data = &args };
+	struct wmi_buffer output;
+	int ret;
+
+	ret = wmidev_invoke_method(data->wdev, 0, 21, &input, &output,
+				   sizeof(struct set_battery_health_control_output));
+	if (ret)
+		return ret;
+
+	struct set_battery_health_control_output *status_output __free(kfree) = output.data;
+	if (le16_to_cpu(status_output->ret) != 0)
+		return -EIO;
+
+	return 0;
+}
+
+static int acer_battery_ext_property_get(struct power_supply *psy,
+					 const struct power_supply_ext *ext,
+					 void *ext_data,
+					 enum power_supply_property psp,
+					 union power_supply_propval *val)
+{
+	struct acer_wmi_battery_data *data = ext_data;
+	bool health_mode;
+	u32 value;
+	int ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+		ret = acer_wmi_battery_get_health_control_status(data, &health_mode);
+		if (ret)
+			return ret;
+
+		val->intval = health_mode ? POWER_SUPPLY_CHARGE_TYPE_LONGLIFE
+					  : POWER_SUPPLY_CHARGE_TYPE_STANDARD;
+		break;
+	case POWER_SUPPLY_PROP_TEMP:
+		ret = acer_wmi_battery_get_information(data, 0x8, ACER_BATTERY_INDEX, &value);
+		if (ret)
+			return ret;
+
+		if (value > U16_MAX)
+			return -ERANGE;
+
+		val->intval = value + ABSOLUTE_ZERO_MILLICELSIUS / MILLIDEGREE_PER_DECIDEGREE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int acer_battery_ext_property_set(struct power_supply *psy,
+					 const struct power_supply_ext *ext,
+					 void *ext_data,
+					 enum power_supply_property psp,
+					 const union power_supply_propval *val)
+{
+	struct acer_wmi_battery_data *data = ext_data;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+		return acer_wmi_battery_set_health_control(data, HEALTH_MODE,
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
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const enum power_supply_property acer_battery_properties_v1[] = {
+	POWER_SUPPLY_PROP_TEMP,
+};
+
+static const enum power_supply_property acer_battery_properties_v2[] = {
+	POWER_SUPPLY_PROP_TEMP,
+	POWER_SUPPLY_PROP_CHARGE_TYPES,
+};
+
+static const struct power_supply_ext acer_wmi_battery_extension_v1 = {
+	.name			= DRIVER_NAME,
+	.properties		= acer_battery_properties_v1,
+	.num_properties		= ARRAY_SIZE(acer_battery_properties_v1),
+	.get_property		= acer_battery_ext_property_get,
+};
+
+static const struct power_supply_ext acer_wmi_battery_extension_v2 = {
+	.name			= DRIVER_NAME,
+	.properties		= acer_battery_properties_v2,
+	.num_properties		= ARRAY_SIZE(acer_battery_properties_v2),
+	.charge_types           = BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
+				  BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE),
+	.get_property		= acer_battery_ext_property_get,
+	.set_property		= acer_battery_ext_property_set,
+	.property_is_writeable	= acer_battery_ext_property_is_writeable,
+};
+
+static int acer_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	struct acer_wmi_battery_data *data = container_of(hook, struct acer_wmi_battery_data, hook);
+
+	return power_supply_register_extension(battery, data->battery_ext,
+					       &data->wdev->dev, data);
+}
+
+static int acer_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	struct acer_wmi_battery_data *data = container_of(hook, struct acer_wmi_battery_data, hook);
+
+	power_supply_unregister_extension(battery, data->battery_ext);
+
+	return 0;
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
+	data->battery_ext = health_mode ? &acer_wmi_battery_extension_v2
+					: &acer_wmi_battery_extension_v1;
+	data->hook.name = "Acer Battery Extension";
+	data->hook.add_battery = acer_battery_add;
+	data->hook.remove_battery = acer_battery_remove;
+
+	return devm_battery_hook_register(&data->wdev->dev, &data->hook);
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
+	.no_singleton = true,
+};
+
+static const struct dmi_system_id acer_wmi_battery_health_mode_table[] __initconst = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-510P"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-24PT"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-44P"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-59"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-59"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A715-42G"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-51"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-57"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-58"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN517-54"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN517-54"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Predator PHN16-71"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SF314-34"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SF314-43"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFE16-44"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFG16-72"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFX14-71G"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFX16-61G"),
+		},
+	},
+	{}
+};
+
+static int __init acer_wmi_battery_module_init(void)
+{
+	int ret;
+
+	if (dmi_check_system(acer_wmi_battery_health_mode_table) || force)
+		health_mode = true;
+	else
+		health_mode = false;
+
+	ret = wmi_driver_register(&acer_wmi_battery_driver);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+static void __exit acer_wmi_battery_module_exit(void)
+{
+	wmi_driver_unregister(&acer_wmi_battery_driver);
+}
+
+module_init(acer_wmi_battery_module_init);
+module_exit(acer_wmi_battery_module_exit);
+
+MODULE_AUTHOR("Frederik Harwath <frederik@harwath.name>");
+MODULE_AUTHOR("Jelle van der Waa <jelle@vdwaa.nl>");
+MODULE_DESCRIPTION("Acer battery health control WMI driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0

