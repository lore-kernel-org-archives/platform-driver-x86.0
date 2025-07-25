Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D64B21C9E3
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753454696; cv=none; b=i+xTfpsMIgVgz1YjViaE5wB/5rce9T+0Nq1Zfm5nBlJCfi+qe9sFKAumiuPtfkbjwgSCKkP62oQOMHso6F2jF6VvAOw5D43o8PdZ/5l/Oxy2CDECQqGzVPhlRCwOA/pip+pTNJG9Booc4eLz+iRuz2Q8NbvHaDeKlKBLNNzrV1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753454696; c=relaxed/simple;
	bh=4GhcAr24bxy66wWQoe5gbrboX69sapkrnznbOjmcUEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXnPZc0xGhtD9PVEfzk21ZG5OivQx93zsPn3y3mLVfX5J4dQ4KMHoicxJteSN9+KjKLkF8p7fUB+yx7VTeBYs9J8HbLTUkz2DNKwdXVSdAkD0Qdv5yOa+BaEh7HJiFpFH0LOpi/VL8DYOBwmOOI1v5R/P1wMO/yaCPyM4XCEPUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9a0LHsp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9a0LHsp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5240BC4CEEB;
	Fri, 25 Jul 2025 14:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753454694;
	bh=4GhcAr24bxy66wWQoe5gbrboX69sapkrnznbOjmcUEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E9a0LHsp+OQl6Xg3+pVbpOzRXuclLOWJxEE4yyajAJ0C+Wy4sMJruNJcq7pkrqDAe
	 pURu1rl+J5tD79GobX6mKtKVSE5qG19pO3rHsTGfrnYX0iEBQNuS6mgj5xeSS4FTyw
	 19TNjrz9f+RSpdfDWQjcHZQTjlbLR1aR1xmuBdhPUJMoYyQ1IgS7o2b0Mn+osNFfkf
	 GMeBPheO6Y34zXSjVtYnDBa/+N5nUwicag+7mad4yxC1Dg4dv8Xdgy/nQB5JFxl1oX
	 69VJiw+FxC+bk/ujJ6HFeS956wmeCmdPVjdzupPPnh/VG1/WXntaViO7A8y7bNibZU
	 o16YlTJVUMt3g==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 1/2] platform/x86: int3472: Rework regulator enable-time handling
Date: Fri, 25 Jul 2025 16:44:43 +0200
Message-ID: <20250725144444.210043-2-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250725144444.210043-1-hansg@kernel.org>
References: <20250725144444.210043-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of hardcoding the regulator enable-time for INT3472_GPIO_TYPE-
POWER_ENABLE and -HANDSHAKE, make int3472_get_con_id_and_polarity()
set the enable-time.

This will allow overriding the enable time through quirks in
the int3472_gpio_map[].

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/platform/x86/intel/int3472/discrete.c | 39 ++++++++++---------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 4c0aed6e626f..bc442944be7f 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -130,7 +130,8 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
  * @type_from: The GPIO type from ACPI ?SDT
  * @type_to: The assigned GPIO type, typically same as @type_from
  * @con_id: The name of the GPIO for the device
- * @polarity_low: GPIO_ACTIVE_LOW true if the @polarity_low is true,
+ * @polarity_low: GPIO_ACTIVE_LOW true if the @polarity_low is true
+ * @enable_time: Enable time in usec for GPIOs mapped to regulators
  * GPIO_ACTIVE_HIGH otherwise
  */
 struct int3472_gpio_map {
@@ -139,17 +140,20 @@ struct int3472_gpio_map {
 	u8 type_to;
 	bool polarity_low;
 	const char *con_id;
+	unsigned int enable_time;
 };
 
 static const struct int3472_gpio_map int3472_gpio_map[] = {
 	/* mt9m114 designs declare a powerdown pin which controls the regulators */
-	{ "INT33F0", INT3472_GPIO_TYPE_POWERDOWN, INT3472_GPIO_TYPE_POWER_ENABLE, false, "vdd" },
+	{ "INT33F0", INT3472_GPIO_TYPE_POWERDOWN, INT3472_GPIO_TYPE_POWER_ENABLE,
+	  false, "vdd", GPIO_REGULATOR_ENABLE_TIME },
 	/* ov7251 driver / DT-bindings expect "enable" as con_id for reset */
 	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, false, "enable" },
 };
 
 static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
-					    const char **con_id, unsigned long *gpio_flags)
+					    const char **con_id, unsigned long *gpio_flags,
+					    unsigned int *enable_time)
 {
 	struct acpi_device *adev = int3472->sensor;
 	unsigned int i;
@@ -173,9 +177,12 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*gpio_flags = int3472_gpio_map[i].polarity_low ?
 			      GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
 		*con_id = int3472_gpio_map[i].con_id;
+		*enable_time = int3472_gpio_map[i].enable_time;
 		return;
 	}
 
+	*enable_time = GPIO_REGULATOR_ENABLE_TIME;
+
 	switch (*type) {
 	case INT3472_GPIO_TYPE_RESET:
 		*con_id = "reset";
@@ -200,6 +207,8 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
+		/* Setups using a handshake pin need 25 ms enable delay */
+		*enable_time = 25 * USEC_PER_MSEC;
 		break;
 	default:
 		*con_id = "unknown";
@@ -244,13 +253,15 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 					     void *data)
 {
 	struct int3472_discrete_device *int3472 = data;
+	const char *second_sensor = NULL;
 	struct acpi_resource_gpio *agpio;
 	u8 active_value, pin, type;
+	unsigned long gpio_flags;
+	unsigned int enable_time;
 	union acpi_object *obj;
 	struct gpio_desc *gpio;
 	const char *err_msg;
 	const char *con_id;
-	unsigned long gpio_flags;
 	int ret;
 
 	if (!acpi_gpio_get_io_resource(ares, &agpio))
@@ -273,7 +284,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
 
-	int3472_get_con_id_and_polarity(int3472, &type, &con_id, &gpio_flags);
+	int3472_get_con_id_and_polarity(int3472, &type, &con_id, &gpio_flags, &enable_time);
 
 	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
 	/* Pin field is not really used under Windows and wraps around at 8 bits */
@@ -322,21 +333,13 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_POWER_ENABLE:
-			ret = skl_int3472_register_regulator(int3472, gpio,
-							     GPIO_REGULATOR_ENABLE_TIME,
-							     con_id,
-							     int3472->quirks.avdd_second_sensor);
-			if (ret)
-				err_msg = "Failed to map power-enable to sensor\n";
-
-			break;
+			second_sensor = int3472->quirks.avdd_second_sensor;
+			fallthrough;
 		case INT3472_GPIO_TYPE_HANDSHAKE:
-			/* Setups using a handshake pin need 25 ms enable delay */
-			ret = skl_int3472_register_regulator(int3472, gpio,
-							     25 * USEC_PER_MSEC,
-							     con_id, NULL);
+			ret = skl_int3472_register_regulator(int3472, gpio, enable_time,
+							     con_id, second_sensor);
 			if (ret)
-				err_msg = "Failed to map handshake to sensor\n";
+				err_msg = "Failed to register regulator\n";
 
 			break;
 		default: /* Never reached */
-- 
2.49.0

