Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4823E3033CC
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 08:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711531; cv=none; b=FQVFcHPRaMPnGWHr8+yj3Vc1wyJKWCrufuFVS2G23sDvY48r8kc3LxIdsjY00U/VkAwhfRB7fxkp1lGc3ZsRCxPbw5FVKpnp+dyBOxspNWIk6m0MlchOT4JmeZp4/osXirLxldTJSHRw3xOocX9ZO61LE0Z1jLmHrCWeHEIlhnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711531; c=relaxed/simple;
	bh=XdQInsIer+/WuRe8ywPJgqHdnMnep2OAuYle7cQEk/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VfLb4waLpL3GK0/lzKOxwjmIAAWHRECpBTsYey+nDOwYqzi33EVxOKTuVXmAzs5KT+R9opFvo4ZY7wrV6WGz3pP1lMBtqDgVYkIZ5BBSRF1UmmGjL/Pt6tgc8QDAdqggnVsQ+KLGaW30QWhdIENpz0mph6OIdEq6jkcvLN+slac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cohunt.app; spf=fail smtp.mailfrom=cohunt.app; dkim=pass (2048-bit key) header.d=cohunt.app header.i=@cohunt.app header.b=XaWJiwx4; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cohunt.app
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=cohunt.app
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cohunt.app header.i=@cohunt.app header.b="XaWJiwx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cohunt.app;
	s=protonmail2; t=1770711514; x=1770970714;
	bh=Xi659j3t1TvZYU2rXAviFM5LIKUcnDnvDwI9tiBHXHk=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XaWJiwx4dD7MNJUNcwXCTVgu4kxyyvzIrynbSeP+AiB9EA+uOq5IjmGuppa9hFxyP
	 2duOB89yBmVXld8FxNNK1CBbwK9alx7O+5XDoeS0g7xu4+T6uUYQjeyAvj6+faVICn
	 k/R6UapS9TUX9pw2ycik8c3QIPXOrdjH5mqlLAF7V6vvl0hedtzTMy4rPenzSloZdM
	 IKXoCfj7vyk80tiL1xKqSnuB4U0JVmJxsPLFHqk4eBbzzdqFbf8LWgPSsc0gCqh9CF
	 gPMm2i2WR3MGLsnVVdU6UdcbmvE6kCCXM/nWz0kZeKn2WYvItVBQuZ0eRnAJtPKF8l
	 LOHGHOyvQvTGw==
X-Pm-Submission-Id: 4f9DwS3p4lz2Scj7
From: Leif Skunberg <diamondback@cohunt.app>
To: hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leif Skunberg <diamondback@cohunt.app>
Subject: [PATCH 2/2] platform/x86: int3472: Handle GPIO type 0x10 (DOVDD) for OV5675
Date: Tue, 10 Feb 2026 09:18:30 +0100
Message-ID: <20260210081830.29581-1-diamondback@cohunt.app>
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

