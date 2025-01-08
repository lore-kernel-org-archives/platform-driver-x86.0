Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACB51F0E59;
	Wed,  8 Jan 2025 08:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325977; cv=none; b=haPj5vtlvwohtSWm6qDHHazycSOimPAKLInbcdqncnkeD9kmUgw7QNDbh6COZ8Q3Es471DSSeG4l/wKFtZCjb3uUtl9Kg/tdrm9d5k95ZBM08OuJJ3o2tPoRfExygbgJyMobtru1aHhgLU3dqhi+Fld+vGFKNxna06ZjA3Ejo0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325977; c=relaxed/simple;
	bh=di4Fx4wgPYXzBx8a23rdLVv2KV8fqz8zcW9JPzoWtT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dNcBPnlaLUB/KLOJqPDqjY0bIjR/LhtvqTwLKSWI1tBnr22Q76+ybpu3QT2x3dTE+Dkoxe0i/IlH4NTv5S59BGoAsSedYUobooAZJuPCoAwsjottjYAD/7Imen4M2365AToCTSos/k7QERFyNNlrmGqqyLLyLlJiPrrghdULQIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pm2SeCNZ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pm2SeCNZ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-215770613dbso182753815ad.2;
        Wed, 08 Jan 2025 00:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325975; x=1736930775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bA8H0HlkjDIyYVPxMw62A6Px8o8J4m1tI5aZXOEk3wU=;
        b=Pm2SeCNZV9+6vLPJKLW3spXgvgyCI0nSsxA5sL8MSPgZKVOWcJdEwGksuctGpzf7K0
         puQoJ4v0vpui7vc7TPEnTr8U6wt6FjbhC9OTFIUQMOkFVFmqOJyTfQEY1XpiKJQVL5HZ
         nyT36rAoyd++rVV5zTDeh5QEcOPIegi3AbR317CEELHoI7W1HV56UsVIDo2GAkpFJW2M
         XiBBkqNR/Wtcg0jBFZHQXJ3DEyceIWzgHX+q/PNbKkkoCD2Uq7U0sp5FceNZrqJBXB/D
         ChrYsQ3r9ZICwzG2l25+3doaWjVrATy8LLO5NhdiOguFiE71TF7XoCr45T+w43zXIPD+
         1fMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325975; x=1736930775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bA8H0HlkjDIyYVPxMw62A6Px8o8J4m1tI5aZXOEk3wU=;
        b=uQoyeDRgkymg/iT72dOEGJ5qTi2Rk1YHMmpfDTFhvw9TQDnjNQj0pfR2z/zk6VfJWH
         lEBuUcORKLy4yFe49cffJWAF/hs0Ept4OfoOA3jbMSZu6ZQh1Y7k1nMiKJBNIcLVc0mN
         6d4RbqpwEOKT/0lqKKsO9xj50y0A+5NyVt8051a5nLumeo/hikmWyFEaGjGAh3oZ78px
         QWU9NxTvuBMqXpzyKH+lMlOjZFA/6GnFBDwfwMvgEfakwIBkkXpkcO/Db9Hx3/4ryBuk
         vAuU+ejQvXRC/NQp9ekngoJGeH+/nLYaUlSBQ5bdGDLsrtPePy1adpaj/p4bK9HYltk2
         W02Q==
X-Forwarded-Encrypted: i=1; AJvYcCWA1s3X9ZypBav0OdHflJIGJXPDqEbSjKq2rtO8ecd/wNokPmJVSksvwwQiE8CKtmqorCnUWIEN6GzXZjo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh8zQuauievgV/+HEvo39CqWjdWfcDBq2TDhIttQp6KifE3gxb
	e1LTkp1uSSR9ZX9zHGPZY5oBlK/79aPiQ8enIhF9taweF9G/dxHb6FLDgOA6bgk=
X-Gm-Gg: ASbGncs7SllODzx9DhCt+K6F9SS43nQ0NhlUyTPJsJOZ+xU1hRpCUgH+j5RvI/s4sg6
	y8Cm9Y0WIfIauE+JCr9ZUjS7iE/rkLr/6VUmTmasjKUMuURhZTU58oq0rPdotAF2SX3SIOaLsBJ
	9YcbNS89RwKEOeYSgBHKr+C8CXsaw7sjD97pCxAd7K4OGOhM04SMfKoyH4L85eQGg9LhFWaXbBE
	Lug2DVGEcYwdTTev42Jm48HrQ/Ydvp//oDo66ViP5jhtt8XtZyZIliFdSNqHA==
X-Google-Smtp-Source: AGHT+IH13fvaioPQQTtFJwtlNIlKgf6uNhoCZ9gSaah9ARwVtXORGNp/Mk2XwnpSQZVjC3kCPpuYLA==
X-Received: by 2002:a05:6a00:114e:b0:728:f337:a721 with SMTP id d2e1a72fcca58-72d21f29214mr2581841b3a.7.1736325975053;
        Wed, 08 Jan 2025 00:46:15 -0800 (PST)
Received: from [10.113.16.67] ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c18fsm36150152b3a.184.2025.01.08.00.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:46:14 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Date: Wed, 08 Jan 2025 14:15:26 +0530
Subject: [PATCH v3 4/5] platform/x86: acer-wmi: use an ACPI bitmap to set
 the platform profile choices
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-platform_profile-v3-4-ec3658d9be9c@gmail.com>
References: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
In-Reply-To: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736325951; l=4924;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=di4Fx4wgPYXzBx8a23rdLVv2KV8fqz8zcW9JPzoWtT8=;
 b=XUHGLh+MOK5EiGoPFgWC56f+4h9axMT45KR/LMIjXe1j7CrwEW/JTFl5c7js8TZtbcY09fUe5
 Vx2CvOe5/aoD0E9d+UIf+ZZO5etpzKB5r/9atRdIxv/NHVlZrUEhMGE
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

Currently the choices for the platform profile are hardcoded. There is
an ACPI bitmap accessible via WMI that specifies the supported profiles,
use this bitmap to dynamically set the choices for the platform profile.

Link: https://lore.kernel.org/platform-driver-x86/ecb60ee5-3df7-4d7e-8ebf-8c162b339ade@gmx.de/
Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 55 +++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 7968fe21507b1cf28fdc575139057c795e6a873b..6c98c1bb3bdce6a7c6559f6da4ff3c6ce56b60e3 100644
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
 
@@ -1957,7 +1959,7 @@ static int
 acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
 				      enum platform_profile_option profile)
 {
-	int err, tp;
+	int max_perf, err, tp;
 
 	switch (profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
@@ -1983,7 +1985,10 @@ acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
 	if (err)
 		return err;
 
-	if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
+	max_perf = find_last_bit(platform_profile_handler.choices,
+				 PLATFORM_PROFILE_LAST);
+
+	if (tp != max_perf)
 		last_non_turbo_profile = tp;
 
 	return 0;
@@ -1992,6 +1997,7 @@ acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
 static int acer_platform_profile_setup(struct platform_device *device)
 {
 	if (quirks->predator_v4) {
+		unsigned long supported_profiles;
 		int err;
 
 		platform_profile_handler.name = "acer-wmi";
@@ -2001,16 +2007,30 @@ static int acer_platform_profile_setup(struct platform_device *device)
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
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET, &supported_profiles))
+			set_bit(PLATFORM_PROFILE_QUIET,
+				platform_profile_handler.choices);
+
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED, &supported_profiles))
+			set_bit(PLATFORM_PROFILE_BALANCED,
+				platform_profile_handler.choices);
+
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE, &supported_profiles))
+			set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
+				platform_profile_handler.choices);
+
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO, &supported_profiles))
+			set_bit(PLATFORM_PROFILE_PERFORMANCE,
+				platform_profile_handler.choices);
+
+		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_ECO, &supported_profiles))
+			set_bit(PLATFORM_PROFILE_LOW_POWER,
+				platform_profile_handler.choices);
 
 		err = platform_profile_register(&platform_profile_handler);
 		if (err)
@@ -2028,11 +2048,11 @@ static int acer_platform_profile_setup(struct platform_device *device)
 static int acer_thermal_profile_change(void)
 {
 	/*
-	 * This mode key will either cycle through each mode or toggle the turbo profile.
+	 * This mode key will either cycle through each mode or toggle the most performant profile.
 	 */
 	if (quirks->predator_v4) {
 		u8 current_tp;
-		int err, tp;
+		int max_perf, err, tp;
 
 		if (cycle_gaming_thermal_profile) {
 			platform_profile_cycle();
@@ -2042,11 +2062,14 @@ static int acer_thermal_profile_change(void)
 			if (err)
 				return err;
 
-			if (current_tp == ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO) {
+			max_perf = find_last_bit(platform_profile_handler.choices,
+						 PLATFORM_PROFILE_LAST);
+
+			if (current_tp == max_perf) {
 				tp = last_non_turbo_profile;
 			} else {
 				last_non_turbo_profile = current_tp;
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
+				tp = max_perf;
 			}
 
 			err = WMID_gaming_set_misc_setting(

-- 
2.47.1

