Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D0D3624C2;
	Fri, 27 Mar 2026 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635038; cv=none; b=YluyFLFXRWZXzlCYzsdjoVq4qDIG5OS3XBebPILuxndxogy2jvaw8mm9vP+WNnQ+5V50Q2c8vGDzk/EoAPSpzSfIO7n04cpgf7GF1lKEAdLhbpMQLVmQbw4jex8JbVn7NGkkJ+bcZM/kDmj+sUaI2ftwEK09d2Y+D2+MUDnTGjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635038; c=relaxed/simple;
	bh=GPBmiZS7ve18pxlg6BxIAXv/Vv66+opA+KYdFpG0Hlc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NrPgVCcRO4/ubHxi/HIjikMnaa22vGQ1qV9c+QwXQcjjRVtiKxfhu3fvdJW23Xqn13OQJBW2OC8oSOPKx6CNbsSwRxWIMTL3ymqwrhShpSyrHVJuzqbQaIJiiwR3m0DyvXQ0XdzKQjvTVkGvG/nYMrB5NbdFdT6/wMAWGsM/PfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=i2aDwtmd; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="i2aDwtmd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QGC7ldH3ILLghnQtQzgtvz8BDZPw0m49fZl+qO4/4kM=; b=i2aDwtmd7m6eqTDez1hg90gh7w
	pxLWt61xIRBewPK4qHEeh3+MFKgSztJOKL2cQPw+FAnvGcoQHRihdWQbZfHz8/dzWbcsso2KQ/Bh1
	cwDmlVESHlMKiJk0W5CBCOhHRhCPYGJyvL1nj6O4YQDauuZ8a3jCLUwUB8d/8V2DVQMw=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w6Bdf-006FSD-2Z;
	Fri, 27 Mar 2026 19:10:31 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v5 2/4] platform/x86: int3472: Rename pled to led in LED registration code
Date: Fri, 27 Mar 2026 19:10:29 +0100
Message-Id: <20260327181031.1489365-3-mnencia@kcore.it>
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

Rename the privacy LED functions, struct type and member from
pled/int3472_pled/register_pled to led/int3472_led/register_led to
prepare for supporting additional LED types (e.g. strobe/IR flood).

No functional change.

Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 drivers/platform/x86/intel/int3472/discrete.c |  4 +-
 drivers/platform/x86/intel/int3472/led.c      | 48 +++++++++----------
 include/linux/platform_data/x86/int3472.h     |  8 ++--
 3 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 1505fc3..cb24763 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -348,7 +348,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_PRIVACY_LED:
-			ret = skl_int3472_register_pled(int3472, gpio);
+			ret = skl_int3472_register_led(int3472, gpio);
 			if (ret)
 				err_msg = "Failed to register LED\n";
 
@@ -422,7 +422,7 @@ void int3472_discrete_cleanup(struct int3472_discrete_device *int3472)
 	gpiod_remove_lookup_table(&int3472->gpios);
 
 	skl_int3472_unregister_clock(int3472);
-	skl_int3472_unregister_pled(int3472);
+	skl_int3472_unregister_led(int3472);
 	skl_int3472_unregister_regulator(int3472);
 }
 EXPORT_SYMBOL_NS_GPL(int3472_discrete_cleanup, "INTEL_INT3472_DISCRETE");
diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index 4c52f99..8e92e8e 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -6,57 +6,57 @@
 #include <linux/leds.h>
 #include <linux/platform_data/x86/int3472.h>
 
-static int int3472_pled_set(struct led_classdev *led_cdev,
-			    enum led_brightness brightness)
+static int int3472_led_set(struct led_classdev *led_cdev,
+			   enum led_brightness brightness)
 {
-	struct int3472_pled *pled = container_of(led_cdev, struct int3472_pled, classdev);
+	struct int3472_led *led = container_of(led_cdev, struct int3472_led, classdev);
 
-	gpiod_set_value_cansleep(pled->gpio, brightness);
+	gpiod_set_value_cansleep(led->gpio, brightness);
 	return 0;
 }
 
-int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
+int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
 {
-	struct int3472_pled *pled = &int3472->pled;
+	struct int3472_led *led = &int3472->led;
 	char *p;
 	int ret;
 
-	if (pled->classdev.dev)
+	if (led->classdev.dev)
 		return -EBUSY;
 
-	pled->gpio = gpio;
+	led->gpio = gpio;
 
 	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
-	snprintf(pled->name, sizeof(pled->name),
+	snprintf(led->name, sizeof(led->name),
 		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
-	p = strchr(pled->name, ':');
+	p = strchr(led->name, ':');
 	if (p)
 		*p = '_';
 
-	pled->classdev.name = pled->name;
-	pled->classdev.max_brightness = 1;
-	pled->classdev.brightness_set_blocking = int3472_pled_set;
+	led->classdev.name = led->name;
+	led->classdev.max_brightness = 1;
+	led->classdev.brightness_set_blocking = int3472_led_set;
 
-	ret = led_classdev_register(int3472->dev, &pled->classdev);
+	ret = led_classdev_register(int3472->dev, &led->classdev);
 	if (ret)
 		return ret;
 
-	pled->lookup.provider = pled->name;
-	pled->lookup.dev_id = int3472->sensor_name;
-	pled->lookup.con_id = "privacy";
-	led_add_lookup(&pled->lookup);
+	led->lookup.provider = led->name;
+	led->lookup.dev_id = int3472->sensor_name;
+	led->lookup.con_id = "privacy";
+	led_add_lookup(&led->lookup);
 
 	return 0;
 }
 
-void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
+void skl_int3472_unregister_led(struct int3472_discrete_device *int3472)
 {
-	struct int3472_pled *pled = &int3472->pled;
+	struct int3472_led *led = &int3472->led;
 
-	if (IS_ERR_OR_NULL(pled->classdev.dev))
+	if (IS_ERR_OR_NULL(led->classdev.dev))
 		return;
 
-	led_remove_lookup(&pled->lookup);
-	led_classdev_unregister(&pled->classdev);
-	gpiod_put(pled->gpio);
+	led_remove_lookup(&led->lookup);
+	led_classdev_unregister(&led->classdev);
+	gpiod_put(led->gpio);
 }
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index b1b8375..7af6731 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -121,12 +121,12 @@ struct int3472_discrete_device {
 		u8 imgclk_index;
 	} clock;
 
-	struct int3472_pled {
+	struct int3472_led {
 		struct led_classdev classdev;
 		struct led_lookup_data lookup;
 		char name[INT3472_LED_MAX_NAME_LEN];
 		struct gpio_desc *gpio;
-	} pled;
+	} led;
 
 	struct int3472_discrete_quirks quirks;
 
@@ -160,7 +160,7 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   const char *second_sensor);
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
 
-int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gpio_desc *gpio);
-void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472);
+int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio);
+void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
 
 #endif
-- 
2.47.3

