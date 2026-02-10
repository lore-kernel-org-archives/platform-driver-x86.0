Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8A323A9A8;
	Tue, 10 Feb 2026 08:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770713792; cv=none; b=uxK/9FoBjaVhlwrBHhWnn4chDXRTRuwd6lQV7YFl2JlKLfDnV3VqpjS0nQx3d8MpB+q+LUFi/csNP5D5Vwrru4RN5QHAD58liU7MNmSWJKDj8qYswq0hKsmaMcGUz703BcnqXxu4V49apPvIkktUYGE180x+UAq027INUGnheo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770713792; c=relaxed/simple;
	bh=XdQInsIer+/WuRe8ywPJgqHdnMnep2OAuYle7cQEk/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d6c3mZr93Q7K3JEsTXt3PnDX0Nv80c/VeqlgQUW878Iqo6L0omWhXFOfigMJ5UZW2TbOixiN240qMNw9hq9VkLQnswT9EPgTY7xlikgpqSc+TPfOQ+QS0PTlThhVOEcRwAv57P6zz4PVA+94GTmnUIpOS3kHrpqkan0oPxddyfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cohunt.app; spf=fail smtp.mailfrom=cohunt.app; dkim=pass (2048-bit key) header.d=cohunt.app header.i=@cohunt.app header.b=rw7DpvYJ; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cohunt.app
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=cohunt.app
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cohunt.app header.i=@cohunt.app header.b="rw7DpvYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cohunt.app;
	s=protonmail2; t=1770713781; x=1770972981;
	bh=Xi659j3t1TvZYU2rXAviFM5LIKUcnDnvDwI9tiBHXHk=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=rw7DpvYJvIyB0eTCKW901PggL6RiRztJ0gBpf26lym+lJDYJqIPOVbkEVILxoZRQB
	 axwbp9xKmWQDN0h5jSGUgxt4fnA8yWYVrEJWS4YwFMKGX7MU+SM4UVV2NqGSMnXPo9
	 E8/KQ/3E0OPg+rChfOZD2C5NDUsKc3M7Us5eOrED0bU6ayxU3lZ3k1kUDZxB5y5iZq
	 gUwBc+1Qv+lL3bd4HBnSSCyAh+YAOrRWStB0usapm331MypaCjvt5ezm9zuRXhB2rX
	 JHTCq/lx3XAhRk02e9dPjU/TzHt3pMYbyG1FEBnFH2mvYAELmjTBHI+0e7eQFmBnKf
	 Nd8wMjVNdbSFw==
X-Pm-Submission-Id: 4f9Fm120Nsz2Sd4j
From: Leif Skunberg <diamondback@cohunt.app>
To: dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leif Skunberg <diamondback@cohunt.app>
Subject: [PATCH 2/2] platform/x86: int3472: Handle GPIO type 0x10 (DOVDD) for OV5675
Date: Tue, 10 Feb 2026 09:56:15 +0100
Message-ID: <20260210085615.34257-1-diamondback@cohunt.app>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo ThinkPad X1 Fold 16 Gen 1 has an OV5675 sensor (ACPI HID
OVTI5675) behind an INT3472 discrete PMIC controller. The INT3472
_DSM returns GPIO type 0x10 for one of the pins, which controls the
DOVDD (digital I/O power) regulator enable.

Type 0x10 is not currently handled by the driver, causing the GPIO to
be ignored with a warning. Add INT3472_GPIO_TYPE_DOVDD (0x10) and
handle it by:

1. Adding an entry to int3472_gpio_map[] that maps the DOVDD type to
   INT3472_GPIO_TYPE_POWER_ENABLE for the OVTI5675 HID. The con_id
   is set to "vio" because "dovdd" exceeds GPIO_SUPPLY_NAME_LENGTH.

2. Adding a fallback case in int3472_get_con_id_and_polarity() so
   devices without a gpio_map match still get a valid con_id.

3. Adding INT3472_GPIO_TYPE_DOVDD to both switch statements in
   skl_int3472_handle_gpio_resources() so the GPIO is acquired via
   temp lookup and registered as a regulator.

Signed-off-by: Leif Skunberg <diamondback@cohunt.app>
---
 drivers/platform/x86/intel/int3472/discrete.c | 14 ++++++++++++++
 include/linux/platform_data/x86/int3472.h     |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 1505fc3ef..0a293e73c 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -164,6 +164,13 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 		.con_id = "dvdd",
 		.enable_time_us = 45 * USEC_PER_MSEC,
 	},
+	{	/* ov5675: DOVDD is a power regulator enable */
+		.hid = "OVTI5675",
+		.type_from = INT3472_GPIO_TYPE_DOVDD,
+		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
+		.con_id = "vio",
+		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
+	},
 };
 
 static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
@@ -223,6 +230,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "avdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_DOVDD:
+		*con_id = "vio";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -251,6 +262,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
  * 0x0b Power enable
  * 0x0c Clock enable
  * 0x0d Privacy LED
+ * 0x10 DOVDD (digital I/O voltage)
  * 0x13 Hotplug detect
  *
  * There are some known platform specific quirks where that does not quite
@@ -332,6 +344,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
+	case INT3472_GPIO_TYPE_DOVDD:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
 		if (IS_ERR(gpio)) {
@@ -356,6 +369,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 		case INT3472_GPIO_TYPE_POWER_ENABLE:
 			second_sensor = int3472->quirks.avdd_second_sensor;
 			fallthrough;
+		case INT3472_GPIO_TYPE_DOVDD:
 		case INT3472_GPIO_TYPE_HANDSHAKE:
 			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
 							     con_id, second_sensor);
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index b1b837583..d72c621f7 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -26,6 +26,7 @@
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
+#define INT3472_GPIO_TYPE_DOVDD					0x10
 #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
 #define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
 
-- 
2.53.0

