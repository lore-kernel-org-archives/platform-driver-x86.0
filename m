Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823F1224AE0
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Nov 2025 02:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762222407; cv=none; b=jZfvwwox6/C9gfy2Jia7EV4IUbLZsz9afQZAYcw4dsOYISTqBTcFenyaGaUeKVletveCQT4e5kFXqxGIyr7ia0dYZh58wws2waj4hKodWCF+va5FrFyQg//5TEUiCvgXib2XR1VnVaagh7ZX/4bVCZso248m8K7EDjSrZ4/XJVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762222407; c=relaxed/simple;
	bh=CDf3jvgq+OCuQr+KDgZ0aSe5ajPPr56IV5hu/qxDurg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nE/xDjeBf3B+1thAKWl6SGpUw3rQ+u4bp5ja0mUErslD3inoIv3WA723kQMwpP7IPRA82Omy/KRXK9cHo0h8UvandI38zk9r6R3rHk8hoVT//swxU/PY1WP5jsS+YfifCZrSh0rFhaxPdRksjNqRLfcu38jkrfgnqQmymfAGsM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kv8hiwBC; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kv8hiwBC"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-559748bcf99so678903e0c.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Nov 2025 18:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762222404; x=1762827204; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPYsJYFrtqkibhcoOmwhJR6RFtPleupdkLO0gfGpmxA=;
        b=Kv8hiwBC9H2XCwdEwU+I4dgsyb2XhBe36rxE/9yRCOb98FJ4VwQMRT5FgPwiRJ44xe
         IGp59AMRudkabj1CUg0EiBHkmsoq5l+lP1ajUDvjWIYtE8+HqPoayZF27wdDGLZ1ZSAR
         IonCmYY7d/YoWyulGzPMQU+RaGhiZcal5W12BxK00dmM7Na8eVm67vsJm/UzqwPRmn7r
         v3so+u43jiSZ+vChYaeKaHVIG2/2m1B5l1vRgzjA3hw3EquLJjxqxaz7nl+jgHapFZsB
         qPda00Lt0TO0I9c8ZSW8oiS58I11p8sTea8/suJWc1fF9raZLLOANSH2iRD+orq83VNo
         8xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762222404; x=1762827204;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPYsJYFrtqkibhcoOmwhJR6RFtPleupdkLO0gfGpmxA=;
        b=mC+ZUPN4podqOtuN98xRL9HXaMUJEIS64EVshSQgplopJocF8SDv/jouW7N0c3eES9
         PhF5WczMe6S8UUY9AgKoRfVZxWuKi2i+dSs7CvXfFS2WYC631ScVoB1HEXh7wtjyqDHz
         BqJwxERj8rrjiUKGj632IHDlBtUz2AU/Lrf/eaiciYq8AfuRlV32qoSmuH2/6lxBveLV
         QpoEWpZC8buJBCLEeF0puZRcgek6AD74rUwkz+2NkqoK4VaCyP1q8gIU6LrVMpbub6+g
         Ux+2wrBxj0CQRSOeuAWjRQRicC2r2LL4mPO9SnOp3MiB330qdpPWZhArFjWyM5TQ+3VP
         lB2Q==
X-Gm-Message-State: AOJu0Yy8dNrAilFJ7vKLbHNi5uiQ/EKwe1FcpTyIHRQAHjIrDpRmVFRu
	kPdyxQWx9ZaBUIQEo6tOHs3pH7NeHeL+gL/dwCJfnU84raERpgFgENSb
X-Gm-Gg: ASbGnctbVJG/qYwRvE94/R1YgA2rT3w5UliMJErMMwVylUkEcyppVzP3zt/5MgzZAp6
	reDLeZdMH9t1wOJdwpRGEU5MqBTpTsJZNVAjtzcJu77bRfq3Pwc45YNZzNjdJOfNuR1fi0CJFdP
	wuW6TwkAnQV/0dWP8hLF/Vj/H9HOWvHh+mpXSDmePrDNHCQaWugeScJob9J3zof/v2Ut1rrRY9n
	cfZ5H2BC1nkiJ7czzBIcgG7tVpR9mT8g6NYBuIYeXAhG6tJrO9YaZmajsW5G/D2TlKULmbreWVR
	Gz9F3FqjVdzuLKuKKw35tjshhfcm1nh3MHIJ4DNDK6fdGQimoas47a/vhKVPkWWELM7AAzLRsxr
	tLYGFxdgDS+fAMFVeu9VtYXLw22vdH48VclCa2JVMQw6XOi7VyAPaoPXwtyzzpb5yAqvWfDCLx2
	HPltMZHOo2f38G
X-Google-Smtp-Source: AGHT+IGanpj09wBC/6zuLxGU5hrabV1DX2/aEqDzKrdWNViKcc2hyV067fO9fqkKk4kK8FelPY9Usw==
X-Received: by 2002:a05:6102:588d:b0:5db:c9cd:673d with SMTP id ada2fe7eead31-5dbc9cd6b9amr1979494137.26.1762222404397;
        Mon, 03 Nov 2025 18:13:24 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93542852924sm747524241.0.2025.11.03.18.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 18:13:24 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 03 Nov 2025 21:12:46 -0500
Subject: [PATCH] platform/x86: alienware-wmi-wmax: Simplify FW profile to
 pprof matching
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-aw-gmode-v1-1-eba7b7be0a9c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB1hCWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMj3cRy3fTc/JRU3cQkc0vLJCNDU8sUIyWg8oKi1LTMCrBR0bG1tQC
 WgsseWgAAAA==
X-Change-ID: 20250622-aw-gmode-ab799b2159d2
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6862; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=CDf3jvgq+OCuQr+KDgZ0aSe5ajPPr56IV5hu/qxDurg=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJmcicqzwg355a4++1RsGfjqvOb6iavvzq7cbvNGsGB5/
 /0n0k8rO0pZGMS4GGTFFFnaExZ9exSV99bvQOh9mDmsTCBDGLg4BWAiNasYGXZsVfJQLuBJ37J2
 +8EjritenpjNbBd1/9QHz+gPh876cs5n+B9e5fdB8VzBqRSpf23/9B/Ff7wuYTXtzJctrgF5V7m
 7+9gA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Drop profile matching micro-optimizations to improve readability and
long-term maintainability.

Additionally, is_awcc_thermal_profile_id is implicitly ignoring the
AWCC_PROFILE_SPECIAL_GMODE ID. State this explicitly with code and a
comment.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 124 ++++++++++++-------------
 1 file changed, 57 insertions(+), 67 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 31f9643a6a3b..9af87471549c 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -283,11 +283,6 @@ enum AWCC_THERMAL_TABLES {
 	AWCC_THERMAL_TABLE_USTT			= 0xA,
 };
 
-enum AWCC_SPECIAL_THERMAL_CODES {
-	AWCC_SPECIAL_PROFILE_CUSTOM		= 0x00,
-	AWCC_SPECIAL_PROFILE_GMODE		= 0xAB,
-};
-
 enum AWCC_TEMP_SENSOR_TYPES {
 	AWCC_TEMP_SENSOR_CPU			= 0x01,
 	AWCC_TEMP_SENSOR_FRONT			= 0x03,
@@ -314,17 +309,18 @@ enum AWCC_FAN_TYPES {
 };
 
 enum awcc_thermal_profile {
-	AWCC_PROFILE_USTT_BALANCED,
-	AWCC_PROFILE_USTT_BALANCED_PERFORMANCE,
-	AWCC_PROFILE_USTT_COOL,
-	AWCC_PROFILE_USTT_QUIET,
-	AWCC_PROFILE_USTT_PERFORMANCE,
-	AWCC_PROFILE_USTT_LOW_POWER,
-	AWCC_PROFILE_LEGACY_QUIET,
-	AWCC_PROFILE_LEGACY_BALANCED,
-	AWCC_PROFILE_LEGACY_BALANCED_PERFORMANCE,
-	AWCC_PROFILE_LEGACY_PERFORMANCE,
-	AWCC_PROFILE_LAST,
+	AWCC_PROFILE_SPECIAL_CUSTOM			= 0x00,
+	AWCC_PROFILE_LEGACY_QUIET			= 0x96,
+	AWCC_PROFILE_LEGACY_BALANCED			= 0x97,
+	AWCC_PROFILE_LEGACY_BALANCED_PERFORMANCE	= 0x98,
+	AWCC_PROFILE_LEGACY_PERFORMANCE			= 0x99,
+	AWCC_PROFILE_USTT_BALANCED			= 0xA0,
+	AWCC_PROFILE_USTT_BALANCED_PERFORMANCE		= 0xA1,
+	AWCC_PROFILE_USTT_COOL				= 0xA2,
+	AWCC_PROFILE_USTT_QUIET				= 0xA3,
+	AWCC_PROFILE_USTT_PERFORMANCE			= 0xA4,
+	AWCC_PROFILE_USTT_LOW_POWER			= 0xA5,
+	AWCC_PROFILE_SPECIAL_GMODE			= 0xAB,
 };
 
 struct wmax_led_args {
@@ -380,19 +376,6 @@ struct awcc_priv {
 	u32 gpio_count;
 };
 
-static const enum platform_profile_option awcc_mode_to_platform_profile[AWCC_PROFILE_LAST] = {
-	[AWCC_PROFILE_USTT_BALANCED]			= PLATFORM_PROFILE_BALANCED,
-	[AWCC_PROFILE_USTT_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
-	[AWCC_PROFILE_USTT_COOL]			= PLATFORM_PROFILE_COOL,
-	[AWCC_PROFILE_USTT_QUIET]			= PLATFORM_PROFILE_QUIET,
-	[AWCC_PROFILE_USTT_PERFORMANCE]			= PLATFORM_PROFILE_PERFORMANCE,
-	[AWCC_PROFILE_USTT_LOW_POWER]			= PLATFORM_PROFILE_LOW_POWER,
-	[AWCC_PROFILE_LEGACY_QUIET]			= PLATFORM_PROFILE_QUIET,
-	[AWCC_PROFILE_LEGACY_BALANCED]			= PLATFORM_PROFILE_BALANCED,
-	[AWCC_PROFILE_LEGACY_BALANCED_PERFORMANCE]	= PLATFORM_PROFILE_BALANCED_PERFORMANCE,
-	[AWCC_PROFILE_LEGACY_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
-};
-
 static struct awcc_quirks *awcc;
 
 /*
@@ -610,21 +593,41 @@ const struct attribute_group wmax_deepsleep_attribute_group = {
 /*
  * AWCC Helpers
  */
-static bool is_awcc_thermal_profile_id(u8 code)
+static int awcc_profile_to_pprof(enum awcc_thermal_profile profile,
+				 enum platform_profile_option *pprof)
 {
-	u8 table = FIELD_GET(AWCC_THERMAL_TABLE_MASK, code);
-	u8 mode = FIELD_GET(AWCC_THERMAL_MODE_MASK, code);
+	switch (profile) {
+	case AWCC_PROFILE_SPECIAL_CUSTOM:
+		*pprof = PLATFORM_PROFILE_CUSTOM;
+		break;
+	case AWCC_PROFILE_LEGACY_QUIET:
+	case AWCC_PROFILE_USTT_QUIET:
+		*pprof = PLATFORM_PROFILE_QUIET;
+		break;
+	case AWCC_PROFILE_LEGACY_BALANCED:
+	case AWCC_PROFILE_USTT_BALANCED:
+		*pprof = PLATFORM_PROFILE_BALANCED;
+		break;
+	case AWCC_PROFILE_LEGACY_BALANCED_PERFORMANCE:
+	case AWCC_PROFILE_USTT_BALANCED_PERFORMANCE:
+		*pprof = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
+		break;
+	case AWCC_PROFILE_LEGACY_PERFORMANCE:
+	case AWCC_PROFILE_USTT_PERFORMANCE:
+	case AWCC_PROFILE_SPECIAL_GMODE:
+		*pprof = PLATFORM_PROFILE_PERFORMANCE;
+		break;
+	case AWCC_PROFILE_USTT_COOL:
+		*pprof = PLATFORM_PROFILE_COOL;
+		break;
+	case AWCC_PROFILE_USTT_LOW_POWER:
+		*pprof = PLATFORM_PROFILE_LOW_POWER;
+		break;
+	default:
+		return -EINVAL;
+	}
 
-	if (mode >= AWCC_PROFILE_LAST)
-		return false;
-
-	if (table == AWCC_THERMAL_TABLE_LEGACY && mode >= AWCC_PROFILE_LEGACY_QUIET)
-		return true;
-
-	if (table == AWCC_THERMAL_TABLE_USTT && mode <= AWCC_PROFILE_USTT_LOW_POWER)
-		return true;
-
-	return false;
+	return 0;
 }
 
 static int awcc_wmi_command(struct wmi_device *wdev, u32 method_id,
@@ -1273,24 +1276,7 @@ static int awcc_platform_profile_get(struct device *dev,
 	if (ret)
 		return ret;
 
-	switch (out_data) {
-	case AWCC_SPECIAL_PROFILE_CUSTOM:
-		*profile = PLATFORM_PROFILE_CUSTOM;
-		return 0;
-	case AWCC_SPECIAL_PROFILE_GMODE:
-		*profile = PLATFORM_PROFILE_PERFORMANCE;
-		return 0;
-	default:
-		break;
-	}
-
-	if (!is_awcc_thermal_profile_id(out_data))
-		return -ENODATA;
-
-	out_data = FIELD_GET(AWCC_THERMAL_MODE_MASK, out_data);
-	*profile = awcc_mode_to_platform_profile[out_data];
-
-	return 0;
+	return awcc_profile_to_pprof(out_data, profile);
 }
 
 static int awcc_platform_profile_set(struct device *dev,
@@ -1327,7 +1313,6 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 {
 	enum platform_profile_option profile;
 	struct awcc_priv *priv = drvdata;
-	enum awcc_thermal_profile mode;
 	u8 id, offset = 0;
 	int ret;
 
@@ -1349,15 +1334,20 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 		if (ret)
 			return ret;
 
-		if (!is_awcc_thermal_profile_id(id)) {
+		/*
+		 * G-Mode profile ID is not listed consistently across modeles
+		 * that support it, therefore we handle it through quirks.
+		 */
+		if (id == AWCC_PROFILE_SPECIAL_GMODE)
+			continue;
+
+		ret = awcc_profile_to_pprof(id, &profile);
+		if (ret) {
 			dev_dbg(&priv->wdev->dev, "Unmapped thermal profile ID 0x%02x\n", id);
 			continue;
 		}
 
-		mode = FIELD_GET(AWCC_THERMAL_MODE_MASK, id);
-		profile = awcc_mode_to_platform_profile[mode];
 		priv->supported_profiles[profile] = id;
-
 		__set_bit(profile, choices);
 	}
 
@@ -1366,14 +1356,14 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
 
 	if (awcc->gmode) {
 		priv->supported_profiles[PLATFORM_PROFILE_PERFORMANCE] =
-			AWCC_SPECIAL_PROFILE_GMODE;
+			AWCC_PROFILE_SPECIAL_GMODE;
 
 		__set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
 	}
 
 	/* Every model supports the "custom" profile */
 	priv->supported_profiles[PLATFORM_PROFILE_CUSTOM] =
-		AWCC_SPECIAL_PROFILE_CUSTOM;
+		AWCC_PROFILE_SPECIAL_CUSTOM;
 
 	__set_bit(PLATFORM_PROFILE_CUSTOM, choices);
 

---
base-commit: 1c72d9c3e0c61468de878d906a65d4cc845718fb
change-id: 20250622-aw-gmode-ab799b2159d2

-- 
 ~ Kurt

