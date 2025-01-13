Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED47E235BFB;
	Mon, 13 Jan 2025 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736774067; cv=none; b=giCQKRc3e+bh4wT/CpLwyLR96zWqoNN/3MLtF5R7nVJbD8sXuMV0BXlfEQC2eoaEePEtsiXsUhzdUo8prz/jg6Vj0P6Tj9/sZ04PuUeMRlAZt6VkQ6t3UVeAFKdqpOhaBhKv0yxuD1kkviND5jLyKSQtyG35KZHXVckwoSWO4Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736774067; c=relaxed/simple;
	bh=gElo3N9lwBjEg7rGQWLhBXorz3Jj1q0USp6HX7CoXuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gLTQDbpql7BdzNBMwm75TCd7CfO/l/fBZ8q6H40e3wqdTxfNLxsN+GQWE0WBbVQE1XfvY9E6NdecdZG5F4Wh6QEAkBzNmEyefKmcJ8KXHEVa95n+RdQ/59z0YYWjYV3NLsCb51VsoP0n30ABmbW4TornCoc9ZIJUS9KyiuSOiTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/1JdFhp; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/1JdFhp"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-218c8aca5f1so90421685ad.0;
        Mon, 13 Jan 2025 05:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736774065; x=1737378865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZX+gi9tRKOU016KJSudjX4GlzuFnKLU29YduivwRZI4=;
        b=F/1JdFhpQyBASKY41jXQ0Rb5/faFZhmTUJy/pYIHy+C3IdGND4tEV/iTY9RNUAuBk8
         5oo2JuKQax/J5MqqpfoSLcxCCRzITXwSmrrsFaaw6v75XvRzDOb/oTMbQd9BGNRSfgqa
         4pjfRGF+/VaMunzRm4z6HUvG9bGWw/eAve0ICGPMSNOMBOkgUD13/ROVr+PdMi2Lg09+
         ykkO0HNeYdLmd15pcStagu3WGetvWxnRponyC98eOo9w3j0ODN/S8QgV7HtmsjmCQn0i
         KqOucRPItZlJu7EhV7TPMhgbnlsUgowPItSuBOjYK78yzBRECV18mFnfOe5nsI/EQGve
         f0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736774065; x=1737378865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZX+gi9tRKOU016KJSudjX4GlzuFnKLU29YduivwRZI4=;
        b=F95GSGmnrHT17+vLLQo/IMtPWEvTuB8PFgL7rHO+mMAdhg0NICwof/AVtqkAYc/Zqh
         TKWJqUDv3pTrYEZw+6fDRKknR1MtPJ71hR4TutL0wos+19A++lCprYw/GyksqCrOlXWi
         3NhHccSxXJ0/kv5Kc0278Kh5pOa+9fJgir1oKa2keRY2+rcHmbPaeoBW4tkCa+WBiodl
         S8k6ORu34uyK1sn3HfLZ0rJSjAnzvYxY7kRSADWyDZv9G9IgpjyNIYXZlCKxB9bkT4Du
         9666B7lLZHMWh2B/SX2pImmYHYXCHFLFI2vcJLjfxzEkeJ/0XmVW0S8LYYgiNf2ZzIhB
         Qg7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUke5QUDhpZhQ3wFsnSWow1NiJ4Kr4gctagLy4K7QnLpckDiRbT5Q/hQKUvM3bLuegVtWEywpN63BvxvQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUze+cf1AUNXbo9o48vemxmz5OmrXRRnLImvu09jgAnybf3lP4
	R1Bn654Aw6K2jvRi3D7TZDtvce2d1oJBa/q+9b6DVAT9VvRz768q/2yGVm+3
X-Gm-Gg: ASbGncuuuLxtg3TiQT4TtqIWskR4n0n5sLw6Cb9C4QjAJWCA0DVPDgteH5j37n1sLzG
	8L8273LC7BAeDCOnCFv2o6YO1wfq9FrB6Z37cULmLQ7626ZLSVHOY96GCITtcPcqDy1qBfLurOf
	g86crzoU+uPZR2S6X7FDPHn7f5gT1lhXk8/2ri5bQp5G2ulgfAsc00bpTQ8XcQomr7rHqkixqz+
	bQ5orQPO5K92sEkGzocb2TMsU7ziN9SkfMWsYcHfutEtUECHeUYvLQmAqycFw==
X-Google-Smtp-Source: AGHT+IGoXmcHK93DvHnv9fTb+qcBwnpdA4pq01Pl6co7iNkq09UiVjZGJBAQdSmAEGEnRPa3k42vaw==
X-Received: by 2002:a05:6a00:2e97:b0:729:49a:2da6 with SMTP id d2e1a72fcca58-72d21f1ac4emr33209309b3a.3.1736774063469;
        Mon, 13 Jan 2025 05:14:23 -0800 (PST)
Received: from [10.113.16.67] ([117.193.77.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31840e93absm6961209a12.20.2025.01.13.05.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:14:22 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Date: Mon, 13 Jan 2025 18:44:09 +0530
Subject: [PATCH v4 1/5] platform/x86: acer-wmi: use WMI calls for platform
 profile handling
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-platform_profile-v4-1-23be0dff19f1@gmail.com>
References: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
In-Reply-To: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736774055; l=11006;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=gElo3N9lwBjEg7rGQWLhBXorz3Jj1q0USp6HX7CoXuc=;
 b=xD8CcspnF5F2gcVI4TWA4WZ5i8Ufw32Y9+eQNJMKuA6/13hU1a+QZfGbSw1UIt4MXG6RWuZLX
 CH4ONe4Q6twC7MFv4uuVHFudDaNaqfe0uRxkf5MsEaO/912sre+w6F7
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

Improve the platform profile handling by using WMI calls to fetch the
current platform profile instead of directly accessing it from the EC.
This is beneficial because the EC address differs for certain laptops.

Link: https://lore.kernel.org/platform-driver-x86/d7be714c-3103-42ee-ad15-223a3fe67f80@gmx.de/
Co-developed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Kurt Borja <kuurtb@gmail.com>
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

