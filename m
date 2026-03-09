Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27806346E7F
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 18:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081379; cv=none; b=MApcV1ZGAQ67LueHv5lDAFzPWU6qwhgFJq0ub3xFmOKEKOlQcdBPTjbTSo68kpbQ/4oD1bIRyBDAcVDNBCRjy/GD86Y4DbPD07rQ3Z8anTrzs9fC4q1fnI+yIdjP6BgUWGbjsdr2HKD4inq/l+z0EgSYUloaXmxHrvMWZXCaErs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081379; c=relaxed/simple;
	bh=h+vfw9NlDHw8h63Uf+nISphYM+pPy+OgcOJwZGDqOsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eX8MzPwC9Z/c72+a4uj0jHSQQSulB4JQk0QhwxsZo0mr6KavXegA8KRk0gasLwUujDg5uh5BL7tIRPt9BXcUswsBP0ONFKCMcMeQXC15MrEO36K4cuHUYpbwIMndsGNAekYhpGrsLPsswhQBbMbj5Occ8OzR2Lg4iMyii2/KlOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F7bEkmNU; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F7bEkmNU"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773081376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mncue8STrWok4fKPe8bLttwSyC8DdrqS29Mii4o9zN0=;
	b=F7bEkmNUB7pqwJ5dpLzWDltLvsDGtV91yK33H3wj3VCrBFmtjeG4PyF7lwqTgHsXaDWwCQ
	R2rZb1qtrEaYjk8bkwVDgPUGT6pg1etQxbywIBOx5jA/HUI9LPQJ7hwNZ9YIj2sK+w5hWM
	mWe1dzLiytxS0/LG77l8G3Ivkz68Rck=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 2/2] platform/x86: asus-armoury: add support for G614FP
Date: Mon,  9 Mar 2026 19:35:58 +0100
Message-ID: <20260309183559.433555-3-denis.benato@linux.dev>
In-Reply-To: <20260309183559.433555-1-denis.benato@linux.dev>
References: <20260309183559.433555-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model G614FP.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 6565dd4c36c5..500097e465fd 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1549,6 +1549,40 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G614FP"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 30,
+				.ppt_pl1_spl_max = 120,
+				.ppt_pl2_sppt_min = 65,
+				.ppt_pl2_sppt_def = 140,
+				.ppt_pl2_sppt_max = 165,
+				.ppt_pl3_fppt_min = 65,
+				.ppt_pl3_fppt_def = 140,
+				.ppt_pl3_fppt_max = 165,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 15,
+				.nv_tgp_min = 50,
+				.nv_tgp_max = 100,
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
 			DMI_MATCH(DMI_BOARD_NAME, "G614J"),
-- 
2.53.0

