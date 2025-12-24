Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D0C218AAD
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 23:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766617665; cv=none; b=aLj6rkemyQFLl293XRy6rwgm0NOkIg9P0eLcDYxmP/12wJGUd3YxwqFekWctqx+joZZ+rqXEg0NGnrM/geDdfpSqjoOcpJ8n1x1uD8LcVopSoNkS8d96lyPUgeLYnuMO5wYcyw6HjSnmWVYeI/zrAN1OozH2pDDCMDujzgjznmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766617665; c=relaxed/simple;
	bh=6QDcAaZaxes9x2TURHA1wRGoNkg4HB8pUYf3Q1VEpIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hXOeBxnX9O2G91+RVeDa+hD8wfW4sYUG1m9MnN9vl7V7yNbim107h0gYEY3uaGeDBCqpl0XhQU5g8DXwNvQOGXl03MvAO5lnHx4JGXqkPZ5/UFFNab+A7t4NqJoTvbGaJJ9O4S6Yi57t/3po09nzPMhOOBGBCNp3OHc1gn8ZJlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kOdgvlMD; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kOdgvlMD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766617651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O7g0+WKMzwDWpbbn4E/6iGVIqQ4rqGgc/0v5tZeCA/Q=;
	b=kOdgvlMDQ89pGOIGsgdgXLRo86IDt6LV5vf8H8q2vzmO+WHBShXwGv7f/8Dosp5TLs2QrZ
	d22JDdR9lptx7bn954i24cZtcezrDEht67hwRWKWdswgB09Genj7am2nB+i3zLz2GPvGTz
	TkL01ia2rEXnADoCTC2wz+vVXw6E27Q=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-armoury: fix ppt data for FA507R
Date: Thu, 25 Dec 2025 00:07:26 +0100
Message-ID: <20251224230726.1836388-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

PPT data for FA507R was reported to be wrong by a user:
Change limits to make them equal to Armoury Crate limits.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index a1bb2005c3f3..ad23718b4298 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -449,12 +449,27 @@ static const struct dmi_system_id power_limits[] = {
 			.ac_data = &(struct power_limits) {
 				.ppt_pl1_spl_min = 15,
 				.ppt_pl1_spl_max = 80,
-				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_min = 35,
 				.ppt_pl2_sppt_max = 80,
 				.ppt_pl3_fppt_min = 35,
-				.ppt_pl3_fppt_max = 80
+				.ppt_pl3_fppt_max = 80,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 45,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 54,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
 			},
-			.dc_data = NULL,
 		},
 	},
 	{
-- 
2.52.0

