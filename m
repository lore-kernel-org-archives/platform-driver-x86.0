Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C8B3CBE7B;
	Fri, 27 Mar 2026 09:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602486; cv=none; b=OQ3/3z7nOdVVRTkZozfUWiURV0Wxd8Ol08amBuUXkDBTzqkO8V/n2CEmo7cXRQasdiFxz+SMFKpOr42hQhk3DqUvNqdFyGGmUscRMf5cBX7mzzC+x6oGZSDJUhZAxXVeXDkoG3HsCUwuVSukpe8mf+IOGkg1uEnMAoIUhB4h8Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602486; c=relaxed/simple;
	bh=Ek3RQBJS4GldWcR+pLKBbICkdXVZvaSCJB2fF+gq6xk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ny87GGRkaeyqmlRzjxanyx2dSyefwdvnB5MMNSHRpRupDYb9GXkflv0kAXRqsGvpuVUn4IO7ig2dnTCWJMPqEVTVytd8HaaOKiwVyF43+RuxUR83L+HLrUZAEnm+uYr1E569Z3xfCxik0ECcUEV4dfWkhCrnWvMWGBO2h2xf71A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=cg0npDY6; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="cg0npDY6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2CKVQnngKqFun6UF1jGBD+/ololOhltgTZvoG15RPpI=; b=cg0npDY6yynhM8rTCFJyb3yOWi
	QxvoUBCtjLKqWB2Zryn843BcTytCtku34zdpOt3ZpDqGmVVoRHffRj+IRtqgfYCV2upXILcBDUawm
	R3mHy8BlyBiCeSGYoTuZK20oBNJKP5hyI8kNYNq8dkfmiZ/MV+yF3kRwVixvKr27mVXo=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w63AX-006DOe-2v;
	Fri, 27 Mar 2026 10:07:53 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v4 3/4] platform/x86: int3472: Introduce LED type enum and multi-LED support
Date: Fri, 27 Mar 2026 10:07:52 +0100
Message-Id: <20260327090753.1481453-4-mnencia@kcore.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260327090753.1481453-1-mnencia@kcore.it>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327090753.1481453-1-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an enum int3472_led_type to parameterize LED registration, and
lookup tables to derive the LED name suffix and con_id from the type.
This replaces the hardcoded "privacy" name and prepares for additional
LED types.

Convert the single struct int3472_led member to an array with a
counter to support devices with multiple LEDs. The LED lookup is now
conditionally registered based on the con_id lookup table entry, and
a has_lookup flag tracks whether to remove it during cleanup.

Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 drivers/platform/x86/intel/int3472/discrete.c |  7 +--
 drivers/platform/x86/intel/int3472/led.c      | 51 +++++++++++++------
 include/linux/platform_data/x86/int3472.h     | 15 ++++--
 3 files changed, 51 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index cb24763..2c554a0 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -348,9 +348,10 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_PRIVACY_LED:
-			ret = skl_int3472_register_led(int3472, gpio);
+			ret = skl_int3472_register_led(int3472, gpio,
+						       INT3472_LED_TYPE_PRIVACY);
 			if (ret)
-				err_msg = "Failed to register LED\n";
+				err_msg = "Failed to register privacy LED\n";
 
 			break;
 		case INT3472_GPIO_TYPE_POWER_ENABLE:
@@ -422,7 +423,7 @@ void int3472_discrete_cleanup(struct int3472_discrete_device *int3472)
 	gpiod_remove_lookup_table(&int3472->gpios);
 
 	skl_int3472_unregister_clock(int3472);
-	skl_int3472_unregister_led(int3472);
+	skl_int3472_unregister_leds(int3472);
 	skl_int3472_unregister_regulator(int3472);
 }
 EXPORT_SYMBOL_NS_GPL(int3472_discrete_cleanup, "INTEL_INT3472_DISCRETE");
diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index efbb02c..33b30f3 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -6,6 +6,14 @@
 #include <linux/leds.h>
 #include <linux/platform_data/x86/int3472.h>
 
+static const char * const int3472_led_names[] = {
+	[INT3472_LED_TYPE_PRIVACY] = "privacy",
+};
+
+static const char * const int3472_led_con_ids[] = {
+	[INT3472_LED_TYPE_PRIVACY] = "privacy",
+};
+
 static int int3472_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness brightness)
 {
@@ -16,20 +24,25 @@ static int int3472_led_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
-int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
+int skl_int3472_register_led(struct int3472_discrete_device *int3472,
+			     struct gpio_desc *gpio,
+			     enum int3472_led_type type)
 {
-	struct int3472_led *led = &int3472->led;
+	const char *name_suffix = int3472_led_names[type];
+	const char *con_id = int3472_led_con_ids[type];
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
 	snprintf(led->name, sizeof(led->name),
-		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
+		 "%s::%s_led", acpi_dev_name(int3472->sensor), name_suffix);
 	p = strchr(led->name, ':');
 	if (p)
 		*p = '_';
@@ -42,22 +55,28 @@ int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpi
 	if (ret)
 		return ret;
 
-	led->lookup.provider = led->name;
-	led->lookup.dev_id = int3472->sensor_name;
-	led->lookup.con_id = "privacy";
-	led_add_lookup(&led->lookup);
+	if (con_id) {
+		led->lookup.provider = led->name;
+		led->lookup.dev_id = int3472->sensor_name;
+		led->lookup.con_id = con_id;
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
+	unsigned int i;
 
-	if (IS_ERR_OR_NULL(led->classdev.dev))
-		return;
+	for (i = 0; i < int3472->n_leds; i++) {
+		struct int3472_led *led = &int3472->leds[i];
 
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
index 7af6731..b6b5b36 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -49,6 +49,7 @@
 #define GPIO_REGULATOR_OFF_ON_DELAY				(2 * USEC_PER_MSEC)
 
 #define INT3472_LED_MAX_NAME_LEN				32
+#define INT3472_MAX_LEDS					2
 
 #define CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET			86
 
@@ -68,6 +69,10 @@
 #define to_int3472_device(clk)					\
 	container_of(clk, struct int3472_discrete_device, clock)
 
+enum int3472_led_type {
+	INT3472_LED_TYPE_PRIVACY,
+};
+
 struct acpi_device;
 struct dmi_system_id;
 struct i2c_client;
@@ -126,7 +131,9 @@ struct int3472_discrete_device {
 		struct led_lookup_data lookup;
 		char name[INT3472_LED_MAX_NAME_LEN];
 		struct gpio_desc *gpio;
-	} led;
+		bool has_lookup;
+	} leds[INT3472_MAX_LEDS];
+	unsigned int n_leds;
 
 	struct int3472_discrete_quirks quirks;
 
@@ -160,7 +167,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   const char *second_sensor);
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
 
-int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio);
-void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
+int skl_int3472_register_led(struct int3472_discrete_device *int3472,
+			     struct gpio_desc *gpio,
+			     enum int3472_led_type type);
+void skl_int3472_unregister_leds(struct int3472_discrete_device *int3472);
 
 #endif
-- 
2.47.3

