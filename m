Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B0C2288E3
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Dec 2025 03:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766632274; cv=none; b=Aw7Sf7kV13NL+/NTSfkdeRWQHCTuBop1i0MZpxkoIvamvDlXDLVEu3EBpxWnyj9c3iuUae9dyHKNrmY+4Yryt+PnUImQypfnmmT0NKw714MbTmbmxvSmy6x2/mNW76+DItOe0xVfBYPzA3HQZDQy62xonDaybqVFu2YUnFpqtdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766632274; c=relaxed/simple;
	bh=JV+qwhxUCTc7AcD7R3ztKPoL0/clvERV76XF3spFE9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sm6krP2cNQ02VAXDlxOuZNf5bsmQ+J+FTZXxYENGL+yZPZ+0T5MkkVOEBX2lgLRntEITJz57eljVG67/qXoY92LGou/YuMQUKPlg/T4tpSp1SqJxU1sDVcp3HwTYyTHtcxVdGp0/+6zVQ2BYr4dFLqucN+DyU2Jk+wl8VVeaGsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YAEV8ahD; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YAEV8ahD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766632260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DjAvkji03/i/NtMZeU4bbnKvi/AWbm8HX2RKHpXkFQY=;
	b=YAEV8ahDwTuSW7zNF794ccMrd6bCwRGGt4J/9QHwectfswjvYQMYjl9kxAPZhMnoIBIkuU
	EkxEpHD68a13vH7wHs7ND2bweWGfWehXr9wx/49rbgZ+QV5tIst/dDP9KLJyaL2MmIJnYk
	ri5rMnJ36fQYt2lxX1xJcW6WQZwXe5Y=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-armoury: add support for G615LR
Date: Thu, 25 Dec 2025 04:10:41 +0100
Message-ID: <20251225031041.2321249-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model G615LR.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index e0a78b4bcd91..ba09b05cd865 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1328,6 +1328,35 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G615LR"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_def = 140,
+				.ppt_pl1_spl_max = 175,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 175,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_tgp_min = 65,
+				.nv_tgp_max = 115,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 55,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 70,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "G634J"),
-- 
2.52.0

