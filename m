Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70FDC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  6 Feb 2022 22:02:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235255AbiBFWCg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 6 Feb 2022 17:02:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbiBFWCf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Feb 2022 17:02:35 -0500
X-Greylist: delayed 10312 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Feb 2022 14:02:33 PST
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EA4D4C06173B
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Feb 2022 14:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644184952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=WqP7LTzBuX8BcsjrHX/uiUgV3VXtu/oH5uy/ecB25es=;
        b=ebZ5/GtWWiUjJH+FwQ5kccfyHi5iJ2jX6vuoDhj9qfkl40Mc8r5fhFEBnnBcbxRwNEAi3x
        j2tHtCB0pkbx7qSE6+zbRZXNwMTCJb1eYxvUINwH64jYS6/nXhrF3+8rohhIqTy4wGahi4
        YWRP4Z0lJl52MaZ0KtEfZXCu0YWu/Ls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-bV4PpJffNCGbprIj6nCNVg-1; Sun, 06 Feb 2022 17:02:31 -0500
X-MC-Unique: bV4PpJffNCGbprIj6nCNVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 180371091DA0;
        Sun,  6 Feb 2022 22:02:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.35])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 23C951037F5B;
        Sun,  6 Feb 2022 22:02:28 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/4] platform/x86: x86-android-tablets: Minor charger / fuel-gauge improvements
Date:   Sun,  6 Feb 2022 23:02:17 +0100
Message-Id: <20220206220220.88491-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Minor charger / fuel-gauge improvements:

1. Make some of the names of charger / fuel-gauge related globals more
   generic in preparation for also using them on other boards.

2. Update the dev_name on the Asus ME176C and TF103C to reflect that these
   are using the bq24297 variant of the bq24190 family.

3. During review of the ug3105 driver the "upi,rsns-microohm" property was
   renamed to "upisemi,rsns-microohm" as "upisemi" is the correct vendor
   prefix, update the ug3105 properties accordingly.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 47 +++++++++++-----------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 838d667126e5..8e6e4f89220f 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -172,8 +172,18 @@ struct x86_dev_info {
 };
 
 /* Generic / shared charger / battery settings */
-static const char * const bq24190_suppliers[] = { "tusb1211-charger-detect" };
-static const char * const ug3105_suppliers[] = { "bq24190-charger" };
+static const char * const tusb1211_chg_det_psy[] = { "tusb1211-charger-detect" };
+static const char * const bq24190_psy[] = { "bq24190-charger" };
+static const char * const bq25890_psy[] = { "bq25890-charger" };
+
+static const struct property_entry fg_bq25890_supply_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq25890_psy),
+	{ }
+};
+
+static const struct software_node fg_bq25890_supply_node = {
+	.properties = fg_bq25890_supply_props,
+};
 
 /* LiPo HighVoltage (max 4.35V) settings used by most devs with a HV bat. */
 static const struct property_entry generic_lipo_hv_4v35_battery_props[] = {
@@ -295,7 +305,7 @@ static const struct software_node asus_me176c_accel_node = {
 };
 
 static const struct property_entry asus_me176c_bq24190_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_suppliers),
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", tusb1211_chg_det_psy),
 	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
 	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
 	PROPERTY_ENTRY_BOOL("omit-battery-class"),
@@ -308,9 +318,9 @@ static const struct software_node asus_me176c_bq24190_node = {
 };
 
 static const struct property_entry asus_me176c_ug3105_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", ug3105_suppliers),
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_psy),
 	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
-	PROPERTY_ENTRY_U32("upi,rsns-microohm", 10000),
+	PROPERTY_ENTRY_U32("upisemi,rsns-microohm", 10000),
 	{ }
 };
 
@@ -320,11 +330,11 @@ static const struct software_node asus_me176c_ug3105_node = {
 
 static const struct x86_i2c_client_info asus_me176c_i2c_clients[] __initconst = {
 	{
-		/* bq24190 battery charger */
+		/* bq24297 battery charger */
 		.board_info = {
 			.type = "bq24190",
 			.addr = 0x6b,
-			.dev_name = "bq24190",
+			.dev_name = "bq24297",
 			.swnode = &asus_me176c_bq24190_node,
 			.platform_data = &bq24190_pdata,
 		},
@@ -463,7 +473,7 @@ static const struct software_node asus_tf103c_battery_node = {
 };
 
 static const struct property_entry asus_tf103c_bq24190_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_suppliers),
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", tusb1211_chg_det_psy),
 	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
 	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
 	PROPERTY_ENTRY_BOOL("omit-battery-class"),
@@ -476,9 +486,9 @@ static const struct software_node asus_tf103c_bq24190_node = {
 };
 
 static const struct property_entry asus_tf103c_ug3105_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", ug3105_suppliers),
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_psy),
 	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
-	PROPERTY_ENTRY_U32("upi,rsns-microohm", 5000),
+	PROPERTY_ENTRY_U32("upisemi,rsns-microohm", 5000),
 	{ }
 };
 
@@ -488,11 +498,11 @@ static const struct software_node asus_tf103c_ug3105_node = {
 
 static const struct x86_i2c_client_info asus_tf103c_i2c_clients[] __initconst = {
 	{
-		/* bq24190 battery charger */
+		/* bq24297 battery charger */
 		.board_info = {
 			.type = "bq24190",
 			.addr = 0x6b,
-			.dev_name = "bq24190",
+			.dev_name = "bq24297",
 			.swnode = &asus_tf103c_bq24190_node,
 			.platform_data = &bq24190_pdata,
 		},
@@ -834,17 +844,6 @@ static const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
  *
  * This takes care of instantiating the hidden devices manually.
  */
-static const char * const bq27520_suppliers[] = { "bq25890-charger" };
-
-static const struct property_entry bq27520_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq27520_suppliers),
-	{ }
-};
-
-static const struct software_node bq27520_node = {
-	.properties = bq27520_props,
-};
-
 static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst = {
 	{
 		/* BQ27520 fuel-gauge */
@@ -852,7 +851,7 @@ static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst
 			.type = "bq27520",
 			.addr = 0x55,
 			.dev_name = "bq27520",
-			.swnode = &bq27520_node,
+			.swnode = &fg_bq25890_supply_node,
 		},
 		.adapter_path = "\\_SB_.PCI0.I2C1",
 	}, {
-- 
2.33.1

