Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E53723A577;
	Mon, 13 Jan 2025 13:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736774074; cv=none; b=MG9rSw16FDiElY6+P86gx39qwlzkH07Zdm8YO3swtfFYLGkvXitns2Fc8kthxXXEQ8DWHYIkNEKjHQ7S7b1cOoIt8JzAu4a2a+FP967XThlebldtjBbo1wFDCHvzCwNFwFlLsXrtSyrLQ5+lLJvmw9vGjoYSUQK8G8tUOpeuEbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736774074; c=relaxed/simple;
	bh=CUcKZGbJ60x3isr5m74jbYJ2wftVQa/D6dx5Db29T1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2aX5lZcA4OBtvvJZQB+QiDtsH3ITg2hL86gzm0HBzt6CDtqcX0uEF/gk536ts3lzqShImCWtj6AqNHOZ9FAeH6kSBuuUmHTxqd9sbsX81bWUQbTj1cpmPfP7xXvYX0V+cSR9LIovVW/BEaVwEOkQLmWbt9z1rkNI4bsTJuFExo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSIB3kof; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSIB3kof"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2165448243fso87747185ad.1;
        Mon, 13 Jan 2025 05:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736774072; x=1737378872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdx58RbkE7UWGw0LJBrSEiuZu1+StplOv00uJ8AcIEE=;
        b=kSIB3kofLLA9cmBhacldqhFZv0H8DGQcvZZcMwwTg0w3BuTQ9GoeRm5g4vdLpTs9T0
         kSUgUXsDhS4L0G9pXdf1wwUEctoTq8miBGax+tIkRzSCfNUv942yGqfJ8uSMYxFnN/WV
         6MfWl+cNtZBPKHKpyffqRvbQyyu4oD63XiV1BdR0s1vwF7nsQMQrMMoBFhy2YpGVwaVZ
         exk8mwLKQmMAIVMe4fRBO8HoLukQh+O/vp2dl1WNZHzmJMuTLVyCELcOCu9pfEi6Q9Tt
         0sq4XBBrkgApy/zpgjF5nJuApUq2FUwx5/QpXimiWJ84Wu/oNh70CJBS1RCmIHMsFszi
         Qckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736774072; x=1737378872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdx58RbkE7UWGw0LJBrSEiuZu1+StplOv00uJ8AcIEE=;
        b=WNI3T98PbkXmBoC54oeMNTiRH+5mpfnOv5JjwhWEsY/D3hl1JNtXW/ogz4/Bvly66L
         TDtDaveCqsI9h4/UQKgk6URmKjiSldozcAoiT4rArXBU0hs2DGqwYW34QWn5v/3M1/O5
         DBLQ7vizWpAd8vIRYnvNSlCWPRNKbwCd8yRHW4XUBzWCYojS/FEIIUL7yDECwR5AQot6
         NoSF8YtbhSseasj9N6GC77f7A/zZ0A/4uTcEQCAsdT/BuQ96tc3MHtFDZ4MvOeK8Nm9e
         /roUgM8ci7a/CO/8iDE+LxMbc+YPLszWwS1lV9m3SNJUQluOEuKazOXGGuqy/kMAHcd2
         w0xg==
X-Forwarded-Encrypted: i=1; AJvYcCUIHIwhz4paxIjJaZO158Zj9WGdy3VOuPcnv5GhpYaMJenLS/vO7n60u90xfqhOLlY4YQ2Fjt2KoN+slhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YytmhHIvTptWL52uKUQyCDVqvF/NUdW5fAFefLQPm0LTxnlnTtw
	e5eEaP/DQLvyfmsXoyUaLN7C1hYPj+D6F02MhMBmYQ3VdK/+b/6WKtauIXC8
X-Gm-Gg: ASbGncs55gOebtpv7GHAGW+hWY0n6S1kxz0+1Pxm2qabwm4VoF0ZlXh9mO4SrnN8ENy
	FM3P7MTeHmBCQy2FUMI2eU/U6V8KesCzrJxMf4e4MhkrG0PC1+MXBJNezyvxnSmbuRXIqSEC75b
	z2w5NacWBU/bND/+jzfJ/efs4/wlKNs439ZUkXiJBE3CBIUstLg17AkUaTM/sPonhmCpC8rEXbh
	uJnoiOguQqPIojaOSxdVGs4nBfubluGeZCq3/hRMhuLGifW5CA+lua7cRekpA==
X-Google-Smtp-Source: AGHT+IGEZ3F1q1aROfxsG+xQZr4KKu+Wt5nnx4sy8ZKLupVcsA6ZJBTW4f5BZBlauV6Bt+/xy9N5IQ==
X-Received: by 2002:a05:6a20:2594:b0:1e4:8fdd:8c77 with SMTP id adf61e73a8af0-1e88d13b502mr35724199637.8.1736774070722;
        Mon, 13 Jan 2025 05:14:30 -0800 (PST)
Received: from [10.113.16.67] ([117.193.77.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31840e93absm6961209a12.20.2025.01.13.05.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:14:30 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Date: Mon, 13 Jan 2025 18:44:11 +0530
Subject: [PATCH v4 3/5] platform/x86: acer-wmi: simplify platform profile
 cycling
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-platform_profile-v4-3-23be0dff19f1@gmail.com>
References: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
In-Reply-To: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736774055; l=3940;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=CUcKZGbJ60x3isr5m74jbYJ2wftVQa/D6dx5Db29T1I=;
 b=HhGwKOLJnMpa/waivnbwNNVVMw2fSROSl0OL/2Bd3kFMwuSou8gl4mE5Is7ouBcnDhrIzoCu/
 CqggarbWNa3D5SFgR03bL2PAVEmsEQiyUN837/8tNLaXpqbUfdCVUbn
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

Make use of platform_profile_cycle() to simplify the logic used for
cycling through the different platform profiles. Also remove the
unnecessary handling for AC power, as the hardware accepts different
profiles regardless of whether AC is plugged in.

Link: https://lore.kernel.org/platform-driver-x86/20e3ac66-b040-49a9-ab00-0adcfdaed2ff@gmx.de/
Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 78 ++++++++++-------------------------------
 1 file changed, 19 insertions(+), 59 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index f662e3740408f70e1e921a90fe75ce441fd239d0..88416c37eca0af2099b0c8d91b38912a4e5d108f 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2028,76 +2028,36 @@ static int acer_platform_profile_setup(struct platform_device *device)
 static int acer_thermal_profile_change(void)
 {
 	/*
-	 * This mode key can rotate each mode or toggle turbo mode.
-	 * On battery, only ECO and BALANCED mode are available.
+	 * This mode key will either cycle through each mode or toggle the turbo profile.
 	 */
 	if (quirks->predator_v4) {
 		u8 current_tp;
-		int tp, err;
-		u64 on_AC;
+		int err, tp;
 
-		err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE,
-						   &current_tp);
-		if (err)
-			return err;
-
-		/* Check power source */
-		err = WMID_gaming_get_sys_info(ACER_WMID_CMD_GET_PREDATOR_V4_BAT_STATUS, &on_AC);
-		if (err < 0)
-			return err;
+		if (cycle_gaming_thermal_profile) {
+			platform_profile_cycle();
+		} else {
+			err = WMID_gaming_get_misc_setting(
+				ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, &current_tp);
+			if (err)
+				return err;
 
-		switch (current_tp) {
-		case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
-			if (!on_AC)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
-			else if (cycle_gaming_thermal_profile)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
-			else
+			if (current_tp == ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
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
 			else
 				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
-			break;
-		default:
-			return -EOPNOTSUPP;
-		}
 
-		err = WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, tp);
-		if (err)
-			return err;
+			err = WMID_gaming_set_misc_setting(
+				ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, tp);
+			if (err)
+				return err;
 
-		/* Store non-turbo profile for turbo mode toggle*/
-		if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
-			last_non_turbo_profile = tp;
+			/* Store last profile for toggle */
+			if (current_tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
+				last_non_turbo_profile = current_tp;
 
-		platform_profile_notify(&platform_profile_handler);
+			platform_profile_notify(&platform_profile_handler);
+		}
 	}
 
 	return 0;

-- 
2.47.1

