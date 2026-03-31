Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23F43D75CF;
	Tue, 31 Mar 2026 07:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943535; cv=none; b=sT20Mzapz2RFHl/d8Bg8QMJfpRpLxZTROyuaBkvyGELTkQNOmvxYAY4EI3W0hHZ6pFW6kVG4vjJtX1G+UUzc1os1yMpRq3WbXcxvaN5lHJVBSP4IRTsbVC6/m1s5MGsli/5F/8tvijnryQzkPBmJgJV+rzRm0Y8gbPle8W3fZ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943535; c=relaxed/simple;
	bh=X8FBR4Kz7FmEdJLG7GWh2Z1f19493eUzRr9kNgYRx30=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MyC1iuBo4r6c3Y3kE4QS+o5GzUFpPEhU9/vicyo+jf7nHhNSDfiepDeciym3EagjVXo8hMcRJNuFLRq7KvDCL6mXH4cNHHaEpfxeZCyE7kSajeHyvJNVNcZ+bYsYEI3zGiiRbNBBLceS7NJWorEHtWdJ/L3pz4zCoof9s6FQ7R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=QDdT/ZMs; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="QDdT/ZMs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=A+gdA3VJhQR1GVOvTKFRBP67MbojnPhGodMPDkM3zfo=; b=QDdT/ZMsUJJqu0pZkuBcY1IEMp
	rRoW8TJmOSNN/7UjJ+iEJdWKaZDHi+4SgTlsOUvFFvemxs1XaSSSsTTAQfgvAY1jmfYgENDFzaqQB
	MBR4H0flc+ky2voxop6SH2TZDd5FhGZQzc8ybcfLt5tW5oMuLlYlLsctLAg1rqqqv82o=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7TtN-006ZoP-07;
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
Subject: [PATCH v6 1/4] platform/x86: int3472: Use local variable for LED struct access
Date: Tue, 31 Mar 2026 09:52:01 +0200
Message-Id: <20260331075204.1567624-2-mnencia@kcore.it>
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

Introduce a local struct int3472_pled pointer in the LED registration,
unregistration, and brightness callback functions to avoid repeatedly
dereferencing int3472->pled. In the brightness callback, use
container_of() to get the int3472_pled struct directly instead of
going through int3472_discrete_device.

No functional change.

Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 drivers/platform/x86/intel/int3472/led.c | 42 +++++++++++++-----------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index b1d84b9..86df81a 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -7,54 +7,56 @@
 #include <linux/platform_data/x86/int3472.h>
 
 static int int3472_pled_set(struct led_classdev *led_cdev,
-				     enum led_brightness brightness)
+			    enum led_brightness brightness)
 {
-	struct int3472_discrete_device *int3472 =
-		container_of(led_cdev, struct int3472_discrete_device, pled.classdev);
+	struct int3472_pled *led = container_of(led_cdev, struct int3472_pled, classdev);
 
-	gpiod_set_value_cansleep(int3472->pled.gpio, brightness);
+	gpiod_set_value_cansleep(led->gpio, brightness);
 	return 0;
 }
 
 int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
 {
+	struct int3472_pled *led = &int3472->pled;
 	char *p;
 	int ret;
 
-	if (int3472->pled.classdev.dev)
+	if (led->classdev.dev)
 		return -EBUSY;
 
-	int3472->pled.gpio = gpio;
+	led->gpio = gpio;
 
 	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
-	snprintf(int3472->pled.name, sizeof(int3472->pled.name),
+	snprintf(led->name, sizeof(led->name),
 		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
-	p = strchr(int3472->pled.name, ':');
+	p = strchr(led->name, ':');
 	if (p)
 		*p = '_';
 
-	int3472->pled.classdev.name = int3472->pled.name;
-	int3472->pled.classdev.max_brightness = 1;
-	int3472->pled.classdev.brightness_set_blocking = int3472_pled_set;
+	led->classdev.name = led->name;
+	led->classdev.max_brightness = 1;
+	led->classdev.brightness_set_blocking = int3472_pled_set;
 
-	ret = led_classdev_register(int3472->dev, &int3472->pled.classdev);
+	ret = led_classdev_register(int3472->dev, &led->classdev);
 	if (ret)
 		return ret;
 
-	int3472->pled.lookup.provider = int3472->pled.name;
-	int3472->pled.lookup.dev_id = int3472->sensor_name;
-	int3472->pled.lookup.con_id = "privacy";
-	led_add_lookup(&int3472->pled.lookup);
+	led->lookup.provider = led->name;
+	led->lookup.dev_id = int3472->sensor_name;
+	led->lookup.con_id = "privacy";
+	led_add_lookup(&led->lookup);
 
 	return 0;
 }
 
 void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
 {
-	if (IS_ERR_OR_NULL(int3472->pled.classdev.dev))
+	struct int3472_pled *led = &int3472->pled;
+
+	if (IS_ERR_OR_NULL(led->classdev.dev))
 		return;
 
-	led_remove_lookup(&int3472->pled.lookup);
-	led_classdev_unregister(&int3472->pled.classdev);
-	gpiod_put(int3472->pled.gpio);
+	led_remove_lookup(&led->lookup);
+	led_classdev_unregister(&led->classdev);
+	gpiod_put(led->gpio);
 }
-- 
2.47.3

