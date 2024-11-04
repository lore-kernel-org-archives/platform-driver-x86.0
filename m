Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A731D3584
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 20:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730750947; cv=none; b=VALeQyCeeUoY2Dcb5kNU8DJGh98vKb2uMQjl81sImnH7QMhCv6lUbEvJR2liB6UQqxVwU6LUQXkYs3XIgUHIJ8NG6DaFLnBLrMEScY9IObX5nDjMG01IrvVsGsag/uBCyCFP6mzi/kaV0PUDDGbrTmfQDsLP7V5rNyiwzNIKJOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730750947; c=relaxed/simple;
	bh=rjsom35kmNTa3VL35eTTpr6vzxaJ4gGSAcuRIyOvlIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cHAjAwA4Z+BbLHlXjiG/t+gqBMA57MXYmH56b0BirrCoRQPV9e+/A7lGPbrxqRXviuasaTh5BtUqkJL65KimqS9es/coM1cXNdBffxDUNWmAEfRSWjJOJI8+WbaJuzbSmIGtgUJKEtaKq6L4MKiipl6BElA4EO05SOy75rEMp9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hRsxSUZj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hRsxSUZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730750944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SgTSyDA6GA/65i9ggZr3ncjbapeLM4CHQql9tTmOryk=;
	b=hRsxSUZjGeu2J41Zf3/1rOlNvNfDQmSi885vxtPwUDpdaYouqR6Fj5AL7fkV+PTgJIPQik
	UuuxRvR8PZTSl0tDJdLgZZON1qL0mlK+tqffYiJEb2TPkUdjvj6TXINmYv3Ai7tHCB37RM
	zKEHmzCEywwHM/OssjEunWzzV11hISk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-492-nCVsV7cTPmu78XA3rnjiGg-1; Mon,
 04 Nov 2024 15:09:00 -0500
X-MC-Unique: nCVsV7cTPmu78XA3rnjiGg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB83D1955EA9;
	Mon,  4 Nov 2024 20:08:56 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.64])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 523CD1956086;
	Mon,  4 Nov 2024 20:08:55 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 3/3] platform/x86: x86-android-tablets: Add support for Vexia EDU ATLA 10 tablet
Date: Mon,  4 Nov 2024 21:08:48 +0100
Message-ID: <20241104200848.58693-4-hdegoede@redhat.com>
In-Reply-To: <20241104200848.58693-1-hdegoede@redhat.com>
References: <20241104200848.58693-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Add support for the Vexia EDU ATLA 10 tablet, Android 4.2/4.4 + Guadalinex
Ubuntu tablet distributed to schools in the Spanish Andalucía region.

Besides the usual broken DSDT issues this tablet is special because all
its LPSS island peripherals are enumerated as PCI devices rather then as
ACPI devices as they typically are.

At the same time there are disabled (_STA=0) ACPI devices for
the peripherals and child ACPI devices for e.g. attached I2C/SDIO devices
are children of these disabled ACPI devices and thus will not be used
by Linux since the parent is disabled.

So besides the usual manual i2c-client instantiation for accel/touchscreen
this tablet also requires manual i2c-client instantiation for the codec
and for the PMIC.

Also it seems the mainboard was designed for Windows not Android, so
it has an I2C attached embedded controller instead of allowing direct
access to the charger + fuel-gauge chips as is usual with Android boards.

Normally when there is an embedded controller, there also is ACPI battery
support, but since this shipped with Android that is missing and Linux
needs to have a power_supply class driver talking directly to the EC.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use pci_get_domain_bus_and_slot()
- Move "depends on PCI" to patch adding get_i2c_adap_by_pci_parent() helper
---
 .../platform/x86/x86-android-tablets/dmi.c    |  10 ++
 .../platform/x86/x86-android-tablets/other.c  | 163 ++++++++++++++++++
 .../x86-android-tablets/x86-android-tablets.h |   1 +
 3 files changed, 174 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
index 17f6da96aa01..3e5fa3b6e2fd 100644
--- a/drivers/platform/x86/x86-android-tablets/dmi.c
+++ b/drivers/platform/x86/x86-android-tablets/dmi.c
@@ -179,6 +179,16 @@ const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		},
 		.driver_data = (void *)&peaq_c1010_info,
 	},
+	{
+		/* Vexia Edu Atla 10 tablet 9V version */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
+			/* Above strings are too generic, also match on BIOS date */
+			DMI_MATCH(DMI_BIOS_DATE, "08/25/2014"),
+		},
+		.driver_data = (void *)&vexia_edu_atla10_info,
+	},
 	{
 		/* Whitelabel (sold as various brands) TM800A550L */
 		.matches = {
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 7db8aa58b907..3ed808ac5b6b 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -12,6 +12,7 @@
 #include <linux/gpio/machine.h>
 #include <linux/input.h>
 #include <linux/leds.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pwm.h>
 
@@ -597,6 +598,168 @@ const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
 	.gpiod_lookup_tables = whitelabel_tm800a550l_gpios,
 };
 
+/*
+ * Vexia EDU ATLA 10 tablet, Android 4.2 / 4.4 + Guadalinex Ubuntu tablet
+ * distributed to schools in the Spanish Andalucía region.
+ */
+const char * const crystal_cove_pwrsrc_psy[] = { "crystal_cove_pwrsrc" };
+
+static const struct property_entry vexia_edu_atla10_ulpmc_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", crystal_cove_pwrsrc_psy),
+	{ }
+};
+
+const struct software_node vexia_edu_atla10_ulpmc_node = {
+	.properties = vexia_edu_atla10_ulpmc_props,
+};
+
+static const char * const vexia_edu_atla10_accel_mount_matrix[] = {
+	"0", "-1", "0",
+	"1", "0", "0",
+	"0", "0", "1"
+};
+
+static const struct property_entry vexia_edu_atla10_accel_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", vexia_edu_atla10_accel_mount_matrix),
+	{ }
+};
+
+static const struct software_node vexia_edu_atla10_accel_node = {
+	.properties = vexia_edu_atla10_accel_props,
+};
+
+static const struct property_entry vexia_edu_atla10_touchscreen_props[] = {
+	PROPERTY_ENTRY_U32("hid-descr-addr", 0x0000),
+	PROPERTY_ENTRY_U32("post-reset-deassert-delay-ms", 120),
+	{ }
+};
+
+static const struct software_node vexia_edu_atla10_touchscreen_node = {
+	.properties = vexia_edu_atla10_touchscreen_props,
+};
+
+static const struct property_entry vexia_edu_atla10_pmic_props[] = {
+	PROPERTY_ENTRY_BOOL("linux,register-pwrsrc-power_supply"),
+	{ }
+};
+
+static const struct software_node vexia_edu_atla10_pmic_node = {
+	.properties = vexia_edu_atla10_pmic_props,
+};
+
+static const struct x86_i2c_client_info vexia_edu_atla10_i2c_clients[] __initconst = {
+	{	/* I2C attached embedded controller, used to access fuel-gauge */
+		.board_info = {
+			.type = "vexia_atla10_ec",
+			.addr = 0x76,
+			.dev_name = "ulpmc",
+			.swnode = &vexia_edu_atla10_ulpmc_node,
+		},
+		.adapter_path = "0000:00:18.1",
+	},
+	{	/* RT5642 audio codec */
+		.board_info = {
+			.type = "rt5640",
+			.addr = 0x1c,
+			.dev_name = "rt5640",
+		},
+		.adapter_path = "0000:00:18.2",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FC:02",
+			.index = 4,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_HIGH,
+			.con_id = "rt5640_irq",
+		},
+	},
+	{
+		/* kxtj21009 accelerometer */
+		.board_info = {
+			.type = "kxtj21009",
+			.addr = 0x0f,
+			.dev_name = "kxtj21009",
+			.swnode = &vexia_edu_atla10_accel_node,
+		},
+		.adapter_path = "0000:00:18.5",
+	}, {
+		/* FT5416DQ9 touchscreen controller */
+		.board_info = {
+			.type = "hid-over-i2c",
+			.addr = 0x38,
+			.dev_name = "FTSC1000",
+			.swnode = &vexia_edu_atla10_touchscreen_node,
+		},
+		.adapter_path = "0000:00:18.6",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_APIC,
+			.index = 0x45,
+			.trigger = ACPI_LEVEL_SENSITIVE,
+			.polarity = ACPI_ACTIVE_HIGH,
+		},
+	}, {
+		/* Crystal Cove PMIC */
+		.board_info = {
+			.type = "intel_soc_pmic_crc",
+			.addr = 0x6e,
+			.dev_name = "intel_soc_pmic_crc",
+			.swnode = &vexia_edu_atla10_pmic_node,
+		},
+		.adapter_path = "0000:00:18.7",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_APIC,
+			.index = 0x43,
+			.trigger = ACPI_LEVEL_SENSITIVE,
+			.polarity = ACPI_ACTIVE_HIGH,
+		},
+	}
+};
+
+static struct gpiod_lookup_table vexia_edu_atla10_ft5416_gpios = {
+	.dev_id = "i2c-FTSC1000",
+	.table = {
+		GPIO_LOOKUP("INT33FC:00", 60, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table * const vexia_edu_atla10_gpios[] = {
+	&vexia_edu_atla10_ft5416_gpios,
+	NULL
+};
+
+static int __init vexia_edu_atla10_init(struct device *dev)
+{
+	struct pci_dev *pdev;
+	int ret;
+
+	/* Enable the Wifi module by setting the wifi_enable pin to 1 */
+	ret = x86_android_tablet_get_gpiod("INT33FC:02", 20, "wifi_enable",
+					   false, GPIOD_OUT_HIGH, NULL);
+	if (ret)
+		return ret;
+
+	/* Reprobe the SDIO controller to enumerate the now enabled Wifi module */
+	pdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0x11, 0));
+	if (!pdev)
+		return -EPROBE_DEFER;
+
+	ret = device_reprobe(&pdev->dev);
+	if (ret)
+		pci_warn(pdev, "Reprobing error: %d\n", ret);
+
+	pci_dev_put(pdev);
+	return 0;
+}
+
+const struct x86_dev_info vexia_edu_atla10_info __initconst = {
+	.i2c_client_info = vexia_edu_atla10_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(vexia_edu_atla10_i2c_clients),
+	.gpiod_lookup_tables = vexia_edu_atla10_gpios,
+	.init = vexia_edu_atla10_init,
+	.use_pci_devname = true,
+};
+
 /*
  * The firmware node for ktd2026 on Xaomi pad2. It composed of a RGB LED node
  * with three subnodes for each color (B/G/R). The RGB LED node is named
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index d26a4792eb0e..0fc7e8cff672 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -120,6 +120,7 @@ extern const struct x86_dev_info nextbook_ares8_info;
 extern const struct x86_dev_info nextbook_ares8a_info;
 extern const struct x86_dev_info peaq_c1010_info;
 extern const struct x86_dev_info whitelabel_tm800a550l_info;
+extern const struct x86_dev_info vexia_edu_atla10_info;
 extern const struct x86_dev_info xiaomi_mipad2_info;
 extern const struct dmi_system_id x86_android_tablet_ids[];
 
-- 
2.47.0

