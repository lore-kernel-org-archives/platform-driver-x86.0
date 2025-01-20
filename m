Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9681DED4B
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2025 10:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737367458; cv=none; b=cUzT44XqMEdFu+nSR/UL/IqWW4DZ9B5qB/Oda9a64pQkEzyY7mtct+SXi8jQj8FWzv5cnXolQYgIEEyGkRTZ+z4MvFs5YYj/Hfu51uxoAGyXpRzic5Z9EQNIlpBrcPZCAUa4pQTPq9u1AfoEMOoDNpKxGa4Nlr6re1B3cczaKX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737367458; c=relaxed/simple;
	bh=6a8zGDeaPCOkC0mUECvEfVL/WR5f2dEeSG8ws020uuY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tDJzi0ZsOusAkMaMLV9IzbJRnHZ0gSCMM48/K4eZPTcJK8F/2XOBLxB5Hz66VktrT99FWYirJTLk8zdOdVxX6zfr551hpe/XmR3hMxYAfycY9vX4m0B6+Y1NY3GN+1JCc7Oi3dskbBWZTh9mr+VAAq26/QB+EeY669VG5kLKG1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7AmQdWz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7AmQdWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737367457; x=1768903457;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6a8zGDeaPCOkC0mUECvEfVL/WR5f2dEeSG8ws020uuY=;
  b=A7AmQdWzox065FXSqYAzHiRph7sWyw7JQZqSAzuDBgg7JVeg8j7Kf9UR
   4/U22+3dBNwYBd3gDm4CLegzn/pP1i2OZLBKJlnJC1rbuQo7KOcWScMN5
   nHyndzU6EdIMxLPlOEQ+ZZKa1Mosto1hA5+zfWqoxdpLT2ehn7u7RyjvA
   aEntjmZx0VWA0Dk5PcwRJvc+H80uYn2WF8ZDXr2ZcSkQz+9A82E6X5/Dq
   EDR9qxTRVGNeN8sadgM7BNfbY/43cSPVJ6SEmI+qoLrwBJPk4Zxrx8BQn
   tnAq8MbXI5+HKQ0Ky/pT2I9f/CytaHHSSA/kRvJAwsGrwccfMY2x26Y9/
   g==;
X-CSE-ConnectionGUID: NdJI58BDRxGU6y+VW74Wuw==
X-CSE-MsgGUID: 3iFZy0OuQ4i3y4aCWJZSrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37020856"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37020856"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 02:04:15 -0800
X-CSE-ConnectionGUID: yZEkGieUQUK8u1kC//LrvA==
X-CSE-MsgGUID: rqP665eZRjOeVGyF93C4QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110509380"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 02:04:14 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3418211F94F;
	Mon, 20 Jan 2025 12:04:10 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 1/1] platform/x86: int3472: Call "reset" GPIO "enable" for INT347E
Date: Mon, 20 Jan 2025 12:04:09 +0200
Message-Id: <20250120100409.147910-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
documentation) but the int3472 indiscriminately provides this as a "reset"
GPIO to sensor drivers. Take this into account by assigning it as "enable"
with active high polarity for INT347E devices, i.e. ov7251.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 45 ++++++++++++++++---
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index d881b2cfcdfc..d65f88af7a52 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -122,13 +122,47 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 	return desc;
 }
 
-static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
+/**
+ * struct int3472_reset_gpio_map - Map "reset" GPIO to whatever is expected by
+ * the sensor driver (as in DT bindings)
+ * @devname: The name of the device without the instance number e.g. i2c-INT347E
+ * @func: The function, e.g. "enable"
+ * @polarity: GPIO_ACTIVE_{HIGH,LOW}
+ */
+static const struct int3472_reset_gpio_map {
+	const char *devname;
+	const char *func;
+	unsigned int polarity;
+} int3472_reset_gpio_map[] = {
+	{ "i2c-INT33BE", "enable", GPIO_ACTIVE_HIGH },
+};
+
+static void int3472_get_func_and_polarity(const char *sensor_name, u8 type,
+					  const char **func, u32 *polarity)
 {
 	switch (type) {
-	case INT3472_GPIO_TYPE_RESET:
-		*func = "reset";
-		*polarity = GPIO_ACTIVE_LOW;
+	case INT3472_GPIO_TYPE_RESET: {
+		const struct int3472_reset_gpio_map *map = NULL;
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(int3472_reset_gpio_map); i++) {
+			if (strncmp(sensor_name, int3472_reset_gpio_map[i].devname,
+				    strlen(int3472_reset_gpio_map[i].devname)))
+				continue;
+
+			map = &int3472_reset_gpio_map[i];
+			break;
+		}
+
+		if (map) {
+			*func = map->func;
+			*polarity = map->polarity;
+		} else {
+			*func = "reset";
+			*polarity = GPIO_ACTIVE_LOW;
+		}
 		break;
+	}
 	case INT3472_GPIO_TYPE_POWERDOWN:
 		*func = "powerdown";
 		*polarity = GPIO_ACTIVE_LOW;
@@ -217,7 +251,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
 
-	int3472_get_func_and_polarity(type, &func, &polarity);
+	int3472_get_func_and_polarity(int3472->sensor_name, type, &func,
+				      &polarity);
 
 	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
 	if (pin != agpio->pin_table[0])

base-commit: 94794b5ce4d90ab134b0b101a02fddf6e74c437d
prerequisite-patch-id: 3b99836646ead079dcb4c32b74a3afb560005cf0
prerequisite-patch-id: 42f5298768ceac20da6bbc727bca27bb8b69917a
prerequisite-patch-id: 0da1895a1d5b142263f6a8767957cb230fac77d1
prerequisite-patch-id: 1754148adebff9477dc2e4dc83767028436113f1
prerequisite-patch-id: f896e40a4927251ce0d21dab25e5d96fb7d83a67
prerequisite-patch-id: e20b198be440e25ef80769488160173d28e71d78
prerequisite-patch-id: a986c4867374f6e27b4c5beab942533777294a30
prerequisite-patch-id: 2422b279b601ad8ff208706c4db9672d224081f2
prerequisite-patch-id: 7ec0c1ae1658eaee582847f058f9b04c852cb2e4
prerequisite-patch-id: 1911c13cfc8daa1dc2af9ec0e7491086f3d0581d
prerequisite-patch-id: 840a441445380dd711a157614fe7587d630ed195
prerequisite-patch-id: 78b65f656e0f0a11f87f56f7e5581028b739a3ad
prerequisite-patch-id: 8ce34ed5d72cd54adffb03577c814bcc29d5ca1b
prerequisite-patch-id: 215af70f493cd61760c3aaf133bacd80ede7c8f2
prerequisite-patch-id: 79f79530793997b60c546d39c125d66a3a65e222
prerequisite-patch-id: 9aa4e4971335b9115bfdb60a563bce2d8d30e457
prerequisite-patch-id: 7e09df54a10314b74dd050274b1af55180be8e02
prerequisite-patch-id: 9441c3b904f1f79639775fcdce704604d938b946
prerequisite-patch-id: ab118d8a895a33ff95eb00022403c352acba957b
prerequisite-patch-id: e21fe9670d14c823608274d2ccce24d25601b309
prerequisite-patch-id: 55bcd0d1f9b197f35a8483103331449cc80a3917
prerequisite-patch-id: 03a3b10c79cce7866542dfea5f7ab14ffcf7957b
prerequisite-patch-id: 996fb61ed97c856d4d0ab37bb1e1d9d3332f0c91
prerequisite-patch-id: 75eae783634b93bc51155bb79b2447384e62aab8
prerequisite-patch-id: 9db352208cf84866feb06bb376ff93f4f07a4fe0
prerequisite-patch-id: ec1d8525ba4011f14c8b4b7193699a10e1c8728c
prerequisite-patch-id: d231b5441e84dc18c923f5141d57de57a8d718bd
prerequisite-patch-id: 8f863f84c5f5502966d40d4364c23d42cae8609d
prerequisite-patch-id: 93be7526bc6ac741e816d2a358d2e657b878d222
prerequisite-patch-id: 855744a45a7d1b85a26d05d8955696821fc0431d
prerequisite-patch-id: b4a7972dcbc872dd948f274e6327fcfc6341fda3
prerequisite-patch-id: dd0dc02bfd4fec2a2a62a058833defdac7c25c07
prerequisite-patch-id: dbc54ba1a5d8713b2a878f9b95600d0266515a09
prerequisite-patch-id: 931a9c6dc7b828fd50e6f2b224f39c701178efd9
prerequisite-patch-id: f5207164c6455a94adb5cb699dd016fd655df5a7
prerequisite-patch-id: e4e51fb674032dbcd2166a84cd1375433217a992
prerequisite-patch-id: 6908515e2938f2e0684c6155424197d1139e1db3
prerequisite-patch-id: d11080c803108b052d50e4c2eadf834c3f0731cc
prerequisite-patch-id: 1f76f886bd10de015f2e467814315e0ccec0f1a7
prerequisite-patch-id: 5221fa0b2bf7fe5310ebfb55c2ac8752d81be38b
prerequisite-patch-id: be6f5cb66be7f5c6224a247b16b5d616e9a2d390
prerequisite-patch-id: e57c3881a538f003c590640219a123d4e18c04a1
prerequisite-patch-id: 5edb1e10d16f5cacf05489902faa7be62672f642
prerequisite-patch-id: 7a6d3c7027b1c8737a1974456b5f2e9c8888b33f
prerequisite-patch-id: 2293861671c91fac14e2f54abe16bcf95f547b57
prerequisite-patch-id: 2ac8ee9098c7512d46ded580440f16ec508947aa
prerequisite-patch-id: 52e3ac13c6e617ac1e0b66db9651b75d9a6de2bd
-- 
2.39.5

