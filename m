Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC53A37CD55
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Mar 2026 21:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774301741; cv=none; b=fT/yEZKCPTrSNTx11d7I+m28xumqMx78jFLFn734LfCL1sqR/I+xVeE7296NeclocBsrnJNdR7TDehzehqOhJIaZxerHIASKju7BabeGafPnWPiaXSWNvr36bWd5Baqte8aaZDDQcnVNAxBsBuDpBUE3Kf51aHB4rEKq7ImOqLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774301741; c=relaxed/simple;
	bh=ZCo4qVO3I2o5BjxfhH8jqqmr85nxr8LyIX9v8COtX5M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c1yIzCI4p+nmunGyhBtYchMkHykKu7d1mdF22/x1oxJy93hOY2rRqKDpqRCzOa8ekikURkduZpqDB0ZhBUV5/IrPIAc6yNmvlTAVmbqytqnw78XJdEEQqCaCJFZyFXN2JTmcHjOkmM9FSyOm2YxqcGUrrqotidsUm3vvbKs+4/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=nnH8oIhl; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="nnH8oIhl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PXMF5fV+CQJ0IY725wxeezeJvbTUbHi6aIk18e54B8o=; b=nnH8oIhlY3dUpvr503iz/O++dK
	8jiSX33IviEpw4qzu2wJh2Hn/Rr6ghYB+FwDxL08P1Y18CQ+q5HBfO9wvCpLWdj0ZhhToYpdepf5N
	+atNSWinirIfJsqmz//RdnE8LNnX8eUGV/rGHv8KFNPEbxA5JFTU2e5aFkYYSOw+F8YY=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w4mvv-005uyy-0H;
	Mon, 23 Mar 2026 22:35:35 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: platform-driver-x86@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	hdegoede@redhat.com,
	andy@kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v2] platform/x86: int3472: Handle GPIO type 0x02 (strobe) as IR  flood LED
Date: Mon, 23 Mar 2026 22:35:35 +0100
Message-Id: <20260323213535.1410678-1-mnencia@kcore.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <ab0URIrzZPsYjWrM@spark.kcore.it>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO type 0x02 (strobe) appears in ACPI tables on recent Intel
Meteor Lake and Arrow Lake platforms (e.g. Dell Pro Max 14/16) for
controlling an IR flood LED used by infrared camera sensors. The
INT3472 discrete driver does not handle this type, logging "GPIO type
0x02 unknown; the sensor may not work" and potentially preventing the
associated sensor slot from initializing cleanly.

Add support for GPIO type 0x02 by registering it as an LED through
the existing LED framework, with the name "ir_flood_led" to
distinguish it from the privacy LED (type 0x0d).

Rename skl_int3472_register_pled() and skl_int3472_unregister_pled()
to skl_int3472_register_led() and skl_int3472_unregister_led(). The
register function takes a name parameter and an optional LED lookup
con_id. For the privacy LED, "privacy" is passed so sensor drivers
can discover it via devm_led_get(). For the IR flood LED, NULL is
passed to register only the LED classdev without a driver lookup,
since no sensor driver currently consumes it.

Link: https://lore.kernel.org/linux-media/ab0URIrzZPsYjWrM@spark.kcore.it/
Suggested-by: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
 drivers/platform/x86/intel/int3472/discrete.c | 20 ++++++++++++++++--
 drivers/platform/x86/intel/int3472/led.c      | 21 ++++++++++++-------
 include/linux/platform_data/x86/int3472.h     |  7 +++++--
 3 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 1505fc3..4d5f40a 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -211,6 +211,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "clk-enable";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_STROBE:
+		*con_id = "ir-flood-led";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 		*con_id = "privacy-led";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -248,6 +252,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
  *
  * 0x00 Reset
  * 0x01 Power down
+ * 0x02 Strobe (IR flood LED)
  * 0x0b Power enable
  * 0x0c Clock enable
  * 0x0d Privacy LED
@@ -330,6 +335,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
+	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
@@ -346,9 +352,19 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 			if (ret)
 				err_msg = "Failed to register clock\n";
 
+			break;
+		case INT3472_GPIO_TYPE_STROBE:
+			ret = skl_int3472_register_led(int3472, gpio,
+						       "ir_flood_led",
+						       NULL);
+			if (ret)
+				err_msg = "Failed to register LED\n";
+
 			break;
 		case INT3472_GPIO_TYPE_PRIVACY_LED:
-			ret = skl_int3472_register_pled(int3472, gpio);
+			ret = skl_int3472_register_led(int3472, gpio,
+						       "privacy_led",
+						       "privacy");
 			if (ret)
 				err_msg = "Failed to register LED\n";
 
@@ -422,7 +438,7 @@ void int3472_discrete_cleanup(struct int3472_discrete_device *int3472)
 	gpiod_remove_lookup_table(&int3472->gpios);
 
 	skl_int3472_unregister_clock(int3472);
-	skl_int3472_unregister_pled(int3472);
+	skl_int3472_unregister_led(int3472);
 	skl_int3472_unregister_regulator(int3472);
 }
 EXPORT_SYMBOL_NS_GPL(int3472_discrete_cleanup, "INTEL_INT3472_DISCRETE");
diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index b1d84b9..e3ab40e 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -16,7 +16,9 @@ static int int3472_pled_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
-int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
+int skl_int3472_register_led(struct int3472_discrete_device *int3472,
+			    struct gpio_desc *gpio, const char *led_name,
+			    const char *lookup_con_id)
 {
 	char *p;
 	int ret;
@@ -28,7 +30,7 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gp
 
 	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
 	snprintf(int3472->pled.name, sizeof(int3472->pled.name),
-		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
+		 "%s::%s", acpi_dev_name(int3472->sensor), led_name);
 	p = strchr(int3472->pled.name, ':');
 	if (p)
 		*p = '_';
@@ -41,20 +43,23 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gp
 	if (ret)
 		return ret;
 
-	int3472->pled.lookup.provider = int3472->pled.name;
-	int3472->pled.lookup.dev_id = int3472->sensor_name;
-	int3472->pled.lookup.con_id = "privacy";
-	led_add_lookup(&int3472->pled.lookup);
+	if (lookup_con_id) {
+		int3472->pled.lookup.provider = int3472->pled.name;
+		int3472->pled.lookup.dev_id = int3472->sensor_name;
+		int3472->pled.lookup.con_id = lookup_con_id;
+		led_add_lookup(&int3472->pled.lookup);
+	}
 
 	return 0;
 }
 
-void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
+void skl_int3472_unregister_led(struct int3472_discrete_device *int3472)
 {
 	if (IS_ERR_OR_NULL(int3472->pled.classdev.dev))
 		return;
 
-	led_remove_lookup(&int3472->pled.lookup);
+	if (int3472->pled.lookup.con_id)
+		led_remove_lookup(&int3472->pled.lookup);
 	led_classdev_unregister(&int3472->pled.classdev);
 	gpiod_put(int3472->pled.gpio);
 }
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index b1b8375..a7cf290 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -23,6 +23,7 @@
 /* PMIC GPIO Types */
 #define INT3472_GPIO_TYPE_RESET					0x00
 #define INT3472_GPIO_TYPE_POWERDOWN				0x01
+#define INT3472_GPIO_TYPE_STROBE				0x02
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
@@ -160,7 +161,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   const char *second_sensor);
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
 
-int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gpio_desc *gpio);
-void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472);
+int skl_int3472_register_led(struct int3472_discrete_device *int3472,
+			    struct gpio_desc *gpio, const char *led_name,
+			    const char *lookup_con_id);
+void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
 
 #endif
-- 
2.47.3

