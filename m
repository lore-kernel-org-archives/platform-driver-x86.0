Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA8E24E4A8
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 21:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753480391; cv=none; b=tw+gOU/xuFJGwuI63UQTJ+jF6rzKV26L/wywoD+lfZviVtCunO9X1GGue55QKMadiD9jksJ03J0rXZDlWmXbz7gf1vBV2lbC8gptvYAefEsHRpNIN7dqGefTxIVRub8X1dH6AOAgyKZDJWpnpxx6oeqFVYbuppl8gFHT/kV0BKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753480391; c=relaxed/simple;
	bh=aW6xyYBJh6YfV2jqEl97q+rfRcYTWXXR+si66caM5i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KNjWEsunro8k09BUXKXHKbcxHtM+q4HnlNgKJFmyQRcemH7RnL2KtMqceMHnhCAsF1rYjTDZ7dxH4I6reMGbO3C4igaEbZNqx2s0JAKQPD+SFkylfGhKpqaQB7pVscPpWolmhrR4c+eDZH/B7nGPv5ZG/oPQDd8vK9rMI0y7Wxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZG6zaBG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZG6zaBG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37CEC4CEF6;
	Fri, 25 Jul 2025 21:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753480389;
	bh=aW6xyYBJh6YfV2jqEl97q+rfRcYTWXXR+si66caM5i0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GZG6zaBG31Y4qNy3G0z3a3EEJHKoQ6cwONsvIs2kobmllX4RpdD27EhEXT7vmaldk
	 qcQa0BzxH9J9FtAG15q9Nnz5YIb47X1lz3LO91P9OuxXg3u1Dn8wm+RVHTTUYF1Vr4
	 l3h07T1M4o5kKHdTXEwR/WDSCv2Y5As8ummMqYrxhfSwnWO/JtwBAeLnS1fsQXQ4cx
	 riEcdpiIifI46v0EnK0MiQyqzzI0I4tqwbP3JgSYWEru8CDNFlrNbWEkTsbCyuKJNw
	 vGJjRCtnJBWR3H17kEnnM3BpfoyT5rOukJRIm6D7OwEW1RZ+VzzzAksqqoDnKPoMi7
	 eR0NVhA8Tb13A==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 2/3] platform/x86: int3472: Rework regulator enable-time handling
Date: Fri, 25 Jul 2025 23:52:58 +0200
Message-ID: <20250725215259.402796-3-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250725215259.402796-1-hansg@kernel.org>
References: <20250725215259.402796-1-hansg@kernel.org>
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
Changes in v2:
- s/enable_time/enable_time_us/
- Move enable_time above con_id for better struct packing
---
 drivers/platform/x86/intel/int3472/discrete.c | 35 ++++++++++---------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 4ffd7330e9ea..74239ce38805 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -129,6 +129,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
  * @hid: The ACPI HID of the device without the instance number e.g. INT347E
  * @type_from: The GPIO type from ACPI ?SDT
  * @type_to: The assigned GPIO type, typically same as @type_from
+ * @enable_time_us: Enable time in usec for GPIOs mapped to regulators
  * @con_id: The name of the GPIO for the device
  * @polarity_low: GPIO_ACTIVE_LOW true if the @polarity_low is true,
  * GPIO_ACTIVE_HIGH otherwise
@@ -138,6 +139,7 @@ struct int3472_gpio_map {
 	u8 type_from;
 	u8 type_to;
 	bool polarity_low;
+	unsigned int enable_time_us;
 	const char *con_id;
 };
 
@@ -147,6 +149,7 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 		.type_from = INT3472_GPIO_TYPE_POWERDOWN,
 		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
 		.con_id = "vdd",
+		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
 	},
 	{	/* ov7251 driver / DT-bindings expect "enable" as con_id for reset */
 		.hid = "INT347E",
@@ -157,7 +160,8 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 };
 
 static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
-					    const char **con_id, unsigned long *gpio_flags)
+					    const char **con_id, unsigned long *gpio_flags,
+					    unsigned int *enable_time_us)
 {
 	struct acpi_device *adev = int3472->sensor;
 	unsigned int i;
@@ -181,9 +185,12 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*gpio_flags = int3472_gpio_map[i].polarity_low ?
 			      GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
 		*con_id = int3472_gpio_map[i].con_id;
+		*enable_time_us = int3472_gpio_map[i].enable_time_us;
 		return;
 	}
 
+	*enable_time_us = GPIO_REGULATOR_ENABLE_TIME;
+
 	switch (*type) {
 	case INT3472_GPIO_TYPE_RESET:
 		*con_id = "reset";
@@ -208,6 +215,8 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
+		/* Setups using a handshake pin need 25 ms enable delay */
+		*enable_time_us = 25 * USEC_PER_MSEC;
 		break;
 	default:
 		*con_id = "unknown";
@@ -252,13 +261,15 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 					     void *data)
 {
 	struct int3472_discrete_device *int3472 = data;
+	const char *second_sensor = NULL;
 	struct acpi_resource_gpio *agpio;
+	unsigned int enable_time_us;
 	u8 active_value, pin, type;
+	unsigned long gpio_flags;
 	union acpi_object *obj;
 	struct gpio_desc *gpio;
 	const char *err_msg;
 	const char *con_id;
-	unsigned long gpio_flags;
 	int ret;
 
 	if (!acpi_gpio_get_io_resource(ares, &agpio))
@@ -281,7 +292,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
 
-	int3472_get_con_id_and_polarity(int3472, &type, &con_id, &gpio_flags);
+	int3472_get_con_id_and_polarity(int3472, &type, &con_id, &gpio_flags, &enable_time_us);
 
 	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
 	/* Pin field is not really used under Windows and wraps around at 8 bits */
@@ -330,21 +341,13 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
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
+			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
+							     con_id, second_sensor);
 			if (ret)
-				err_msg = "Failed to map handshake to sensor\n";
+				err_msg = "Failed to register regulator\n";
 
 			break;
 		default: /* Never reached */
-- 
2.49.0

