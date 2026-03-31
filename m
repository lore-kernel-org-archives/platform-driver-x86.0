Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8403B314A82;
	Tue, 31 Mar 2026 13:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964691; cv=none; b=FJpnyL7uy8Pb2JAO2u0PKiqZ5bC2slcV+Fa8Bjy+ZjPXxCcrzSQKvPPM1syaLyxX1JW+h2KV0ggTPXd3b/7AoDxaxcbwiVcv+ah6vSVrDDHiMF287oxCCaZWLeq7osJYJMVSzkT6UkF1riR6EdQHFil73Zu37lw1WRxzJnBmsGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964691; c=relaxed/simple;
	bh=MGVmKIltC6US1u0PxFY+nZ4e39zPpw4O/NHwaCUJ0ac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oblXyOAfGBitHpKGw5psOUdSBMgIu9zyrAOAbzkrb8TxZoMVngkfe4CqxwN5m9pGKgsBAeDv0H3Gde5XkwBDHCGFZz9+SkUgMDWKGdmP6oAT172O54GX5pQVE4B++nENZPkYcgTF0DiJGlucMN1Wf9J4d0T8MKFZ/y28JNW4Nfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=x7GXQdPf; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="x7GXQdPf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gDpf551a8GS9WBj/Aok1/LjwjEHJCbXgl64dmqTj+g4=; b=x7GXQdPfLKAPqQy7E0QPD5f9Je
	Y0CIKwOWMh4sIX/Ef4fxfd9FGmR8Iiai6qf6dUCNYLlEJdJV1ysdCVSUlYdkcrWxXFG3FerdVpwGA
	NBZAZCut7a1JR1CoVXvntOLkNqQk8tep4ukfTKnURJGATnt6gG1V0ClnJZl5JQWyxkGs=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7ZOd-006bE4-0U;
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
Subject: [PATCH v7 3/4] platform/x86: int3472: Parameterize LED con_id in registration
Date: Tue, 31 Mar 2026 15:44:42 +0200
Message-Id: <20260331134443.1573053-4-mnencia@kcore.it>
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

Add a con_id parameter to skl_int3472_register_led() to allow callers
to specify both the LED name suffix and lookup con_id instead of
hardcoding "privacy". This prepares for registering additional LED
types with different names.

While at it, rename the privacy LED's GPIO con_id from "privacy-led"
to "privacy" in int3472_get_con_id_and_polarity() and pass it
directly to skl_int3472_register_led(), reducing churn when adding
new LED types.

No functional change.

Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 drivers/platform/x86/intel/int3472/discrete.c | 4 ++--
 drivers/platform/x86/intel/int3472/led.c      | 7 ++++---
 include/linux/platform_data/x86/int3472.h     | 3 ++-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index cb24763..a45a930 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -212,7 +212,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
-		*con_id = "privacy-led";
+		*con_id = "privacy";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
@@ -348,7 +348,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_PRIVACY_LED:
-			ret = skl_int3472_register_led(int3472, gpio);
+			ret = skl_int3472_register_led(int3472, gpio, con_id);
 			if (ret)
 				err_msg = "Failed to register LED\n";
 
diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index fe412cb..22d0d6c 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -14,7 +14,8 @@ static int int3472_led_set(struct led_classdev *led_cdev, enum led_brightness br
 	return 0;
 }
 
-int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
+int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio,
+			     const char *con_id)
 {
 	struct int3472_led *led = &int3472->led;
 	char *p;
@@ -27,7 +28,7 @@ int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpi
 
 	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
 	snprintf(led->name, sizeof(led->name),
-		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
+		 "%s::%s_led", acpi_dev_name(int3472->sensor), con_id);
 	p = strchr(led->name, ':');
 	if (p)
 		*p = '_';
@@ -42,7 +43,7 @@ int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpi
 
 	led->lookup.provider = led->name;
 	led->lookup.dev_id = int3472->sensor_name;
-	led->lookup.con_id = "privacy";
+	led->lookup.con_id = con_id;
 	led_add_lookup(&led->lookup);
 
 	return 0;
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index 7af6731..3ba0d56 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -160,7 +160,8 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   const char *second_sensor);
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
 
-int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio);
+int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio,
+			     const char *con_id);
 void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
 
 #endif
-- 
2.47.3

