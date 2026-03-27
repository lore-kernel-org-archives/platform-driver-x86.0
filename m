Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C80355F22;
	Fri, 27 Mar 2026 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635038; cv=none; b=TlztRCId/AMg0b0Yb+200bH4ILduZMAdnEj3B1DnAKSpaXYFTsMPqd33K1mlcmlMojfSLCkDiopz2dyCX6whFopapg4ZeHAlaem4dhme9LbK3a2YTGOfUtVjWaYFCEndbVOas3UXkYJmZSlc2aCOe807nlVeOSrC2H71mNgBVvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635038; c=relaxed/simple;
	bh=Me/dNDhjULUX4bfZoWy2VYCeCbFJlFbArFgcmmWcBxE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a/Lb/sR9x4XkRyIWdzgtZJ7GCsDamih4GBExL65cLQs71BdMTGEv2prtg45hMy5x8ZyouLLjim627tbW59tcIG2QqSwknzDo6dvR6O78JLCWEK5Em25HnVllkjmElzCR6+nQo24UMssH3+XMcbvV083gN5V+eUirNjFV8Is7XZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=OmTyy/mC; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="OmTyy/mC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=57BwF54EmoRVxe2+xL7GGnB9Jgg4m5zqhYTpvW/p10I=; b=OmTyy/mCbkO7BguEtQaa2MOmBh
	l2bF5WQTzgX7TyqkZ5fPf5wqKixmlfjoAom9USh9WFERw+Ss4/jzWn5nT1lCL0YFADldBTXww7IVx
	A6PT2Nr1Nkb2TA60h5vB4Szm1yQP2kMoZCLVrZ0+ykqRm3tzRcGy1fIMa0PcJWFolfnI=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w6Bdf-006FSG-2e;
	Fri, 27 Mar 2026 19:10:31 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v5 3/4] platform/x86: int3472: Parameterize LED name in registration
Date: Fri, 27 Mar 2026 19:10:30 +0100
Message-Id: <20260327181031.1489365-4-mnencia@kcore.it>
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

Add a name parameter to skl_int3472_register_led() to allow callers
to specify the LED name suffix instead of hardcoding "privacy". This
prepares for registering additional LED types with different names.

No functional change.

Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 drivers/platform/x86/intel/int3472/discrete.c | 2 +-
 drivers/platform/x86/intel/int3472/led.c      | 5 +++--
 include/linux/platform_data/x86/int3472.h     | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

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
index 8e92e8e..8222550 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -15,7 +15,8 @@ static int int3472_led_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
-int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
+int skl_int3472_register_led(struct int3472_discrete_device *int3472,
+			     struct gpio_desc *gpio, const char *name)
 {
 	struct int3472_led *led = &int3472->led;
 	char *p;
@@ -28,7 +29,7 @@ int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpi
 
 	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
 	snprintf(led->name, sizeof(led->name),
-		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
+		 "%s::%s_led", acpi_dev_name(int3472->sensor), name);
 	p = strchr(led->name, ':');
 	if (p)
 		*p = '_';
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index 7af6731..3a077f4 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -160,7 +160,8 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   const char *second_sensor);
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
 
-int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio);
+int skl_int3472_register_led(struct int3472_discrete_device *int3472,
+			     struct gpio_desc *gpio, const char *name);
 void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
 
 #endif
-- 
2.47.3

