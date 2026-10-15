Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C535326BA;
	Thu, 15 Oct 2026 18:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088366; cv=none; b=NIfaX4JT58e9uGM1/LaCEJeD7SVVqpNP+mfBMkdu5wapyMm+Mf8/yx4jOGaCslGIhFHHieVizfTj276V3AB8bS+b665Lca2gtHATJTzMVz6/NeBFnY54T1c6TbmZKAMRbTxeJ4dKw2J6PJFBpDeGp0CaSH0BayD3O4u9YSEwNIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088366; c=relaxed/simple;
	bh=GMRDlcZT2zJ7evB7w4H8Sf/PpFZ0l2dCp6qdjZGk0gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAlmXi8gArDfIKWhch0NGnAatgV8Wmy0vPSyHO3iy19hLqxCww1t+UfNb8GrW/uN3BVL1XOzD+2mOw8Uy/tA18a0A5L2cL6xUqTdqbV+ldvoeiW5pSlofTDDtppU06ragyggPgtp5mpQxUW7QlWfrIh8Gly5GPZ0VOsF7Obl2Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fEt/Kk/1; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fEt/Kk/1"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C7BA380848;
	Thu, 15 Oct 2026 20:19:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_jaybZL8tN8; Thu, 15 Oct 2026 20:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792088361; bh=GMRDlcZT2zJ7evB7w4H8Sf/PpFZ0l2dCp6qdjZGk0gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fEt/Kk/1IRfGPr4ry5RwkOeNKdPSdrO5mlC3c6QADsLrzZVBaaCISRiMTcPza/W2f
	 Kp4GZ0bjlgOICvqIAwLimkZoOLL+vzWltdR05/xX7ewpyMdnixyh5UVtIxTYNiB+tW
	 RRvgXZ6peYAe6xM9tUeQqYrhMZMTYZ9nu0s+OJtgBmfd/ePkupldqBYNVKuuuMJ0TB
	 S88rC/7IU04sf0vBLAqT7m5mIUJM5U6PsWIdihNNjj7n4mDiKa7u7USzmSXGklUfG9
	 ESTPhXPzkhpbinCVUek6CURZHzgpxJnHmzZcfdLATf11xCFLbVdcMF46ZMn/QWyIO2
	 k5NMWt5bN2MtA==
From: Marco Scardovi <scardracs@disroot.org>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 3/6] platform/x86: asus-armoury: add power limits quirk for FA608UH
Date: Thu, 15 Oct 2026 20:18:47 +0200
Message-ID: <20261015181850.170862-4-scardracs@disroot.org>
In-Reply-To: <20261015181850.170862-1-scardracs@disroot.org>
References: <20261015181850.170862-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add power limits quirk entry for ASUS FA608UH laptop.
The limits are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
 1 file changed, 31 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -816,6 +816,37 @@
 				},
 			},
 		},
+		{
+			.matches = {
+				DMI_MATCH(DMI_BOARD_NAME, "FA608UH"),
+			},
+			.driver_data = &(struct power_data) {
+				.ac_data = &(struct power_limits) {
+					.nv_dynamic_boost_max = 15,
+					.nv_dynamic_boost_min = 10,
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.ppt_pl1_spl_max = 90,
+					.ppt_pl1_spl_min = 15,
+					.ppt_pl2_sppt_max = 90,
+					.ppt_pl2_sppt_min = 35,
+					.ppt_pl3_fppt_max = 90,
+					.ppt_pl3_fppt_min = 35,
+				},
+				.dc_data = &(struct power_limits) {
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.ppt_pl1_spl_def = 45,
+					.ppt_pl1_spl_max = 65,
+					.ppt_pl1_spl_min = 15,
+					.ppt_pl2_sppt_def = 54,
+					.ppt_pl2_sppt_max = 65,
+					.ppt_pl2_sppt_min = 35,
+					.ppt_pl3_fppt_max = 65,
+					.ppt_pl3_fppt_min = 35,
+				},
+			},
+		},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FA608UM"),
-- 
2.56.0
