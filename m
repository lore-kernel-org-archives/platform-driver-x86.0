Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281AB174EE4
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 Nov 2024 12:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731759432; cv=none; b=s/HDt5i3P5McwKIHm2f1D9mty26ZY3T+vJly7wkFND2a/WzF9tp+Xa1SIOrzDlnwNdz8QqskDk6dkLe9TEoBdNHEy9CdJMGRvTFAC8EXflWWc27+nUL5Wu110T8YbqKkD//8wQQDGcQLS6SNxTdKCcBdqb4s6WUGuaSRG2tIDOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731759432; c=relaxed/simple;
	bh=9EdXZGMeyP757Gm8xDqI3snUt0WcSuOVXmyV+hRNjEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G8hiGztLyE/7zh2VL9s6blSSK4UrewbiGlWFFdMim3/1B0a28BMZC/qkP0vit/9n+sVu1JQB6b2qNsjSZdwLGtDLxTs5LzP25B6y46QHeIjBZCY4Qn0KQXS9DuSL/dvp2IUnkr4PC9vv03Yb6VJAbwjq4erCps5i+GLxZ0mhfVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gC6RkIJE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gC6RkIJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731759429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E4x4uH1HUay/7lyuWfJ9mzNQKMtHwTBTvAHsAGm+8ds=;
	b=gC6RkIJE77btJbDJUYkQ4+ECdO5Ng44GzcRfslwtJKPrhkkcM6K0zeV/jBRXmOrz3nAe8c
	QEcKuSQpcqdCyn5FezGpBm45AFV03ZCn+C1dkzDytvVuwCUO4U95yxPudJcTNQHHoU890p
	L89euJYtZrFVy2quaFiFX1aQs+HqH0E=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-15-atzmSeecNmqdBNCEdPdHqw-1; Sat,
 16 Nov 2024 07:17:05 -0500
X-MC-Unique: atzmSeecNmqdBNCEdPdHqw-1
X-Mimecast-MFC-AGG-ID: atzmSeecNmqdBNCEdPdHqw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1EC2619560B8;
	Sat, 16 Nov 2024 12:17:04 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.52])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9D0C11956054;
	Sat, 16 Nov 2024 12:17:02 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/2] platform/x86: x86-android-tablets: Add Vexia EDU ATLA 10 EC battery driver
Date: Sat, 16 Nov 2024 13:16:59 +0100
Message-ID: <20241116121659.57487-2-hdegoede@redhat.com>
In-Reply-To: <20241116121659.57487-1-hdegoede@redhat.com>
References: <20241116121659.57487-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The Vexia EDU ATLA 10 tablet has an embedded controller instead of
giving the os direct access to the charger + fuel-gauge ICs as is normal
on tablets designed for Android.

There is ACPI Battery device in the DSDT using the EC which should work
except that it expects the I2C controller to be enumerated as an ACPI
device and the tablet's BIOS enumerates all LPSS devices as PCI devices
(and changing the LPSS BIOS settings from PCI -> ACPI does not work).

Add a power_supply class driver for the Atla 10 EC to expert battery info
to userspace. This is made part of the x86-android-tablets directory and
Kconfig option because the i2c_client it binds to is instantiated by
the x86-android-tablets kmod.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Makefile tweaks
- postfix variable/define names with units (e.g. _mV / _mAh)
- Replace i2c_smbus_read_i2c_block_data() with i2c_smbus_read_block_data()
  which takes care of the length byte prefixing the buffer for us
- Adress other small review remarks
---
 .../platform/x86/x86-android-tablets/Makefile |   2 +-
 .../x86/x86-android-tablets/vexia_atla10_ec.c | 259 ++++++++++++++++++
 2 files changed, 260 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c

diff --git a/drivers/platform/x86/x86-android-tablets/Makefile b/drivers/platform/x86/x86-android-tablets/Makefile
index 41ece5a37137..313be30548bc 100644
--- a/drivers/platform/x86/x86-android-tablets/Makefile
+++ b/drivers/platform/x86/x86-android-tablets/Makefile
@@ -3,7 +3,7 @@
 # X86 Android tablet support Makefile
 #
 
+obj-$(CONFIG_X86_ANDROID_TABLETS) += vexia_atla10_ec.o
 obj-$(CONFIG_X86_ANDROID_TABLETS) += x86-android-tablets.o
-
 x86-android-tablets-y := core.o dmi.o shared-psy-info.o \
 			 asus.o lenovo.o other.o
diff --git a/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c b/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
new file mode 100644
index 000000000000..07df69f6db00
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * power_supply class (battery) driver for the I2C attached embedded controller
+ * found on Vexia EDU ATLA 10 (9V version) tablets.
+ *
+ * This is based on the ACPI Battery device in the DSDT which should work
+ * expect that it expects the I2C controller to be enumerated as an ACPI
+ * device and the tablet's BIOS enumerates all LPSS devices as PCI devices
+ * (and changing the LPSS BIOS settings from PCI -> ACPI does not work).
+ *
+ * Copyright (c) 2024 Hans de Goede <hansg@kernel.org>
+ */
+
+#include <linux/bits.h>
+#include <linux/devm-helpers.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/power_supply.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include <asm/byteorder.h>
+
+/* State field uses ACPI Battery spec status bits */
+#define ACPI_BATTERY_STATE_DISCHARGING		BIT(0)
+#define ACPI_BATTERY_STATE_CHARGING		BIT(1)
+
+#define ATLA10_EC_BATTERY_STATE_COMMAND		0x87
+#define ATLA10_EC_BATTERY_INFO_COMMAND		0x88
+
+/* From broken ACPI battery device in DSDT */
+#define ATLA10_EC_VOLTAGE_MIN_DESIGN_uV		3750000
+
+struct atla10_ec_battery_state {
+	u8 status;			/* Using ACPI Battery spec status bits */
+	u8 capacity;			/* Percent */
+	__le16 charge_now_mAh;
+	__le16 voltage_now_mV;
+	__le16 current_now_mA;
+	__le16 charge_full_mAh;
+	__le16 temp;			/* centi degrees Celsius */
+} __packed;
+
+struct atla10_ec_battery_info {
+	__le16 charge_full_design_mAh;
+	__le16 voltage_now_mV;		/* Should be design voltage, but is not ? */
+	__le16 charge_full_design2_mAh;
+} __packed;
+
+struct atla10_ec_data {
+	struct i2c_client *client;
+	struct power_supply *psy;
+	struct delayed_work work;
+	struct mutex update_lock;
+	struct atla10_ec_battery_info info;
+	struct atla10_ec_battery_state state;
+	bool valid;			/* true if state is valid */
+	unsigned long last_update;	/* In jiffies */
+};
+
+static int atla10_ec_cmd(struct atla10_ec_data *data, u8 cmd, u8 len, u8 *values)
+{
+	struct device *dev = &data->client->dev;
+	u8 buf[32]; /* i2c_smbus_read_block_data() transfers max 32 bytes */
+	int ret;
+
+	ret = i2c_smbus_read_block_data(data->client, cmd, buf);
+	if (ret != len) {
+		dev_err(dev, "I2C command 0x%02x error: %d\n", cmd, ret);
+		return -EIO;
+	}
+
+	memcpy(values, buf, len);
+	return 0;
+}
+
+static int atla10_ec_update(struct atla10_ec_data *data)
+{
+	int ret;
+
+	/* Cache data for 5 seconds */
+	if (data->valid && time_before(jiffies, data->last_update + 5 * HZ))
+		return 0;
+
+	ret = atla10_ec_cmd(data, ATLA10_EC_BATTERY_STATE_COMMAND,
+			    sizeof(data->state), (u8 *)&data->state);
+	if (ret)
+		return ret;
+
+	data->last_update = jiffies;
+	data->valid = true;
+	return 0;
+}
+
+static int atla10_ec_psy_get_property(struct power_supply *psy,
+				      enum power_supply_property psp,
+				      union power_supply_propval *val)
+{
+	struct atla10_ec_data *data = power_supply_get_drvdata(psy);
+	int charge_now_mAh, charge_full_mAh, ret;
+
+	guard(mutex)(&data->update_lock);
+
+	ret = atla10_ec_update(data);
+	if (ret)
+		return ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
+		if (data->state.status & ACPI_BATTERY_STATE_DISCHARGING)
+			val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
+		else if (data->state.status & ACPI_BATTERY_STATE_CHARGING)
+			val->intval = POWER_SUPPLY_STATUS_CHARGING;
+		else if (data->state.capacity == 100)
+			val->intval = POWER_SUPPLY_STATUS_FULL;
+		else
+			val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
+		break;
+	case POWER_SUPPLY_PROP_CAPACITY:
+		val->intval = data->state.capacity;
+		break;
+	case POWER_SUPPLY_PROP_CHARGE_NOW:
+		/*
+		 * The EC has a bug where it reports charge-full-design as
+		 * charge-now when the battery is full. Clamp charge-now to
+		 * charge-full to workaround this.
+		 */
+		charge_now_mAh = le16_to_cpu(data->state.charge_now_mAh);
+		charge_full_mAh = le16_to_cpu(data->state.charge_full_mAh);
+		val->intval = min(charge_now_mAh, charge_full_mAh) * 1000;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		val->intval = le16_to_cpu(data->state.voltage_now_mV) * 1000;
+		break;
+	case POWER_SUPPLY_PROP_CURRENT_NOW:
+		val->intval = le16_to_cpu(data->state.current_now_mA) * 1000;
+		/*
+		 * Documentation/ABI/testing/sysfs-class-power specifies
+		 * negative current for discharging.
+		 */
+		if (data->state.status & ACPI_BATTERY_STATE_DISCHARGING)
+			val->intval = -val->intval;
+		break;
+	case POWER_SUPPLY_PROP_CHARGE_FULL:
+		val->intval = le16_to_cpu(data->state.charge_full_mAh) * 1000;
+		break;
+	case POWER_SUPPLY_PROP_TEMP:
+		val->intval = le16_to_cpu(data->state.temp) / 10;
+		break;
+	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
+		val->intval = le16_to_cpu(data->info.charge_full_design_mAh) * 1000;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN:
+		val->intval = ATLA10_EC_VOLTAGE_MIN_DESIGN_uV;
+		break;
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = 1;
+		break;
+	case POWER_SUPPLY_PROP_TECHNOLOGY:
+		val->intval = POWER_SUPPLY_TECHNOLOGY_LIPO;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void atla10_ec_external_power_changed_work(struct work_struct *work)
+{
+	struct atla10_ec_data *data = container_of(work, struct atla10_ec_data, work.work);
+
+	dev_dbg(&data->client->dev, "External power changed\n");
+	data->valid = false;
+	power_supply_changed(data->psy);
+}
+
+static void atla10_ec_external_power_changed(struct power_supply *psy)
+{
+	struct atla10_ec_data *data = power_supply_get_drvdata(psy);
+
+	/* After charger plug in/out wait 0.5s for things to stabilize */
+	mod_delayed_work(system_wq, &data->work, HZ / 2);
+}
+
+static const enum power_supply_property atla10_ec_psy_props[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_CHARGE_NOW,
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+	POWER_SUPPLY_PROP_CURRENT_NOW,
+	POWER_SUPPLY_PROP_CHARGE_FULL,
+	POWER_SUPPLY_PROP_TEMP,
+	POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
+	POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_TECHNOLOGY,
+};
+
+static const struct power_supply_desc atla10_ec_psy_desc = {
+	.name = "atla10_ec_battery",
+	.type = POWER_SUPPLY_TYPE_BATTERY,
+	.properties = atla10_ec_psy_props,
+	.num_properties = ARRAY_SIZE(atla10_ec_psy_props),
+	.get_property = atla10_ec_psy_get_property,
+	.external_power_changed = atla10_ec_external_power_changed,
+};
+
+static int atla10_ec_probe(struct i2c_client *client)
+{
+	struct power_supply_config psy_cfg = { };
+	struct device *dev = &client->dev;
+	struct atla10_ec_data *data;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	psy_cfg.drv_data = data;
+	data->client = client;
+
+	ret = devm_mutex_init(dev, &data->update_lock);
+	if (ret)
+		return ret;
+
+	ret = devm_delayed_work_autocancel(dev, &data->work,
+					   atla10_ec_external_power_changed_work);
+	if (ret)
+		return ret;
+
+	ret = atla10_ec_cmd(data, ATLA10_EC_BATTERY_INFO_COMMAND,
+			    sizeof(data->info), (u8 *)&data->info);
+	if (ret)
+		return ret;
+
+	data->psy = devm_power_supply_register(dev, &atla10_ec_psy_desc, &psy_cfg);
+	return PTR_ERR_OR_ZERO(data->psy);
+}
+
+static const struct i2c_device_id atla10_ec_id_table[] = {
+	{ "vexia_atla10_ec" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, atla10_ec_id_table);
+
+static struct i2c_driver atla10_ec_driver = {
+	.driver = {
+		.name = "vexia_atla10_ec",
+	},
+	.probe = atla10_ec_probe,
+	.id_table = atla10_ec_id_table,
+};
+module_i2c_driver(atla10_ec_driver);
+
+MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
+MODULE_DESCRIPTION("Battery driver for Vexia EDU ATLA 10 tablet EC");
+MODULE_LICENSE("GPL");
-- 
2.47.0

