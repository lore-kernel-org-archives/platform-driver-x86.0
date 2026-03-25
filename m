Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F4430AAB8;
	Wed, 25 Mar 2026 22:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478310; cv=none; b=WMa0AsHfwZ4ev4L7FT4++qpfPzyIBgDmPshnbQSZ+ZTy1HKCtxo7Aeb4tGOEC5uL5K1ed2W63hUqPGAui5k4OM4ND2UxLyg3ezOJGp5rr1LfsPNsuJCtHBslqE53BGtDOc6B6e6UiH3s8ehAdaqP73Q9s+zTD0dkjIZQdc2qXak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478310; c=relaxed/simple;
	bh=XabR+D6caPVcw5pMeDJ0xbZ0klUbE5q5+/bGSg7MBHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tZhtq930F1qbkxmGwO05mA6num45juBlVxiHRoL6Cf9tabJITK4HrhIPDL9qeQ16wwDp/nKSjvn6a/V7pVDu4H0HqOMsll8sdhDrf5x7THwVfmTtNb3rI52z06TY+GLanKV/zHm7DaD1t4WU2RUF6RDMUd+RN5Br4E7KjVgWH9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=WQro1RRW; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="WQro1RRW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Yayt7xPdJdpEYZ0uw4TdYu5pmV+0IJBIHEA8MsGaG3c=; b=WQro1RRWQxDaYtBWScsF9+mnI0
	Vh3htoniJMWd8EJjUQ4WTKg1Mc089r7kjBr6DU56oTsxYndMJHwxPkfUeP+K9rVi2OnJhm6jFK8QN
	2Dt7LFGHCygDrJi6cqYbLVz36OFUPSUYRbKk9pWEhkXppptP+htxNxCUgsJ3Xnbg5MxI=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w5Wrn-0065Yj-0T;
	Wed, 25 Mar 2026 23:38:23 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v3 1/2] platform/x86: int3472: Rename pled to led in LED registration code
Date: Wed, 25 Mar 2026 23:38:22 +0100
Message-Id: <03e1e03a275915d41c6b705d61bbf318e7958029.1774477895.git.mnencia@kcore.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1774477895.git.mnencia@kcore.it>
References: <ab0URIrzZPsYjWrM@spark.kcore.it> <cover.1774477895.git.mnencia@kcore.it>
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

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
Changes in v3:
- New patch, split out from v2 single patch per Andy Shevchenko's request

 drivers/platform/x86/intel/int3472/discrete.c |  4 +-
 drivers/platform/x86/intel/int3472/led.c      | 45 ++++++++++---------
 include/linux/platform_data/x86/int3472.h     |  8 ++--
 3 files changed, 29 insertions(+), 28 deletions(-)

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
index b1d84b9..8b26929 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -6,55 +6,56 @@
 #include <linux/leds.h>
 #include <linux/platform_data/x86/int3472.h>
 
-static int int3472_pled_set(struct led_classdev *led_cdev,
-				     enum led_brightness brightness)
+static int int3472_led_set(struct led_classdev *led_cdev,
+			   enum led_brightness brightness)
 {
 	struct int3472_discrete_device *int3472 =
-		container_of(led_cdev, struct int3472_discrete_device, pled.classdev);
+		container_of(led_cdev, struct int3472_discrete_device, led.classdev);
 
-	gpiod_set_value_cansleep(int3472->pled.gpio, brightness);
+	gpiod_set_value_cansleep(int3472->led.gpio, brightness);
 	return 0;
 }
 
-int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
+int skl_int3472_register_led(struct int3472_discrete_device *int3472,
+			     struct gpio_desc *gpio)
 {
 	char *p;
 	int ret;
 
-	if (int3472->pled.classdev.dev)
+	if (int3472->led.classdev.dev)
 		return -EBUSY;
 
-	int3472->pled.gpio = gpio;
+	int3472->led.gpio = gpio;
 
 	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
-	snprintf(int3472->pled.name, sizeof(int3472->pled.name),
+	snprintf(int3472->led.name, sizeof(int3472->led.name),
 		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
-	p = strchr(int3472->pled.name, ':');
+	p = strchr(int3472->led.name, ':');
 	if (p)
 		*p = '_';
 
-	int3472->pled.classdev.name = int3472->pled.name;
-	int3472->pled.classdev.max_brightness = 1;
-	int3472->pled.classdev.brightness_set_blocking = int3472_pled_set;
+	int3472->led.classdev.name = int3472->led.name;
+	int3472->led.classdev.max_brightness = 1;
+	int3472->led.classdev.brightness_set_blocking = int3472_led_set;
 
-	ret = led_classdev_register(int3472->dev, &int3472->pled.classdev);
+	ret = led_classdev_register(int3472->dev, &int3472->led.classdev);
 	if (ret)
 		return ret;
 
-	int3472->pled.lookup.provider = int3472->pled.name;
-	int3472->pled.lookup.dev_id = int3472->sensor_name;
-	int3472->pled.lookup.con_id = "privacy";
-	led_add_lookup(&int3472->pled.lookup);
+	int3472->led.lookup.provider = int3472->led.name;
+	int3472->led.lookup.dev_id = int3472->sensor_name;
+	int3472->led.lookup.con_id = "privacy";
+	led_add_lookup(&int3472->led.lookup);
 
 	return 0;
 }
 
-void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
+void skl_int3472_unregister_led(struct int3472_discrete_device *int3472)
 {
-	if (IS_ERR_OR_NULL(int3472->pled.classdev.dev))
+	if (IS_ERR_OR_NULL(int3472->led.classdev.dev))
 		return;
 
-	led_remove_lookup(&int3472->pled.lookup);
-	led_classdev_unregister(&int3472->pled.classdev);
-	gpiod_put(int3472->pled.gpio);
+	led_remove_lookup(&int3472->led.lookup);
+	led_classdev_unregister(&int3472->led.classdev);
+	gpiod_put(int3472->led.gpio);
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

