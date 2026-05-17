Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F98330D43
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 22:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779055227; cv=none; b=tMTVvx5k5B3+1GEawPOQeSJLgayRAlV9sW+db4ueN1FWguQOUBsCbLfZT4S84fsdseFkuM8fx+UqgdnTpzcgCQAtgq83unbwSwOQ1PzcDsMH3AsYvbxiFDH+4XtC3+fe+0q+aV8BbKdefQ+U657HaoyNynTGQp80mkx3sJdKCo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779055227; c=relaxed/simple;
	bh=1qN0gHXtSKMZPa3afXa0YKl03Dx5LmgVxGjhuktDwVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsK4CDRd80cJs+tI7OEZmldgEyIzAQzxtw4VcNDgdLB5ojNRexR6dmZLce2wBMZ8maSXArYw+iFHvyWs3zRTqJGBc3/QBGsueNeI3E2pLB1+hicgXfAWc/2SNS6mkhlhzeVge25uRWK1OyS9oMoanr94221UA9p8hd30RxmaVEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qgOBxP96; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qgOBxP96"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779055224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gojl9DQlCyY+4puBz7dpyhz7k2ck75fqbxNsifRxlOA=;
	b=qgOBxP96bIi+woxACpE/V9TQPb2daTVGxEP9RC54v/GsFCdrGplrybCVI4iVLxm0gJFsd1
	hGaDBDQQ0724PRV+x3FfvbkVnhyKOPdSVo0h9B80CMPq+FPZP//qdqnRcthxakmAY5tqa1
	ODQi6MBqbzMsrL5a64C4iaiGRD0voFs=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 4/4] platform/x86: asus-armoury: add support for GU605CP
Date: Sun, 17 May 2026 22:00:05 +0000
Message-ID: <20260517220005.4594-5-denis.benato@linux.dev>
In-Reply-To: <20260517220005.4594-1-denis.benato@linux.dev>
References: <20260517220005.4594-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model GU605CP.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 71df2ca061a7..692978b61959 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1303,6 +1303,35 @@ static const struct dmi_system_id power_limits[] = {
 			},
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GU605CP"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 45,
+				.ppt_pl1_spl_max = 75,
+				.ppt_pl2_sppt_min = 56,
+				.ppt_pl2_sppt_max = 95,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 15,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_def = 75,
+				.nv_tgp_max = 95,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 75,
+				.ppt_pl2_sppt_min = 32,
+				.ppt_pl2_sppt_max = 95,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GU605CR"),
-- 
2.47.3

