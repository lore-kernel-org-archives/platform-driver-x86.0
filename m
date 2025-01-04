Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69226F9D9;
	Sat,  4 Jan 2025 15:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736004664; cv=none; b=pOeGhvIz++Z2ShWSH+IGmmzSmCj4hdr2FlAeEXK/Lxyzs4wl5SsYInoVJKE3uRzvPgXeQsX2JGbR5uR3Djgsu6jXc4X46H0BDyh+u4KRKcnghCoX0qHaaGe0HgpHHlZIClM5LnoQ+mwC4Sdz7o7bMPAotzoPLo4FNADqpFUYMTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736004664; c=relaxed/simple;
	bh=QZVrpuhMlTaz+SSifxG1ApZYCAX0+m/5iaJrT7356nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BHq461w8UZCWyQgQd8M2wOg9vyEmfg6/p/JmM8IFEVFxP43991zzYsHu5IKyvYh0f65dwe1pu7H28Kp/BvRah6IGz7kGpnd9WSnNePYllqciIAOk+OcVibw/gqcjnPe4na3EyGXGZjaAttk3ZruYcjGIjbkJkEnJ+ajFD0xOWTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0bLr7DZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0bLr7DZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216281bc30fso213581915ad.0;
        Sat, 04 Jan 2025 07:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736004661; x=1736609461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jz9CR8HU51wLXH1c29C9rHDFl8M8LY+bOXNRU4zBiFo=;
        b=i0bLr7DZKjsBnWfP0Ve9FH6gvCrL+szuNxUK2PAdemk70njVqVG++BINmOg/B4vvIM
         ln/YtN8NhZweoNqce67X6oX7cgs/QLOiH58s6U86iiznX6CoAO7FwndE5a0UtJrZLWP3
         mlkoqZSnoe3dmHYNxDZvrVTgW0ap92mqrGzXGhTynd4sZA2+TrorhzK2wTW4SR7drvut
         V5/JO8pfjSfP4Hs9N5L8Tr18cRqkif3yA013yli8dHv+6byeOWZInzox2Eb68AgmHUxV
         dhD4Ybn8UHtY46j+n6pq3ybLZ4se4aRfQINM4SOonFrpLLrcvBKm6Y/3KgbYtoyw/DpO
         kRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736004661; x=1736609461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz9CR8HU51wLXH1c29C9rHDFl8M8LY+bOXNRU4zBiFo=;
        b=vUiVGXbJue+uTgvhUVPzcKHmZj/Nrjyte8judZeJRa/6HflF5u1obKyDPPV4Jx3v2X
         y7zDbpShUGeAHGQJy9oZJbwDm8glM3Vjqs3uONwC0kTkTSGQFCIdV7FzeLoVFxouFQ+o
         S4kNd+qQjdcHAflT8YZu5fTNc7Js5usyw3CQS6v/7l8lf6ImwihaAo6ziWEfq9C28hZH
         7Q92Dug7wz3WNWunS6HWPoD74ESf2ihZ2YhX+clhWhBTPNvOE3X/jSA+8GcWQ7xXSC4e
         7a6hXY7zQ3Jjy8d7OhkN7y2rvTW3lJjnsoCDxz1pmEs9/AyAS70IQxq8HVa8+IuBTDR8
         duXg==
X-Forwarded-Encrypted: i=1; AJvYcCUtz4U+SXxKnoCZW7oGBU0a3wALnz12MgRkX3xKu4stCEyFUTGMkenrOLzvfCv/di5Ia3ULS1VkK3n8P/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMn6FqAzCyAdjkg3PPtF6R+w0/wLY1+JOoBGLnxCoVxQGvYPPZ
	3Ly3VUT5S0GIefAYmgnSlKe3PCsf9jiqa4R/tNoP+zHv/Um38knSr3rdt4GWrhg=
X-Gm-Gg: ASbGncsigMPV0iy5FojEWVGx7bCgI9c5Cs/E77qpI2/L1LgwRVOVLtaxsnbos19ypJP
	3MzS/vJTdKfy34OhCPyX38ZQ/TeWldpLSOyAomsesiaFcipIkMXa4Ji9rB9XX1CK9CAumQSIbi7
	kIJBi2ea9t5poY1NP12Y26vXqJZZ0zqVlydvGdYvhg0YMgaCQ7gfwQjmCTcmehSq/zugkJCsE2S
	iubkWQJB3RezfY15dMW6zTxOeHuC3tXvhI223/LY4zbMXygiANHBg9VjdBP2ve+
X-Google-Smtp-Source: AGHT+IEPFmO6W6gZjk2aMz1/ra2d5DFY8ROaH6LYShghvw9Kfge7m74KhKaAmmWM6Lp8qkItz52v8A==
X-Received: by 2002:a17:903:320a:b0:216:4cc0:aa4e with SMTP id d9443c01a7336-219e6f37f88mr780756435ad.47.1736004660986;
        Sat, 04 Jan 2025 07:31:00 -0800 (PST)
Received: from [172.19.0.1] ([2401:4900:315c:e91e:a8f1:4734:ec05:235a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97182dsm262417815ad.82.2025.01.04.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 07:31:00 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Date: Sat, 04 Jan 2025 20:59:20 +0530
Subject: [PATCH v2 1/3] platform/x86: acer-wmi: use WMI calls for platform
 profile handling
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-platform_profile-v2-1-b58164718903@gmail.com>
References: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
In-Reply-To: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736004654; l=11377;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=QZVrpuhMlTaz+SSifxG1ApZYCAX0+m/5iaJrT7356nw=;
 b=fJIURnvGcLrBxt9ieBK0DpS6rM0zm/ilLOT8+t/kI7myZWzsytTcnVPjmVEiKTO2CQfgZaS1A
 jFLnsyp9kGTB1zKK6gZb1EsLKAlgOpqR8WhU7/HgzEenZRhawCxJPqP
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
 drivers/platform/x86/acer-wmi.c | 189 ++++++++++++++++++++++++++++------------
 1 file changed, 133 insertions(+), 56 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index b3043d78a7b38a7b773da5ecd4846ca11e8595f5..5370056fb2d03a768162f2f1643ef27dc6deafa8 100644
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
+	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET		= 0x00,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED	= 0x01,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE	= 0x04,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO		= 0x05,
+	ACER_PREDATOR_V4_THERMAL_PROFILE_ECO		= 0x06,
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
@@ -1923,6 +2003,7 @@ static int acer_platform_profile_setup(struct platform_device *device)
 		set_bit(PLATFORM_PROFILE_LOW_POWER,
 			platform_profile_handler.choices);
 
+
 		err = platform_profile_register(&platform_profile_handler);
 		if (err)
 			return err;
@@ -1931,7 +2012,7 @@ static int acer_platform_profile_setup(struct platform_device *device)
 
 		/* Set default non-turbo profile  */
 		last_non_turbo_profile =
-			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
+			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
 	}
 	return 0;
 }
@@ -1946,12 +2027,10 @@ static int acer_thermal_profile_change(void)
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
@@ -1962,54 +2041,52 @@ static int acer_thermal_profile_change(void)
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

