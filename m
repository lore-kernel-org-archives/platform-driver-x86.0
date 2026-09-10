Received: from mta0.migadu.com (out-26.mta0.migadu.com [91.218.175.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA1B3BD65A
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 20:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073443; cv=none; b=UW0AzHFLYfMXF0T8XOqRmiJIfWdKmumUIWJ4zbkdbsqRXCB8ZyGJWKojePzzEkslpHkNLnM5V972kXtij2RJ98FQMlleZ4x5zBdS/Cri7qvUmRuRsb1/LKRi3BBw6MwBkqmu2kcW1S41Nq+TBI2uiAKwLG9cKTfdoBhGviypHPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073443; c=relaxed/simple;
	bh=41+fTgHWFKSBVVp4XifXvnE3VNYqFnKT69tOOkfc8gY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKaxTsZBVIcBrQfh2LMaXAw5by56zc+Cq64SMZkGf+bAepdvoCkU5XTcjQ3R74U+uXMDgiY+xCdjlVcqylut1rMRnYF2nUocCMH0xriHD7l+kEPT/2mgLw6VLyLrNti1QIQeBcVVG9+wpA6Xqp8+w2766WWgJaNEO+pDmevQteM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rQkMT9+A; arc=none smtp.client-ip=91.218.175.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rQkMT9+A"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=41+fTgHWFKSBVVp4XifXvnE3VNYqFnKT69tOOkfc8gY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789073434; v=1; x=1789678234;
 b=rQkMT9+AFs0iblo3j+iJZOJA2LmX0DrfPjU4gvhUX377dDIE2CTu8PMLlM5TFxYOKargiM4h
 I7A2JR04gvd/+ecFkie0bIHvFZmTwi8WglQ0YKwcbuS+5zBhY7ejUBU8zuOi2YlGxANOClDenfa
 2b6c02hxY0JEdxmduu6nq9zY=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 997b8a268c56b9b3;
	Thu, 10 Sep 2026 20:50:34 +0000
X-Mizu-Trace-ID: 997b8a268c56b9b3
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Cymirk <Cymirk@icloud.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-armoury: add support for GX651AR
Date: Thu, 10 Sep 2026 20:50:32 +0000
Message-ID: <20260910205032.153165-1-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cymirk <Cymirk@icloud.com>

Add power limit data for the ASUS ROG Zephyrus Duo GX651AR.

The GX651AR uses the following limits:
- CPU PL1: 30-75 W
- CPU PL2: 38-80 W
- NVIDIA Dynamic Boost: 5-25 W
- NVIDIA TGP: 80-115 W
- NVIDIA temperature target: 75-87 C

The same CPU limits and temperature target are available on DC power.

Signed-off-by: Cymirk <Cymirk@icloud.com>
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 0e301d663d0c..44ea9519560d 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1881,6 +1881,33 @@ static const struct dmi_system_id power_limits[] = {
 			},
 		},
 	},
+		{
+			.matches = {
+				DMI_MATCH(DMI_BOARD_NAME, "GX651AR"),
+			},
+			.driver_data = &(struct power_data) {
+				.ac_data = &(struct power_limits) {
+					.ppt_pl1_spl_min = 30,
+					.ppt_pl1_spl_max = 75,
+					.ppt_pl2_sppt_min = 38,
+					.ppt_pl2_sppt_max = 80,
+					.nv_dynamic_boost_min = 5,
+					.nv_dynamic_boost_max = 25,
+					.nv_temp_target_min = 75,
+					.nv_temp_target_max = 87,
+					.nv_tgp_min = 80,
+					.nv_tgp_max = 115,
+				},
+				.dc_data = &(struct power_limits) {
+					.ppt_pl1_spl_min = 30,
+					.ppt_pl1_spl_max = 75,
+					.ppt_pl2_sppt_min = 38,
+					.ppt_pl2_sppt_max = 80,
+					.nv_temp_target_min = 75,
+					.nv_temp_target_max = 87,
+				},
+			},
+		},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GZ302EA"),
-- 
2.47.3

