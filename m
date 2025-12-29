Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C542264C0
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767020912; cv=none; b=KDlvVgsBravtYrdE+ynzztAthe6kYUfUYL8N//21sabYkx4xfOYmi+oUlS3hjtpCpq8prkpeZdujHpagFi3vZQrpGb2rit+o3rbmaYCN83p7YVwGuO1ansDE3feNDX9lgFvdPGV+w9u/DctAQuCEEJMMMNbEZMlRZLwKq+r/uHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767020912; c=relaxed/simple;
	bh=cbTlmIUapISTfdkDEn3LldF+ViRcGOJT6QuTS43OUQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E6B4Ngl14YOJBCr5ayKyTuPntUytFlcEyU7NX/BrZesUONApEoF6KqjAPfGjwPt8tjs3E4W3CHHgcTO/HoZWZfiA3V6yDQNVv/b+KF+wxWVutz2woqizbVxmn7VB+4HvZD0CrKwRF9R8cyoXbMFqFj+HRQ0NTkz0bPGO8mrtQIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qOF20hIa; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qOF20hIa"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767020899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=liYTCfeZ+mrSbdebBofyCfbvtxib8sEyr2O6VggJSKc=;
	b=qOF20hIaHPySWip/+C33tu6Vrz0QkepDsSh1TjOQQi4V04QghH7kyiYTBts5b/3hMPBrOR
	KeIF+GuTME4/VqNP/50Rw5ZWHhz4tRScD5Ybb3RvEKHdhBJdHmdlc/mtsPgJw8DcaG+hpw
	HwkrEWYWeOxXDscmGRyJSlCDmsUIcWk=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	=?UTF-8?q?Merthan=20Karaka=C5=9F?= <m3rthn.k@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v2] platform/x86: asus-armoury: fix ppt data for FA507R
Date: Mon, 29 Dec 2025 16:07:55 +0100
Message-ID: <20251229150755.1351495-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

PPT data for FA507R was reported to be wrong by a user:
change limits to make them equal to Armoury Crate limits.

Fixes: 39ae6c50e599 ("platform/x86: asus-armoury: add ppt_* and nv_* tuning knobs")
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

