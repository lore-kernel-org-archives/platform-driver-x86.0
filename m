Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B33EBF28
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770729701; cv=none; b=UaNclEAH7j2qDDIxSscm76VbwmVmU1XqfQNhbm9jH8dLdRmt80o9Q/4/tcRuJiuByzRK03/GQwx5q6cQ/3PbcOM9EBxyE2HuxjSRnGPp4gkBHIGfhzBwMx09CvA0IJ//p0BYDpbegEV6azr/13WhuLsC8MgYr/cfan0tyf3bIQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770729701; c=relaxed/simple;
	bh=YpCbSebCbgtoJKzaFR+lTQoOLjMR3pAzhchGu/p9IDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KefJPCZoF6DTPwUwRpCXueHZMUygZVoOkuDgTdIDHethsBve2QJZKplkHuGpEmvLjQOHbgc2thrxCCFeF4RuOzsMf6ZbQe2FlVFh64o5Lp5Wv4cZce/rQNQz+NU/IoMPXZeEy3108jO6gG+JmkzAW7jmQ1c51wxVBpW+BykwvCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cohunt.app; spf=fail smtp.mailfrom=cohunt.app; dkim=pass (2048-bit key) header.d=cohunt.app header.i=@cohunt.app header.b=XeI65nzv; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cohunt.app
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=cohunt.app
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cohunt.app header.i=@cohunt.app header.b="XeI65nzv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cohunt.app;
	s=protonmail2; t=1770729694; x=1770988894;
	bh=VrLbUzzVgJYvbn0ZQLliJls69dkRfpZ9geGXY8CX5yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XeI65nzvD08p269+MZYOpSDWPYhjDjfz4G4+E8YnvFYwcvktmlAGdESaxFubdujVY
	 84Slj9ewcAp6j9LEnb58pICblpTz+SYYsHVYZJ+97y55BdU9hk1dVt0eJn93xN45ca
	 hrmCQh7pwZasE3dtQ8ShhQFtDVwQIaHdGaWdM366Bx2Ymr8aVwCTO/DRYy20KpQlt5
	 ba+vtzHKrdbr2jNx3wWkLXLWeR8le6qL0YIADjpZBmD3BWLRIR6q9Mvgyg4pS8XYFu
	 uDXQuNc7JxXHC9C2hW0z41ouH6lwVzwp+wZ35N0bJCjbJjGSkKksTZ0xPnGKSUIjEp
	 Az7bGlIJFc7sg==
X-Pm-Submission-Id: 4f9Mf43J6zz2Sct7
From: Leif Skunberg <diamondback@cohunt.app>
To: dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leif Skunberg <diamondback@cohunt.app>
Subject: [PATCH v2] platform/x86: int3472: Handle GPIO type 0x10 (DOVDD)
Date: Tue, 10 Feb 2026 14:21:29 +0100
Message-ID: <20260210132129.17943-1-diamondback@cohunt.app>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210085615.34257-1-diamondback@cohunt.app>
References: <20260210085615.34257-1-diamondback@cohunt.app>
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
handle it as a regulator with con_id "dovdd" to match the supply name
used by sensor drivers (e.g. ov5675).

Also increase GPIO_SUPPLY_NAME_LENGTH from 5 to 6 to accommodate
the "dovdd" name (5 chars + null terminator).

Signed-off-by: Leif Skunberg <diamondback@cohunt.app>
---
 drivers/platform/x86/intel/int3472/discrete.c | 7 +++++++
 include/linux/platform_data/x86/int3472.h     | 5 +++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 1505fc3ef..fec8a899c 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -223,6 +223,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "avdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_DOVDD:
+		*con_id = "dovdd";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -251,6 +255,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
  * 0x0b Power enable
  * 0x0c Clock enable
  * 0x0d Privacy LED
+ * 0x10 DOVDD (digital I/O voltage)
  * 0x13 Hotplug detect
  *
  * There are some known platform specific quirks where that does not quite
@@ -332,6 +337,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
+	case INT3472_GPIO_TYPE_DOVDD:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
 		if (IS_ERR(gpio)) {
@@ -356,6 +362,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 		case INT3472_GPIO_TYPE_POWER_ENABLE:
 			second_sensor = int3472->quirks.avdd_second_sensor;
 			fallthrough;
+		case INT3472_GPIO_TYPE_DOVDD:
 		case INT3472_GPIO_TYPE_HANDSHAKE:
 			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
 							     con_id, second_sensor);
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index b1b837583..dbe745dc8 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -26,6 +26,7 @@
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
+#define INT3472_GPIO_TYPE_DOVDD					0x10
 #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
 #define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
 
@@ -33,8 +34,8 @@
 #define INT3472_MAX_SENSOR_GPIOS				3
 #define INT3472_MAX_REGULATORS					3
 
-/* E.g. "avdd\0" */
-#define GPIO_SUPPLY_NAME_LENGTH				5
+/* E.g. "dovdd\0" */
+#define GPIO_SUPPLY_NAME_LENGTH				6
 /* 12 chars for acpi_dev_name() + "-", e.g. "ABCD1234:00-" */
 #define GPIO_REGULATOR_NAME_LENGTH				(12 + GPIO_SUPPLY_NAME_LENGTH)
 /* lower- and upper-case mapping */
-- 
2.53.0

