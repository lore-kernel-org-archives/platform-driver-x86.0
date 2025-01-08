Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2D81F12EE;
	Wed,  8 Jan 2025 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325962; cv=none; b=p6s4xtUuU9L0RPTIa9jOa8auFmxkqUWR6/HmCKajOkipKSWBluzABGZ+KI+rmsJ9OePwNus5g+eN5Pvpjgn2MJHmUHEpSL/NHFCFeS41yS9EuVF821gi3NMd96Csa5y34Xw6fmkU46xJzPeaJLFITU1yTv7HUTueC6SWK2hVNVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325962; c=relaxed/simple;
	bh=CKzg5Pm13udSKJOgvTDhQySCSoNl0FYJa5oKa6xy1Kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o8fSsfVnTYeC8z2z27fge4XfDqE95K8NW5iL9jHIUWTWDIC/P0eTcyKGibvBml9AL8bAfxa+DtDtNALH7uHIiTPlF+Sa0xFBKDI0agQQVli9hayq7TQSuKLMNR5Ej9LwEXIwZmtnAb8CBvSDfiBlaeCxExA62070rlbf/cH9k1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6OTmxvY; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6OTmxvY"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2165448243fso47929185ad.1;
        Wed, 08 Jan 2025 00:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325960; x=1736930760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKe9tzE97MJhjwt8IMOkld+MahS1dPUD2DgQWb3YrJ4=;
        b=S6OTmxvYlzhJjK2whVxfVrjyHYRt2d8ZkJtO234jgAoCMoUU1GGUUmgA5hUDY3Enhj
         kKhaI0UmXYa7edLct2NcsXHfDGg+w421YaU7XoqWfDS3JxOGEa4whTC1Ju2isZD58Bwn
         T1ApxJqJLz5p9KqB18WxTBoHnew/meItl6GInbXiOmSg6kE+oklwsed4z9XZtHMWQ5dT
         IxqG9w5pewg9bci1W3Ov3n7J3BKmMWHPgBqwZhRGH6PNA2sMlnoNc8+0hVTH+Bz6nhMv
         i5p5FLdZNARXZFfhW5l02vSWH33cA31x1sawaU54+1QWPDRW1qO6KUu+bAyCh2GToMtS
         hIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325960; x=1736930760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKe9tzE97MJhjwt8IMOkld+MahS1dPUD2DgQWb3YrJ4=;
        b=M4l4CWR0C5gyRPwY2c3jGv23Ta0di7yE2WILFac/EuvW79QsCgeCFeEAXYhtcga53G
         62c87JJse2tRMLyk1/+1FeiQcZxRFQuyeDQpJA6eAH3N9ttwUEVh0ws63EzV1DQAZlGn
         cuBBDGt/sEVoD5JBHx1krmPoC/cNsAcNxs9SxaUZMRLUoF+xZ+LoA/btkK5apJFsDE5V
         O5WalILObmDg0IJPY0imZDk2PBpqqu7CvXdSozSBwrsSUa3SLKBcUAuUOnuyyo9WTa20
         dRxnvjL0iRyP4GdeKBWKQ0xI1psOhmXuA9Cbi/8X/+/hUWZ110h6e50SWp39azjGaydK
         /p9A==
X-Forwarded-Encrypted: i=1; AJvYcCUtYWY9kVuQpLK9+7y4aNSXQTeQ0sq02q8gJ85sk24OVelwDXxCYVpLbZdzwOXA+bDPOrm+oWJxzSgVhe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHo68au43zrxoroMzDI4R6BUWuzg19/+e4C6ZpgwcfVX4fo4B
	Mhrqb57KMtkHPoFao7rAy39+DGWhzllZQFhHXOEHhXqnpR6PeYJ0/ImrApRhYSY=
X-Gm-Gg: ASbGncuiTY3CZPaFmEvjsVtWtAEPIiWY5GKKjLBH8lzMaOm8HzkVeAcnFefickTItNC
	HHt20bMWWTOqV5uzde+HO9cSFoNN+UvZ4UOhmdX8+kFpkETS1Zld0Q7ckUepiq1ke0UhkWcaVa7
	V14ry1UCoEk6PUPI0+T2iWpLURyI/JCR+xSYb71jxgAPnvUiwZNtdj2Ga9h8vNRb/TllQ88E8WR
	NbG76OnteV3sEkyiAkft8A7XpAv0W9dfWemYF0Bo0ntuTIAYcBQU/MB4BwnbQ==
X-Google-Smtp-Source: AGHT+IGbfJkFUWoSWSvvK6itizOvTx25HYyMoIo43dgpEcTzjErZ1PXsLj2+DD7BGNMftTTnPncorg==
X-Received: by 2002:a05:6a20:3d83:b0:1e0:c77c:450d with SMTP id adf61e73a8af0-1e88d13b562mr3392702637.1.1736325959714;
        Wed, 08 Jan 2025 00:45:59 -0800 (PST)
Received: from [10.113.16.67] ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c18fsm36150152b3a.184.2025.01.08.00.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:45:59 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Date: Wed, 08 Jan 2025 14:15:23 +0530
Subject: [PATCH v3 1/5] platform/x86: acer-wmi: use WMI calls for platform
 profile handling
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-platform_profile-v3-1-ec3658d9be9c@gmail.com>
References: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
In-Reply-To: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736325951; l=10962;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=CKzg5Pm13udSKJOgvTDhQySCSoNl0FYJa5oKa6xy1Kw=;
 b=8LCj+UA/XCTQTYNRs6yI48AN59viFADYorb1CrSJtKF5VgJQN4edAkjWfFLGOOcZ88hnNANLT
 Png7jBnvgrNCVwPoCVa1sxvwSfFEpSOA3928nW6YoSvgZLi9XRY9pTC
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

Improve the platform profile handling by using WMI calls to fetch the
current platform profile instead of directly accessing it from the EC.
This is beneficial because the EC address differs for certain laptops.

Link: https://lore.kernel.org/platform-driver-x86/d7be714c-3103-42ee-ad15-223a3fe67f80@gmx.de/
Co-developed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 185 ++++++++++++++++++++++++++++------------
 1 file changed, 129 insertions(+), 56 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index b3043d78a7b38a7b773da5ecd4846ca11e8595f5..97eabb0ec42781a27e6a00ce0df4c8a815c1b817 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -31,6 +31,7 @@
 #include <acpi/video.h>
 #include <linux/hwmon.h>
 #include <linux/units.h>
+#include <linux/unaligned.h>
 #include <linux/bitfield.h>
 
 MODULE_AUTHOR("Carlos Corbacho");
@@ -68,8 +69,11 @@ MODULE_LICENSE("GPL");
 #define ACER_WMID_GET_GAMING_SYS_INFO_METHODID 5
 #define ACER_WMID_SET_GAMING_FAN_BEHAVIOR 14
 #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
+#define ACER_WMID_GET_GAMING_MISC_SETTING_METHODID 23
 
-#define ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET 0x54
+#define ACER_GAMING_MISC_SETTING_STATUS_MASK GENMASK_ULL(7, 0)
+#define ACER_GAMING_MISC_SETTING_INDEX_MASK GENMASK_ULL(7, 0)
+#define ACER_GAMING_MISC_SETTING_VALUE_MASK GENMASK_ULL(15, 8)
 
 #define ACER_PREDATOR_V4_RETURN_STATUS_BIT_MASK GENMASK_ULL(7, 0)
 #define ACER_PREDATOR_V4_SENSOR_INDEX_BIT_MASK GENMASK_ULL(15, 8)
@@ -115,6 +119,10 @@ enum acer_wmi_predator_v4_sensor_id {
 	ACER_WMID_SENSOR_GPU_TEMPERATURE	= 0x0A,
 };
 
+enum acer_wmi_gaming_misc_setting {
+	ACER_WMID_MISC_SETTING_PLATFORM_PROFILE		= 0x000B,
+};
+
 static const struct key_entry acer_wmi_keymap[] __initconst = {
 	{KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
 	{KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
@@ -751,20 +759,12 @@ static bool platform_profile_support;
  */
 static int last_non_turbo_profile;
 
-enum acer_predator_v4_thermal_profile_ec {
-	ACER_PREDATOR_V4_THERMAL_PROFILE_ECO = 0x04,
-	ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO = 0x03,
-	ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE = 0x02,
-	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET = 0x01,
-	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED = 0x00,
-};
-
-enum acer_predator_v4_thermal_profile_wmi {
-	ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI = 0x060B,
-	ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI = 0x050B,
-	ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI = 0x040B,
-	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI = 0x0B,
-	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI = 0x010B,
+enum acer_predator_v4_thermal_profile {
+	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET		= 0x00,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED	= 0x01,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE	= 0x04,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO		= 0x05,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_ECO		= 0x06,
 };
 
 /* Find which quirks are needed for a particular vendor/ model pair */
@@ -1477,6 +1477,45 @@ WMI_gaming_execute_u64(u32 method_id, u64 in, u64 *out)
 	return status;
 }
 
+static int WMI_gaming_execute_u32_u64(u32 method_id, u32 in, u64 *out)
+{
+	struct acpi_buffer result = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer input = {
+		.length = sizeof(in),
+		.pointer = &in,
+	};
+	union acpi_object *obj;
+	acpi_status status;
+	int ret = 0;
+
+	status = wmi_evaluate_method(WMID_GUID4, 0, method_id, &input, &result);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = result.pointer;
+	if (obj && out) {
+		switch (obj->type) {
+		case ACPI_TYPE_INTEGER:
+			*out = obj->integer.value;
+			break;
+		case ACPI_TYPE_BUFFER:
+			if (obj->buffer.length < sizeof(*out))
+				ret = -ENOMSG;
+			else
+				*out = get_unaligned_le64(obj->buffer.pointer);
+
+			break;
+		default:
+			ret = -ENOMSG;
+			break;
+		}
+	}
+
+	kfree(obj);
+
+	return ret;
+}
+
 static acpi_status WMID_gaming_set_u64(u64 value, u32 cap)
 {
 	u32 method_id = 0;
@@ -1565,6 +1604,48 @@ static void WMID_gaming_set_fan_mode(u8 fan_mode)
 	WMID_gaming_set_u64(gpu_fan_config2 | gpu_fan_config1 << 16, ACER_CAP_TURBO_FAN);
 }
 
+static int WMID_gaming_set_misc_setting(enum acer_wmi_gaming_misc_setting setting, u8 value)
+{
+	acpi_status status;
+	u64 input = 0;
+	u64 result;
+
+	input |= FIELD_PREP(ACER_GAMING_MISC_SETTING_INDEX_MASK, setting);
+	input |= FIELD_PREP(ACER_GAMING_MISC_SETTING_VALUE_MASK, value);
+
+	status = WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, input, &result);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	/* The return status must be zero for the operation to have succeeded */
+	if (FIELD_GET(ACER_GAMING_MISC_SETTING_STATUS_MASK, result))
+		return -EIO;
+
+	return 0;
+}
+
+static int WMID_gaming_get_misc_setting(enum acer_wmi_gaming_misc_setting setting, u8 *value)
+{
+	u64 input = 0;
+	u64 result;
+	int ret;
+
+	input |= FIELD_PREP(ACER_GAMING_MISC_SETTING_INDEX_MASK, setting);
+
+	ret = WMI_gaming_execute_u32_u64(ACER_WMID_GET_GAMING_MISC_SETTING_METHODID, input,
+					 &result);
+	if (ret < 0)
+		return ret;
+
+	/* The return status must be zero for the operation to have succeeded */
+	if (FIELD_GET(ACER_GAMING_MISC_SETTING_STATUS_MASK, result))
+		return -EIO;
+
+	*value = FIELD_GET(ACER_GAMING_MISC_SETTING_VALUE_MASK, result);
+
+	return 0;
+}
+
 /*
  * Generic Device (interface-independent)
  */
@@ -1833,9 +1914,8 @@ acer_predator_v4_platform_profile_get(struct platform_profile_handler *pprof,
 	u8 tp;
 	int err;
 
-	err = ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET, &tp);
-
-	if (err < 0)
+	err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, &tp);
+	if (err)
 		return err;
 
 	switch (tp) {
@@ -1865,36 +1945,33 @@ static int
 acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
 				      enum platform_profile_option profile)
 {
-	int tp;
-	acpi_status status;
+	int err, tp;
 
 	switch (profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
-		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
+		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
 		break;
 	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
-		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI;
+		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
 		break;
 	case PLATFORM_PROFILE_BALANCED:
-		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
 		break;
 	case PLATFORM_PROFILE_QUIET:
-		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI;
+		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
 		break;
 	case PLATFORM_PROFILE_LOW_POWER:
-		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
+		tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
 		break;
 	default:
 		return -EOPNOTSUPP;
 	}
 
-	status = WMI_gaming_execute_u64(
-		ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, NULL);
-
-	if (ACPI_FAILURE(status))
-		return -EIO;
+	err = WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, tp);
+	if (err)
+		return err;
 
-	if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
+	if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
 		last_non_turbo_profile = tp;
 
 	return 0;
@@ -1931,7 +2008,7 @@ static int acer_platform_profile_setup(struct platform_device *device)
 
 		/* Set default non-turbo profile  */
 		last_non_turbo_profile =
-			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
 	}
 	return 0;
 }
@@ -1946,12 +2023,10 @@ static int acer_thermal_profile_change(void)
 		u8 current_tp;
 		int tp, err;
 		u64 on_AC;
-		acpi_status status;
-
-		err = ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET,
-			      &current_tp);
 
-		if (err < 0)
+		err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE,
+						   &current_tp);
+		if (err)
 			return err;
 
 		/* Check power source */
@@ -1962,54 +2037,52 @@ static int acer_thermal_profile_change(void)
 		switch (current_tp) {
 		case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
 			if (!on_AC)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
 			else if (cycle_gaming_thermal_profile)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
 			else
 				tp = last_non_turbo_profile;
 			break;
 		case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
 			if (!on_AC)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
 			else
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
 			break;
 		case ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED:
 			if (!on_AC)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
 			else if (cycle_gaming_thermal_profile)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI;
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
 			else
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
 			break;
 		case ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET:
 			if (!on_AC)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
 			else if (cycle_gaming_thermal_profile)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
 			else
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
 			break;
 		case ACER_PREDATOR_V4_THERMAL_PROFILE_ECO:
 			if (!on_AC)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
 			else if (cycle_gaming_thermal_profile)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI;
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
 			else
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
+				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
 			break;
 		default:
 			return -EOPNOTSUPP;
 		}
 
-		status = WMI_gaming_execute_u64(
-			ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, NULL);
-
-		if (ACPI_FAILURE(status))
-			return -EIO;
+		err = WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, tp);
+		if (err)
+			return err;
 
 		/* Store non-turbo profile for turbo mode toggle*/
-		if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
+		if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
 			last_non_turbo_profile = tp;
 
 		platform_profile_notify(&platform_profile_handler);

-- 
2.47.1

