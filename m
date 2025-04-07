Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BF922A4DA
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Apr 2025 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017629; cv=none; b=lzOJTs7zSUaXBs9E3xgbG46r/YIre9ljCwjsFe5rXIAQkfWIA7LAHdf28wvfbNARrXD32w4P5HaY/uU33jczibkteJDG1e8sIkJ9eaoWrX+NEhcpyBoA4nTy6eTvFMnmthsD3WOp2KSZVGqc7Y1Se+Witd4mjQK4ynpmRCmTP+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017629; c=relaxed/simple;
	bh=YB6W7mg4Pq6IV+aVWU9iVQNr6cHPpg4WQGf+PdB1u7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k9F6nx6Y5ih+JImr2e0JhbL/ScBGoF1pmENbANZSngcqNhXlsvWK76i39BipMI/m/30i9yVHqQQWeKTXDdjfSlgoL9IjzXVULpPHVaHA/n6kXApHwJ0tH3Sa7HMXcd6NcKAn1+e85Ljg13MXZ8fVMrmM51Dszq/+nOkWfG4/AZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bj1TLEG9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bj1TLEG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744017626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8Qs8KcXAF4f0doxUY4H/fSiKaQVdSlpO2HeH4zSkiEw=;
	b=Bj1TLEG9J2bWMWnQwIl6H6hJ/gIuotszkB3G6gYJj0iFLCF7oIkFpHpHu7oSIR3mFayaD4
	hhw4bB99ErKKC4npaMVRuoX5LKeFARRcTdjuGbE8YMgDJnQcY5ePO7SPU/nDH8BoXv5z4c
	y18P8se/0kcc+btQ064FDYZ6M9XG3tQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-573-K6j__idMM-2W-TI8j4tAdA-1; Mon,
 07 Apr 2025 05:20:23 -0400
X-MC-Unique: K6j__idMM-2W-TI8j4tAdA-1
X-Mimecast-MFC-AGG-ID: K6j__idMM-2W-TI8j4tAdA_1744017622
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 14BDB1800257;
	Mon,  7 Apr 2025 09:20:22 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.225.6])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 082FD1809B67;
	Mon,  7 Apr 2025 09:20:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: x86-android-tablets: Add "9v" to Vexia EDU ATLA 10 tablet symbols
Date: Mon,  7 Apr 2025 11:20:15 +0200
Message-ID: <20250407092017.273124-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The Vexia EDU ATLA 10 tablet comes in 2 different versions with
significantly different mainboards. The only outward difference is that
the charging barrel on one is marked 5V and the other is marked 9V.

Both need to be handled by the x86-android-tablets code. Add 9v to
the symbols for the existing support for the 9V Vexia EDU ATLA 10 tablet
symbols to prepare for adding support for the 5V version.

All this patch does is s/vexia_edu_atla10_info/vexia_edu_atla10_9v_info/

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/dmi.c    |  2 +-
 .../platform/x86/x86-android-tablets/other.c  | 64 +++++++++----------
 .../x86-android-tablets/x86-android-tablets.h |  2 +-
 3 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
index 3e5fa3b6e2fd..e43d482b17a3 100644
--- a/drivers/platform/x86/x86-android-tablets/dmi.c
+++ b/drivers/platform/x86/x86-android-tablets/dmi.c
@@ -187,7 +187,7 @@ const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 			/* Above strings are too generic, also match on BIOS date */
 			DMI_MATCH(DMI_BIOS_DATE, "08/25/2014"),
 		},
-		.driver_data = (void *)&vexia_edu_atla10_info,
+		.driver_data = (void *)&vexia_edu_atla10_9v_info,
 	},
 	{
 		/* Whitelabel (sold as various brands) TM800A550L */
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 1d93d9edb23f..74dcac8d19d7 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -599,62 +599,62 @@ const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
 };
 
 /*
- * Vexia EDU ATLA 10 tablet, Android 4.2 / 4.4 + Guadalinex Ubuntu tablet
+ * Vexia EDU ATLA 10 tablet 9V, Android 4.2 + Guadalinex Ubuntu tablet
  * distributed to schools in the Spanish Andalucía region.
  */
 static const char * const crystal_cove_pwrsrc_psy[] = { "crystal_cove_pwrsrc" };
 
-static const struct property_entry vexia_edu_atla10_ulpmc_props[] = {
+static const struct property_entry vexia_edu_atla10_9v_ulpmc_props[] = {
 	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", crystal_cove_pwrsrc_psy),
 	{ }
 };
 
-static const struct software_node vexia_edu_atla10_ulpmc_node = {
-	.properties = vexia_edu_atla10_ulpmc_props,
+static const struct software_node vexia_edu_atla10_9v_ulpmc_node = {
+	.properties = vexia_edu_atla10_9v_ulpmc_props,
 };
 
-static const char * const vexia_edu_atla10_accel_mount_matrix[] = {
+static const char * const vexia_edu_atla10_9v_accel_mount_matrix[] = {
 	"0", "-1", "0",
 	"1", "0", "0",
 	"0", "0", "1"
 };
 
-static const struct property_entry vexia_edu_atla10_accel_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", vexia_edu_atla10_accel_mount_matrix),
+static const struct property_entry vexia_edu_atla10_9v_accel_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", vexia_edu_atla10_9v_accel_mount_matrix),
 	{ }
 };
 
-static const struct software_node vexia_edu_atla10_accel_node = {
-	.properties = vexia_edu_atla10_accel_props,
+static const struct software_node vexia_edu_atla10_9v_accel_node = {
+	.properties = vexia_edu_atla10_9v_accel_props,
 };
 
-static const struct property_entry vexia_edu_atla10_touchscreen_props[] = {
+static const struct property_entry vexia_edu_atla10_9v_touchscreen_props[] = {
 	PROPERTY_ENTRY_U32("hid-descr-addr", 0x0000),
 	PROPERTY_ENTRY_U32("post-reset-deassert-delay-ms", 120),
 	{ }
 };
 
-static const struct software_node vexia_edu_atla10_touchscreen_node = {
-	.properties = vexia_edu_atla10_touchscreen_props,
+static const struct software_node vexia_edu_atla10_9v_touchscreen_node = {
+	.properties = vexia_edu_atla10_9v_touchscreen_props,
 };
 
-static const struct property_entry vexia_edu_atla10_pmic_props[] = {
+static const struct property_entry vexia_edu_atla10_9v_pmic_props[] = {
 	PROPERTY_ENTRY_BOOL("linux,register-pwrsrc-power_supply"),
 	{ }
 };
 
-static const struct software_node vexia_edu_atla10_pmic_node = {
-	.properties = vexia_edu_atla10_pmic_props,
+static const struct software_node vexia_edu_atla10_9v_pmic_node = {
+	.properties = vexia_edu_atla10_9v_pmic_props,
 };
 
-static const struct x86_i2c_client_info vexia_edu_atla10_i2c_clients[] __initconst = {
+static const struct x86_i2c_client_info vexia_edu_atla10_9v_i2c_clients[] __initconst = {
 	{
 		/* I2C attached embedded controller, used to access fuel-gauge */
 		.board_info = {
 			.type = "vexia_atla10_ec",
 			.addr = 0x76,
 			.dev_name = "ulpmc",
-			.swnode = &vexia_edu_atla10_ulpmc_node,
+			.swnode = &vexia_edu_atla10_9v_ulpmc_node,
 		},
 		.adapter_path = "0000:00:18.1",
 	}, {
@@ -679,7 +679,7 @@ static const struct x86_i2c_client_info vexia_edu_atla10_i2c_clients[] __initcon
 			.type = "kxtj21009",
 			.addr = 0x0f,
 			.dev_name = "kxtj21009",
-			.swnode = &vexia_edu_atla10_accel_node,
+			.swnode = &vexia_edu_atla10_9v_accel_node,
 		},
 		.adapter_path = "0000:00:18.5",
 	}, {
@@ -688,7 +688,7 @@ static const struct x86_i2c_client_info vexia_edu_atla10_i2c_clients[] __initcon
 			.type = "hid-over-i2c",
 			.addr = 0x38,
 			.dev_name = "FTSC1000",
-			.swnode = &vexia_edu_atla10_touchscreen_node,
+			.swnode = &vexia_edu_atla10_9v_touchscreen_node,
 		},
 		.adapter_path = "0000:00:18.6",
 		.irq_data = {
@@ -703,7 +703,7 @@ static const struct x86_i2c_client_info vexia_edu_atla10_i2c_clients[] __initcon
 			.type = "intel_soc_pmic_crc",
 			.addr = 0x6e,
 			.dev_name = "intel_soc_pmic_crc",
-			.swnode = &vexia_edu_atla10_pmic_node,
+			.swnode = &vexia_edu_atla10_9v_pmic_node,
 		},
 		.adapter_path = "0000:00:18.7",
 		.irq_data = {
@@ -715,7 +715,7 @@ static const struct x86_i2c_client_info vexia_edu_atla10_i2c_clients[] __initcon
 	}
 };
 
-static const struct x86_serdev_info vexia_edu_atla10_serdevs[] __initconst = {
+static const struct x86_serdev_info vexia_edu_atla10_9v_serdevs[] __initconst = {
 	{
 		.ctrl.pci.devfn = PCI_DEVFN(0x1e, 3),
 		.ctrl_devname = "serial0",
@@ -723,7 +723,7 @@ static const struct x86_serdev_info vexia_edu_atla10_serdevs[] __initconst = {
 	},
 };
 
-static struct gpiod_lookup_table vexia_edu_atla10_ft5416_gpios = {
+static struct gpiod_lookup_table vexia_edu_atla10_9v_ft5416_gpios = {
 	.dev_id = "i2c-FTSC1000",
 	.table = {
 		GPIO_LOOKUP("INT33FC:00", 60, "reset", GPIO_ACTIVE_LOW),
@@ -731,12 +731,12 @@ static struct gpiod_lookup_table vexia_edu_atla10_ft5416_gpios = {
 	},
 };
 
-static struct gpiod_lookup_table * const vexia_edu_atla10_gpios[] = {
-	&vexia_edu_atla10_ft5416_gpios,
+static struct gpiod_lookup_table * const vexia_edu_atla10_9v_gpios[] = {
+	&vexia_edu_atla10_9v_ft5416_gpios,
 	NULL
 };
 
-static int __init vexia_edu_atla10_init(struct device *dev)
+static int __init vexia_edu_atla10_9v_init(struct device *dev)
 {
 	struct pci_dev *pdev;
 	int ret;
@@ -760,13 +760,13 @@ static int __init vexia_edu_atla10_init(struct device *dev)
 	return 0;
 }
 
-const struct x86_dev_info vexia_edu_atla10_info __initconst = {
-	.i2c_client_info = vexia_edu_atla10_i2c_clients,
-	.i2c_client_count = ARRAY_SIZE(vexia_edu_atla10_i2c_clients),
-	.serdev_info = vexia_edu_atla10_serdevs,
-	.serdev_count = ARRAY_SIZE(vexia_edu_atla10_serdevs),
-	.gpiod_lookup_tables = vexia_edu_atla10_gpios,
-	.init = vexia_edu_atla10_init,
+const struct x86_dev_info vexia_edu_atla10_9v_info __initconst = {
+	.i2c_client_info = vexia_edu_atla10_9v_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(vexia_edu_atla10_9v_i2c_clients),
+	.serdev_info = vexia_edu_atla10_9v_serdevs,
+	.serdev_count = ARRAY_SIZE(vexia_edu_atla10_9v_serdevs),
+	.gpiod_lookup_tables = vexia_edu_atla10_9v_gpios,
+	.init = vexia_edu_atla10_9v_init,
 	.use_pci = true,
 };
 
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 63a38a0069ba..2204bbaf2ed5 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -127,7 +127,7 @@ extern const struct x86_dev_info nextbook_ares8_info;
 extern const struct x86_dev_info nextbook_ares8a_info;
 extern const struct x86_dev_info peaq_c1010_info;
 extern const struct x86_dev_info whitelabel_tm800a550l_info;
-extern const struct x86_dev_info vexia_edu_atla10_info;
+extern const struct x86_dev_info vexia_edu_atla10_9v_info;
 extern const struct x86_dev_info xiaomi_mipad2_info;
 extern const struct dmi_system_id x86_android_tablet_ids[];
 
-- 
2.49.0

