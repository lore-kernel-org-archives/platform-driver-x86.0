Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8218AC433FE
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 19:14:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238602AbiBETOF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 14:14:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21153 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243650AbiBETOF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 14:14:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644088444;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/kedafhXDQd8BhVdArz0dZIs8SfUwjFx+eOM0PVueaE=;
        b=C1KoPsF+i+FlvJN+28cJkdBdfnxXuI33N0t0As5la/rQB3ccVSf46qTLOe4tN+PXuQqvPh
        K+fKOkpzuggyEywjuB8UDvsY8RMu38CiLedSwcOaIZwjrb3Cw1LNc4d4635rgyG7EQnfg1
        wmHBl1v8DRa/zDWb08DLL9mdo43xvuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-iM0k5ACsNpeRFVkPm5p9ag-1; Sat, 05 Feb 2022 14:14:01 -0500
X-MC-Unique: iM0k5ACsNpeRFVkPm5p9ag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A579814245;
        Sat,  5 Feb 2022 19:14:00 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 613995F707;
        Sat,  5 Feb 2022 19:13:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/6] platform/x86: x86-android-tablets: Add Asus ME176C/TF103C charger and fuelgauge props
Date:   Sat,  5 Feb 2022 20:13:52 +0100
Message-Id: <20220205191356.225505-2-hdegoede@redhat.com>
In-Reply-To: <20220205191356.225505-1-hdegoede@redhat.com>
References: <20220205191356.225505-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add properties describing the battery on the Asus ME176C / TF103C
tablets. The max constant charge volt / current settings were taken
from the factory Android image on these tablets.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 97 +++++++++++++++++++---
 1 file changed, 85 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 80d113c41623..45a951002401 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -158,21 +158,27 @@ struct x86_dev_info {
 	void (*exit)(void);
 };
 
-/* Generic / shared bq24190 settings */
-static const char * const bq24190_suppliers[] = { "tusb1210-psy" };
-
-static const struct property_entry bq24190_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_suppliers),
-	PROPERTY_ENTRY_BOOL("omit-battery-class"),
-	PROPERTY_ENTRY_BOOL("disable-reset"),
+/* Generic / shared charger / battery settings */
+static const char * const bq24190_suppliers[] = { "tusb1211-charger-detect" };
+static const char * const ug3105_suppliers[] = { "bq24190-charger" };
+
+/* LiPo HighVoltage (max 4.35V) settings used by most devs with a HV bat. */
+static const struct property_entry generic_lipo_hv_4v35_battery_props[] = {
+	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
+	PROPERTY_ENTRY_STRING("device-chemistry", "lithium-ion"),
+	PROPERTY_ENTRY_U32("precharge-current-microamp", 256000),
+	PROPERTY_ENTRY_U32("charge-term-current-microamp", 128000),
+	PROPERTY_ENTRY_U32("constant-charge-current-max-microamp", 1856000),
+	PROPERTY_ENTRY_U32("constant-charge-voltage-max-microvolt", 4352000),
+	PROPERTY_ENTRY_U32("factory-internal-resistance-micro-ohms", 150000),
 	{ }
 };
 
-static const struct software_node bq24190_node = {
-	.properties = bq24190_props,
+static const struct software_node generic_lipo_hv_4v35_battery_node = {
+	.properties = generic_lipo_hv_4v35_battery_props,
 };
 
-/* For enableing the bq24190 5V boost based on id-pin */
+/* For enabling the bq24190 5V boost based on id-pin */
 static struct regulator_consumer_supply intel_int3496_consumer = {
 	.supply = "vbus",
 	.dev_name = "intel-int3496",
@@ -230,6 +236,30 @@ static const struct software_node asus_me176c_accel_node = {
 	.properties = asus_me176c_accel_props,
 };
 
+static const struct property_entry asus_me176c_bq24190_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_suppliers),
+	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
+	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
+	PROPERTY_ENTRY_BOOL("omit-battery-class"),
+	PROPERTY_ENTRY_BOOL("disable-reset"),
+	{ }
+};
+
+static const struct software_node asus_me176c_bq24190_node = {
+	.properties = asus_me176c_bq24190_props,
+};
+
+static const struct property_entry asus_me176c_ug3105_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", ug3105_suppliers),
+	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
+	PROPERTY_ENTRY_U32("upi,rsns-microohm", 10000),
+	{ }
+};
+
+static const struct software_node asus_me176c_ug3105_node = {
+	.properties = asus_me176c_ug3105_props,
+};
+
 static const struct x86_i2c_client_info asus_me176c_i2c_clients[] __initconst = {
 	{
 		/* bq24190 battery charger */
@@ -237,7 +267,7 @@ static const struct x86_i2c_client_info asus_me176c_i2c_clients[] __initconst =
 			.type = "bq24190",
 			.addr = 0x6b,
 			.dev_name = "bq24190",
-			.swnode = &bq24190_node,
+			.swnode = &asus_me176c_bq24190_node,
 			.platform_data = &bq24190_pdata,
 		},
 		.adapter_path = "\\_SB_.I2C1",
@@ -253,6 +283,7 @@ static const struct x86_i2c_client_info asus_me176c_i2c_clients[] __initconst =
 			.type = "ug3105",
 			.addr = 0x70,
 			.dev_name = "ug3105",
+			.swnode = &asus_me176c_ug3105_node,
 		},
 		.adapter_path = "\\_SB_.I2C1",
 	}, {
@@ -321,6 +352,7 @@ static const struct x86_dev_info asus_me176c_info __initconst = {
 	.serdev_info = asus_me176c_serdevs,
 	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
 	.gpiod_lookup_tables = asus_me176c_gpios,
+	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
 	.invalid_aei_gpiochip = "INT33FC:02",
 };
@@ -350,6 +382,45 @@ static const struct software_node asus_tf103c_touchscreen_node = {
 	.properties = asus_tf103c_touchscreen_props,
 };
 
+static const struct property_entry asus_tf103c_battery_props[] = {
+	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
+	PROPERTY_ENTRY_STRING("device-chemistry", "lithium-ion-polymer"),
+	PROPERTY_ENTRY_U32("precharge-current-microamp", 256000),
+	PROPERTY_ENTRY_U32("charge-term-current-microamp", 128000),
+	PROPERTY_ENTRY_U32("constant-charge-current-max-microamp", 2048000),
+	PROPERTY_ENTRY_U32("constant-charge-voltage-max-microvolt", 4208000),
+	PROPERTY_ENTRY_U32("factory-internal-resistance-micro-ohms", 150000),
+	{ }
+};
+
+static const struct software_node asus_tf103c_battery_node = {
+	.properties = asus_tf103c_battery_props,
+};
+
+static const struct property_entry asus_tf103c_bq24190_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_suppliers),
+	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
+	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
+	PROPERTY_ENTRY_BOOL("omit-battery-class"),
+	PROPERTY_ENTRY_BOOL("disable-reset"),
+	{ }
+};
+
+static const struct software_node asus_tf103c_bq24190_node = {
+	.properties = asus_tf103c_bq24190_props,
+};
+
+static const struct property_entry asus_tf103c_ug3105_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", ug3105_suppliers),
+	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
+	PROPERTY_ENTRY_U32("upi,rsns-microohm", 5000),
+	{ }
+};
+
+static const struct software_node asus_tf103c_ug3105_node = {
+	.properties = asus_tf103c_ug3105_props,
+};
+
 static const struct x86_i2c_client_info asus_tf103c_i2c_clients[] __initconst = {
 	{
 		/* bq24190 battery charger */
@@ -357,7 +428,7 @@ static const struct x86_i2c_client_info asus_tf103c_i2c_clients[] __initconst =
 			.type = "bq24190",
 			.addr = 0x6b,
 			.dev_name = "bq24190",
-			.swnode = &bq24190_node,
+			.swnode = &asus_tf103c_bq24190_node,
 			.platform_data = &bq24190_pdata,
 		},
 		.adapter_path = "\\_SB_.I2C1",
@@ -373,6 +444,7 @@ static const struct x86_i2c_client_info asus_tf103c_i2c_clients[] __initconst =
 			.type = "ug3105",
 			.addr = 0x70,
 			.dev_name = "ug3105",
+			.swnode = &asus_tf103c_ug3105_node,
 		},
 		.adapter_path = "\\_SB_.I2C1",
 	}, {
@@ -422,6 +494,7 @@ static const struct x86_dev_info asus_tf103c_info __initconst = {
 	.pdev_info = int3496_pdevs,
 	.pdev_count = ARRAY_SIZE(int3496_pdevs),
 	.gpiod_lookup_tables = asus_tf103c_gpios,
+	.bat_swnode = &asus_tf103c_battery_node,
 	.modules = bq24190_modules,
 	.invalid_aei_gpiochip = "INT33FC:02",
 };
-- 
2.33.1

