Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01F932A3C9;
	Tue, 31 Mar 2026 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964691; cv=none; b=rfxiyVEyCmQB92ftiiBWWTZV3qxDbc3d8g93SzzEby/YbTs6566TEBm3/ncqqtOE1vFcKUYlZgbTY5ZjVuycYBAwCErqyFSmLZz+OukT7w85UGEnuzbZFCukQRAyv6gE2CWAukqU+P7alereb+B3aovuJMx54smhTcm8qSCV55o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964691; c=relaxed/simple;
	bh=A3e+BLkG9hpZ9AKeuR3iaXUiE5L4qhFf3wTO0MEQ2js=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IRBHE8+r/S6F4csVzRtoCwLnyqxsz9zaSlUTS9wnLugOVJU1rFEesz/MQLRtQZPmVfjuXKKJCwit+yoBqXQG1LBIEdVZPCUkJmm5+SHSWL8/ELNY2nGh8sCHE/9sHW535jZ9dXxc4J8TrMJmryk1T8NL9PUljRCzTRRRWwMqcks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=VsgwQx7i; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="VsgwQx7i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Btnx7IB6AO2Zoa+deZaSHaRKbvxZGPAPqUcGCaoOowQ=; b=VsgwQx7iCaIWEcryVIR9wVf4KA
	Z/lanBOZteptkLef0Pszf+k9+v2PprRMDA/ATsRFIYgu0He99lvHItfs/X7B7DtTcE8L8g3f27toM
	q0KBvFWr0n3s4O/H4BpWhuMx42kORMuVVE+2X0T0VuVuiHOzAF08+NXCB582CBOAzRjQ=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7ZOd-006bDy-0L;
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
Subject: [PATCH v7 1/4] platform/x86: int3472: Use local variable for LED struct access
Date: Tue, 31 Mar 2026 15:44:40 +0200
Message-Id: <20260331134443.1573053-2-mnencia@kcore.it>
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

Introduce a local struct int3472_pled pointer in the LED registration,
unregistration, and brightness callback functions to avoid repeatedly
dereferencing int3472->pled. In the brightness callback, use
container_of() to get the int3472_pled struct directly instead of
going through int3472_discrete_device.

No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 drivers/platform/x86/intel/int3472/led.c | 43 ++++++++++++------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index b1d84b9..35abad9 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -6,55 +6,56 @@
 #include <linux/leds.h>
 #include <linux/platform_data/x86/int3472.h>
 
-static int int3472_pled_set(struct led_classdev *led_cdev,
-				     enum led_brightness brightness)
+static int int3472_pled_set(struct led_classdev *led_cdev, enum led_brightness brightness)
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

