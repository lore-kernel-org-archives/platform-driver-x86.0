Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4E2277C9D;
	Tue, 31 Mar 2026 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964692; cv=none; b=JIr9Cxw4u2Cj8McFtRZXYTybA+8G8ixuTPIlibwN4Q8WxZAV7C3q71/qFZDc61+2iuczjTIxUBlxmonKXb2nzrNHWTao/lgCB6HMIFUQS2HlYtwc0UXC5hsVvHXcu9pyU8B6rCnC0DTbza0TWlEzmUebo2yfO0IDDyXodOKDNaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964692; c=relaxed/simple;
	bh=dwbTnMkeJpE+XMrqTGdWS1bzvb219GnFkqziQz5TiwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q2n/WGGMehasY2AvGHYRkYXs9qmThimeLgiAaDqSTH0r5zTSM3w1OpoBzg0QO50+p1WpT0Cv2VqlbQ60DTfIcN+y6q5UtYnaX7pcFYSF7xi/FIfumZXnBxeukyFtG0ARY2Is2BB93yisioTFQ6QztGhG8bw7Doej1QzPL46Betw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=OJpYzfj0; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="OJpYzfj0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9c1YyInYFbb6VlJbaDDEkj1V3e0aiQv3jLc++FeB8jw=; b=OJpYzfj00E+3nMx0TA9KWzacZ2
	CZRBQVobn0iC5IRAxupDW3V96UHkNqJG6SVjeyCmShvYbs+2UcbN5Hj8YHJr6zZd5+j4FHImpZXXt
	eouKmI2HRKhq8lBsDF4NjyaikXREYIo8UUER0zH0WGCwTRZsJ0bVOqpwwLNPm60db2Ug=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7ZOd-006bE1-0Q;
	Tue, 31 Mar 2026 15:44:43 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v7 2/4] platform/x86: int3472: Rename pled to led in LED registration code
Date: Tue, 31 Mar 2026 15:44:41 +0200
Message-Id: <20260331134443.1573053-3-mnencia@kcore.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260331134443.1573053-1-mnencia@kcore.it>
References: <20260331134443.1573053-1-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the privacy LED type, struct member, and functions from "pled"
to "led" in preparation for supporting additional LED types beyond
just the privacy LED.

No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 drivers/platform/x86/intel/int3472/discrete.c |  4 ++--
 drivers/platform/x86/intel/int3472/led.c      | 14 +++++++-------
 include/linux/platform_data/x86/int3472.h     |  8 ++++----
 3 files changed, 13 insertions(+), 13 deletions(-)

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
index 35abad9..fe412cb 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -6,17 +6,17 @@
 #include <linux/leds.h>
 #include <linux/platform_data/x86/int3472.h>
 
-static int int3472_pled_set(struct led_classdev *led_cdev, enum led_brightness brightness)
+static int int3472_led_set(struct led_classdev *led_cdev, enum led_brightness brightness)
 {
-	struct int3472_pled *led = container_of(led_cdev, struct int3472_pled, classdev);
+	struct int3472_led *led = container_of(led_cdev, struct int3472_led, classdev);
 
 	gpiod_set_value_cansleep(led->gpio, brightness);
 	return 0;
 }
 
-int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
+int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
 {
-	struct int3472_pled *led = &int3472->pled;
+	struct int3472_led *led = &int3472->led;
 	char *p;
 	int ret;
 
@@ -34,7 +34,7 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gp
 
 	led->classdev.name = led->name;
 	led->classdev.max_brightness = 1;
-	led->classdev.brightness_set_blocking = int3472_pled_set;
+	led->classdev.brightness_set_blocking = int3472_led_set;
 
 	ret = led_classdev_register(int3472->dev, &led->classdev);
 	if (ret)
@@ -48,9 +48,9 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gp
 	return 0;
 }
 
-void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
+void skl_int3472_unregister_led(struct int3472_discrete_device *int3472)
 {
-	struct int3472_pled *led = &int3472->pled;
+	struct int3472_led *led = &int3472->led;
 
 	if (IS_ERR_OR_NULL(led->classdev.dev))
 		return;
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

