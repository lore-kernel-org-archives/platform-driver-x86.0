Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AC8BA27
	for <platform-driver-x86@vger.kernel.org>; Thu, 31 Jul 2025 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753997745; cv=none; b=OW2a7M3aVgOcmAXvntCvM2gJXpwtPeehAhDz9a+HwEQS/qbY/7SUufO9QtWffR+qafxLp0HgMgg665ztDzIh6jd9oIki+p2VpLSh0Dd8km2NPRQMpTnNVO5/EphPhhWb1Tn62lSgia/7nfoQpgsyUsQroVU/wcNY+ujhMks3v+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753997745; c=relaxed/simple;
	bh=yQF2uCTgMrgt5JUg3beEfaFjj7UOPV88JW/ta/EREno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kPTwf+1N+Rq0UIjxSacnnEfgQogj4jF43uBh/Ryam6s7sCtydNusGLNlpRirtoz2KpXeDK141CG2aAJ4g2RQqI1CXy4evjpGkx8lTJ/J8JpjcPHmtZmH68nREf6SUY8tsK6hNHSokO21R0vC18BVPfuh8CBXrlPEEJyVNK9KTfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhTmIagu; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhTmIagu"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7e2c920058fso263718285a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 31 Jul 2025 14:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753997742; x=1754602542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zTEsx0L9BmhmApbN6CJEdBx1NK/yZcrd2CMiI1VonMY=;
        b=QhTmIaguHq0W9Y6ktLRSQD1wGsQkQ0QvydtXnSsOzMzdyHB50N44VmJiTsfqWiMRE4
         BBwCPlF+j+trEe7JcZMNo/TIYmbBpuikd4li9TK7KLkrRQH/S539OhHyNd/RynVS2mWV
         oUlNQKOQt7db+JLG0w1kpM7Oep76KdtJPWBWJnguc+LEwMgkU7RDOdzk7TTaRc1+Wvjy
         7hKJn0LSTv27jgnd/SnHmvqyS6IqBcJg3Bp4kx1bZOr9s0M/kgQ7qPasALGYb1ezWAyc
         Qt9Hu7q+42T9CrmuEpXeP3mMlMdTNvlSDCQDDThl9bpXHbuGnoeEHeoKyDElej8YfEfy
         JYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753997742; x=1754602542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTEsx0L9BmhmApbN6CJEdBx1NK/yZcrd2CMiI1VonMY=;
        b=GPVxTkE3+KL0McOnt9vThoKKftAWHtWgK8RAfbXaesi4Op5QbsX/7P8+iZux1p5anR
         a63XdGRyMV/Gw6zuniXs7FYenzRcc4zEiBzCnVTo/hwfSXwkwIjH+QQCFlLyi8iSI3gQ
         ipzU0PBJ/qGcNiWZyWD/j9HmgZL+fCJ1lSF6yNQzo/i2o4hQSEUT9CS1zfwxXrjV9xW2
         2AQOE+bjoxguBgufH+Bb7hmk9L3dKGJoH/SCKa14oHvk5s2XVvuiXLfWz1/2tYbK42LF
         8l1xQMlySap3O7PQbVpXp81V+4R6f4sagVhfhS/fLAznWyR8Geg/aq0XxEVBTB4rX7TL
         QraA==
X-Gm-Message-State: AOJu0YxWg7lofRvWYkoUy9BUBxs1Xx8xLHU+EB9rh5qBlHq/ZDs9oM1G
	WME2O+J3GPF1WYYVJPfjyb1iNeBge0AooBabfjKXCADkxrm9TIigQ8x4
X-Gm-Gg: ASbGncvmQQWavZSM1oE9MBDfUAHHAzJOx+HqA3h9B9sPELWoTxsYFjFyww99F+JkfDk
	mxxg6EA6XiQlyz+K1pVwMnXpKOdG2MF+DkOXrD1kdwXaQp9UMHacgIx+/N804zIJOLikmUCBULR
	ICmUzYmP9hKYYwRZG+G9E4OB1gFYSmUOSWL8HQQBoY62KO0Ce2Z7uSoaKhWGmyT3rlgoLiDjOBg
	yfYNRiOCWp+FQIfjtKB1OfsEnOJQwj31Sv6uI8twcsS0f4eS4NjSdpZcq5Ym2tTt2CJk4GfsfJe
	5bcgG0xFx1vqI/oE/JH9fT/uxtZ4vaVEzoOC3yny/blnOi9/zx4DlPCRZNNZIQZvHoxJoBASWTR
	9wKXug7Pdcj+Oxen4MscE
X-Google-Smtp-Source: AGHT+IEPKUESYvBi1vhGOg4f4XmMeDg12jeKSXCTlTlWFWydg6O7sAtDxDH9qAcN6wMNeJKlBaw0jw==
X-Received: by 2002:a05:620a:40ca:b0:7e3:2bb9:be81 with SMTP id af79cd13be357-7e681309080mr559328685a.15.1753997742157;
        Thu, 31 Jul 2025 14:35:42 -0700 (PDT)
Received: from nixos.lan ([2601:5c0:c300:6846:2e0c:4b69:31e2:e994])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e68b22033asm182485a.19.2025.07.31.14.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 14:35:41 -0700 (PDT)
From: noahpro <noahpro@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	noahpro <noahpro@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: add Omen 16-wf0xxx (board 8BAB) fan & perf-profile support
Date: Thu, 31 Jul 2025 17:35:29 -0400
Message-ID: <20250731213529.27378-1-noahpro@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent 2024-era Omen laptops (DMI board 8BAB) use different
thermal-profile commands (0x48 default, 0x31 performance) but are very
similar to those used by the existing Victus-S code paths although
it wasn't in the config.  As a result:

- `/sys/devices/platform/hp-wmi/fan*` reported 0
- `echo 0 | sudo tee /sys/devices/platform/hp-wmi/hwmon/*/pwm1_enable`
  max-fan writes failed
- platform_profile was not registered, so performance/balanced switching
  was not available

I added the new board to victus_s_thermal_profile_boards[] and created
omen_2024_thermal_profile_boards[] with HP_OMEN_2024_THERMAL_PROFILE_*
enums, and switched the Victus-S performance setter to choose the
right wmi commands.

I was was unsure of whether to rename the victus_s_ names to
newer or 2024 boards everywhere becuase this would clutter the commit.

Tested on HP Omen 16-wf0xxx (BIOS F.21):
 * fan RPMs readable
 * performance/balanced switching works (needed nvidiaDynamicBoost to
   see max wattage changes but it does work)
 * "max fans" honoured (firmware reverts after 120 sec, but the existing
   timed board variables don't work when testing. On Windows the
   Omen Command Center simply sends lots of commands to keep this alive
   so this seems fine to me as user applications can write to the
   fan speed every ~100 sec).

Signed-off-by: noahpro <noahpro@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 41 ++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index db5fdee2109c..55c3680724b5 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -92,9 +92,13 @@ static const char * const victus_thermal_profile_boards[] = {
 	"8A25"
 };
 
-/* DMI Board names of Victus 16-s1000 laptops */
+/* DMI Board names of newer 2024+ laptops that have use different wmi commands */
 static const char * const victus_s_thermal_profile_boards[] = {
-	"8C9C"
+	"8C9C", "8BAB"
+};
+
+static const char * const omen_2024_thermal_profile_boards[] = {
+	"8BAB"
 };
 
 enum hp_wmi_radio {
@@ -245,6 +249,11 @@ enum hp_thermal_profile_victus_s {
 	HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE		= 0x01,
 };
 
+enum hp_thermal_profile_omen_2024 {
+	HP_OMEN_2024_THERMAL_PROFILE_DEFAULT	  = 0x48,
+	HP_OMEN_2024_THERMAL_PROFILE_PERFORMANCE  = 0x31,
+};
+
 enum hp_thermal_profile {
 	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
 	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
@@ -1580,6 +1589,19 @@ static bool is_victus_s_thermal_profile(void)
 			    board_name) >= 0;
 }
 
+static bool is_omen_2024_thermal_profile(void)
+{
+	const char *board_name;
+
+	board_name = dmi_get_system_info(DMI_BOARD_NAME);
+	if (!board_name)
+		return false;
+
+	return match_string(omen_2024_thermal_profile_boards,
+			    ARRAY_SIZE(omen_2024_thermal_profile_boards),
+			    board_name) >= 0;
+}
+
 static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
 					    bool *ppab_enable,
 					    u8 *dstate,
@@ -1666,19 +1688,28 @@ static int platform_profile_victus_s_set_ec(enum platform_profile_option profile
 
 	switch (profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
-		tp = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE;
+		if (is_omen_2024_thermal_profile())
+			tp = HP_OMEN_2024_THERMAL_PROFILE_PERFORMANCE;
+		else
+			tp = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE;
 		gpu_ctgp_enable = true;
 		gpu_ppab_enable = true;
 		gpu_dstate = 1;
 		break;
 	case PLATFORM_PROFILE_BALANCED:
-		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
+		if (is_omen_2024_thermal_profile())
+			tp = HP_OMEN_2024_THERMAL_PROFILE_DEFAULT;
+		else
+			tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
 		gpu_ctgp_enable = false;
 		gpu_ppab_enable = true;
 		gpu_dstate = 1;
 		break;
 	case PLATFORM_PROFILE_LOW_POWER:
-		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
+		if (is_omen_2024_thermal_profile())
+			tp = HP_OMEN_2024_THERMAL_PROFILE_DEFAULT;
+		else
+			tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
 		gpu_ctgp_enable = false;
 		gpu_ppab_enable = false;
 		gpu_dstate = 1;

base-commit: 1798561befd8be1e52feb54f850efcab5a595f43
-- 
2.50.1

