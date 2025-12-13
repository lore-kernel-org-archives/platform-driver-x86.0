Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173941DE4E1
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Dec 2025 18:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765651875; cv=none; b=ABCxh2kZppAqSbq8sMdO7wE44tIvDeSAdrB8IGBfn5C1n9omwkxdSrESKuddtZUIFOm7mtLPipiRLEw6IQNhftU02aYChfQhNvSJSsc0F2L86pgPNN1xLXCZMNpRD3qrkai1HqtRDI5ImVCH3+Shl6VDlgBT7YxyMVysUagIjT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765651875; c=relaxed/simple;
	bh=Nrocump//UT0hoseAopkuQU9LhsQ1KnMWoqDONQlz7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e9R7EklyCvIunFTqdawLNK86KmElAgwSHveWD2/dywiO9zM/TyY38z2sSDtJgayiwGDERVWa2HeVwnay3Tuq6lOZEyRat6VSX9SH25kIbWOhuwuAuaAxAdbKpuRJbnl+NZryS4wfwltRVJfdjoHG4pVvnDogy7tTrIP4S/xBgws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmowZuSD; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmowZuSD"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34abc7da414so1397127a91.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 13 Dec 2025 10:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765651873; x=1766256673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5BjeNij9NJictwA/Nmpy2B9exYRrQ4lKtb8tO0JZFyM=;
        b=nmowZuSDUHjokM1oeTnzOPouVNX5mz0D8JyhHyb2/3A0PdjyVJfi//MWsJEP/DgSir
         ZnOnwNSz6EM9JqM5+pbCltxBrJ7pz6WzEjxB4XQEaSt7YM5yHVj+LiG5RAtAp8ebBmwm
         XrMUBnRbefzBgdAQokN791VSU5j5BgHXOZvDh5HnF9W5dfvqybWq0Oaxoed8SD4VWvQF
         YTCsXI3DGnHpJaoOAKsIC/JM4aGloFBnV2b2GkpQDj6/BVPuX54zHfzLBMhUW6QI6R2v
         L0ciF24PYBQPzirEXI8yDtUW8bVviF8JMBxuCoTRrtVlYfoVbojTSWvB8mtSYHJ8NBKp
         r+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765651873; x=1766256673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BjeNij9NJictwA/Nmpy2B9exYRrQ4lKtb8tO0JZFyM=;
        b=oQV6sL0TO+Q3Ub1T5OYDeA2Jz2Bm0Qug/zu0J8ISRpLo9CJ1pRootfFDWutoHJTH75
         Lu5IwOXEsSqp6jWZzgk8wtksHXOo440B53CvzRFwYAFCroz0fHJm+m8WhJYBxwr+MxJF
         WrTCQ6TyxJZ1+RQkKvaQMaAucD0ES8mIR5JSXUw1KKtVRCIcF+BCTkdzw9QBO3HMwMvP
         IdTMC5ytl8U+wVfu7llUNZwVsBIOkxQ/TzSGxiEaxUU5UJVtUuLnw7huThC7yxkFrby2
         gETOHRnAFtKwdf4x582ng7AqpXWRCbU8vweuPi/GOPROwS7uXENKd0src4+YPBYHrRHQ
         whlA==
X-Gm-Message-State: AOJu0YzTpvpYyxeCSyOIsi/irNUi6P81tmfTGjOmxqAS991UffDbbwrf
	Az9Dy3Q+WdVHMuFf4vkJ3J8pk/b4JeGEm05yhTAoMwkS4X6eS6IkUlyh
X-Gm-Gg: AY/fxX4fFaMvO6zL2eTZLFLquq6VrjeBSUo7zvzXSEksFS6R+tGFb3T7RyG3wrJ+XPQ
	Dx7dEyeuT8VSTjt/8UZxrzDMwGWAu0ZD2xypQrzETNs5yrLV6BAKQt7iiGU4UPU5jx/rRYfdJFu
	2cFwWZWba1cp8NtvWG9XHjPzL8f/SgMM6H2NCpVxjLDGuw7yKMPig6E/EMYplqEQzZ5SR+ZNwiR
	SOhIEHVV87k7baL7ZMZdLX055GOOULuTDLfkpi5fNm+69vCEQDE7cl20A/GzLhZNISMsm+rjTRB
	kKCQQq49zesK797n8v1ZamjIiEfpTRuykWeP1QuuakXJ/FjLWE2uVNQUr2RLO2LAAS7dyn9KsKx
	nO7RAsA1zJkxAyo0pBMh5Y1xL3hTc7RRp80DJqioFTI5CldjRTSMWsgs0m0gU7PIRjj2iZ0uN90
	HNrPxfe4pZVwb41XNzcxA=
X-Google-Smtp-Source: AGHT+IHsQcJnIERBwhNaB8N5jTa0eD2McdlMbtBz7ve5xL6PQO2uvtGgxY5sj/PByyIYqFiQszBGwg==
X-Received: by 2002:a17:90b:2743:b0:34a:a1dd:1f2a with SMTP id 98e67ed59e1d1-34abd761703mr5615412a91.20.1765651873244;
        Sat, 13 Dec 2025 10:51:13 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:bd87:a308:8427:d21d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe1ffde5sm5087012a91.1.2025.12.13.10.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 10:51:12 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: fix platform profile values for Omen 16-wf1xxx
Date: Sun, 14 Dec 2025 00:21:07 +0530
Message-ID: <20251213185107.179130-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP Omen 16-wf1xxx (board ID 8C78) currently sends the incorrect
Victus-specific thermal profile values via WMI, leading to a logical
inconsistency when switching between platform profiles.

The driver currently uses Victus S values:
0x00 => Balanced / Low-Power
0x01 => Performance

However, Omen Gaming Hub logs / EC register inspection on Windows shows
that this board is intended to use:
0x30 => Balanced / Low-Power
0x31 => Performance

This patch corrects the thermal profile command values to match the
values observed from Omen Gaming Hub logs. The performance benchmarks
and peak power draw (from both CPU and GPU) show no observable change
with this correction (suggesting that the firmware is currently tolerant
of the incorrect values). However sending the correct values prevents
potential regressions after future firmware updates.

Create a new omen_new_thermal_profile_boards[] array for devices that
share the Victus WMI queries but require Omen thermal profile values.
Conditionally use these values in platform_profile_victus_s_set_ec().

Tested on: HP Omen 16-wf1xxx (board 8C78)
Result: Confirmed WMI codes 0x30/0x31 are now sent, resolving the
logical inconsistency and ensuring the value visible in EC registers
match the Windows state for this profile.

Fixes: fb146a38cb11 ("platform/x86: hp-wmi: Add Omen 16-wf1xxx fan support")
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 35 +++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f4ea1ea05997..4dfd5fc230e2 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -105,6 +105,14 @@ static const char * const victus_s_thermal_profile_boards[] = {
 	"8D41",
 };
 
+/* DMI Board names of Omen laptops that have same WMI queries as
+ * victus_s_thermal_profile_boards but use hp_thermal_profile_omen_v1
+ * values.
+ */
+static const char * const omen_new_thermal_profile_boards[] = {
+	"8C78",
+};
+
 enum hp_wmi_radio {
 	HPWMI_WIFI	= 0x0,
 	HPWMI_BLUETOOTH	= 0x1,
@@ -1522,6 +1530,18 @@ static bool is_victus_thermal_profile(void)
 			    board_name) >= 0;
 }
 
+static bool is_omen_new_thermal_profile(void)
+{
+	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
+
+	if (!board_name)
+		return false;
+
+	return match_string(omen_new_thermal_profile_boards,
+			    ARRAY_SIZE(omen_new_thermal_profile_boards),
+			    board_name) >= 0;
+}
+
 static int platform_profile_victus_get_ec(enum platform_profile_option *profile)
 {
 	int tp;
@@ -1678,19 +1698,28 @@ static int platform_profile_victus_s_set_ec(enum platform_profile_option profile
 
 	switch (profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
-		tp = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE;
+		if (is_omen_new_thermal_profile())
+			tp = HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE;
+		else
+			tp = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE;
 		gpu_ctgp_enable = true;
 		gpu_ppab_enable = true;
 		gpu_dstate = 1;
 		break;
 	case PLATFORM_PROFILE_BALANCED:
-		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
+		if (is_omen_new_thermal_profile())
+			tp = HP_OMEN_V1_THERMAL_PROFILE_DEFAULT;
+		else
+			tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
 		gpu_ctgp_enable = false;
 		gpu_ppab_enable = true;
 		gpu_dstate = 1;
 		break;
 	case PLATFORM_PROFILE_LOW_POWER:
-		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
+		if (is_omen_new_thermal_profile())
+			tp = HP_OMEN_V1_THERMAL_PROFILE_DEFAULT;
+		else
+			tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
 		gpu_ctgp_enable = false;
 		gpu_ppab_enable = false;
 		gpu_dstate = 1;
-- 
2.52.0

