Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34972374174
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Feb 2026 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772115592; cv=none; b=fc7bCTUHXdHJ5gQykNnfnGgTWKABvQXWZJhmBBsK1zYX53Jq+UGYdR1HNaGYZGM0DLPMsY2AwRc2IV+QKOt6edXZ47/QpSCHMiyeMAS6PJLT/pWC2YfQhGd0mctVzXlW1UvNLQnnDxvyw3m84K2hLDqxSVvTH/+3S/oo95QlkAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772115592; c=relaxed/simple;
	bh=05odd7jsKJOii99Ux0pKgZiDWHXOCiHQHIBPYGpEulE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+wszwg43WCrLXnSZCNklZVaCybWgibue6xf9BsqeWpJr2U5o/anO4Idb8pC+DO619Dn7FzxWn4HzghYuYpg211f1L5HGjG+rTy6mz2RAi1kh4dzNg8w2hjpewgPlMgFupPQewmU7PbSak/d6GVUlJdEw/NBUcfsYgZZ7bBWUV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GGasqGAb; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GGasqGAb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772115589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aLKSga4L6fgkyP1SiMgZ6g3DH4/YisYxf/RuxuzRkWo=;
	b=GGasqGAb9CC7E/6GhCMWGdAeNLb/eHhQy1U5O9uEVuKvQNhiTEpdRtdaIf+DoboD5rt0Zm
	dOnhSREPfu22kZBtQxC+QL5QHO9GD3uRNwB4nQbAorzQgdXDE6Zr484Ko8+G9FlI9bScx0
	wr2CJGAvdaT5xEeSh5QC1G9/az4VCYs=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Denis Benato" <denis.benato@linux.dev>
Subject: [PATCH 1/2] platform/x86: asus-armoury: add support for GX650RX
Date: Thu, 26 Feb 2026 15:19:43 +0100
Message-ID: <20260226141944.352923-2-denis.benato@linux.dev>
In-Reply-To: <20260226141944.352923-1-denis.benato@linux.dev>
References: <20260226141944.352923-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model GX650RX.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 001c011fdd56..f9d9136aec7b 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1457,6 +1457,38 @@ static const struct dmi_system_id power_limits[] = {
 			},
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GX650RX"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_def = 70,
+				.ppt_pl1_spl_max = 90,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_def = 70,
+				.ppt_pl2_sppt_max = 100,
+				.ppt_pl3_fppt_min = 28,
+				.ppt_pl3_fppt_def = 110,
+				.ppt_pl3_fppt_max = 125,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 76,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 50,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 50,
+				.ppt_pl3_fppt_min = 28,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 76,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "G513I"),
-- 
2.53.0

