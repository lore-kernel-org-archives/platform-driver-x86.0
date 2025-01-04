Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732BA1CCEC8;
	Sat,  4 Jan 2025 15:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736004670; cv=none; b=qzUq+m7cE7cbj14nyUePGO2OHzEPTuq7G5wxDX7i0zJxZgkIYJjfSzi0X+hzGTAHCOWnWcXCDKNI2zY+MOrRcW06dWy6yGk9tPMfiJzFGsYD26gPwSc9JWYF38tArUSRsmt7SDqXXHqC/Ed9yEdEz4Q/Q5O1teRBmNklKEp3HoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736004670; c=relaxed/simple;
	bh=TyZONBQJQqKfqJ3muZg6yHspgdruiXY2D2uolFj8ljo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ClWOouaFiCGW/s8vGUSJ/kEIAdavxrCkm91JkHLhSthCNBDtDeuBR10dt2rvWFkMio/kyFuXrco+b/Ejlg8YLTKXFEMToFxywn5E4I3ivpmtOMBiksDGsEY0+Jb+A7kGIczLCMHqSTYRGhl5pnocevg31W13Uu2sswfW1Bkc7YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFnSnbIE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFnSnbIE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2161eb94cceso129776255ad.2;
        Sat, 04 Jan 2025 07:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736004667; x=1736609467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ys4oGORKa1ZEzSV5egWXtTRM/Kqz3c5tu6DAtr8KGiU=;
        b=PFnSnbIEqYjp1z01O3933iv+Sz3yVNXnW7QtfRY0GTKcCDZgQr5CA32D0sfe0I+6M8
         Pbvx33EIdBJxdYI/oAglLNwALfrGSfy+3utNPAkEd0xnbjJi/CdkioEIdDyTCAFuCdb3
         wOX+SfpHO3sHrqIqlOLpsc9idp8lkvLVbB/xf/QPYrmn54A0kr50Sv01SuLoke9dQ2S4
         j+MFMNtjP3sTMGOhSSFGWlRKu8JMgnHA1rsnTOVpKma383TMN3ExFyMnJjjjZIlSbRR3
         HMOcYxEF//vWNzi/wzZlFgPZH544rE2+SCA2EW/603UatQuLIbMzyEgPjUMRV9m4HV5i
         4a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736004667; x=1736609467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ys4oGORKa1ZEzSV5egWXtTRM/Kqz3c5tu6DAtr8KGiU=;
        b=twTJqJ+A5OitYvK8MhPgU6jXn/aXS6Z47Ex7SRFOAt9XREga1Rx82mHVkG3tCzaS/l
         DOXG2VavIqP5sJRPgsnGu7uVhUV7OL0mvIbCwt4WCLvJXBlkbq61KHHTlYdDG3oUWDzX
         Ko5PINmm+95toh/FKh0jVYnlF6muZiF8jne0S+EJVNMY/SM/hQyYD28/6UelEZKKlUG1
         icWKlRwF6/a371ropNLMGHOFbD5cN1IlfW+bKDPgvIDL96pKjr67FsT3Qq5PqLkG9Y1D
         pc+TrVwJ829J5NRlfm/qF3qfMGX73Io/xGlXUQeXaskPYz+WeyXlb0gNQ//QZoUqZEDr
         EI6A==
X-Forwarded-Encrypted: i=1; AJvYcCVUluQfYaJksUkDmNFX4cVmon+X2g0Drx50ZkxrRyHO8Gnbg+tsDdiy35p1klM0WAFx8uX24QwiDfwyVoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUPj2STrKxAQ6tgSEznEH4NXY++4PQ96wlTlQWbiq+6S21cEnh
	ecrHO6Zza2UXObP5pCOaRG9TCVQNqWnuwoyXOxptGD6rrx99qjKmh7EkBUkh1ag=
X-Gm-Gg: ASbGncuiCX2jZsza+8BFawSc/zGGJojVBR+2AZVs0c6vtHqebBmwYwOCFgG3riCXWaN
	wKezB4Xx/puobqlJub2Pcn2ySSCAJCELNP7ytAG+rUQoMaXfhHnGsIJqf40r5Ml88i1dc5uAweM
	kBNBv/7Ky7MEAOEVtOQUM9Ji+d77GssISrdr69qFChnQ2wj94MR+BxYIjpGpxVtdQBaOdRJseHD
	/8bS0OMHr0LkU/OWhlREd1tgETwdmnNQQxcF6BvYuHVQZ6OtvsFhT3nHj6BVMIU
X-Google-Smtp-Source: AGHT+IF9g4iY/btbkKpWHSq/VYEOO/n/xBzFvebiYwWmcm4ICknkh5rNKk110kZ49EKm3QWX9BjzTA==
X-Received: by 2002:a17:903:946:b0:216:2af7:a2a3 with SMTP id d9443c01a7336-219e6f27157mr907385785ad.53.1736004667310;
        Sat, 04 Jan 2025 07:31:07 -0800 (PST)
Received: from [172.19.0.1] ([2401:4900:315c:e91e:a8f1:4734:ec05:235a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97182dsm262417815ad.82.2025.01.04.07.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 07:31:06 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Date: Sat, 04 Jan 2025 20:59:22 +0530
Subject: [PATCH v2 3/3] platform/x86: acer-wmi: simplify platform profile
 cycling
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-platform_profile-v2-3-b58164718903@gmail.com>
References: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
In-Reply-To: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736004654; l=4441;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=TyZONBQJQqKfqJ3muZg6yHspgdruiXY2D2uolFj8ljo=;
 b=GZN62rtVyUZiw0F70F2F1z1eDoHr0HyLyz/bYLsSWUEY/oDqOcvrcZkCRbRC91oLbeq9CILUu
 hjjRKUAmNyZBM4s6cSuveFbRMAKryQV0kpSLNieKxu4YTK6DJYBi0/7
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

Make use of platform_profile_cycle() to simplify the logic used for
cycling through the different platform profiles. Also remove the
handling for AC power as the hardware will accept the different profiles
regardless of whether or not AC is plugged in.

Link: https://lore.kernel.org/platform-driver-x86/20e3ac66-b040-49a9-ab00-0adcfdaed2ff@gmx.de/
Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 87 +++++++++++------------------------------
 1 file changed, 23 insertions(+), 64 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index f6c47deb4c452fc193f22c479c730aecb1e69e44..9c73f78eb302323299e03bf9dbeb2c68bb422938 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -34,6 +34,7 @@
 #include <linux/unaligned.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include "linux/bitmap.h"
 
 MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
@@ -1975,9 +1976,6 @@ acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
 	if (err)
 		return err;
 
-	if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
-		last_non_turbo_profile = tp;
-
 	return 0;
 }
 
@@ -2036,76 +2034,37 @@ static int acer_platform_profile_setup(struct platform_device *device)
 static int acer_thermal_profile_change(void)
 {
 	/*
-	 * This mode key can rotate each mode or toggle turbo mode.
-	 * On battery, only ECO and BALANCED mode are available.
+	 * This mode key will either cycle through each mode or toggle the performance profile.
 	 */
 	if (quirks->predator_v4) {
 		u8 current_tp;
-		int tp, err;
-		u64 on_AC;
+		int max_perf, tp, err;
 
-		err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE,
-						   &current_tp);
-		if (err)
-			return err;
+		if (cycle_gaming_thermal_profile) {
+			platform_profile_cycle();
+		} else {
+			err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE,
+							   &current_tp);
+			if (err)
+				return err;
 
-		/* Check power source */
-		err = WMID_gaming_get_sys_info(ACER_WMID_CMD_GET_PREDATOR_V4_BAT_STATUS, &on_AC);
-		if (err < 0)
-			return err;
+			max_perf = find_last_bit(platform_profile_handler.choices,
+						 PLATFORM_PROFILE_LAST);
 
-		switch (current_tp) {
-		case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
-			if (!on_AC)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
-			else if (cycle_gaming_thermal_profile)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
-			else
+			if (current_tp == max_perf) {
 				tp = last_non_turbo_profile;
-			break;
-		case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
-			if (!on_AC)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
-			else
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
-			break;
-		case ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED:
-			if (!on_AC)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
-			else if (cycle_gaming_thermal_profile)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
-			else
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
-			break;
-		case ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET:
-			if (!on_AC)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
-			else if (cycle_gaming_thermal_profile)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
-			else
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
-			break;
-		case ACER_PREDATOR_V4_THERMAL_PROFILE_ECO:
-			if (!on_AC)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
-			else if (cycle_gaming_thermal_profile)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
-			else
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
-			break;
-		default:
-			return -EOPNOTSUPP;
-		}
-
-		err = WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, tp);
-		if (err)
-			return err;
+			} else {
+				last_non_turbo_profile = current_tp;
+				tp = max_perf;
+			}
 
-		/* Store non-turbo profile for turbo mode toggle*/
-		if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
-			last_non_turbo_profile = tp;
+			err = WMID_gaming_set_misc_setting(
+				ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, tp);
+			if (err)
+				return err;
 
-		platform_profile_notify(&platform_profile_handler);
+			platform_profile_notify(&platform_profile_handler);
+		}
 	}
 
 	return 0;

-- 
2.47.1

