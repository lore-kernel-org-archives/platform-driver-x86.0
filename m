Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20173C05027
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Feb 2023 13:26:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbjBNN0V (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Feb 2023 08:26:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbjBNN0U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Feb 2023 08:26:20 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2EF11C
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Feb 2023 05:26:18 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id w11so23405858lfu.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Feb 2023 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMGb6vesFKRLCKpu3OBLjrCtOVBxMVU+d1MLUBdVPf4=;
        b=VcXWSzbjvC8oW2oHr29aF9BYoSYElqWY5a6oRd2ANdLuDevj7Bo07FLt74ab+GQvtO
         3/SyVLbtlyJLhxgtivDUwEnTly7+defnM4WJgmExkdiBtc/pnu2Gd/UAl1Uakm46GJGB
         Y8DdTLTkOX44M0esGM1RrzOpCdIzzuFDQC8ZLZQSG1XINvneih/9oABJljt/GSP/c1b/
         T7ha7p/E9kPahvt6toGmn64bXYk1710Rx+yQECX9Y8F6XjLIDzSpAShMs0nJso7S53fw
         4Wd6BXRPhiDWSqfwGIBLG7mVmsPQGnFSj6+qAfe67u98DU9vrmOlQsI3GbXjLPYancW1
         G5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMGb6vesFKRLCKpu3OBLjrCtOVBxMVU+d1MLUBdVPf4=;
        b=mKMZN/ebNG/gpieds/b6st6p1oyxtxNw4uF0q8rKFeLrPduFNK77usBLDl6Hn1HrOz
         hGtoNoRQ6TWXBSeK1goN/t28dnwvlIBn722MtHiCxpwibSSQoIU8isshBJONnFvWmJus
         IzvadfczXwSdhUVICYdXT1KsQMkZb8FXl6G7kDrKWMDG2i5Oc4JznozzZufY9lP6mFSx
         OIGhQNitOmYsR2EUXaz8S6CudGsXPj61KAensMD9uUz5LuAomONbPzsSz1RjqqVM+lyN
         qnzgLejNL4LfUgVrbUoOqSLmPbDYjjpulMq5WNJCHtQ9gNCIZkdqx70CgOZhw0laaYhP
         eoCw==
X-Gm-Message-State: AO0yUKXnM/oWiSgKGafIyAOXpw62oQJ/yo+IljgecYXwEnIiqdlhuC/k
        88VmOr+f63quhZTzyB59dlk=
X-Google-Smtp-Source: AK7set97PKs0aEjxPmiiX1Vj0O/sHnLZT2BWYa6Hcot8yqmjDyD6gbsquj/GTgaB5WoLA81+0AVdUA==
X-Received: by 2002:ac2:5fc3:0:b0:4d7:59e6:388e with SMTP id q3-20020ac25fc3000000b004d759e6388emr672129lfg.46.1676381176510;
        Tue, 14 Feb 2023 05:26:16 -0800 (PST)
Received: from localhost.localdomain ([178.176.72.175])
        by smtp.gmail.com with ESMTPSA id e12-20020ac2546c000000b004b4bae1a05asm1079349lfn.293.2023.02.14.05.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 05:26:16 -0800 (PST)
From:   Nikita Kravets <teackot@gmail.com>
To:     hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org,
        Nikita Kravets <teackot@gmail.com>
Subject: [PATCH] platform/x86: Add new msi-ec driver
Date:   Tue, 14 Feb 2023 16:25:22 +0300
Message-Id: <20230214132522.32631-1-teackot@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a new driver to allow various MSI laptops' functionalities to be
controlled from userspace. This includes such features as power
profiles (aka shift modes), fan speed, charge thresholds, LEDs, etc.

This driver contains EC memory configurations for different firmware
versions and exports battery charge thresholds to userspace (note,
that start and end thresholds control the same EC parameter
and are always 10% apart).

Link: https://github.com/BeardOverflow/msi-ec/
Discussion: https://github.com/BeardOverflow/msi-ec/pull/13
Signed-off-by: Nikita Kravets <teackot@gmail.com>
---
 drivers/platform/x86/Kconfig  |   7 +
 drivers/platform/x86/Makefile |   1 +
 drivers/platform/x86/msi-ec.c | 528 ++++++++++++++++++++++++++++++++++
 drivers/platform/x86/msi-ec.h | 119 ++++++++
 4 files changed, 655 insertions(+)
 create mode 100644 drivers/platform/x86/msi-ec.c
 create mode 100644 drivers/platform/x86/msi-ec.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 5692385e2d26..4534d11f9ca5 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -644,6 +644,13 @@ config THINKPAD_LMI
 
 source "drivers/platform/x86/intel/Kconfig"
 
+config MSI_EC
+	tristate "MSI EC Extras"
+	depends on ACPI
+	help
+	  This driver allows various MSI laptops' functionalities to be
+	  controlled from userspace, including battery charge threshold.
+
 config MSI_LAPTOP
 	tristate "MSI Laptop Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 1d3d1b02541b..7cc2beca8208 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 obj-y				+= intel/
 
 # MSI
+obj-$(CONFIG_MSI_EC)		+= msi-ec.o
 obj-$(CONFIG_MSI_LAPTOP)	+= msi-laptop.o
 obj-$(CONFIG_MSI_WMI)		+= msi-wmi.o
 
diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
new file mode 100644
index 000000000000..b32106445bf6
--- /dev/null
+++ b/drivers/platform/x86/msi-ec.c
@@ -0,0 +1,528 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * msi-ec: MSI laptops' embedded controller driver.
+ *
+ * This driver allows various MSI laptops' functionalities to be
+ * controlled from userspace.
+ *
+ * It contains EC memory configurations for different firmware versions
+ * and exports battery charge thresholds to userspace.
+ *
+ * Copyright (C) 2023 Jose Angel Pastrana <japp0005@red.ujaen.es>
+ * Copyright (C) 2023 Aakash Singh <mail@singhaakash.dev>
+ * Copyright (C) 2023 Nikita Kravets <teackot@gmail.com>
+ */
+
+#include "msi-ec.h"
+
+#include <acpi/battery.h>
+#include <linux/acpi.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
+
+static const char *const SM_ECO_NAME       = "eco";
+static const char *const SM_COMFORT_NAME   = "comfort";
+static const char *const SM_SPORT_NAME     = "sport";
+static const char *const SM_TURBO_NAME     = "turbo";
+
+static const char *ALLOWED_FW_0[] __initdata = {
+	"14C1EMS1.101",
+	NULL,
+};
+
+static struct msi_ec_conf CONF0 __initdata = {
+	.allowed_fw = ALLOWED_FW_0,
+	.charge_control = {
+		.address      = 0xef,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_super_swap = {
+		.address = 0xbf,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xf2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+		},
+		.modes_count = 3,
+	},
+	.super_battery = {
+		.supported = false,
+	},
+	.fan_mode = {
+		.address = 0xf4,
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0x71,
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = 0x89,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = 0x80,
+		.rt_fan_speed_address = 0x89,
+	},
+	.leds = {
+		.micmute_led_address = 0x2b,
+		.mute_led_address    = 0x2c,
+		.bit                 = 2,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = 0x2c, // ?
+		.bl_modes         = { 0x00, 0x08 }, // ?
+		.max_mode         = 1, // ?
+		.bl_state_address = 0xf3,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char *ALLOWED_FW_1[] __initdata = {
+	"17F2EMS1.106",
+	NULL,
+};
+
+static struct msi_ec_conf CONF1 __initdata = {
+	.allowed_fw = ALLOWED_FW_1,
+	.charge_control = {
+		.address      = 0xef,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_super_swap = {
+		.address = 0xbf,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xf2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+			{ SM_TURBO_NAME,   0xc4 },
+		},
+		.modes_count = 4,
+	},
+	.super_battery = {
+		.supported = false,
+	},
+	.fan_mode = {
+		.address = 0xf4,
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0x71,
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = 0x89,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = 0x80,
+		.rt_fan_speed_address = 0x89,
+	},
+	.leds = {
+		.micmute_led_address = 0x2b,
+		.mute_led_address    = 0x2c,
+		.bit                 = 2,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = 0x2c, // ?
+		.bl_modes         = { 0x00, 0x08 }, // ?
+		.max_mode         = 1, // ?
+		.bl_state_address = 0xf3,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char *ALLOWED_FW_2[] __initdata = {
+	"1552EMS1.118",
+	NULL,
+};
+
+static struct msi_ec_conf CONF2 __initdata = {
+	.allowed_fw = ALLOWED_FW_2,
+	.charge_control = {
+		.address      = 0xd7,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_super_swap = {
+		.address = 0xe8,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xf2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+		},
+		.modes_count = 3,
+	},
+	.super_battery = {
+		.supported = true,
+		.address   = 0xeb,
+		.mask      = 0x0f,
+	},
+	.fan_mode = {
+		.address = 0xd4,
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0x71,
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = 0x89,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = 0x80,
+		.rt_fan_speed_address = 0x89,
+	},
+	.leds = {
+		.micmute_led_address = 0x2c,
+		.mute_led_address    = 0x2d,
+		.bit                 = 1,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = 0x2c, // ?
+		.bl_modes         = { 0x00, 0x08 }, // ?
+		.max_mode         = 1, // ?
+		.bl_state_address = 0xd3,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static const char *ALLOWED_FW_3[] __initdata = {
+	"1592EMS1.111",
+	"E1592IMS.10C",
+	NULL,
+};
+
+static struct msi_ec_conf CONF3 __initdata = {
+	.allowed_fw = ALLOWED_FW_3,
+	.charge_control = {
+		.address      = 0xef,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_super_swap = {
+		.address = 0xe8,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xd2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_SPORT_NAME,   0xc0 },
+		},
+		.modes_count = 3,
+	},
+	.super_battery = {
+		.supported = true,
+		.address   = 0xeb,
+		.mask      = 0x0f,
+	},
+	.fan_mode = {
+		.address = 0xd4,
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0xc9,
+		.rt_fan_speed_base_min = 0x19,
+		.rt_fan_speed_base_max = 0x37,
+		.bs_fan_speed_address  = 0x89, // ?
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = 0x80,
+		.rt_fan_speed_address = 0x89,
+	},
+	.leds = {
+		.micmute_led_address = 0x2b,
+		.mute_led_address    = 0x2c,
+		.bit                 = 1,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = 0x2c, // ?
+		.bl_modes         = { 0x00, 0x08 }, // ?
+		.max_mode         = 1, // ?
+		.bl_state_address = 0xd3,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
+static struct msi_ec_conf *CONFIGURATIONS[] __initdata = {
+	&CONF0,
+	&CONF1,
+	&CONF2,
+	&CONF3,
+	NULL,
+};
+
+static struct msi_ec_conf conf; // current configuration
+
+// ============================================================ //
+// Helper functions
+// ============================================================ //
+
+static int ec_read_seq(u8 addr, u8 *buf, int len)
+{
+	int result;
+	u8 i;
+	for (i = 0; i < len; i++) {
+		result = ec_read(addr + i, buf + i);
+		if (result < 0)
+			return result;
+	}
+	return 0;
+}
+
+static int ec_get_firmware_version(u8 buf[MSI_EC_FW_VERSION_LENGTH + 1])
+{
+	int result;
+
+	memset(buf, 0, MSI_EC_FW_VERSION_LENGTH + 1);
+	result = ec_read_seq(MSI_EC_FW_VERSION_ADDRESS,
+			     buf,
+			     MSI_EC_FW_VERSION_LENGTH);
+	if (result < 0)
+		return result;
+
+	return MSI_EC_FW_VERSION_LENGTH + 1;
+}
+
+// ============================================================ //
+// Sysfs power_supply subsystem
+// ============================================================ //
+
+static ssize_t charge_control_threshold_show(u8 offset, struct device *device,
+					     struct device_attribute *attr,
+					     char *buf)
+{
+	u8 rdata;
+	int result;
+
+	result = ec_read(conf.charge_control.address, &rdata);
+	if (result < 0)
+		return result;
+
+	return sprintf(buf, "%i\n", rdata - offset);
+}
+
+static ssize_t charge_control_threshold_store(u8 offset, struct device *dev,
+					      struct device_attribute *attr,
+					      const char *buf, size_t count)
+{
+	u8 wdata;
+	int result;
+
+	result = kstrtou8(buf, 10, &wdata);
+	if (result < 0)
+		return result;
+
+	wdata += offset;
+	if (wdata < conf.charge_control.range_min ||
+	    wdata > conf.charge_control.range_max)
+		return -EINVAL;
+
+	result = ec_write(conf.charge_control.address, wdata);
+	if (result < 0)
+		return result;
+
+	return count;
+}
+
+static ssize_t
+charge_control_start_threshold_show(struct device *device,
+				    struct device_attribute *attr, char *buf)
+{
+	return charge_control_threshold_show(conf.charge_control.offset_start,
+					     device, attr, buf);
+}
+
+static ssize_t
+charge_control_start_threshold_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	return charge_control_threshold_store(conf.charge_control.offset_start,
+					      dev, attr, buf, count);
+}
+
+static ssize_t charge_control_end_threshold_show(struct device *device,
+						 struct device_attribute *attr,
+						 char *buf)
+{
+	return charge_control_threshold_show(conf.charge_control.offset_end,
+					     device, attr, buf);
+}
+
+static ssize_t charge_control_end_threshold_store(struct device *dev,
+						  struct device_attribute *attr,
+						  const char *buf, size_t count)
+{
+	return charge_control_threshold_store(conf.charge_control.offset_end,
+					      dev, attr, buf, count);
+}
+
+static DEVICE_ATTR_RW(charge_control_start_threshold);
+static DEVICE_ATTR_RW(charge_control_end_threshold);
+
+static struct attribute *msi_battery_attrs[] = {
+	&dev_attr_charge_control_start_threshold.attr,
+	&dev_attr_charge_control_end_threshold.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(msi_battery);
+
+static int msi_battery_add(struct power_supply *battery,
+			   struct acpi_battery_hook *hook)
+{
+	if (device_add_groups(&battery->dev, msi_battery_groups))
+		return -ENODEV;
+	return 0;
+}
+
+static int msi_battery_remove(struct power_supply *battery,
+			      struct acpi_battery_hook *hook)
+{
+	device_remove_groups(&battery->dev, msi_battery_groups);
+	return 0;
+}
+
+static struct acpi_battery_hook battery_hook = {
+	.add_battery = msi_battery_add,
+	.remove_battery = msi_battery_remove,
+	.name = MSI_EC_DRIVER_NAME,
+};
+
+// ============================================================ //
+// Module load/unload
+// ============================================================ //
+
+static int __init load_configuration(void)
+{
+	int result;
+
+	// get firmware version
+	u8 fw_version[MSI_EC_FW_VERSION_LENGTH + 1];
+	result = ec_get_firmware_version(fw_version);
+	if (result < 0) {
+		return result;
+	}
+
+	// load the suitable configuration, if exists
+	for (int i = 0; CONFIGURATIONS[i]; i++) {
+		for (int j = 0; CONFIGURATIONS[i]->allowed_fw[j]; j++) {
+			if (strcmp(CONFIGURATIONS[i]->allowed_fw[j], fw_version) == 0) {
+				memcpy(&conf, CONFIGURATIONS[i], sizeof(struct msi_ec_conf));
+				conf.allowed_fw = NULL;
+				return 0;
+			}
+		}
+	}
+
+	pr_err("Your firmware version is not supported!\n");
+	return -EOPNOTSUPP;
+}
+
+static int __init msi_ec_init(void)
+{
+	int result;
+
+	if (acpi_disabled) {
+		pr_err("Unable to init because ACPI needs to be enabled first!\n");
+		return -ENODEV;
+	}
+
+	result = load_configuration();
+	if (result < 0)
+		return result;
+
+	battery_hook_register(&battery_hook);
+
+	pr_info("msi-ec: module_init\n");
+	return 0;
+}
+
+static void __exit msi_ec_exit(void)
+{
+	battery_hook_unregister(&battery_hook);
+
+	pr_info("msi-ec: module_exit\n");
+}
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jose Angel Pastrana <japp0005@red.ujaen.es>");
+MODULE_AUTHOR("Aakash Singh <mail@singhaakash.dev>");
+MODULE_AUTHOR("Nikita Kravets <teackot@gmail.com>");
+MODULE_DESCRIPTION("MSI Embedded Controller");
+
+module_init(msi_ec_init);
+module_exit(msi_ec_exit);
diff --git a/drivers/platform/x86/msi-ec.h b/drivers/platform/x86/msi-ec.h
new file mode 100644
index 000000000000..4de6bba363ff
--- /dev/null
+++ b/drivers/platform/x86/msi-ec.h
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * msi-ec: MSI laptops' embedded controller driver.
+ *
+ * Copyright (C) 2023 Jose Angel Pastrana <japp0005@red.ujaen.es>
+ * Copyright (C) 2023 Aakash Singh <mail@singhaakash.dev>
+ * Copyright (C) 2023 Nikita Kravets <teackot@gmail.com>
+ */
+
+#ifndef _MSI_EC_H_
+#define _MSI_EC_H_
+
+#include <linux/types.h>
+
+#define MSI_EC_DRIVER_NAME "msi-ec"
+
+// Firmware info addresses are universal
+#define MSI_EC_FW_VERSION_ADDRESS 0xa0
+#define MSI_EC_FW_DATE_ADDRESS    0xac
+#define MSI_EC_FW_TIME_ADDRESS    0xb4
+#define MSI_EC_FW_VERSION_LENGTH  12
+#define MSI_EC_FW_DATE_LENGTH     8
+#define MSI_EC_FW_TIME_LENGTH     8
+
+struct msi_ec_charge_control_conf {
+	int address;
+	int offset_start;
+	int offset_end;
+	int range_min;
+	int range_max;
+};
+
+struct msi_ec_webcam_conf {
+	int address;
+	int block_address;
+	int bit;
+};
+
+struct msi_ec_fn_super_swap_conf {
+	int address;
+	int bit;
+};
+
+struct msi_ec_cooler_boost_conf {
+	int address;
+	int bit;
+};
+
+struct msi_ec_mode {
+	const char *name;
+	int value;
+};
+
+struct msi_ec_shift_mode_conf {
+	int address;
+	struct msi_ec_mode modes[5]; // fixed size for easier hard coding
+	int modes_count;
+};
+
+struct msi_ec_super_battery_conf {
+	bool supported;
+	int address;
+	int mask;
+};
+
+struct msi_ec_fan_mode_conf {
+	int address;
+};
+
+struct msi_ec_cpu_conf {
+	int rt_temp_address;
+	int rt_fan_speed_address; // realtime
+	int rt_fan_speed_base_min;
+	int rt_fan_speed_base_max;
+	int bs_fan_speed_address; // basic
+	int bs_fan_speed_base_min;
+	int bs_fan_speed_base_max;
+};
+
+struct msi_ec_gpu_conf {
+	int rt_temp_address;
+	int rt_fan_speed_address; // realtime
+};
+
+struct msi_ec_led_conf {
+	int micmute_led_address;
+	int mute_led_address;
+	int bit;
+};
+
+#define MSI_EC_KBD_BL_STATE_MASK 0x3
+struct msi_ec_kbd_bl_conf {
+	int bl_mode_address;
+	int bl_modes[2];
+	int max_mode;
+
+	int bl_state_address;
+	int state_base_value;
+	int max_state;
+};
+
+struct msi_ec_conf {
+	const char **allowed_fw;
+
+	struct msi_ec_charge_control_conf charge_control;
+	struct msi_ec_webcam_conf         webcam;
+	struct msi_ec_fn_super_swap_conf  fn_super_swap;
+	struct msi_ec_cooler_boost_conf   cooler_boost;
+	struct msi_ec_shift_mode_conf     shift_mode;
+	struct msi_ec_super_battery_conf  super_battery;
+	struct msi_ec_fan_mode_conf       fan_mode;
+	struct msi_ec_cpu_conf            cpu;
+	struct msi_ec_gpu_conf            gpu;
+	struct msi_ec_led_conf            leds;
+	struct msi_ec_kbd_bl_conf         kbd_bl;
+};
+
+#endif // _MSI_EC_H_
-- 
2.39.1

