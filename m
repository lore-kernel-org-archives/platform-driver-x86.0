Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2D339732F;
	Sun, 14 Jun 2026 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781426693; cv=none; b=Rwm2jphTdlGsPkTjPkZ/lpUkgVVjWDfdChh6OS0QPUY+2q4re9bd6zN4f2ERcv8j1ZtS1mGdb+5ORfAtf+yM9GECtCtzB3/ngaTqouzBD8jnrPtcuLrmgz3zYQzGGwf3WHY70xmc6Qikii4w3H83uLmuq2UDfI65G99L004kOus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781426693; c=relaxed/simple;
	bh=3GPHAjiM19B/A6uh8t6l81lKe8Bcii6cdXIv4vU1gAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sKBnBk8YHWtfemyC6KN+xQYykVpSzDkOQYEbgS7VEtjSzWMW+entelkpn7n13kApu1er7p5eCjDEHaAidgrca78mgRTzIUYQ++fYJGUPT2wX5egQoijpujvK03WSL3o9uV/GJdRKg7A/rvV8zmcPYnD2LpcSw+DjtK7y5pkH96s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=memN5yle; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="memN5yle"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3CFB82701A;
	Sun, 14 Jun 2026 10:44:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AN4lQ1jfcM7t; Sun, 14 Jun 2026 10:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781426682; bh=3GPHAjiM19B/A6uh8t6l81lKe8Bcii6cdXIv4vU1gAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=memN5ylerczXgZkJYqWMT4rZ+w9epI4gtI6NIOpBrGV5j3MVgNQ6NRYWG4e+s7AFm
	 WIZE07VY1gZJjNE3OYcJ1CyZ+hgoovtyl7eb2Bo6aqCRNHvhu4lBl7W7IcPXhHNiXN
	 12qfLoP3C9NlK6Ya1FP758KSwwzx590RfF/eMoFLYJfr+jL6PnQLaQ///SnKQ79j8G
	 IsoTuwDdJZuviB+iXmyVgezNqJwCZRf7X6Q2pwhovriQOFQp+fzHVeeav75PwyYi39
	 wIiSyeZCL9YHifSC6amaepuN0Gn5eyUZ5YlasbOSID+NcsAnzKZVNeLNsNNqWGj0Je
	 VMA8i8WO10dsA==
From: Marco Scardovi <scardracs@disroot.org>
To: ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org,
	scardracs@disroot.org
Subject: [PATCH v2] platform/x86: asus-armoury: add support for G614PR
Date: Sun, 14 Jun 2026 10:44:12 +0200
Message-ID: <20260614084423.50723-2-scardracs@disroot.org>
In-Reply-To: <20260614084423.50723-1-scardracs@disroot.org>
References: <178119015973.12014.6231948241278781864.b4-ty@b4>
 <20260614084423.50723-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add TDP power limits and fan curve requirements for the ASUS ROG
Strix G16 G614PR laptop model.

Add the corresponding DMI board name matching entry ("G614PR") under
the power_limits table in asus-armoury.h, populating the AC and DC limits
based on the platform's hardware specification.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 692978b61959..c2df2381a260 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1898,6 +1898,40 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G614PR"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 30,
+				.ppt_pl1_spl_max = 120,
+				.ppt_pl2_sppt_min = 65,
+				.ppt_pl2_sppt_def = 140,
+				.ppt_pl2_sppt_max = 145,
+				.ppt_pl3_fppt_min = 65,
+				.ppt_pl3_fppt_def = 140,
+				.ppt_pl3_fppt_max = 145,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_tgp_min = 65,
+				.nv_tgp_max = 115,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 75,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "G615LR"),
-- 
2.54.0

