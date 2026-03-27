Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D82346FC6;
	Fri, 27 Mar 2026 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635039; cv=none; b=jPSIfevWUaGFgh8uTb699wWamLfU/46Qk31UgqE0eIXmyVlxv0MJDI+BHQ1JM3m6mv/IgRlLHGpqGCa5nVsVDm6t8N5j+8ShPwv87fCybwOtC+2r49X7WX1OCXh+swSUJFRRhX8dwacgBNVJKFrRV/gUOZoiVQ3wxboXLHzbZbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635039; c=relaxed/simple;
	bh=T/dSfo/LMkLDt4W4JkHqJv+gQtkXzGBbDcaufjbQLkM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rohFSZTxm9VN8aO30/ao9XTYxzvBCtrdg7b7urP56FmuN5WOC6J1czDW+ysbMi/qJCBgvdT8mo4nB7d/3IJ+vjmtYXGE61W+gsKnc9tjRl0ZsVE/MjzIO2O7vMlk1UlD0ZC/JOMhjNZJJfAl+sp8EahzK+zsIwEnkD+9RHzHI2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=qSpEe/gT; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="qSpEe/gT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Qt3XWHI5YmC5jcWIMY0NXX2T8UoU9QZRTYaKhKnU4YE=; b=qSpEe/gTleO6zuYrEJh7MP7DtG
	9DDnjMkVAnfX5EgC7C14dJnazkr5v1QX4f+SX22K1BFSNynfqsnW7j3GyXwQfXNx5gZSTr7ca+1ls
	1R+ZMb1TqUdNcCNfGgtB7wqEjH6qXhi9j43wOKOxOltTN4ZQbIf1sZCefh159k8AG/gY=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w6Bdf-006FSJ-2j;
	Fri, 27 Mar 2026 19:10:31 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v5 4/4] platform/x86: int3472: Add support for GPIO type 0x02 (strobe)
Date: Fri, 27 Mar 2026 19:10:31 +0100
Message-Id: <20260327181031.1489365-5-mnencia@kcore.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260327181031.1489365-1-mnencia@kcore.it>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327181031.1489365-1-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for GPIO type 0x02, which controls an IR strobe LED used
for face authentication on some laptops (e.g. Dell Pro Max 16 Premium).

Without this patch, the kernel logs "GPIO type 0x02 unknown; the sensor
may not work" and IR sensors paired with a strobe LED cannot function.

The strobe LED is registered through the LED subsystem like the existing
privacy LED. Unlike the privacy LED, it does not have a lookup entry
since there is no consumer driver expecting it via led_get().

To support multiple LEDs per INT3472 device, convert the single led
struct member to an array with a counter.

This GPIO type was previously referred to as "ir_flood" in early
versions of this patch series. It has been renamed to "strobe" to match
the GPIO type name used in ACPI _DSM tables and align with common
camera terminology for IR illuminators.

Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 drivers/platform/x86/intel/int3472/discrete.c | 16 +++++++-
 drivers/platform/x86/intel/int3472/led.c      | 38 +++++++++++--------
 include/linux/platform_data/x86/int3472.h     | 11 ++++--
 3 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 57c3b2c..4c03845 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -215,6 +215,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "privacy-led";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_STROBE:
+		*con_id = "strobe";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
 		*con_id = "hpd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -248,6 +252,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
  *
  * 0x00 Reset
  * 0x01 Power down
+ * 0x02 Strobe
  * 0x0b Power enable
  * 0x0c Clock enable
  * 0x0d Privacy LED
@@ -331,6 +336,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
+	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
@@ -348,7 +354,13 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_PRIVACY_LED:
-			ret = skl_int3472_register_led(int3472, gpio, "privacy");
+			ret = skl_int3472_register_led(int3472, gpio, "privacy", true);
+			if (ret)
+				err_msg = "Failed to register LED\n";
+
+			break;
+		case INT3472_GPIO_TYPE_STROBE:
+			ret = skl_int3472_register_led(int3472, gpio, "strobe", false);
 			if (ret)
 				err_msg = "Failed to register LED\n";
 
@@ -422,7 +434,7 @@ void int3472_discrete_cleanup(struct int3472_discrete_device *int3472)
 	gpiod_remove_lookup_table(&int3472->gpios);
 
 	skl_int3472_unregister_clock(int3472);
-	skl_int3472_unregister_led(int3472);
+	skl_int3472_unregister_leds(int3472);
 	skl_int3472_unregister_regulator(int3472);
 }
 EXPORT_SYMBOL_NS_GPL(int3472_discrete_cleanup, "INTEL_INT3472_DISCRETE");
diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index 8222550..77f61a4 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -16,15 +16,17 @@ static int int3472_led_set(struct led_classdev *led_cdev,
 }
 
 int skl_int3472_register_led(struct int3472_discrete_device *int3472,
-			     struct gpio_desc *gpio, const char *name)
+			     struct gpio_desc *gpio, const char *name,
+			     bool has_lookup)
 {
-	struct int3472_led *led = &int3472->led;
+	struct int3472_led *led;
 	char *p;
 	int ret;
 
-	if (led->classdev.dev)
-		return -EBUSY;
+	if (int3472->n_leds >= INT3472_MAX_LEDS)
+		return -ENOSPC;
 
+	led = &int3472->leds[int3472->n_leds];
 	led->gpio = gpio;
 
 	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
@@ -42,22 +44,26 @@ int skl_int3472_register_led(struct int3472_discrete_device *int3472,
 	if (ret)
 		return ret;
 
-	led->lookup.provider = led->name;
-	led->lookup.dev_id = int3472->sensor_name;
-	led->lookup.con_id = "privacy";
-	led_add_lookup(&led->lookup);
+	if (has_lookup) {
+		led->lookup.provider = led->name;
+		led->lookup.dev_id = int3472->sensor_name;
+		led->lookup.con_id = name;
+		led_add_lookup(&led->lookup);
+		led->has_lookup = true;
+	}
 
+	int3472->n_leds++;
 	return 0;
 }
 
-void skl_int3472_unregister_led(struct int3472_discrete_device *int3472)
+void skl_int3472_unregister_leds(struct int3472_discrete_device *int3472)
 {
-	struct int3472_led *led = &int3472->led;
+	for (unsigned int i = 0; i < int3472->n_leds; i++) {
+		struct int3472_led *led = &int3472->leds[i];
 
-	if (IS_ERR_OR_NULL(led->classdev.dev))
-		return;
-
-	led_remove_lookup(&led->lookup);
-	led_classdev_unregister(&led->classdev);
-	gpiod_put(led->gpio);
+		if (led->has_lookup)
+			led_remove_lookup(&led->lookup);
+		led_classdev_unregister(&led->classdev);
+		gpiod_put(led->gpio);
+	}
 }
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index 3a077f4..540e3f2 100644
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
@@ -31,6 +32,7 @@
 
 #define INT3472_PDEV_MAX_NAME_LEN				23
 #define INT3472_MAX_SENSOR_GPIOS				3
+#define INT3472_MAX_LEDS					2
 #define INT3472_MAX_REGULATORS					3
 
 /* E.g. "avdd\0" */
@@ -126,12 +128,14 @@ struct int3472_discrete_device {
 		struct led_lookup_data lookup;
 		char name[INT3472_LED_MAX_NAME_LEN];
 		struct gpio_desc *gpio;
-	} led;
+		bool has_lookup;
+	} leds[INT3472_MAX_LEDS];
 
 	struct int3472_discrete_quirks quirks;
 
 	unsigned int ngpios; /* how many GPIOs have we seen */
 	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
+	unsigned int n_leds; /* how many LEDs have we registered */
 	unsigned int n_regulator_gpios; /* how many have we mapped to a regulator */
 	struct gpiod_lookup_table gpios;
 };
@@ -161,7 +165,8 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
 
 int skl_int3472_register_led(struct int3472_discrete_device *int3472,
-			     struct gpio_desc *gpio, const char *name);
-void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
+			     struct gpio_desc *gpio, const char *name,
+			     bool has_lookup);
+void skl_int3472_unregister_leds(struct int3472_discrete_device *int3472);
 
 #endif
-- 
2.47.3

