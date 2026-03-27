Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636D73D9044;
	Fri, 27 Mar 2026 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602487; cv=none; b=YI3s+fBw7BQc2PluPWA8Hjhmwz7AB5JMd4+qaJiBGOfNEnJZcYTqzui1Ux0GEXX7I++/SbUArVst62rxFI4WwjkzsAsJsxu4p1nknl4Yni0Q2vTsEEKFZpqJ1Lb+k4O21fUwMvQlVUx1l6hqI5Alxr9x3JYG8DI0TBRRDn6ws5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602487; c=relaxed/simple;
	bh=IW8wT+nYV2b3gblOL+QMjAa4/8maVyR/QCWIP2hCZS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MkjBnt4g66daA2R5wvzKEGa3xcPBz3BCI/43xkVE6Jz1Fzqps6JCF5RtLNJ3EnOB+gXeZ4mQNJraMYSXdrbxItpEiRjeHIjCZonu3f+Pn9K8Sx6HY2mjtLLDgUJT8Av4YMkKS2Ns9rUvolw9RrIBnp8PuWIQShb14SnEfYN6Kig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=FS76bz0i; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="FS76bz0i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SrNwU+vCM7AcLOv3Lgv7rg4YZN7d0YGaFgHQS2YG+cM=; b=FS76bz0i2FHmjP+4C5riFTJdHy
	ehYSjh0NTStdL/bH8BO+hHJwZBE1CtMcIuvO88n23B3SfwSE32TJuCfE4lIS2bTAwFAzVjdg30JiJ
	WOQ1gTdz/RCiqjXf4fNPU74O8S3F5aVvZ2e/WUMVGwsiX3SNtb2iNuQ+ESAvLodBevjE=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w63AX-006DOh-30;
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
Subject: [PATCH v4 4/4] platform/x86: int3472: Add support for GPIO type 0x02 (strobe LED)
Date: Fri, 27 Mar 2026 10:07:53 +0100
Message-Id: <20260327090753.1481453-5-mnencia@kcore.it>
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

Some ACPI INT3472 devices include a GPIO with DSM type 0x02, used for
IR flood (strobe) illumination. This GPIO type was previously
unhandled, resulting in the following warning during probe:

  int3472-discrete INT3472:00: GPIO type 0x02 unknown; the sensor
  may not work

Add INT3472_GPIO_TYPE_STROBE (0x02) handling that registers the GPIO
as an LED class device via skl_int3472_register_led(). Unlike the
privacy LED, the strobe LED is not consumed by the sensor driver, so
no LED lookup is registered.

Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 drivers/platform/x86/intel/int3472/discrete.c | 13 +++++++++++++
 drivers/platform/x86/intel/int3472/led.c      |  2 ++
 include/linux/platform_data/x86/int3472.h     |  2 ++
 3 files changed, 17 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 2c554a0..03f0b49 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -207,6 +207,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "powerdown";
 		*gpio_flags = GPIO_ACTIVE_LOW;
 		break;
+	case INT3472_GPIO_TYPE_STROBE:
+		*con_id = "strobe";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
 		*con_id = "clk-enable";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -248,6 +252,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
  *
  * 0x00 Reset
  * 0x01 Power down
+ * 0x02 Strobe (IR flood LED)
  * 0x0b Power enable
  * 0x0c Clock enable
  * 0x0d Privacy LED
@@ -329,6 +334,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 			err_msg = "Failed to map GPIO pin to sensor\n";
 
 		break;
+	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
@@ -353,6 +359,13 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 			if (ret)
 				err_msg = "Failed to register privacy LED\n";
 
+			break;
+		case INT3472_GPIO_TYPE_STROBE:
+			ret = skl_int3472_register_led(int3472, gpio,
+						       INT3472_LED_TYPE_STROBE);
+			if (ret)
+				err_msg = "Failed to register strobe LED\n";
+
 			break;
 		case INT3472_GPIO_TYPE_POWER_ENABLE:
 			second_sensor = int3472->quirks.avdd_second_sensor;
diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index 33b30f3..e6faba4 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -8,10 +8,12 @@
 
 static const char * const int3472_led_names[] = {
 	[INT3472_LED_TYPE_PRIVACY] = "privacy",
+	[INT3472_LED_TYPE_STROBE]  = "strobe",
 };
 
 static const char * const int3472_led_con_ids[] = {
 	[INT3472_LED_TYPE_PRIVACY] = "privacy",
+	[INT3472_LED_TYPE_STROBE]  = NULL,
 };
 
 static int int3472_led_set(struct led_classdev *led_cdev,
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index b6b5b36..9893711 100644
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
@@ -71,6 +72,7 @@
 
 enum int3472_led_type {
 	INT3472_LED_TYPE_PRIVACY,
+	INT3472_LED_TYPE_STROBE,
 };
 
 struct acpi_device;
-- 
2.47.3

