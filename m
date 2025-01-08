Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70D01F0E38;
	Wed,  8 Jan 2025 08:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325973; cv=none; b=UnPvVRQbX48RoPHIiEi9g0cC+Q8FII9x5a4/T7tZzhYI98554L4TTChpzDO2lgOJhpWY0mAm+eCbad6GhlzFrplSlDZ/9hYKHNR/jqanAA6GxcpzyJbiLHFNF+qMIzvmxqQRkZ5Tm3zGvy7bHOZgB0/gKC+RYNny3canSNwJVag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325973; c=relaxed/simple;
	bh=rSB9wBk4XoxGxfasLjGzFlGQLBNclMGlYpCEFAcEZ2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gu8oiozhKwEK8B0F50hdTwjITSmWpPF+Nxb25HaE8Gan0vIAi1Z3cdFQChZJpcfpKpYfUflK6l54u9/cy0WKby4oX9AFRsV8YAWv5PziSoyzyFn64Vkla5/0pL9v92xz+YVYhgAIoeWDi6d/bzIoXsqQyQOpQ4/Vq1I9Kcb7Pvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3pfrHdh; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3pfrHdh"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21670dce0a7so72179885ad.1;
        Wed, 08 Jan 2025 00:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325970; x=1736930770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aujqfzf+Zfy8dsZ/+H1C+mIMGl8nWFEnF6FImzkZAvk=;
        b=K3pfrHdhvIKgDAIVB/m8oVI/1RUQnxa7ExZrcYPzxSkRHPYz1QpqwAXHXRrHXGj+Uq
         sQuf/2DylO0BhAsRsgCfdHccS03ufW1RyH7flW3MBHABuiGSulEDFQJ4W4HR/EoEn69/
         HJcNT/9sp1Nrybfh8iDJfqUW8tgCNF/XqMXtv+ct+Kx/5/BnKm7669Yg6kSbzwb4jBgT
         znOQ3TYjJ4l418GKISUrFWH9wjZS8EGzwLswNk/Yhsrs3o82hI7Wyxd5VqUErXCaiZZf
         FxXKJOvGmZNWT6l1UCnZ3fEbEFq55ezjPCJsQ8dwuLIgf/DXHxXAZvNqOHCnMpezcglJ
         vXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325970; x=1736930770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aujqfzf+Zfy8dsZ/+H1C+mIMGl8nWFEnF6FImzkZAvk=;
        b=QlJQxTLgldCNKFUC/EPxJTLGb2HXkfNfl9f7I6ZoUAh2sFNfrj4cjJIdIpRPYuSNT5
         u38I0ka4iwYbKOJibPTKU0dbejbFtAbmcTBXM2hd2yPdcjHZoQJ0akyvPLjHYzKYmyQG
         ThytL0fKA/o8WDq+fwMErUY9K1dL98KrszgGdy/4jtmosLS3GnhPlipvTlXn5PKYan3D
         X74q3PYu9+6w+sxzJUBw88YQ4XvTyicijsCQL0tJWIRdHcxJIShIH5CbJsA77oEgIK4G
         iwZr5NVgZUMv/boBMxMdyxOiNA/lgpbk8W0GV9inQwLDeD2AIVKtZTl+XNKbQaA7Ay7y
         mGxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX3uNv0FZALwWoxGfJDygRmL1nPOFPEhBaTTICNNgkrIV05UwAqK/d71v3jrEJ65YISmYgRDq6Ar+tcfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAonGHhr+UphVrUH5U7YFXvAPJKSoVkWgIHTwLKFhm8DvYIMct
	Qz38GPQJJnMG9RpP/iora3d5OnUZSq1QiZsUwZfRdgsen6FGp+p15N0kk8D5o5I=
X-Gm-Gg: ASbGnctWVAey2oVCc5f6jHoNCEeX6DD1oTxNQqeVK6Mxro2OKYA641jZMDVkeCl2eIl
	YL+u+GyFkhTzlse39D9YaVRSAVd07ikB24n9pGYtyuRG54Se7EOURtxTnTr0lyQC5rweF/dJFQX
	PWb4OmdvpyzxzQ/bEusiA8zgE/OtXk64a2dLnegPMgitQATTcb7ICeyApH+OR/QFq3jTSvKVDpr
	XZ8oyaFZvazKj9lmuyz/ezZdprVNSa57HUQys1WxRYNrVxAMEyxRY3a87qvkA==
X-Google-Smtp-Source: AGHT+IEJFyKVtnvJr32IR1InkIVDUgVESQO6KGgiR0Dww8aQbwdhzjVM28OxgtRF6r3c15QfEY0zng==
X-Received: by 2002:a05:6a20:72ab:b0:1e1:af9e:2779 with SMTP id adf61e73a8af0-1e88cfd3c67mr4599177637.22.1736325970578;
        Wed, 08 Jan 2025 00:46:10 -0800 (PST)
Received: from [10.113.16.67] ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c18fsm36150152b3a.184.2025.01.08.00.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:46:10 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Date: Wed, 08 Jan 2025 14:15:25 +0530
Subject: [PATCH v3 3/5] platform/x86: acer-wmi: simplify platform profile
 cycling
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-platform_profile-v3-3-ec3658d9be9c@gmail.com>
References: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
In-Reply-To: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736325951; l=3864;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=rSB9wBk4XoxGxfasLjGzFlGQLBNclMGlYpCEFAcEZ2w=;
 b=9uJXnoQ6jOMHUwlw6xAUimIQyP7lYsrqPteJc0azuKW8r4Pk5lrRX/5KOwyEMB5qpBbWcrQ0+
 LKTascm+KkEBZLL/FGEb+ZPYxfQIpNaXkK809EyCFORsROpusNDQOZc
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

Make use of platform_profile_cycle() to simplify the logic used for
cycling through the different platform profiles. Also remove the
unnecessary handling for AC power, as the hardware accepts different
profiles regardless of whether AC is plugged in.

Link: https://lore.kernel.org/platform-driver-x86/20e3ac66-b040-49a9-ab00-0adcfdaed2ff@gmx.de/
Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 80 ++++++++++-------------------------------
 1 file changed, 19 insertions(+), 61 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index f662e3740408f70e1e921a90fe75ce441fd239d0..7968fe21507b1cf28fdc575139057c795e6a873b 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2028,76 +2028,34 @@ static int acer_platform_profile_setup(struct platform_device *device)
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
+			err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE,
+							   &current_tp);
+			if (err)
+				return err;
 
-		switch (current_tp) {
-		case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
-			if (!on_AC)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
-			else if (cycle_gaming_thermal_profile)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
-			else
+			if (current_tp == ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO) {
 				tp = last_non_turbo_profile;
-			break;
-		case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
-			if (!on_AC)
-				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
-			else
+			} else {
+				last_non_turbo_profile = current_tp;
 				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
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

