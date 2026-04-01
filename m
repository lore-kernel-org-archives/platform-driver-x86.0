Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB9A35DA7F;
	Wed,  1 Apr 2026 20:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075807; cv=none; b=LBFkYPsJh8aAJ2R4mTIamOIUKNtK2MaQCvx13xrCN8z4VxMEFn9yFF3Stvzf9ouLP5JPljJJUxx6/vGBhqrkScpB4QS5cqkeZ+UFnEkML1VhDNd/0WnLrgsYS/kCIf8opj/fPEQpYLI9pAGOrEOf9QmIQ9emanbmXv3gZzKk/UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075807; c=relaxed/simple;
	bh=gPlBX4zOHimo90WEB16/vQdW+j5FCKP9gW8J1WNT3Eg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ArgbzDQAn8HSnT+9U/69eTSQFZKrhYGybiA8nKvgFuBw5VKQ6+/htc+zBXSUhopVyvsXgmaN8rPSfuktV/N016de0QaCSsWF9rrRQPVflFH3hqYs6l1bM+gs3d2otoXLzfHAt3+2n42NAsfgNzYo7xULlgugIOY/EvQPrfuRSZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=JSLW4LGt; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="JSLW4LGt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IA41wtT5V5rXIBop4HcpbrrSYwWN4RGD30edsVoVwa4=; b=JSLW4LGtkJ8y6staZnx+6qrXDI
	DKwqJ2NkMcq7+ix/J2lpDfFP/WvFnLloN/bncCUxuBuvzZPaN15MUWvbYQ/O6nFBCRIElU9j+52MI
	DFnOCy5DAmJZ+6zTeUaqObOud0xQ1RCvfsJcGVzoiRLlskRf909l/yq9bSvc0BOmw/tY=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w82Io-006ifX-2H;
	Wed, 01 Apr 2026 22:36:38 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v8 4/4] platform/x86: int3472: Add support for GPIO type 0x02 (IR flood LED)
Date: Wed,  1 Apr 2026 22:36:38 +0200
Message-Id: <20260401203638.1601661-5-mnencia@kcore.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260401203638.1601661-1-mnencia@kcore.it>
References: <20260401203638.1601661-1-mnencia@kcore.it>
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
privacy LED, including a lookup entry to allow future consumer drivers
to find and control it via led_get().

To support multiple LEDs per INT3472 device, convert the single led
struct member to an array with a counter.

Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
Changes in v8:
- Always register the LED lookup for ir_flood too, removing the type
  parameter and conditional switch-case (Hans de Goede, Andy Shevchenko).

The ACPI _DSM tables refer to this GPIO type as "strobe", hence the
INT3472_GPIO_TYPE_STROBE define. The userspace-visible LED name uses
"ir_flood" instead, as the hardware is an IR flood illuminator, not a
flash strobe.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>
 drivers/platform/x86/intel/int3472/discrete.c |  9 +++++++-
 drivers/platform/x86/intel/int3472/led.c      | 23 ++++++++++---------
 include/linux/platform_data/x86/int3472.h     |  7 ++++--
 3 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index a45a93093..a675e8f4c 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -215,6 +215,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "privacy";
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
@@ -348,6 +354,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_PRIVACY_LED:
+		case INT3472_GPIO_TYPE_STROBE:
 			ret = skl_int3472_register_led(int3472, gpio, con_id);
 			if (ret)
 				err_msg = "Failed to register LED\n";
@@ -422,7 +429,7 @@ void int3472_discrete_cleanup(struct int3472_discrete_device *int3472)
 	gpiod_remove_lookup_table(&int3472->gpios);
 
 	skl_int3472_unregister_clock(int3472);
-	skl_int3472_unregister_led(int3472);
+	skl_int3472_unregister_leds(int3472);
 	skl_int3472_unregister_regulator(int3472);
 }
 EXPORT_SYMBOL_NS_GPL(int3472_discrete_cleanup, "INTEL_INT3472_DISCRETE");
diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index 22d0d6c5e..9b2573cc3 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -17,13 +17,14 @@ static int int3472_led_set(struct led_classdev *led_cdev, enum led_brightness br
 int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio,
 			     const char *con_id)
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
@@ -46,17 +47,17 @@ int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpi
 	led->lookup.con_id = con_id;
 	led_add_lookup(&led->lookup);
 
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
+		led_remove_lookup(&led->lookup);
+		led_classdev_unregister(&led->classdev);
+		gpiod_put(led->gpio);
+	}
 }
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index 3ba0d5646..c597f37e9 100644
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
@@ -162,6 +165,6 @@ void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
 
 int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio,
 			     const char *con_id);
-void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
+void skl_int3472_unregister_leds(struct int3472_discrete_device *int3472);
 
 #endif
-- 
2.47.3

