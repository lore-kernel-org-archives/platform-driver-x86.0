Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2191AED5C
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2025 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737368271; cv=none; b=ENqofDSoxFyoYAyHDp7NTIdJceEAWt7lTIlSdQY8N/WtJoMQx71TdiDjyhq6a/D2a3m+YrECEibk5ED0T0DtfV/rKONbcffEOwUtrGYJp1dxGnx4Z7BE3UlB8TOF4/GNKynllU+TeNFNmzRyNOGW+aNHj3zFiyuLmR74FFwSwg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737368271; c=relaxed/simple;
	bh=lLvzFnSlG7yQ1BKkA6b/is0XKah+Kwk1jdhumHIyO7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bLRHILulHetxewQgG2felL8gpXSrPUAWIbU4M7Rz0hAA4s9DiVQC6R8Yjd2n62mKFwg6uUaow0jJzZdyF4Eb+DW3EyrFczXfiCCmfu7/2r7vTjTxrUHb0R3KFCwolD8fDHEaYXJtJfu27pd5wF0GPtiolYfa0cw4vS3fNzV5/C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/uAB3TU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/uAB3TU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737368270; x=1768904270;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lLvzFnSlG7yQ1BKkA6b/is0XKah+Kwk1jdhumHIyO7Y=;
  b=R/uAB3TUmM6hgUc7CeLeWfMbpKYBNIrkegtqg4rHtxINOadorCoTO5YM
   mrEeZZ9JismuzvDqCnK15ECtI1XQKNbDRBna9UTeDnIHrfunpNkahYyJH
   6ZwUmhSiAYz9e3XQ/yYjmn2yvfykNab+1zV9fpvIHjIaYsBrGLoLqeh1A
   V3awoIhOAj3K+VKVkAgG9BLgQxdCkKMz6A3yYR5/QrkmWxAJcvK9fzhg0
   4+LmQVXCbx5bO/3JkRjA93+LkxQWCmj2XkkT0bZ/IouvSVHRdg0fVNICJ
   MoQQs8UaTl3hBrM82k7XoNeBeepRMpwNv0FqKgHkgZEZ8yvQpvglGQYRK
   g==;
X-CSE-ConnectionGUID: 4y3AuLhpRcinbd4FlVBbAA==
X-CSE-MsgGUID: vxMEMET7QLmebQbFkH4PSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37907691"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37907691"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 02:17:49 -0800
X-CSE-ConnectionGUID: ipT7RlaETs+0tn/X72MCOw==
X-CSE-MsgGUID: vpuHkYArTJ2evrM1iwFcNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106473244"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 02:17:48 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BF62A11F94F;
	Mon, 20 Jan 2025 12:17:43 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] platform/x86: int3472: Call "reset" GPIO "enable" for INT347E
Date: Mon, 20 Jan 2025 12:17:43 +0200
Message-Id: <20250120101743.149169-1-sakari.ailus@linux.intel.com>
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
since v1:

- Fixed device name string.

 drivers/platform/x86/intel/int3472/discrete.c | 45 ++++++++++++++++---
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index d881b2cfcdfc..6404ef1eb4a7 100644
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
+	{ "i2c-INT347E", "enable", GPIO_ACTIVE_HIGH },
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
-- 
2.39.5

