Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F2D36D518;
	Mon,  9 Mar 2026 20:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.180.73.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773089562; cv=none; b=o+NvkMgXDUutXGGHBOvmKSIhMRBL99lwc8Rmp+Jv+XAKCjqEx0PDGWRoDfox4xLWNexQlhJ6FmjUNJUz0hfb/QpB3ISQQW/tWLDmehf6gru0ZUJhuaf194oZ8meYw7/Jn2DE/WSwQi7xsdARHz5gM74RmTlviox+ebG3WsQncms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773089562; c=relaxed/simple;
	bh=Gr+PB21Hc5E58lQOP3fAT+Mw2A1uL8Do9S0KFbeprRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBckf20p8YeOoh0O+3BvpmJGRKwCnUGfUv+DntczhdnlRv4bW91/nA2vOrOCz3UPLTjdC6TWklMdggOfikMpTqZS6cdFtcHYNjjINMvptwdI8PjeONhSpGy9x/vbwQ8GTCEX5YMJgQ6kIeGDI1hWsLLYR440XrugABcU91SuH4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=GPY6DS11; arc=none smtp.client-ip=157.180.73.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="GPY6DS11"
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id 64D4A407FA;
	Mon,  9 Mar 2026 20:52:38 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id 3AD42408F0;
	Mon,  9 Mar 2026 20:52:37 +0000 (UTC)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 2A518201CBF;
	Mon,  9 Mar 2026 22:52:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1773089556;
	bh=h7bMbUUi7ojolGBNGc2ERcNw4ar8lurqF44AqwyazKo=; h=From:To:Subject;
	b=GPY6DS11he8MtmeugT9MErgbD0DGhEKa2hCK64rXsmySoMOdIKFi6lYHACCOXrfBR
	 5srhQnNQdrVdYAjpJmYAIYgIP6n6/KpZhaNmtX5saL8ZfO8jAv9bGxPtWj4HrG7zRX
	 bYOxl1Y1ni85S6vtGHUul8thBYx5Ibe82dF1x7NLFJjHBgmFBUnCxN3oAHtWtkRjiV
	 TUmFJCxp6jzj5M55fGOjN/UD6e9IZKG1Qeyy0BU05n6y+x+wAhnnX/3o1dHhShcYMp
	 iDV/vMEYHKqFLcxMiB8EKpYjcUgv7+129Fk3pti12Axx5PIa07tr/Oty7SKYX2qHfb
	 XTbguHcvEZ/iQ==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Mario.Limonciello@amd.com
Cc: W_Armin@gmx.de,
	sashal@kernel.org,
	Shyam-Sundar.S-k@amd.com,
	derekjohn.clark@gmail.com,
	denis.benato@linux.dev,
	i@rong.moe,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [RFC v4 4/4] platform/x86/amd: dptc: Add device entries for handheld
 PCs
Date: Mon,  9 Mar 2026 21:51:25 +0100
Message-ID: <20260309205125.293148-5-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260309205125.293148-1-lkml@antheas.dev>
References: <20260309205125.293148-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177308955670.1090999.14348522395993720316@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Add limit tables and DMI entries for AMD APU-based handheld devices:

 - 15W class: AYANEO AIR
 - 18W class: AYANEO AIR Plus/Pro
 - 25W class: AYANEO AIR 1S, NEXT/KUN
 - 28W class: GPD Win Mini/4/Max 2, GPD Duo, GPD Pocket 4, AYANEO 2,
               OrangePi NEO-01, SuiPlay0X1
 - 30W class: AYANEO FLIP/GEEK/SLIDE/3, AOKZOE A1/A1X/A2,
               OneXPlayer F1Pro/2/X1/G1, AYN Loki Max, Zeenix Pro

Also add SoC strings for Ryzen AI, Ryzen 8000/7040/6000/5000
families, extending support beyond the initial AI MAX series.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/amd/dptc.c | 420 ++++++++++++++++++++++++++++++++
 1 file changed, 420 insertions(+)

diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/dptc.c
index f4db95affb1b..b2820f8652f1 100644
--- a/drivers/platform/x86/amd/dptc.c
+++ b/drivers/platform/x86/amd/dptc.c
@@ -86,6 +86,81 @@ static const struct dptc_param_desc dptc_params[DPTC_NUM_PARAMS] = {
 				 1, ALIB_ID_TEMP_TARGET },
 };
 
+/* 15W class: AYANEO AIR (Ryzen 5 5560U) */
+static const struct dptc_device_limits limits_15w = {
+	.params = {
+		[DPTC_PPT_PL1_SPL]  = {  1,  5, 10, 15,  18 },
+		[DPTC_PPT_PL2_SPPT] = {  1,  5, 10, 15,  18 },
+		[DPTC_PPT_PL3_FPPT] = {  1,  5, 12, 18,  22 },
+		[DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
+	},
+	.profiles = {
+		[PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5,  5,  8, 0 } },
+		[PLATFORM_PROFILE_BALANCED]    = { .vals = { 10, 12, 15, 0 } },
+		[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 15, 15, 18, 0 } },
+	},
+};
+
+/* 18W class: AYANEO AIR Plus/Pro (Ryzen 5 5560U, Ryzen 7 5825U) */
+static const struct dptc_device_limits limits_18w = {
+	.params = {
+		[DPTC_PPT_PL1_SPL]  = {  1,  5, 15, 18,  22 },
+		[DPTC_PPT_PL2_SPPT] = {  1,  5, 15, 18,  22 },
+		[DPTC_PPT_PL3_FPPT] = {  1,  5, 15, 20,  25 },
+		[DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
+	},
+	.profiles = {
+		[PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5,  5,  8, 0 } },
+		[PLATFORM_PROFILE_BALANCED]    = { .vals = { 12, 14, 15, 0 } },
+		[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 18, 18, 20, 0 } },
+	},
+};
+
+/* 25W class: Ryzen 5000 handhelds (AYANEO NEXT, KUN) */
+static const struct dptc_device_limits limits_25w = {
+	.params = {
+		[DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 25,  32 },
+		[DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 27,  35 },
+		[DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 30,  37 },
+		[DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
+	},
+	.profiles = {
+		[PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
+		[PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 20, 0 } },
+		[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 27, 30, 0 } },
+	},
+};
+
+/* 28W class: GPD Win series, AYANEO 2, OrangePi NEO-01 */
+static const struct dptc_device_limits limits_28w = {
+	.params = {
+		[DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 28,  32 },
+		[DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 30,  35 },
+		[DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 32,  37 },
+		[DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
+	},
+	.profiles = {
+		[PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
+		[PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 22, 0 } },
+		[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 28, 32, 0 } },
+	},
+};
+
+/* 30W class: OneXPlayer, AYANEO FLIP/GEEK/SLIDE/3, AOKZOE */
+static const struct dptc_device_limits limits_30w = {
+	.params = {
+		[DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 30,  40 },
+		[DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 32,  43 },
+		[DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 41,  50 },
+		[DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
+	},
+	.profiles = {
+		[PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
+		[PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 25, 0 } },
+		[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 28, 41, 0 } },
+	},
+};
+
 /* AI MAX Handheld class: GPD Win 5 */
 static const struct dptc_device_limits limits_maxhh = {
 	.params = {
@@ -107,11 +182,56 @@ static const char * const dptc_soc_table[] = {
 	"AMD RYZEN AI MAX+ 395",
 	"AMD RYZEN AI MAX+ 385",
 	"AMD RYZEN AI MAX 380",
+	/* Ryzen AI */
+	"AMD Ryzen AI 9 HX 370",
+	/* Ryzen 8000 */
+	"AMD Ryzen 7 8840U",
+	/* Ryzen 7040 */
+	"AMD Ryzen 7 7840U",
+	/* Ryzen 6000 */
+	"AMD Ryzen 7 6800U",
+	"AMD Ryzen 7 6600U",
+	/* Ryzen 5000 */
+	"AMD Ryzen 7 5800U",
+	"AMD Ryzen 7 5700U",
+	"AMD Ryzen 5 5560U",
 	NULL,
 };
 
 static const struct dmi_system_id dptc_dmi_table[] = {
 	/* GPD */
+	{
+		.ident = "GPD Win Mini",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1617-01"),
+		},
+		.driver_data = (void *)&limits_28w,
+	},
+	{
+		.ident = "GPD Win Mini 2024",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02"),
+		},
+		.driver_data = (void *)&limits_28w,
+	},
+	{
+		.ident = "GPD Win Mini 2024",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02-L"),
+		},
+		.driver_data = (void *)&limits_28w,
+	},
+	{
+		.ident = "GPD Win 4",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1618-04"),
+		},
+		.driver_data = (void *)&limits_28w,
+	},
 	{
 		.ident = "GPD Win 5",
 		.matches = {
@@ -120,6 +240,306 @@ static const struct dmi_system_id dptc_dmi_table[] = {
 		},
 		.driver_data = (void *)&limits_maxhh,
 	},
+	{
+		.ident = "GPD Win Max 2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1619-04"),
+		},
+		.driver_data = (void *)&limits_28w,
+	},
+	{
+		.ident = "GPD Win Max 2 2024",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1619-05"),
+		},
+		.driver_data = (void *)&limits_28w,
+	},
+	{
+		.ident = "GPD Duo",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01"),
+		},
+		.driver_data = (void *)&limits_28w,
+	},
+	{
+		.ident = "GPD Duo",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01-L"),
+		},
+		.driver_data = (void *)&limits_28w,
+	},
+	{
+		.ident = "GPD Pocket 4",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04"),
+		},
+		.driver_data = (void *)&limits_28w,
+	},
+	{
+		.ident = "GPD Pocket 4",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04-L"),
+		},
+		.driver_data = (void *)&limits_28w,
+	},
+	/* OrangePi */
+	{
+		.ident = "OrangePi NEO-01",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "OrangePi"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEO-01"),
+		},
+		.driver_data = (void *)&limits_28w,
+	},
+	/* AYN */
+	{
+		.ident = "AYN Loki Max",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Max"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	/* Tectoy (Zeenix Pro = Loki Max) */
+	{
+		.ident = "Zeenix Pro",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Tectoy"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Zeenix Pro"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	/* AOKZOE */
+	{
+		.ident = "AOKZOE A1 AR07",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	{
+		.ident = "AOKZOE A1 Pro",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 Pro"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	{
+		.ident = "AOKZOE A1X",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1X"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	{
+		.ident = "AOKZOE A2 Pro",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A2 Pro"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	/* OneXPlayer (Intel variants filtered by SoC table) */
+	{
+		.ident = "ONEXPLAYER F1Pro",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1Pro"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	{
+		.ident = "ONEXPLAYER F1 EVA-02",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1 EVA-02"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	{
+		.ident = "ONEXPLAYER 2",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_MATCH(DMI_BOARD_NAME, "ONEXPLAYER 2"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	{
+		.ident = "ONEXPLAYER X1 A",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1 A"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	{
+		.ident = "ONEXPLAYER X1z",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1z"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	{
+		.ident = "ONEXPLAYER X1Pro",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1Pro"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	{
+		.ident = "ONEXPLAYER G1 A",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER G1 A"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	/* AYANEO - 15W */
+	{
+		.ident = "AYANEO AIR",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR"),
+		},
+		.driver_data = (void *)&limits_15w,
+	},
+	/* AYANEO - 18W */
+	{
+		.ident = "AYANEO AIR Plus",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Plus"),
+		},
+		.driver_data = (void *)&limits_18w,
+	},
+	{
+		.ident = "AYANEO AIR Pro",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Pro"),
+		},
+		.driver_data = (void *)&limits_18w,
+	},
+	/* AYANEO - 25W */
+	{
+		.ident = "AYANEO AIR 1S",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_MATCH(DMI_BOARD_NAME, "AIR 1S"),
+		},
+		.driver_data = (void *)&limits_25w,
+	},
+	{
+		.ident = "AYANEO NEXT Advance",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Advance"),
+		},
+		.driver_data = (void *)&limits_25w,
+	},
+	{
+		.ident = "AYANEO NEXT Lite",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Lite"),
+		},
+		.driver_data = (void *)&limits_25w,
+	},
+	{
+		.ident = "AYANEO NEXT Pro",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Pro"),
+		},
+		.driver_data = (void *)&limits_25w,
+	},
+	{
+		.ident = "AYANEO NEXT",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
+		},
+		.driver_data = (void *)&limits_25w,
+	},
+	{
+		.ident = "AYANEO KUN",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "KUN"),
+		},
+		.driver_data = (void *)&limits_25w,
+	},
+	{
+		.ident = "AYANEO KUN",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO KUN"),
+		},
+		.driver_data = (void *)&limits_25w,
+	},
+	/* AYANEO - 28W */
+	{
+		.ident = "AYANEO 2",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_MATCH(DMI_BOARD_NAME, "AYANEO 2"),
+		},
+		.driver_data = (void *)&limits_28w,
+	},
+	{
+		.ident = "SuiPlay0X1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Mysten Labs, Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "SuiPlay0X1"),
+		},
+		.driver_data = (void *)&limits_28w,
+	},
+	/* AYANEO - 30W */
+	{
+		/* DMI_MATCH catches all FLIP variants (DS, KB, 1S DS, 1S KB) */
+		.ident = "AYANEO FLIP",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	{
+		/* DMI_MATCH catches GEEK and GEEK 1S */
+		.ident = "AYANEO GEEK",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_MATCH(DMI_BOARD_NAME, "GEEK"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	{
+		.ident = "AYANEO SLIDE",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "SLIDE"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
+	{
+		.ident = "AYANEO 3",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO 3"),
+		},
+		.driver_data = (void *)&limits_30w,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);
-- 
2.52.0


