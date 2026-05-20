Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5FE2BE7C6
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 14:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286155; cv=none; b=u2PkAxTwn/nLv7Qs0teV7CCQwU17CJL6/Vgpst4xcD3/J8FGetCAHZindE7gzpuipFnn+pU6UU/ZYOvB4x5a1zzPpObGeScF4H7esrGB9NH3Ab9VQs+ZXKHnUoZgNVFm6w9/HujWRkEcMZrrG9Avh4Ak+cJoxS1YbXjCeEVaWiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286155; c=relaxed/simple;
	bh=VOL1dZ+0liw4I0f1TvGE7W03xZEqkwnrbh4Kv0+Xnq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfkHRjhemZwOsGAbhVq7evB/9Lp/TObHkLhjYx37mvslHcd7dMT97DMA91Rx8hPD0rZOrLAxM4mHNAX3LPcviqJCciUwZAHOTdJnSo5rENMLf4naeIZxcVhNptabRWd1KiD0Afkhtf7sZpwXIs18ALVafzoNzaijBcAdDBWQTzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJJysTdq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJJysTdq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so1999393b3a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 07:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779286151; x=1779890951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgzZmk7PrHR8G+H9VOVmVYi0JlqrD4zCuzYVpnJdAXI=;
        b=YJJysTdqYkDwM2CtCEKHOUb03tRGWIlBgc8KqwPVTs5GOD4VesgERVAdNoDI9gS7eA
         xWwhOz+7gCGh/B7bKFjJ3hcAyke/BO0txj52GF0jHH/krkLfXaeE1qENO9boLiwgnw+l
         MIaBx6J7WuFGt/X54xdgK6DzbBPXSb+uGENFL6ziikjkvITOPflrXI2rS5WathcE6FPN
         ogETmjkOZdFBtwAcRsavihh3pYeyMqODQ2o8LH+fylYsyMcqircPShM1jAzzk5C5s07i
         Tl4i12X8qbjNxZ2b5RayUBk27mR0IgMuRTvshg+wRNS8RFU4PhdDyqywCyeQr0I623Qk
         kcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286151; x=1779890951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PgzZmk7PrHR8G+H9VOVmVYi0JlqrD4zCuzYVpnJdAXI=;
        b=ScmySIDJyeKg68hqa0gUjqh+IhORMB+xZyNk3LLupX8Fw3O4dQenPZxt12X8fppmK2
         pyWaQUkACqV1t6Ro2ruzxF7b+fiie6QrgmhAkNU5obfiijbE4faG7vXrmmV7mGwBxmrJ
         4dikBYBwUDnpQSyxMdNqJOk8vZKRBh/QX8rsZE+sRnR9KqCupqOi4iYFc8YCKSl6hGD8
         CLUZ9Z0qr98G5MriE10ex6olriaG5WvSD6hCL51TAJ7FSke8DzEwlYZ7h6O4DkXouVgj
         Nh9JXMj64rWI7SpazbN9i5iH4fJkeDWpKPZO0HgBPmHDHW0pt2BgiSGbtKwN9qLncaLR
         7fqg==
X-Gm-Message-State: AOJu0Yz8NBRDD0aAEfwW3q/hQ37himQlaU9FvfYWHorAj5NHw5GuX0Ys
	qImxoFJ2g9DmIAs+oVegj18CcP/IVRwxjcWMjTvg03a873UnOw9ZbDkKXZl7nvLEX5k=
X-Gm-Gg: Acq92OFuISdmbfCs5OMfex5vcbVzxRigqMylHM4ARbO38rMO4AnNcqjRpspEWZdo+RY
	PsYJV8tQdOpLztPPjOd56C8DjL02YIFeAPphhRjv2keEZKEA5fjL68/e0ubI457kQ0kP2MwIGsn
	qZT1/SQeyojQjSPYxZZz2kpFuunCwgTjXkog37w97jnRULwvmHn5ARQ2zw84Bo4vOc1iRpXBGw3
	HwFNQSUsZcybHt2mZrGblxLn5UzPaQx92qKCxBuDmQypONPXup9Oxty/u6oCIwzEc+yMrOYlcC7
	mDoGCIrtszA7c7X7lb4Bh828W2y8UKiJ9C0jcPsIMaSJBKbY8eJuTM06swZfPyuo8dLQGXToExB
	Utfi6QNzd0YV6Wr9gxnjH10AUov1leYQCVTgViLpymjpmI4RL+uwsVQoIySFPyyOeItfpuNrNA3
	WGJSeBMWLmG3kha78uMUxpOkun10FBfl2aCQ==
X-Received: by 2002:a05:6a00:39a0:b0:82c:d7c4:4c56 with SMTP id d2e1a72fcca58-83f33c43997mr23914183b3a.15.1779286151373;
        Wed, 20 May 2026 07:09:11 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c38:1e5a:9abb:36af:543:3c14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10989525b3a.48.2026.05.20.07.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:09:10 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	krishna.chomal108@gmail.com,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v5 2/2] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
Date: Wed, 20 May 2026 19:37:48 +0530
Message-ID: <20260520140800.130530-3-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520140800.130530-1-radheykalra901@gmail.com>
References: <20260520140800.130530-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP Victus 15-fb0xxx board 8A3D exposes the Victus fan table and accepts
the existing Victus fan-speed WMI control path. Add it as a
fan-control-only board so the hwmon PWM interface is enabled without
forcing Victus S thermal-profile handling on this model.

Tested on a Victus by HP Gaming Laptop 15-fb0xxx, board 8A3D, BIOS
F.22. The fan table query succeeded and returned rows including
cpu=23/gpu=0 followed by cpu=24/gpu=22. With 8A3D enabled in the
fan-control path, pwm1 and pwm1_enable were exposed through hwmon.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index dcfffe6..f463823 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -170,6 +170,10 @@ static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static const struct hp_wmi_board_params victus_8a3d_board_params = {
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params *active_board_params;
 
 static const struct thermal_profile_params *hp_wmi_thermal_profile(void)
@@ -230,6 +234,10 @@ static const char * const victus_thermal_profile_boards[] = {
 
 /* DMI board-specific feature data for Omen and Victus laptops. */
 static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
+		.driver_data = (void *)&victus_8a3d_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
-- 
2.54.0

