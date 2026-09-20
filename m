Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1292337F8BA;
	Sun, 20 Sep 2026 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789931095; cv=none; b=Uf3Ogxzm8XCfiKcsTiK6yfQz/sPFrrLMFQDh+p1zw7oTtCcInnNTh2mIMo9+8L6okV+Lvi4bMl5ahIR0y2OkbPaWoDvIWB5PJnnnTSl7cQsDD0ous/RCozsQ+adYExkqTyYzbHW+z4CNY9LGQwqWTUimITxCXHJtpVG3MmL4C+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789931095; c=relaxed/simple;
	bh=IIDX+WacK9t8OjfZgL+WcbR3a9lT5aTkroiqCcHeJkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H7fQvJePa3Fwm6reCEubgLgjn685db0ZMe5h5aOeU9+UPkQav921uuXXkmagcPJATewgocvgl42k5INQdvrRmJGbDnvY68x/K6TTasg4H7NF/h9vv84+ERbqfTcUJ+BUxHZCTHQ1DGTlolPo21PHygxFvBz/iNcAOvlqrjfkgHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ZQLLCM7s; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ZQLLCM7s"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 7F95D4249B;
	Sun, 20 Sep 2026 22:04:44 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 7B0053F477;
	Sun, 20 Sep 2026 22:04:43 +0300 (EEST)
Received: from t14.cm.kolding.net (unknown [IPv6:2a05:f6c5:43c3:0:71d:3f4c:4885:3ab1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 4F638201DEE;
	Sun, 20 Sep 2026 22:04:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1789931083;
	bh=A65QWvsKGLRKJMavxyvUBJYY8qVM/ghJI8TGPtRQYPM=; h=From:To:Subject;
	b=ZQLLCM7soeM6QVmwk+aHp7RtunOOWto6FmlEM1+cdVbfsudbwa8yWNT0jPigqpJIp
	 cDHNKNafdbU0bJ2e/JmfTYZqV9SG7JeB42GuNSeAXjtJa6P/Za5WeFYRgvYEHYIb9z
	 F10rgdwVcLkQSIvNlwqOncZ9/82jEqIMLT/N35b1+z9XN7rdaLM4EZchvIlI5h3xHX
	 MY5l1ecxdgLlegf1KG85sUzu1K1ihxms9zyyvXZ31iG/sgzhTVTZIINZK+hSDz5ioV
	 N/VnkBSyCNRg7bB1SogqK+luCoUvkdWd8VoiP3fqCkgK+epFvZcIeiJF3I5neOjOyj
	 MG6bZeky5H0nA==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:71d:3f4c:4885:3ab1) smtp.mailfrom=lkml@antheas.dev smtp.helo=t14.cm.kolding.net
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Eileen <eileen@one-netbook.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1 1/2] platform/x86: oxpec: Fix Apex charge limit control
Date: Sun, 20 Sep 2026 21:04:37 +0200
Message-ID: <20260920190438.3444923-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <178993108288.1697666.6568536612869307892@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

The OneXPlayer Apex uses E5/E6 for battery bypass / charge limit, making
it the first device to deviate. This was verified by a user on Windows
with BIOS version 2.17 and later by running this kernel patch.

Drop X1_ from the MASK variables as they are common in all devices,
introduce a board enum for Apex, and make it use the new E5/E6 registers
for charge limit / bypass. Apply the same quirks as oxp_fly, since APEX
uses the same registers otherwise.

Fixes: 3385ea97c14d ("platform/x86: oxpec: Add support for OneXPlayer APEX")
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/oxpec.c | 68 ++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 34bb17fca148..38c272995437 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -50,6 +50,7 @@ enum oxp_board {
 	oxp_x1,
 	oxp_g1_i,
 	oxp_g1_a,
+	oxp_apex,
 };
 
 static enum oxp_board board;
@@ -93,11 +94,14 @@ static struct device *oxp_dev;
 #define OXP_X1_CHARGE_LIMIT_REG		0xA3 /* X1 charge limit (%) */
 #define OXP_X1_CHARGE_INHIBIT_REG	0xA4 /* X1 bypass charging */
 
-#define OXP_X1_CHARGE_INHIBIT_MASK_AWAKE	0x01
+#define OXP_APEX_CHARGE_LIMIT_REG	0xE5 /* Apex charge limit (%) */
+#define OXP_APEX_CHARGE_INHIBIT_REG	0xE6 /* Apex bypass charging */
+
+#define OXP_CHARGE_INHIBIT_MASK_AWAKE	0x01
 /* X1 Mask is 0x0A, F1Pro is 0x02 but the extra bit on the X1 does nothing. */
-#define OXP_X1_CHARGE_INHIBIT_MASK_OFF		0x02
-#define OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS	(OXP_X1_CHARGE_INHIBIT_MASK_AWAKE | \
-						 OXP_X1_CHARGE_INHIBIT_MASK_OFF)
+#define OXP_CHARGE_INHIBIT_MASK_OFF		0x02
+#define OXP_CHARGE_INHIBIT_MASK_ALWAYS	(OXP_CHARGE_INHIBIT_MASK_AWAKE | \
+					 OXP_CHARGE_INHIBIT_MASK_OFF)
 
 static const struct dmi_system_id dmi_table[] = {
 	{
@@ -154,7 +158,7 @@ static const struct dmi_system_id dmi_table[] = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER APEX"),
 		},
-		.driver_data = (void *)oxp_fly,
+		.driver_data = (void *)oxp_apex,
 	},
 	{
 		.matches = {
@@ -352,6 +356,7 @@ static umode_t tt_toggle_is_visible(struct kobject *kobj,
 	case oxp_x1:
 	case oxp_g1_i:
 	case oxp_g1_a:
+	case oxp_apex:
 		return attr->mode;
 	default:
 		break;
@@ -381,6 +386,7 @@ static ssize_t tt_toggle_store(struct device *dev,
 	case oxp_fly:
 	case oxp_mini_amd_pro:
 	case oxp_g1_a:
+	case oxp_apex:
 		reg = OXP_TURBO_SWITCH_REG;
 		mask = OXP_TURBO_TAKE_VAL;
 		break;
@@ -427,6 +433,7 @@ static ssize_t tt_toggle_show(struct device *dev,
 	case oxp_fly:
 	case oxp_mini_amd_pro:
 	case oxp_g1_a:
+	case oxp_apex:
 		reg = OXP_TURBO_SWITCH_REG;
 		mask = OXP_TURBO_TAKE_VAL;
 		break;
@@ -524,6 +531,7 @@ static bool oxp_psy_ext_supported(void)
 	case oxp_g1_i:
 	case oxp_g1_a:
 	case oxp_fly:
+	case oxp_apex:
 		return true;
 	default:
 		break;
@@ -537,12 +545,24 @@ static int oxp_psy_ext_get_prop(struct power_supply *psy,
 				enum power_supply_property psp,
 				union power_supply_propval *val)
 {
+	u8 limit_reg, inhibit_reg;
 	long raw_val;
 	int ret;
 
+	switch (board) {
+	case oxp_apex:
+		limit_reg = OXP_APEX_CHARGE_LIMIT_REG;
+		inhibit_reg = OXP_APEX_CHARGE_INHIBIT_REG;
+		break;
+	default:
+		limit_reg = OXP_X1_CHARGE_LIMIT_REG;
+		inhibit_reg = OXP_X1_CHARGE_INHIBIT_REG;
+		break;
+	}
+
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
-		ret = read_from_ec(OXP_X1_CHARGE_LIMIT_REG, 1, &raw_val);
+		ret = read_from_ec(limit_reg, 1, &raw_val);
 		if (ret)
 			return ret;
 		if (raw_val < 0 || raw_val > 100)
@@ -550,14 +570,14 @@ static int oxp_psy_ext_get_prop(struct power_supply *psy,
 		val->intval = raw_val;
 		return 0;
 	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
-		ret = read_from_ec(OXP_X1_CHARGE_INHIBIT_REG, 1, &raw_val);
+		ret = read_from_ec(inhibit_reg, 1, &raw_val);
 		if (ret)
 			return ret;
-		if ((raw_val & OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS) ==
-		    OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS)
+		if ((raw_val & OXP_CHARGE_INHIBIT_MASK_ALWAYS) ==
+		    OXP_CHARGE_INHIBIT_MASK_ALWAYS)
 			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
-		else if ((raw_val & OXP_X1_CHARGE_INHIBIT_MASK_AWAKE) ==
-			 OXP_X1_CHARGE_INHIBIT_MASK_AWAKE)
+		else if ((raw_val & OXP_CHARGE_INHIBIT_MASK_AWAKE) ==
+			 OXP_CHARGE_INHIBIT_MASK_AWAKE)
 			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE;
 		else
 			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
@@ -573,29 +593,41 @@ static int oxp_psy_ext_set_prop(struct power_supply *psy,
 				enum power_supply_property psp,
 				const union power_supply_propval *val)
 {
+	u8 limit_reg, inhibit_reg;
 	long raw_val;
 
+	switch (board) {
+	case oxp_apex:
+		limit_reg = OXP_APEX_CHARGE_LIMIT_REG;
+		inhibit_reg = OXP_APEX_CHARGE_INHIBIT_REG;
+		break;
+	default:
+		limit_reg = OXP_X1_CHARGE_LIMIT_REG;
+		inhibit_reg = OXP_X1_CHARGE_INHIBIT_REG;
+		break;
+	}
+
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
 		if (val->intval < 0 || val->intval > 100)
 			return -EINVAL;
-		return write_to_ec(OXP_X1_CHARGE_LIMIT_REG, val->intval);
+		return write_to_ec(limit_reg, val->intval);
 	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
 		switch (val->intval) {
 		case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
 			raw_val = 0;
 			break;
 		case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE:
-			raw_val = OXP_X1_CHARGE_INHIBIT_MASK_AWAKE;
+			raw_val = OXP_CHARGE_INHIBIT_MASK_AWAKE;
 			break;
 		case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
-			raw_val = OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS;
+			raw_val = OXP_CHARGE_INHIBIT_MASK_ALWAYS;
 			break;
 		default:
 			return -EINVAL;
 		}
 
-		return write_to_ec(OXP_X1_CHARGE_INHIBIT_REG, raw_val);
+		return write_to_ec(inhibit_reg, raw_val);
 	default:
 		return -EINVAL;
 	}
@@ -656,6 +688,7 @@ static int oxp_pwm_enable(void)
 	case oxp_x1:
 	case oxp_g1_i:
 	case oxp_g1_a:
+	case oxp_apex:
 		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_MANUAL);
 	default:
 		return -EINVAL;
@@ -676,6 +709,7 @@ static int oxp_pwm_disable(void)
 	case oxp_x1:
 	case oxp_g1_i:
 	case oxp_g1_a:
+	case oxp_apex:
 		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
 	default:
 		return -EINVAL;
@@ -696,6 +730,7 @@ static int oxp_pwm_read(long *val)
 	case oxp_x1:
 	case oxp_g1_i:
 	case oxp_g1_a:
+	case oxp_apex:
 		return read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1, val);
 	default:
 		return -EOPNOTSUPP;
@@ -732,6 +767,7 @@ static int oxp_pwm_fan_speed(long *val)
 	case oxp_mini_amd_a07:
 	case oxp_mini_amd_pro:
 	case oxp_g1_a:
+	case oxp_apex:
 		return read_from_ec(OXP_SENSOR_FAN_REG, 2, val);
 	default:
 		return -EOPNOTSUPP;
@@ -764,6 +800,7 @@ static int oxp_pwm_input_write(long val)
 	case oxp_fly:
 	case oxp_mini_amd_pro:
 	case oxp_g1_a:
+	case oxp_apex:
 		return write_to_ec(OXP_SENSOR_PWM_REG, val);
 	default:
 		return -EOPNOTSUPP;
@@ -803,6 +840,7 @@ static int oxp_pwm_input_read(long *val)
 	case oxp_fly:
 	case oxp_mini_amd_pro:
 	case oxp_g1_a:
+	case oxp_apex:
 	default:
 		ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
 		if (ret)

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.55.0


