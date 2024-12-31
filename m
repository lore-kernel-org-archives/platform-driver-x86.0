Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D34DF59;
	Tue, 31 Dec 2024 14:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735653893; cv=none; b=P5ASGBRQI8OY/lR5MhLFcp46zRx5yz+1FWtcS1gDGgwm8/bhPyLF1ljYZFBKIR8Tq6Vrk6MWOT8iV+FnROkWQXzhEnyv9clm70WYkDn14lT5fL804d8G9SuZB+Gm4k/TJXeE2teoFN77Gc6JvAD4x33PfGgrXwiQ9UhU4Pgcb8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735653893; c=relaxed/simple;
	bh=YYzuRSvVfBVgp+j6W12z1j0Ltw2LhyhYF1qfhDQfGJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EsPGrAckkRZhZxf67nOIesDPG70Qql8YChLPTrvrwt+7cHE2k2P2rCtCclr/aF4PCyH4U6h7O1Gz1SxRFAdbtAYwcDwRdCn7e6VpvE4tsywe9hWT2pCIlClXv508S/rVmUquI2jBFJpCgu0H+sP1Z+MIwfqbgPHPmpxrD6iaAD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFAEJxWY; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFAEJxWY"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2162c0f6a39so141669025ad.0;
        Tue, 31 Dec 2024 06:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735653891; x=1736258691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eLw5zBXoHLuu4P71Nf7CYLvhTUC/pGly9GaEs+5Cad4=;
        b=lFAEJxWYI0TCMmLu7ejJoBUH6wROeR/tvUcBm3YzNm2Ejqgj6Ecb7G9b0ca2aiBBMz
         XjJZFzJO7t8xiIFe4LroU/G9m2vxTf0sEknuUDZNvIpOm1QvvZPbBsyhlO8sJHkPMEik
         JP1FPgyO6K8dxd7/4h8lXLT5iHO0h76+6teIq8BbvNhFAb6ptxfInFQkmD9QKd+bYq22
         vSB2dBgQiRzkeMaPOvLvPUGc23P2IP63+YfBivv7XNYU5OnZuk6vKLKn2ktHNZ8ajc9s
         AraD61tqVYcgfaLfsoaQuOJAdmwgkNGiRe8drZXZ5xVys7TKScHTatpZfKeI4PVTb1pW
         4kWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735653891; x=1736258691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLw5zBXoHLuu4P71Nf7CYLvhTUC/pGly9GaEs+5Cad4=;
        b=uwgUiXVM5WDOCUR3NKlXiElS+fQQzAai7gcl7hBlwmIndqNuMTjWnCMRXkqZZ8E3Jx
         KV4n8nN7xMEJcqNanoCGTb9AVYqwWYr2QWR2dH64exhKcqhhsSI+5+9dK4zHh/8aIDLX
         932V2rsGU0p4I6yBbY0xDOt68WB85PpE9s423WqLLkF1kP7odQ4w/i5Yw6ch1ORDOO0O
         l6ufO6AoDMQaXbEdFrj+GT7NRZM5kziqJs366e+LjoIJZ3GxrkeCZEVUD6+ujkDoDVMw
         sFIuapkOxVH7hZhNyXw4v6TfP5mo2OXzuAH93BYCwod+zyy7OIzxrH+SWPS5tSciJCIz
         nKLw==
X-Forwarded-Encrypted: i=1; AJvYcCXWnQNYBRw11ZSUlnJ94CS9vI7ERN37DwNPJz6WYtcFZBPtzoY21fagxDHAtwMrpmZXhj6mtEhfpl9vj6E=@vger.kernel.org, AJvYcCXuUS38Rs7SChrzK/tb+X7UAdkqG+5dHJsRDpr59us1TUzMWYJ+SOK+g7a+WNmEPVkdjOVzIKiyphClokyKT9LfRUnAdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbyinsSFVecE7RLmr3qK9QhgjNn0iZEquDa60CkH/lpmExQpLO
	lIpt7cvvltG3HiQbFLxg0FzYOES82WGzvaaooeDd/e8wt3e/Jt1F
X-Gm-Gg: ASbGncuA/r9cTA0LSk7hxHeLR6l4DqFp1O+o5WLT5KK0jb521IMuw2RDhss1BNma3pT
	89luqOg+1Rwo0FGqiTY/QIyRixN7zNyr7WOsE/lAK7UlABThUFVxk7ySwUEJeT/Br3ctTquSprB
	p6dDIqFAQL99RqRP+ByiDmgfKgg6QbRjuy/PKkGEt9cR4wLO42sYe6z1xXKdc90riTOn+jXpVfB
	IQucynsLJTlBkik4vH9RMVx/8xqJWQRStdbU/29wwNZhOdhwKIlfmrP88tkHs4PdGJhYn1dizPf
	nlHJbR7cop6b/NE=
X-Google-Smtp-Source: AGHT+IHORnQJzTRQDnTyWZ2dwG7vH4aWNfZybdVUm/QsqbhLAtSf/ovnjtdCqr0OdEI1Fn66irWd0w==
X-Received: by 2002:a05:6a21:9989:b0:1e1:b42c:8e47 with SMTP id adf61e73a8af0-1e5c6ec6f1cmr60323584637.5.1735653890964;
        Tue, 31 Dec 2024 06:04:50 -0800 (PST)
Received: from Hridesh-ArchLinux.am.students.amrita.edu ([123.63.2.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842dd089089sm19203474a12.58.2024.12.31.06.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 06:04:50 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
To: "Lee, Chun-Yi" <jlee@suse.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>
Cc: Hridesh MG <hridesh699@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Shuah Khan" <skhan@linuxfoundation.org>
Subject: [PATCH] platform/x86: acer-wmi: improve platform profile handling
Date: Tue, 31 Dec 2024 19:34:41 +0530
Message-ID: <20241231140442.10076-1-hridesh699@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two improvements to the platform profile handling for laptops using
the Acer Predator interface -

1) Use WMI calls to fetch the current platform profile instead of
   directly accessing it from the EC since the EC address differs for
   certain laptops.
2) Use the supported profiles bitmap to dynamically set
   platform_profile_choices.

Link: https://lore.kernel.org/platform-driver-x86/d7be714c-3103-42ee-ad15-223a3fe67f80@gmx.de/
Co-developed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
This patch has been tested on an acer nitro AN515-58 laptop, it would be
good if someone with a predator laptop could also test it
---
 drivers/platform/x86/acer-wmi.c | 220 ++++++++++++++++++++++----------
 1 file changed, 154 insertions(+), 66 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index b3043d78a7b3..37f629b6e3d3 100644
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
@@ -115,6 +119,13 @@ enum acer_wmi_predator_v4_sensor_id {
 	ACER_WMID_SENSOR_GPU_TEMPERATURE	= 0x0A,
 };
 
+enum acer_wmi_gaming_misc_setting {
+	ACER_WMID_MISC_SETTING_OC_1			= 0x0005,
+	ACER_WMID_MISC_SETTING_OC_2			= 0x0007,
+	ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES	= 0x000A,
+	ACER_WMID_MISC_SETTING_PLATFORM_PROFILE		= 0x000B,
+};
+
 static const struct key_entry acer_wmi_keymap[] __initconst = {
 	{KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
 	{KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
@@ -751,20 +762,12 @@ static bool platform_profile_support;
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
+	ACER_PREDATOR_V4_THERMAL_PROFILE_ECO = 0x06,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO = 0x05,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE = 0x04,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED = 0x01,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET = 0x00,
 };
 
 /* Find which quirks are needed for a particular vendor/ model pair */
@@ -1477,6 +1480,45 @@ WMI_gaming_execute_u64(u32 method_id, u64 in, u64 *out)
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
@@ -1565,6 +1607,48 @@ static void WMID_gaming_set_fan_mode(u8 fan_mode)
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
@@ -1833,9 +1917,8 @@ acer_predator_v4_platform_profile_get(struct platform_profile_handler *pprof,
 	u8 tp;
 	int err;
 
-	err = ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET, &tp);
-
-	if (err < 0)
+	err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, &tp);
+	if (err)
 		return err;
 
 	switch (tp) {
@@ -1865,36 +1948,33 @@ static int
 acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
 				      enum platform_profile_option profile)
 {
-	int tp;
-	acpi_status status;
+	int tp, err;
 
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
@@ -1904,6 +1984,7 @@ static int acer_platform_profile_setup(struct platform_device *device)
 {
 	if (quirks->predator_v4) {
 		int err;
+		u8 supported_profiles;
 
 		platform_profile_handler.name = "acer-wmi";
 		platform_profile_handler.dev = &device->dev;
@@ -1912,16 +1993,27 @@ static int acer_platform_profile_setup(struct platform_device *device)
 		platform_profile_handler.profile_set =
 			acer_predator_v4_platform_profile_set;
 
-		set_bit(PLATFORM_PROFILE_PERFORMANCE,
-			platform_profile_handler.choices);
-		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
-			platform_profile_handler.choices);
-		set_bit(PLATFORM_PROFILE_BALANCED,
-			platform_profile_handler.choices);
-		set_bit(PLATFORM_PROFILE_QUIET,
-			platform_profile_handler.choices);
-		set_bit(PLATFORM_PROFILE_LOW_POWER,
-			platform_profile_handler.choices);
+		err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES,
+						   &supported_profiles);
+		if (err)
+			return err;
+
+		if (supported_profiles & 1 << 0)
+			set_bit(PLATFORM_PROFILE_QUIET,
+				platform_profile_handler.choices);
+		if (supported_profiles & 1 << 1)
+			set_bit(PLATFORM_PROFILE_BALANCED,
+				platform_profile_handler.choices);
+		if (supported_profiles & 1 << 4)
+			set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
+				platform_profile_handler.choices);
+		if (supported_profiles & 1 << 5)
+			set_bit(PLATFORM_PROFILE_PERFORMANCE,
+				platform_profile_handler.choices);
+		if (supported_profiles & 1 << 6)
+			set_bit(PLATFORM_PROFILE_LOW_POWER,
+				platform_profile_handler.choices);
+
 
 		err = platform_profile_register(&platform_profile_handler);
 		if (err)
@@ -1931,7 +2023,7 @@ static int acer_platform_profile_setup(struct platform_device *device)
 
 		/* Set default non-turbo profile  */
 		last_non_turbo_profile =
-			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
 	}
 	return 0;
 }
@@ -1946,12 +2038,10 @@ static int acer_thermal_profile_change(void)
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
@@ -1962,54 +2052,52 @@ static int acer_thermal_profile_change(void)
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

