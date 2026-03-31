Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC29A3CEB98;
	Tue, 31 Mar 2026 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943532; cv=none; b=lY6KHHeCJo78S/YMR+XJJbdlv2KcRb7blxK6LrqSC7sr8b+6HfnHStiO9LokzDMhM1YXOKcyQJN+3JvtZKmB8owzVk7LHhFaw/2IB2jFqnfT4u9YWa+z4rYhvwvhLECzx5tny+Y9TvzFvTLxp2jACd04wEEF8/iBRLtqha2o9lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943532; c=relaxed/simple;
	bh=JNdbpaNiFGKuDB4+iCAS3uYPQ6ziOtCtEWlCCF0XRmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SbBeXIMYD9JoZ7xqtUUPl21GlHfRNQUSYq61q8qF/UtkovQe6H8wCFQHx6RjlDPxKMMDx98k1LhHbC07dPQMQO/FUnXdSNZmiG0wBAu+RR/Yi3P9SO10MHCK6kFTXT6hA4baR/2ExgaiA4mR0EuBSmejf04B/9+xOXPDIOxFG/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=oan5T/Gs; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="oan5T/Gs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CvcZ1ZaM/VH0POy5eaDjcEdZEK/vz9XxQVnBC6mc9o8=; b=oan5T/GsPPofCw4JBux3duUFf0
	3Kpbi/WGjzLzBkHxhc+Ostt31IPFDE2ES6sb7v8DhHpR/enRga85HJKKGOmq08rq6kXhC2yR6wDeN
	m28OfWMa8OS/EjqllwSpJ9IXDkcu4bR3pZXbNxALnaYom0tgVxnr4r0FFKkaR7cXjYLs=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7TtN-006ZoV-0G;
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
Subject: [PATCH v6 3/4] platform/x86: int3472: Parameterize LED con_id in registration
Date: Tue, 31 Mar 2026 09:52:03 +0200
Message-Id: <20260331075204.1567624-4-mnencia@kcore.it>
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

Add a con_id parameter to skl_int3472_register_led() to allow callers
to specify both the LED name suffix and lookup con_id instead of
hardcoding "privacy". This prepares for registering additional LED
types with different names.

No functional change.

Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 drivers/platform/x86/intel/int3472/discrete.c | 2 +-
 drivers/platform/x86/intel/int3472/led.c      | 7 ++++---
 include/linux/platform_data/x86/int3472.h     | 3 ++-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index cb24763..57c3b2c 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -348,7 +348,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_PRIVACY_LED:
-			ret = skl_int3472_register_led(int3472, gpio);
+			ret = skl_int3472_register_led(int3472, gpio, "privacy");
 			if (ret)
 				err_msg = "Failed to register LED\n";
 
diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index 8bd4903..39466d4 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -15,7 +15,8 @@ static int int3472_led_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
-int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
+int skl_int3472_register_led(struct int3472_discrete_device *int3472,
+			     struct gpio_desc *gpio, const char *con_id)
 {
 	struct int3472_led *led = &int3472->led;
 	char *p;
@@ -28,7 +29,7 @@ int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpi
 
 	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
 	snprintf(led->name, sizeof(led->name),
-		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
+		 "%s::%s_led", acpi_dev_name(int3472->sensor), con_id);
 	p = strchr(led->name, ':');
 	if (p)
 		*p = '_';
@@ -43,7 +44,7 @@ int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpi
 
 	led->lookup.provider = led->name;
 	led->lookup.dev_id = int3472->sensor_name;
-	led->lookup.con_id = "privacy";
+	led->lookup.con_id = con_id;
 	led_add_lookup(&led->lookup);
 
 	return 0;
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index 7af6731..5213911 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -160,7 +160,8 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   const char *second_sensor);
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
 
-int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio);
+int skl_int3472_register_led(struct int3472_discrete_device *int3472,
+			     struct gpio_desc *gpio, const char *con_id);
 void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
 
 #endif
-- 
2.47.3

