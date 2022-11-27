Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837D2C43217
	for <platform-driver-x86@archiver.kernel.org>; Sun, 27 Nov 2022 18:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiK0S0H (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 27 Nov 2022 13:26:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiK0S0G (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 27 Nov 2022 13:26:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279E8DF1E
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 Nov 2022 10:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669573511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=gEf2LukyWxkA+zEFCrGuPeOHWjeQShK5ZWOLFwx29Ko=;
        b=UPzemeUGn2dD5N/Koj65TV6A/8M/3OFzejbqXUzznBBio8UwBmGzsWw1TX1noDKK/tE5dP
        qxivEqctixWF8VQnN+2lPqSj7FOSzsS0Nc4QYwnR5KKmo5FbdWSWKktYp3EiMSjvlbjpQi
        x7XoQucZC2JQgl7cKDbovkMlkCUJa1M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-mtt8LqXeMSWdIh-8tdMkPA-1; Sun, 27 Nov 2022 13:25:10 -0500
X-MC-Unique: mtt8LqXeMSWdIh-8tdMkPA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A48C138041CF;
        Sun, 27 Nov 2022 18:25:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.80])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F3AD849BB61;
        Sun, 27 Nov 2022 18:25:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: x86-android-tablets: Add Lenovo Yoga Tab 3 (YT3-X90F) charger + fuel-gauge data
Date:   Sun, 27 Nov 2022 19:24:58 +0100
Message-Id: <20221127182458.104528-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Lenovo Yoga Tab 3 (YT3-X90F) is an Intel Cherry Trail based tablet
which ships with Android as Factory OS. Its DSDT contains a bunch of I2C
devices which are not actually there, causing various resource conflicts.
Use acpi_quirk_skip_i2c_client_enumeration() to not enumerate these.

The YT3-X90F has quite a bit of exotic hardware, this adds initial
support by manually instantiating the i2c-clients for the 2 charger +
2 fuel-gauge chips used for the 2 batteries.

Support for other parts of the hw will be added by follow-up patches.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 129 ++++++++++++++++++++-
 1 file changed, 128 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index f04e06eeb958..dd933cf32b38 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -5,7 +5,7 @@
  * devices typically have a bunch of things hardcoded, rather than specified
  * in their DSDT.
  *
- * Copyright (C) 2021 Hans de Goede <hdegoede@redhat.com>
+ * Copyright (C) 2021-2022 Hans de Goede <hdegoede@redhat.com>
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -987,6 +987,124 @@ static void lenovo_yoga_tab2_830_1050_exit(void)
 	}
 }
 
+/* Lenovo Yoga Tab 3 Pro YT3-X90F */
+
+/*
+ * There are 2 batteries, with 2 bq27500 fuel-gauges and 2 bq25892 chargers,
+ * "bq25890-charger-1" is instantiated from: drivers/i2c/busses/i2c-cht-wc.c.
+ */
+static const char * const lenovo_yt3_bq25892_0_suppliers[] = { "cht_wcove_pwrsrc" };
+static const char * const bq25890_1_psy[] = { "bq25890-charger-1" };
+
+static const struct property_entry fg_bq25890_1_supply_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq25890_1_psy),
+	{ }
+};
+
+static const struct software_node fg_bq25890_1_supply_node = {
+	.properties = fg_bq25890_1_supply_props,
+};
+
+/* bq25892 charger settings for the flat lipo battery behind the screen */
+static const struct property_entry lenovo_yt3_bq25892_0_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", lenovo_yt3_bq25892_0_suppliers),
+	PROPERTY_ENTRY_STRING("linux,power-supply-name", "bq25892-second-chrg"),
+	PROPERTY_ENTRY_U32("linux,iinlim-percentage", 40),
+	PROPERTY_ENTRY_BOOL("linux,skip-reset"),
+	/* Values taken from Android Factory Image */
+	PROPERTY_ENTRY_U32("ti,charge-current", 2048000),
+	PROPERTY_ENTRY_U32("ti,battery-regulation-voltage", 4352000),
+	PROPERTY_ENTRY_U32("ti,termination-current", 128000),
+	PROPERTY_ENTRY_U32("ti,precharge-current", 128000),
+	PROPERTY_ENTRY_U32("ti,minimum-sys-voltage", 3700000),
+	PROPERTY_ENTRY_U32("ti,boost-voltage", 4998000),
+	PROPERTY_ENTRY_U32("ti,boost-max-current", 500000),
+	PROPERTY_ENTRY_BOOL("ti,use-ilim-pin"),
+	{ }
+};
+
+static const struct software_node lenovo_yt3_bq25892_0_node = {
+	.properties = lenovo_yt3_bq25892_0_props,
+};
+
+static const struct x86_i2c_client_info lenovo_yt3_i2c_clients[] __initconst = {
+	{
+		/* bq27500 fuel-gauge for the flat lipo battery behind the screen */
+		.board_info = {
+			.type = "bq27500",
+			.addr = 0x55,
+			.dev_name = "bq27500_0",
+			.swnode = &fg_bq25890_supply_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+	}, {
+		/* bq25892 charger for the flat lipo battery behind the screen */
+		.board_info = {
+			.type = "bq25892",
+			.addr = 0x6b,
+			.dev_name = "bq25892_0",
+			.swnode = &lenovo_yt3_bq25892_0_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:01",
+			.index = 5,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
+	}, {
+		/* bq27500 fuel-gauge for the round li-ion cells in the hinge */
+		.board_info = {
+			.type = "bq27500",
+			.addr = 0x55,
+			.dev_name = "bq27500_1",
+			.swnode = &fg_bq25890_1_supply_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C2",
+	}
+};
+
+static int __init lenovo_yt3_init(void)
+{
+	struct gpio_desc *gpiod;
+	int ret;
+
+	/*
+	 * The "bq25892_0" charger IC has its /CE (Charge-Enable) and OTG pins
+	 * connected to GPIOs, rather then having them hardwired to the correct
+	 * values as is normally done.
+	 *
+	 * The bq25890_charger driver controls these through I2C, but this only
+	 * works if not overridden by the pins. Set these pins here:
+	 * 1. Set /CE to 0 to allow charging.
+	 * 2. Set OTG to 0 disable V5 boost output since the 5V boost output of
+	 *    the main "bq25892_1" charger is used when necessary.
+	 */
+
+	/* /CE pin */
+	ret = x86_android_tablet_get_gpiod("INT33FF:02", 22, &gpiod);
+	if (ret < 0)
+		return ret;
+
+	gpiod_set_value(gpiod, 0);
+
+	/* OTG pin */
+	ret = x86_android_tablet_get_gpiod("INT33FF:03", 19, &gpiod);
+	if (ret < 0)
+		return ret;
+
+	gpiod_set_value(gpiod, 0);
+
+	return 0;
+}
+
+static const struct x86_dev_info lenovo_yt3_info __initconst = {
+	.i2c_client_info = lenovo_yt3_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(lenovo_yt3_i2c_clients),
+	.init = lenovo_yt3_init,
+};
+
 /* Medion Lifetab S10346 tablets have an Android factory img with everything hardcoded */
 static const char * const medion_lifetab_s10346_accel_mount_matrix[] = {
 	"0", "1", "0",
@@ -1327,6 +1445,15 @@ static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		},
 		.driver_data = (void *)&lenovo_yoga_tab2_830_1050_info,
 	},
+	{
+		/* Lenovo Yoga Tab 3 Pro YT3-X90F */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
+		},
+		.driver_data = (void *)&lenovo_yt3_info,
+	},
 	{
 		/* Medion Lifetab S10346 */
 		.matches = {
-- 
2.38.1

