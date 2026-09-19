Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9057A3A0B05;
	Sat, 19 Sep 2026 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795788; cv=none; b=TDHiMMs6PCy+J6z1FqpjskhStCnS32XwIcG9ugssKUjR8a14DtFMFXw6WmVdthfu4lOJ88T0ZlrFUQNh7Tb+Hg1yd++Q06H9oCtfw0dw1dkZHBAwUFhQwqcqH0L4U2wsyhyl2id+FCaUCTTdScB3TtXYOG4qpuX3JS1YfccojZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795788; c=relaxed/simple;
	bh=0SGaHccmm4ibXWSb/5TRhO9LUaNsTZRlvdF0gsyjlgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qaFEZ2jVn3nMS6/aXoI3SrwdRk2W4DSAWs43+Y7kScIOpE6XaRSm/JNiH93aj/FK45VU4Mg1L2TJ4HAisK48/NNUzp8WFikCaF4yFFDhAm2ssDgeddFb82QIgXmhbw5xeVxMRK07GvrXV6kqWV9VBMz0PgUsuFesZEuYPTJVfsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=A/XNoxrU; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="A/XNoxrU"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9B05980DC8;
	Sat, 19 Sep 2026 07:29:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOeq7WyUnqoc; Sat, 19 Sep 2026 07:29:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1789795784; bh=0SGaHccmm4ibXWSb/5TRhO9LUaNsTZRlvdF0gsyjlgQ=;
	h=From:To:Cc:Subject:Date;
	b=A/XNoxrUoWjIF4Dcj6nqkqTxL+hAbCyi6HHOtICHi/DDKCfOYkLitFuTUKB+3kpL1
	 m+YnHIZze5C3Hfxaw2RWmqfMd9+/K1iNxOBAwLbBY7p4b8DOFHseew5KUolx3Pu+ey
	 1ITFheK4bkWA4n+vwLr8Gb7qNB3K+BTTBPKin1LXpI9xg7GIOUuAlFCN6H92JCEmkp
	 HEwU6FyrXR9fY5QgBje3K3YOTo2YqjysfQk08newrESnGwjIEQ8AYGzHhpJS0Vkb5l
	 Y06YXBjfEqcUcF+EVQ9/7DxXMzr6Ug7AeVlAtVlfmoFI9xNpiIVNm/9zES6stAyVqZ
	 r3/0o+6lF6rVw==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Denis Benato <denis.benato@linux.dev>,
	Luke Jones <luke@ljones.dev>,
	Corentin Chary <corentin.chary@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-armoury: add power limits quirk for FA608PM
Date: Sat, 19 Sep 2026 07:29:13 +0200
Message-ID: <20260919052913.24147-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add power limits quirk entry for ASUS FA608PM laptop.
The limits are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 29 changes(+/-)
 1 file changed, 29 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -713,6 +713,35 @@
 			},
 		},
 	},
+		{
+			.matches = {
+				DMI_MATCH(DMI_BOARD_NAME, "FA608PM"),
+			},
+			.driver_data = &(struct power_data) {
+				.ac_data = &(struct power_limits) {
+					.nv_dynamic_boost_max = 15,
+					.nv_dynamic_boost_min = 10,
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.ppt_pl1_spl_max = 100,
+					.ppt_pl1_spl_min = 45,
+					.ppt_pl2_sppt_max = 115,
+					.ppt_pl2_sppt_min = 60,
+					.ppt_pl3_fppt_max = 135,
+					.ppt_pl3_fppt_min = 80,
+				},
+				.dc_data = &(struct power_limits) {
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.ppt_pl1_spl_max = 68,
+					.ppt_pl1_spl_min = 35,
+					.ppt_pl2_sppt_max = 71,
+					.ppt_pl2_sppt_min = 36,
+					.ppt_pl3_fppt_max = 74,
+					.ppt_pl3_fppt_min = 70,
+				},
+			},
+		},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FA608UM"),
-- 
2.55.0
