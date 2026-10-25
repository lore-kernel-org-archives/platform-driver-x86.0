Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900131;
	b=WKMBZPKl/F4Mj1dpt99EX6hvjkmQ6tWc3bhspXoCC9RK10sXXdHofEsueM6fqqyIS2Jb
	 QncYFeFEJRBdiUgksFJUN5kDq6zihi5bZYnT4mATJGAf/5nyhFIEsZzdEhHyaCNpkzEX9
	 UPvxr2eXwRBdcDnDwGl74ic7dTzcFEKGG4PEGMnG1tT3JSWpBy5qRvQK5YD3KYIyfRVOv
	 QWVJdWN9i5rzp2pUlUbfb4KVhYQo3jc4ITK8vqL0dQdDmy+3eDJUvywHeVYOY1LFD4x8/
	 SVGlAnTJUhzJS4jf8ryKjHy6+ydHP2Wmv8mJghXH7hpvaNW8dE2u3t6JCHi0PiWltgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LNVC/Q79iURelaMNO6LKar36XQUrN2NnF/HDD9huQKk=;
	b=TF7+IKAzcIsfcK3TmZIf0BrUABVs+tJFXvv7rFFJC1wiZ7OTnzLDFdHZzcHB+IGi7cnr
	 0RwWQbg8D3gURDAdA0YO3iLhcbuVIpwZEECzcqUUtXaboeN09g3w+7ALsP5kBh+wIsg+w
	 HtQIZbNi9VDA0EC0HdwKV3ru3ncQ6eShtP/cYJSM2Jqn3yHB5xSz0mGY7kY1RqHkstcBk
	 u096/HJ1pELgFQEgaxae5biAiz2bVRlMtT9g1IE7InOGCja8XSDXpUSnGG7OFoRvp0R7T
	 aDWISrbNIxIlrK4xORneVdUFtVqkysC/sm1dR4nnduHM/1WmbbtDn2bxj4imdmZH5cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KZ91zmuh;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272B9606A31A
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 03:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 272B9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KZ91zmuh
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535a54bed9so3235626eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 20:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900130; x=1793504930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNVC/Q79iURelaMNO6LKar36XQUrN2NnF/HDD9huQKk=;
        b=KZ91zmuhv7KcEEx8gUY7lKMO2jtzeTsCxr/YAB/rmCeOKn/fE5z8mZpNLxXIToBsgr
         A52hGW5THyW8Z1ijoRSs+xe+TPG2Kki4StiNWqY9Ygo8fqMUcO14OMbVxCF6NjrqeNOp
         GkyVDhm98fcWMW3CcarGsTDtR3k3icfa1Utfy1mVolpt2V7RfH3Z0xmmGGBaxSY5gWkR
         7ai6RMlBajQcYZc3sh8etBY8AQ4cwAjt2GxsH4w9TMtDLIjqac1pa/VTbpdL2vO24OQR
         Ze+dQagMNm99++dRbbrLCgvOBUAkUNQyTehCxi2zZBmtBcdmnSZi/DeawX4PsEoKRqOG
         4HDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900130; x=1793504930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNVC/Q79iURelaMNO6LKar36XQUrN2NnF/HDD9huQKk=;
        b=gfDWknjtjOUlyO29XcHCiSu32aFebuTpm0IkKQU/pjwXfZ05U69Kxr28AI/UzB1mwO
         AQfIVehjJRUaScQPdeohIUUMcZCvYwKMMETWW6Mod4tnYR5ofd4I5aVZ8Yas55ILJJD0
         NjmU+SoZDneawL/UfJnw8c9XPuoUcdvZrOLuuHmMYJ/CHiWeZAgWFBpuc98krW4Z3Xx1
         FqO2ytcxcqb3h7JAaBi4KuVkA4jdpQiBT7ZInW6yKC5PbB0fJJRrZ2zo9uGmWcrYfMEm
         5W8+kO34LAkEuKEGs/q8m/xIK1ZRN2ZiR3uSkkOBOaynorekHOMZ+LrfgqTrMsqYUPXq
         57Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxgxAO0JbBoMJ+9aGSgLJ18e1CuHvEyoXzvIkPHSD/LJjn1mTia6lutF1QPnFVUBFJYV4xvUibFXPlzYCOFzKl4Nere@vger.kernel.org
X-Gm-Message-State: AFq9FYK+SKsYCy8EM9qcbyNkpurATlvnVKef3OOTGbtBu0sjvmvhWNCY
	hZXElNccMlQt+U/2pSa4Ouf/DcP8MmWM4v91SoceyNRj83XvHxHS+mwr
X-Gm-Gg: AYBFou3nK9wgdhUzkqVcITEJE3D4x4erpNY+yit+32qplVzMnqFD9V3D+CLO5bPATQa
	31nlvStkK6NgnvdZqA4b0KtpHs3nBLxioNh5wudl98q8qWIycZ6tpiR+0Tvm4YAU9Cpsb0skkam
	dZCHlR2hS1tKPeIORFFgrQarjjfUZcGL5el2NFfk4CaI9tn8UI4BYHq8/FS9t5ye6jNAPCDqo/f
	YHiux3Deb5Tu29KLcnYrDmmKWvTDlzrmgeB/pi993eUg3plxg7XzVZ42ehz60oQnHfgkRnx6vFp
	pSHV9UUtrg5ewu+v4NI5RLurC3LpS0LV3uJd9lpVaikeAmw+nPkHYxM1RzjAnEc2NxpWUGtgtEQ
	ZjnEcrOI6tadFaK0rTooHbCJuHIDTez48TdvznJ5zcNl18K0e7mF1SECW5iuwPKXIvEO3jchKwo
	hXspl/X1nkWPmZ3MFA1eqcmFIn3asbh8a2vp9Indh9HijIehLdhyBjN6hT8R1oEIxmjy7WY9AZu
	adXSUlKo4dYc7bawTROYCvlq7nJH3Ufz4Vl05MY6LN5l9qHSyIm0FY/5Bq4XS7fMJ0HnAEoJzBL
	PYwm
X-Received: by 2002:a05:693c:4195:20b0:369:535f:4d12 with SMTP id 5a478bee46e88-369e833625amr5936559eec.3.1792900130126;
        Sat, 24 Oct 2026 20:48:50 -0700 (PDT)
Received: from localhost.localdomain ([2409:40e2:11e1:8680:3154:5358:731d:7be5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec864fsm14369443eec.24.2026.10.24.20.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:48:49 -0700 (PDT)
From: Sourav Nayak <nonameblank007@gmail.com>
To: nonameblank007@gmail.com
Cc: ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V2] platform/x86: hp-wmi: fix platform profile values for Victus 15-fb0xxx (8A3D)
Date: Sun, 25 Oct 2026 09:15:39 +0530
Message-ID: <20261025034539.4565-1-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261024202658.13149-1-nonameblank007@gmail.com>
References: <20261024202658.13149-1-nonameblank007@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Victus 15-fb0xxx (8A3D) takes victus_s_thermal_params,
which causes it to register as incorrect EC layout while cold boot.

- On other hand windows Omen Gaming Hub registers EC offset as 0x95,
- which is set in driver as HP_OMEN_EC_THERMAL_PROFILE_OFFSET.
- So, address it by adding victus_s_ec_thermal_params.

- Also perfcontrol modes as performance (0x1), default (0x0), quiet
(0x3) registers. So, add support for quiet mode.

Also, hp_wmi_fan_speed_max_reset() caused fans to freeze during loads at
0RPM, introduce a 'if' statement to resolve it by calling hp_wmi_fan_speed_max_set(0),
and passing platform active again to reactive curves. Test data:

auto/max:
hp-isa-0000
Adapter: ISA adapter
fan1:        5400 RPM
fan2:        5200 RPM

mannual[255]:
hp-isa-0000
Adapter: ISA adapter
fan1:        5800 RPM
fan2:        5800 RPM

Tested-by: Sourav Nayak <nonameblank007@gmail.com>
Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 615b4cf6fc45..ee6de96b3280 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -121,6 +121,13 @@ static const struct thermal_profile_params victus_s_thermal_params = {
 	.ec_tp_offset	= HP_EC_OFFSET_UNKNOWN,
 };
 
+static const struct thermal_profile_params victus_s_ec_thermal_params = {
+	.performance	= HP_VICTUS_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_VICTUS_THERMAL_PROFILE_DEFAULT,
+	.low_power	= HP_VICTUS_THERMAL_PROFILE_QUIET,
+	.ec_tp_offset	= HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
+};
+
 static const struct thermal_profile_params omen_v1_thermal_params = {
 	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
 	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
@@ -164,6 +171,11 @@ static const struct hp_wmi_board_params victus_s_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static const struct hp_wmi_board_params victus_s_ec_board_params = {
+	.thermal_profile	= &victus_s_ec_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params omen_v1_board_params = {
 	.thermal_profile	= &omen_v1_thermal_params,
 	.fan_profile		= &victus_s_fan_profile_params,
@@ -245,7 +257,7 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
-		.driver_data = (void *)&victus_s_board_params,
+		.driver_data = (void *)&victus_s_ec_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
@@ -2121,10 +2133,14 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 	 * but logically it should have tp == 0x30 || tp == 0x31, as
 	 * corrected by the Omen Gaming Hub on windows. Hence accept both
 	 * of these values.
+	 * Since boards like 8A3D write 0x3 to EC offset 0x95 to
+	 * engage quiet mode. Map this to PLATFORM_PROFILE_LOW_POWER.
 	 */
 	if (tp == victus_s_thermal_params.performance ||
 	    tp == omen_v1_thermal_params.performance) {
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
+	} else if (tp == victus_s_ec_thermal_params.low_power) {
+		*profile = PLATFORM_PROFILE_LOW_POWER;
 	} else if (tp == victus_s_thermal_params.balanced ||
 		   tp == omen_v1_thermal_params.balanced) {
 		/*
@@ -2657,7 +2673,17 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (hp_wmi_fan_control_supported()) {
+		/*
+		 * Victus models like 8A3D, calling hp_wmi_fan_speed_max_reset()
+		 * freezes fans at 0 RPM under load. Instead, disable max fans and re-apply
+		 * the active platform profile, so the EC firmware thermal curves regain control.
+		 */
+		if (hp_wmi_thermal_profile() == &victus_s_ec_thermal_params) {
+			ret = hp_wmi_fan_speed_max_set(0);
+			if (ret < 0)
+				return ret;
+			ret = platform_profile_victus_s_set_ec(active_platform_profile);
+		} else if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
-- 
2.55.0

