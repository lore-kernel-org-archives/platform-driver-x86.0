Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5943723A58E;
	Mon, 13 Jan 2025 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736774076; cv=none; b=bQcjK5PrTKhvVeT9XHBFkdXXZi1qYIkyb74Fclk90KkVoNp3qcch37RWhGLsImBW8cAo24FjIUOc9s9OxkG+ZrELW2MAqPwKEOneD52WZ62q0BsMVB5GmzOWhlK+tJN03tTpSob/5gTYciTGBQZ9SY7bCZYuXLu9JtbR45irrKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736774076; c=relaxed/simple;
	bh=9gOtIFNC+9p0devArM1OIQgXPradQhZJkE2B9DNLXEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KVjIrJAEX1jbpr7wIIuOt1dCy7Y+QahQcNsDKrLtMAxzhdRvebhTsVYDxrnVJ+jTuVMAtJVn2vOqmZgGVnV9nfppWGqzHnK7fZ4g/iAIr14mZvKB0A+pObi4effZuljbgyXNlFhHPGUOs3gM5EPWjWWgUm9D24ptd5laWTADeh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HinWtXB6; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HinWtXB6"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2161eb94cceso50279655ad.2;
        Mon, 13 Jan 2025 05:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736774074; x=1737378874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KjjxCDGj5y3C+fSOgT4oOkpbJF7wzDOY1kUuqtfuxk=;
        b=HinWtXB6HCoLvRQ8zsUwJD4pKMG420Y2sTFJk/o9YI11aslGNrF0+uzRLGWXP6suax
         phm0x3SpCo8qmTJsCVxSscMWROLhh17v5Bx46uDBItsbsKcT02d1LajlHrORK/AJfKzV
         /t5tcCoCQJUxG/AOCzXjyp1aXhMXx6jz+WPtKxo16KV5Dj9NnEBJTCdHuCSL5pDRX5ee
         jPouCiteQf+F1MCpHXLyw2Hm17hNA0EDs+GBcQKvod2wi6It+14GUWgSBN2igiytRsX7
         64wVrurb8n+ulPVtDGrE9bNE3XSBDVGI3rmLGPkLKmw+WkDqhllM96I211sYkojETFJ9
         JJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736774074; x=1737378874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KjjxCDGj5y3C+fSOgT4oOkpbJF7wzDOY1kUuqtfuxk=;
        b=Z8VI4wmWTTwszqgKPFtq/7bymw1qN5EdQdyqbMhc8diRD6ED18hVtWhaaeo+LfQc45
         Oy+RCCMKpaHjwARdXDIwzRn1DwpVws6Yvv52h19aCQtsSlZUTDwz0ZPYJB2qwERAabZS
         xagOJ1NlCJnqvNgEDsrff5sv8VBUqkJgBKEPelBtDDmcnNEBAAVWfb7VgxR14y5Div/D
         D8z271OtmEZPeh7hmqlmMmPw0s37wujPR8Uhhh74ks3AmTyeYhtrqmz1uhUeTguxC2cf
         6vINz9chtAxgq6XW/C40BrIRRe/fh+SeREZMp7qK/JzI6VFH/nghZa115zFRVFGC9tix
         stGA==
X-Forwarded-Encrypted: i=1; AJvYcCUDW42PmFpXOZVQYe4Bq8lwUPls1EJd7d9t43at5iUhgrXy5oIk9DKuqUgmTQW3Vl9fzb9v+gIcDnj3dBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrDByiP4bLo8viWAGMKqG0J0iEG1aL15TqoajEGhqWrvTAVc5V
	yfuCUZY9qx5ND1Dd7Alsg5nrO/JAYu+x6eM21rAGn1GTY3to73WUZLwS3ZSG
X-Gm-Gg: ASbGncuXcOXPyes+YGDdmzEjxZvg3yzd3fHhoHBBgDcLPVJeoSQc8d9kVE+H8t+js38
	dwQw36P6YHhTr40YG8xsw5q1jtDOe2lSnrkRZ+EGDYf8nKJU2oa8N3uBjns7PD+YX3Ez3NMimtz
	UdM8xspuC9/nMMDFjyda3iSmbWqQlExqlvuTLqjqLEe8fw/8uUPE+SQWfN7C4Rh5gTPlPg61UkO
	AHttGbFizQrt39Z0SgQlWuOrHgyDOg6S0wEoDe2QJEoMucAtLw+SJPFBdTzdQ==
X-Google-Smtp-Source: AGHT+IGLoFo3zIUtaKcfrg+ETQceT+Ur1KNUCw6BlEBI+xxlQek4/Eb9nJzu/3ZPwQ0DP6oCgcCFGg==
X-Received: by 2002:a05:6a20:7fa1:b0:1e0:ce11:b0ce with SMTP id adf61e73a8af0-1e88d0a9418mr37681488637.35.1736774074442;
        Mon, 13 Jan 2025 05:14:34 -0800 (PST)
Received: from [10.113.16.67] ([117.193.77.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31840e93absm6961209a12.20.2025.01.13.05.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:14:33 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Date: Mon, 13 Jan 2025 18:44:12 +0530
Subject: [PATCH v4 4/5] platform/x86: acer-wmi: use an ACPI bitmap to set
 the platform profile choices
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-platform_profile-v4-4-23be0dff19f1@gmail.com>
References: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
In-Reply-To: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736774055; l=5593;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=9gOtIFNC+9p0devArM1OIQgXPradQhZJkE2B9DNLXEM=;
 b=O8nOViNyXF1yZA0VaL39HjMYbJSpAO8BcSw1zPlgWwPwzRCADjz22mkPEasMAbRu7vUy0C4y1
 vazr5/iR6eVAn0L5z3YOps0z5280bAqyGgS7ZtCqc+qxchmLIB28XU+
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

Currently the choices for the platform profile are hardcoded. There is
an ACPI bitmap accessible via WMI that specifies the supported profiles,
use this bitmap to dynamically set the choices for the platform profile.

Link: https://lore.kernel.org/platform-driver-x86/ecb60ee5-3df7-4d7e-8ebf-8c162b339ade@gmx.de/
Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 67 ++++++++++++++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 88416c37eca0af2099b0c8d91b38912a4e5d108f..37f8c2019925391185e1e0952dac563daf923320 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -33,6 +33,7 @@
 #include <linux/units.h>
 #include <linux/unaligned.h>
 #include <linux/bitfield.h>
+#include <linux/bitmap.h>
 
 MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
@@ -127,6 +128,7 @@ enum acer_wmi_predator_v4_oc {
 enum acer_wmi_gaming_misc_setting {
 	ACER_WMID_MISC_SETTING_OC_1			= 0x0005,
 	ACER_WMID_MISC_SETTING_OC_2			= 0x0007,
+	ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES	= 0x000A,
 	ACER_WMID_MISC_SETTING_PLATFORM_PROFILE		= 0x000B,
 };
 
@@ -766,6 +768,9 @@ static bool platform_profile_support;
  */
 static int last_non_turbo_profile;
 
+/* The most performant supported profile */
+static int acer_predator_v4_max_perf;
+
 enum acer_predator_v4_thermal_profile {
 	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET		= 0x00,
 	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED	= 0x01,
@@ -1983,7 +1988,7 @@ acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
 	if (err)
 		return err;
 
-	if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
+	if (tp != acer_predator_v4_max_perf)
 		last_non_turbo_profile = tp;
 
 	return 0;
@@ -1992,6 +1997,7 @@ acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
 static int acer_platform_profile_setup(struct platform_device *device)
 {
 	if (quirks->predator_v4) {
+		unsigned long supported_profiles;
 		int err;
 
 		platform_profile_handler.name = "acer-wmi";
@@ -2001,16 +2007,46 @@ static int acer_platform_profile_setup(struct platform_device *device)
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
+						   (u8 *)&supported_profiles);
+		if (err)
+			return err;
+
+		/* Iterate through supported profiles in order of increasing performance */
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_ECO, &supported_profiles)) {
+			set_bit(PLATFORM_PROFILE_LOW_POWER,
+				platform_profile_handler.choices);
+			acer_predator_v4_max_perf =
+				ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
+		}
+
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET, &supported_profiles)) {
+			set_bit(PLATFORM_PROFILE_QUIET,
+				platform_profile_handler.choices);
+			acer_predator_v4_max_perf =
+				ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
+		}
+
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED, &supported_profiles)) {
+			set_bit(PLATFORM_PROFILE_BALANCED,
+				platform_profile_handler.choices);
+			acer_predator_v4_max_perf =
+				ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
+		}
+
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE, &supported_profiles)) {
+			set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
+				platform_profile_handler.choices);
+			acer_predator_v4_max_perf =
+				ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
+		}
+
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO, &supported_profiles)) {
+			set_bit(PLATFORM_PROFILE_PERFORMANCE,
+				platform_profile_handler.choices);
+			acer_predator_v4_max_perf =
+				ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
+		}
 
 		err = platform_profile_register(&platform_profile_handler);
 		if (err)
@@ -2028,7 +2064,8 @@ static int acer_platform_profile_setup(struct platform_device *device)
 static int acer_thermal_profile_change(void)
 {
 	/*
-	 * This mode key will either cycle through each mode or toggle the turbo profile.
+	 * This mode key will either cycle through each mode or toggle the
+	 * most performant profile.
 	 */
 	if (quirks->predator_v4) {
 		u8 current_tp;
@@ -2042,10 +2079,10 @@ static int acer_thermal_profile_change(void)
 			if (err)
 				return err;
 
-			if (current_tp == ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
+			if (current_tp == acer_predator_v4_max_perf)
 				tp = last_non_turbo_profile;
 			else
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
+				tp = acer_predator_v4_max_perf;
 
 			err = WMID_gaming_set_misc_setting(
 				ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, tp);
@@ -2053,7 +2090,7 @@ static int acer_thermal_profile_change(void)
 				return err;
 
 			/* Store last profile for toggle */
-			if (current_tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
+			if (current_tp != acer_predator_v4_max_perf)
 				last_non_turbo_profile = current_tp;
 
 			platform_profile_notify(&platform_profile_handler);

-- 
2.47.1

