Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BFA3C9EF0;
	Fri, 27 Mar 2026 09:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602486; cv=none; b=YJqDHDNbNnChHKlJaKENDSiD8fFiGC1vI6yxLGZbGS8BmhQyy45B7dNGjOfxt7rDdanSlg0fzQBUiOmo1JXzQ8gLuFPq3IS/xl0QWV/WAVImsRnvwAlo+R6M7k/U98pEoKcUK/DjRDdjWxvThZFVvKtz+POZPrjSn6UsQWApdjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602486; c=relaxed/simple;
	bh=CvC61XeMVwlPFf3renEnnynRkbtgGOutbfE6em4sng0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jQFE6tyMNn5WNMhC9evZsZfMnEWeSv14ehmNZDZDjQ9HuuwUyQzNvDzAeFjAzETdWeTPCpFwc7DX9Wa1q511iqytcDdOLFY0f8k9eu6zm/cEpwbbBO4GH2UhaZmR+V7GHu2265sWn/dBkzt4ZAokluhd0owB5mUFAaBPjyjAKk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=zBocX4kN; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="zBocX4kN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gdL6TF00khNTCDWH0opWEdKAuryG3EP0C3qV+jSMD8Q=; b=zBocX4kNgp0Gv+ASIQ7OTCWunI
	zs2ESzTkFi59YiH5M+b+3/Ao9p9CwxiZXdETycUNoYC5N5M6vAbZ10w368g20sCrL8QAZpZ80j9UK
	LLjCIISHJ/UGbtgT3Zw8v4gtd+Wt4JKWS99z7D3dq+avDUtorJ2LHrWDqEeBye493aHY=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w63AX-006DOb-2q;
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
Subject: [PATCH v4 2/4] platform/x86: int3472: Use local variable for LED struct access
Date: Fri, 27 Mar 2026 10:07:51 +0100
Message-Id: <20260327090753.1481453-3-mnencia@kcore.it>
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

Introduce a local struct int3472_led pointer in the LED registration
and unregistration functions to avoid repeatedly dereferencing
int3472->led. In the brightness callback, use container_of to get the
int3472_led struct directly instead of going through
int3472_discrete_device.

No functional change.

Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 drivers/platform/x86/intel/int3472/led.c | 43 +++++++++++++-----------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index ccd51f2..efbb02c 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -7,54 +7,57 @@
 #include <linux/platform_data/x86/int3472.h>
 
 static int int3472_led_set(struct led_classdev *led_cdev,
-				     enum led_brightness brightness)
+			   enum led_brightness brightness)
 {
-	struct int3472_discrete_device *int3472 =
-		container_of(led_cdev, struct int3472_discrete_device, led.classdev);
+	struct int3472_led *led =
+		container_of(led_cdev, struct int3472_led, classdev);
 
-	gpiod_set_value_cansleep(int3472->led.gpio, brightness);
+	gpiod_set_value_cansleep(led->gpio, brightness);
 	return 0;
 }
 
 int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
 {
+	struct int3472_led *led = &int3472->led;
 	char *p;
 	int ret;
 
-	if (int3472->led.classdev.dev)
+	if (led->classdev.dev)
 		return -EBUSY;
 
-	int3472->led.gpio = gpio;
+	led->gpio = gpio;
 
 	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
-	snprintf(int3472->led.name, sizeof(int3472->led.name),
+	snprintf(led->name, sizeof(led->name),
 		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
-	p = strchr(int3472->led.name, ':');
+	p = strchr(led->name, ':');
 	if (p)
 		*p = '_';
 
-	int3472->led.classdev.name = int3472->led.name;
-	int3472->led.classdev.max_brightness = 1;
-	int3472->led.classdev.brightness_set_blocking = int3472_led_set;
+	led->classdev.name = led->name;
+	led->classdev.max_brightness = 1;
+	led->classdev.brightness_set_blocking = int3472_led_set;
 
-	ret = led_classdev_register(int3472->dev, &int3472->led.classdev);
+	ret = led_classdev_register(int3472->dev, &led->classdev);
 	if (ret)
 		return ret;
 
-	int3472->led.lookup.provider = int3472->led.name;
-	int3472->led.lookup.dev_id = int3472->sensor_name;
-	int3472->led.lookup.con_id = "privacy";
-	led_add_lookup(&int3472->led.lookup);
+	led->lookup.provider = led->name;
+	led->lookup.dev_id = int3472->sensor_name;
+	led->lookup.con_id = "privacy";
+	led_add_lookup(&led->lookup);
 
 	return 0;
 }
 
 void skl_int3472_unregister_led(struct int3472_discrete_device *int3472)
 {
-	if (IS_ERR_OR_NULL(int3472->led.classdev.dev))
+	struct int3472_led *led = &int3472->led;
+
+	if (IS_ERR_OR_NULL(led->classdev.dev))
 		return;
 
-	led_remove_lookup(&int3472->led.lookup);
-	led_classdev_unregister(&int3472->led.classdev);
-	gpiod_put(int3472->led.gpio);
+	led_remove_lookup(&led->lookup);
+	led_classdev_unregister(&led->classdev);
+	gpiod_put(led->gpio);
 }
-- 
2.47.3

