Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E71B22FF2B
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Apr 2025 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017630; cv=none; b=Fm8n143e5UvkidAgyJPTYOl5sii4N5/mDQyvv8/SBcGeg+jXbd3jIGhOMbapkYQxPoCkGtC8rDbbQ54N4DFf0TSPYWQ0Mk8b6sSQzh4swSpLfgwUV9vKsSZFJUk/FC5a/ZhmrbZZFZupCfO+jguvWhDulyOH233NahnEefx9otE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017630; c=relaxed/simple;
	bh=VhAHtkzUaA77avVOaHOmlU11JoPNYgTqUXiazBs4bqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=shoGEIYa7CkkEeZ7zPUQ3CTivr7HtK7i/1SPXnoJwSszEcqtwmb7VAkGzm2iOykkRdGeao4v0oni6IAEcZHDQIymTCDdbi2EQSa+oPHhHFjr0fTlNJAiiFtpWvpBs2xcTAPKzHm5HrOvttfjJ91EKQTQjGrOdtbSnVvHmusMWPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PBm9M7tU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PBm9M7tU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744017627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5qBTZDSnynsG1d8aLLifxeoQ5ewZHfI4YdlGwvgLLxY=;
	b=PBm9M7tUFICeXabENdHL9WWg7dhlGNY9KBO+Nup7JALo8QTUDpyBMSaIrQPRQHw8FUi9km
	JFuWOJLbuXQAB7ssZZA9EeNbpDzIoqD/A/M00CStnx3TT2WAuXquh5KUX6J2lyPz906CQR
	H0ThoAyOHe3Mo/09ZTC5jafPtgtCOyo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-MfpD-J0WPS-7DS7fu53O8w-1; Mon,
 07 Apr 2025 05:20:25 -0400
X-MC-Unique: MfpD-J0WPS-7DS7fu53O8w-1
X-Mimecast-MFC-AGG-ID: MfpD-J0WPS-7DS7fu53O8w_1744017624
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C004B1801A1A;
	Mon,  7 Apr 2025 09:20:24 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.225.6])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DAD77180094A;
	Mon,  7 Apr 2025 09:20:22 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: x86-android-tablets: Add Vexia Edu Atla 10 tablet 5V data
Date: Mon,  7 Apr 2025 11:20:16 +0200
Message-ID: <20250407092017.273124-2-hdegoede@redhat.com>
In-Reply-To: <20250407092017.273124-1-hdegoede@redhat.com>
References: <20250407092017.273124-1-hdegoede@redhat.com>
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

Both are x86 ACPI tablets which ships with Android x86 as factory OS.
with a DSDT which contains a bunch of I2C devices which are not actually
there, causing various resource conflicts. Enumeration of these is skipped
through the acpi_quirk_skip_i2c_client_enumeration().

Extend the existing support for the 9V version by adding support for
manually instantiating the I2C devices which are actually present on
the 5V version by adding the necessary device info to
the x86-android-tablets module.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/dmi.c    | 12 ++++
 .../platform/x86/x86-android-tablets/other.c  | 60 +++++++++++++++++++
 .../x86-android-tablets/x86-android-tablets.h |  1 +
 3 files changed, 73 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
index e43d482b17a3..278c6d151dc4 100644
--- a/drivers/platform/x86/x86-android-tablets/dmi.c
+++ b/drivers/platform/x86/x86-android-tablets/dmi.c
@@ -179,6 +179,18 @@ const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		},
 		.driver_data = (void *)&peaq_c1010_info,
 	},
+	{
+		/* Vexia Edu Atla 10 tablet 5V version */
+		.matches = {
+			/* Having all 3 of these not set is somewhat unique */
+			DMI_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "To be filled by O.E.M."),
+			DMI_MATCH(DMI_BOARD_NAME, "To be filled by O.E.M."),
+			/* Above strings are too generic, also match on BIOS date */
+			DMI_MATCH(DMI_BIOS_DATE, "05/14/2015"),
+		},
+		.driver_data = (void *)&vexia_edu_atla10_5v_info,
+	},
 	{
 		/* Vexia Edu Atla 10 tablet 9V version */
 		.matches = {
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 74dcac8d19d7..f7bd9f863c85 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -598,6 +598,66 @@ const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
 	.gpiod_lookup_tables = whitelabel_tm800a550l_gpios,
 };
 
+/*
+ * Vexia EDU ATLA 10 tablet 5V, Android 4.4 + Guadalinex Ubuntu tablet
+ * distributed to schools in the Spanish Andalucía region.
+ */
+static const struct property_entry vexia_edu_atla10_5v_touchscreen_props[] = {
+	PROPERTY_ENTRY_U32("hid-descr-addr", 0x0000),
+	PROPERTY_ENTRY_U32("post-reset-deassert-delay-ms", 120),
+	{ }
+};
+
+static const struct software_node vexia_edu_atla10_5v_touchscreen_node = {
+	.properties = vexia_edu_atla10_5v_touchscreen_props,
+};
+
+static const struct x86_i2c_client_info vexia_edu_atla10_5v_i2c_clients[] __initconst = {
+	{
+		/* kxcjk1013 accelerometer */
+		.board_info = {
+			.type = "kxcjk1013",
+			.addr = 0x0f,
+			.dev_name = "kxcjk1013",
+		},
+		.adapter_path = "\\_SB_.I2C3",
+	}, {
+		/*  touchscreen controller */
+		.board_info = {
+			.type = "hid-over-i2c",
+			.addr = 0x38,
+			.dev_name = "FTSC1000",
+			.swnode = &vexia_edu_atla10_5v_touchscreen_node,
+		},
+		.adapter_path = "\\_SB_.I2C4",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_APIC,
+			.index = 0x44,
+			.trigger = ACPI_LEVEL_SENSITIVE,
+			.polarity = ACPI_ACTIVE_HIGH,
+		},
+	}
+};
+
+static struct gpiod_lookup_table vexia_edu_atla10_5v_ft5416_gpios = {
+	.dev_id = "i2c-FTSC1000",
+	.table = {
+		GPIO_LOOKUP("INT33FC:01", 26, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table * const vexia_edu_atla10_5v_gpios[] = {
+	&vexia_edu_atla10_5v_ft5416_gpios,
+	NULL
+};
+
+const struct x86_dev_info vexia_edu_atla10_5v_info __initconst = {
+	.i2c_client_info = vexia_edu_atla10_5v_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(vexia_edu_atla10_5v_i2c_clients),
+	.gpiod_lookup_tables = vexia_edu_atla10_5v_gpios,
+};
+
 /*
  * Vexia EDU ATLA 10 tablet 9V, Android 4.2 + Guadalinex Ubuntu tablet
  * distributed to schools in the Spanish Andalucía region.
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 2204bbaf2ed5..dcf8d49e3b5f 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -127,6 +127,7 @@ extern const struct x86_dev_info nextbook_ares8_info;
 extern const struct x86_dev_info nextbook_ares8a_info;
 extern const struct x86_dev_info peaq_c1010_info;
 extern const struct x86_dev_info whitelabel_tm800a550l_info;
+extern const struct x86_dev_info vexia_edu_atla10_5v_info;
 extern const struct x86_dev_info vexia_edu_atla10_9v_info;
 extern const struct x86_dev_info xiaomi_mipad2_info;
 extern const struct dmi_system_id x86_android_tablet_ids[];
-- 
2.49.0

