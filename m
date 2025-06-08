Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3801372
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Jun 2025 20:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749415318; cv=none; b=MdrioqkINcgNa8ZUH5u3jHOB8EVkalRbyotC9UemoAyVAOOtem7pMcij42JpMBFDfzl06XL9TcUeCCpWYtgPg0K9wFUWAwWmO0a2ibw4v13ddOIxUfxgrVm+oA1psPK3wpsMGVHltZZWWR99adIw/mok7Pe5D1N6Cv2EPgGpkkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749415318; c=relaxed/simple;
	bh=f/brtTDJ4tfQmymQGWdWFzOqb3RwDI03yFYC0zQiu5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sdItO04s1SqKWdMNYnvimcQLdddwtYJDpWy1lcv9bVQvuvGn3MtfvQePeEj9p5FAZ8zgiK9ZVW3u91C1KJGhJFgLMXGgS5Mk+KmnBjrOMT3yD6QlbUSqWnt1LqjV0kaWsPcxOEh9CHMgSsSUnSQUnVyfNzXsIhifwbtbcQUDoec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUk+3fJ8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUk+3fJ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F795C4CEEE;
	Sun,  8 Jun 2025 20:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749415317;
	bh=f/brtTDJ4tfQmymQGWdWFzOqb3RwDI03yFYC0zQiu5k=;
	h=From:To:Cc:Subject:Date:From;
	b=ZUk+3fJ8krQEGCEoEzJdFjHIp181LLw4zCaaKyT+yD9Hb2cfJACstqg7wki1EOJp+
	 La3Bf7EEa/Yc7Ca/IaXrA9GDzdZefZ+dDFA05bnTXYt+nFq6imlzuETNZJMqdsIKj4
	 V/3OGN7A5WdOVohEhDq08i1C4d8Bmkz8M+g+BvLOiwfV9qE1KemacISAfRsChfB9M/
	 zWEoNUN8TZt8Nml5NCJ081Zibwxq1O+WB3vy5v4Lsa/8NtrO1+XFBy8gVIHDeNW5Sw
	 DphwXAjv2KYNLtZVcp4F2TurFhKcCppkzpUEevf/gIFi3vjsUTZxS5rY9WAgBV+lF+
	 ZyjogaFhmnHUQ==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: x86-android-tablets: Add generic_lipo_4v2_battery info
Date: Sun,  8 Jun 2025 22:41:53 +0200
Message-ID: <20250608204154.37605-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the asus_tf103c_battery_node to shared-psy-info.c and rename it to
generic_lipo_4v2_battery_node.

This is a preparation patch for adding ovc-capacity-table info to
the battery nodes.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 .../platform/x86/x86-android-tablets/asus.c   | 21 +++----------------
 .../x86/x86-android-tablets/shared-psy-info.c | 16 ++++++++++++++
 .../x86/x86-android-tablets/shared-psy-info.h |  1 +
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
index 7dde63b9943f..97cd14c1fd23 100644
--- a/drivers/platform/x86/x86-android-tablets/asus.c
+++ b/drivers/platform/x86/x86-android-tablets/asus.c
@@ -206,24 +206,9 @@ static const struct software_node asus_tf103c_touchscreen_node = {
 	.properties = asus_tf103c_touchscreen_props,
 };
 
-static const struct property_entry asus_tf103c_battery_props[] = {
-	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
-	PROPERTY_ENTRY_STRING("device-chemistry", "lithium-ion-polymer"),
-	PROPERTY_ENTRY_U32("precharge-current-microamp", 256000),
-	PROPERTY_ENTRY_U32("charge-term-current-microamp", 128000),
-	PROPERTY_ENTRY_U32("constant-charge-current-max-microamp", 2048000),
-	PROPERTY_ENTRY_U32("constant-charge-voltage-max-microvolt", 4208000),
-	PROPERTY_ENTRY_U32("factory-internal-resistance-micro-ohms", 150000),
-	{ }
-};
-
-static const struct software_node asus_tf103c_battery_node = {
-	.properties = asus_tf103c_battery_props,
-};
-
 static const struct property_entry asus_tf103c_bq24190_props[] = {
 	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", tusb1211_chg_det_psy, 1),
-	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
+	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_4v2_battery_node),
 	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
 	PROPERTY_ENTRY_BOOL("omit-battery-class"),
 	PROPERTY_ENTRY_BOOL("disable-reset"),
@@ -236,7 +221,7 @@ static const struct software_node asus_tf103c_bq24190_node = {
 
 static const struct property_entry asus_tf103c_ug3105_props[] = {
 	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", bq24190_psy, 1),
-	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
+	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_4v2_battery_node),
 	PROPERTY_ENTRY_U32("upisemi,rsns-microohm", 5000),
 	{ }
 };
@@ -321,6 +306,6 @@ const struct x86_dev_info asus_tf103c_info __initconst = {
 	.gpio_button = &asus_me176c_tf103c_lid,
 	.gpio_button_count = 1,
 	.gpiod_lookup_tables = asus_tf103c_gpios,
-	.bat_swnode = &asus_tf103c_battery_node,
+	.bat_swnode = &generic_lipo_4v2_battery_node,
 	.modules = bq24190_modules,
 };
diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
index a46fa15acfb1..55da57477153 100644
--- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
+++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
@@ -39,6 +39,22 @@ const struct software_node fg_bq25890_supply_node = {
 	.properties = fg_bq25890_supply_props,
 };
 
+/* Standard LiPo (max 4.2V) settings used by most devs with a LiPo battery */
+static const struct property_entry generic_lipo_4v2_battery_props[] = {
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
+const struct software_node generic_lipo_4v2_battery_node = {
+	.properties = generic_lipo_4v2_battery_props,
+};
+
 /* LiPo HighVoltage (max 4.35V) settings used by most devs with a HV battery */
 static const struct property_entry generic_lipo_hv_4v35_battery_props[] = {
 	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
index c2d2968cddc2..bcf9845ad275 100644
--- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
+++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
@@ -21,6 +21,7 @@ extern const char * const bq25890_psy[];
 
 extern const struct software_node fg_bq24190_supply_node;
 extern const struct software_node fg_bq25890_supply_node;
+extern const struct software_node generic_lipo_4v2_battery_node;
 extern const struct software_node generic_lipo_hv_4v35_battery_node;
 
 extern struct bq24190_platform_data bq24190_pdata;
-- 
2.49.0

