Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345863CD8BE;
	Tue, 31 Mar 2026 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943531; cv=none; b=mvDSyaoLwaUuZaVKzRs+42Dugh5o2SWa5UB36Bj+R1oqWnz3LnkiCyxGJS2pWQqH+6T8wUuYgfBA1FVGOxNP/d8cLJaROrwo35YbPi/mln+DkrsyPllLiDagoZdl4iJ4GBxM+22g65v74aGy80+SSTpH1X+YpK6BE5oM+UJxiBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943531; c=relaxed/simple;
	bh=2qXKWqVqgm/7crcPDCVD5wGUmdAXHS24+CCFfwmlnDA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SdksGnKg+KSRvr9TPuZbSujyBDE6fSL1VK7rumyiiwRmjKK6ZU0zE7uq8qrQhN7++q4lyaKFjUFXXCKadLGAz/pBdOZS6nY+tR/p6u5dx5XBZskTbqGBK14v02wYnJ32IleKjxACMnDARjV8xg+TskLRyRsHvG2SmRmUH0N1EXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=V+aTdJAx; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="V+aTdJAx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NpriGdcD5NbsT32LA4dS/KzK3W30O4gcHtIkK8mv3SI=; b=V+aTdJAxlu4WcktRFDDSSjE0yf
	zEa+laAxGRMfHhyb6uM9V8EmbAzemhJRfPomAapXUghVeZrpqVnCL4thGLkiL0BT5sVX5cJ8zpVrz
	IYRzuUeUEqL4NHDok6j0TRvtK+4b/XJ6998SWWhxCNYa4MHwEK+sHlqapNetRbcRj7Cw=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7TtN-006ZoY-0L;
	Tue, 31 Mar 2026 09:52:05 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v6 4/4] platform/x86: int3472: Add support for GPIO type 0x02 (IR flood LED)
Date: Tue, 31 Mar 2026 09:52:04 +0200
Message-Id: <20260331075204.1567624-5-mnencia@kcore.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260331075204.1567624-1-mnencia@kcore.it>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260331075204.1567624-1-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for GPIO type 0x02, which controls an IR flood LED used
for face authentication on some laptops (e.g. Dell Pro Max 16 Premium).

Without this patch, the kernel logs "GPIO type 0x02 unknown; the sensor
may not work" and IR sensors paired with a flood LED cannot function.

The flood LED is registered through the LED subsystem like the existing
privacy LED. Unlike the privacy LED, it does not have a lookup entry
since there is no consumer driver expecting it via led_get().

To support multiple LEDs per INT3472 device, convert the single led
struct member to an array with a counter.

Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---

The ACPI _DSM tables refer to this GPIO type as "strobe", hence the
INT3472_GPIO_TYPE_STROBE define. The userspace-visible LED name uses
"ir_flood" instead, as the hardware is an IR flood illuminator, not a
flash strobe.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 drivers/platform/x86/intel/int3472/discrete.c | 16 +++++++-
 drivers/platform/x86/intel/int3472/led.c      | 39 +++++++++++--------
 include/linux/platform_data/x86/int3472.h     | 10 +++--
 3 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 57c3b2c..78111e5 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -215,6 +215,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "privacy-led";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_STROBE:
+		*con_id = "ir_flood";
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
+			ret = skl_int3472_register_led(int3472, gpio, "ir_flood", false);
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
index 39466d4..e7cd144 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -4,6 +4,7 @@
 #include <linux/acpi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/leds.h>
+#include <linux/list.h>
 #include <linux/platform_data/x86/int3472.h>
 
 static int int3472_led_set(struct led_classdev *led_cdev,
@@ -16,16 +17,19 @@ static int int3472_led_set(struct led_classdev *led_cdev,
 }
 
 int skl_int3472_register_led(struct int3472_discrete_device *int3472,
-			     struct gpio_desc *gpio, const char *con_id)
+			     struct gpio_desc *gpio, const char *con_id,
+			     bool add_lookup)
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
+	INIT_LIST_HEAD(&led->lookup.list);
 
 	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
 	snprintf(led->name, sizeof(led->name),
@@ -42,22 +46,25 @@ int skl_int3472_register_led(struct int3472_discrete_device *int3472,
 	if (ret)
 		return ret;
 
-	led->lookup.provider = led->name;
-	led->lookup.dev_id = int3472->sensor_name;
-	led->lookup.con_id = con_id;
-	led_add_lookup(&led->lookup);
+	if (add_lookup) {
+		led->lookup.provider = led->name;
+		led->lookup.dev_id = int3472->sensor_name;
+		led->lookup.con_id = con_id;
+		led_add_lookup(&led->lookup);
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
+		if (!list_empty(&led->lookup.list))
+			led_remove_lookup(&led->lookup);
+		led_classdev_unregister(&led->classdev);
+		gpiod_put(led->gpio);
+	}
 }
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index 5213911..7366a25 100644
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
@@ -126,11 +128,12 @@ struct int3472_discrete_device {
 		struct led_lookup_data lookup;
 		char name[INT3472_LED_MAX_NAME_LEN];
 		struct gpio_desc *gpio;
-	} led;
+	} leds[INT3472_MAX_LEDS];
 
 	struct int3472_discrete_quirks quirks;
 
 	unsigned int ngpios; /* how many GPIOs have we seen */
+	unsigned int n_leds; /* how many LEDs have we registered */
 	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
 	unsigned int n_regulator_gpios; /* how many have we mapped to a regulator */
 	struct gpiod_lookup_table gpios;
@@ -161,7 +164,8 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
 
 int skl_int3472_register_led(struct int3472_discrete_device *int3472,
-			     struct gpio_desc *gpio, const char *con_id);
-void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
+			     struct gpio_desc *gpio, const char *con_id,
+			     bool add_lookup);
+void skl_int3472_unregister_leds(struct int3472_discrete_device *int3472);
 
 #endif
-- 
2.47.3

