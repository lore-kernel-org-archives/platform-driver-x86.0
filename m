Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F99371D0F;
	Wed,  1 Jul 2026 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924024; cv=none; b=J7BBM/UesDRJQHns2jarMF5atQ/bVbPysW72ZRs1AggXvQqum3yGtacMaGI8pf5jpGmWeTbduV1TK9/htvZ5DneyFMGaQLg/bo2XbZIGHtSlVPvY3/kTsqDrHAjiHhPoo1iLT8jChwF4dFRPwIsEMC0sn8eT159g1YgSR9PSOsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924024; c=relaxed/simple;
	bh=eDwdgIq0qOhuSNV9j+DESA8VkVd4LLxwj5SIJO3lK8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jO488JauO17I2zYZ2Spjvt/NNnQ6bSlZxLItkReVvR9DUGgiD+0SPUvE9NWOiDXUKH9WpdL54eePO2hxyLnrRKLcr7DeT5ikVq6foKPWqqjk+jQKOfitrIjG9qHlofi1u/9oA6Xo00NxTjwDDXuRFHwHPXKlPjOTRbKY+RyTP84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=D5S0KYOZ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="D5S0KYOZ"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 13D1484141;
	Wed, 01 Jul 2026 18:40:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdlYQGwgyjB3; Wed,  1 Jul 2026 18:40:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1782924018; bh=eDwdgIq0qOhuSNV9j+DESA8VkVd4LLxwj5SIJO3lK8I=;
	h=From:To:Cc:Subject:Date;
	b=D5S0KYOZfnErK2ryS91nHnWhpZPSsB8u6ZJBJUMIiY2u+KnTNYOtBLgloxKuP6giU
	 7TTaFYyczNbFHRGm0cN0ODlrIh31zY/zXohYBE5pv9JYPZEPPnfHlSU7CNWklskl9F
	 VAz4bDgAbnShqNqegdXzeVlNDqxtJwa6mZ1HQVdMxr+cldb7BGoxu7P8tFnL5kG1dw
	 hw13uSnNln4vnWXLn4RvTihvwyS5r0MwjO3g3ux+oJ0iPT80ADq6+jc8Y9KKBvNei0
	 KC+HJdj1QOoyxkNZbkULoh/2Joy5sYGWCHbL1/smiY8F9nsbnE8G2LS290NeQ1Uxbp
	 3cloPBNdIkliA==
From: Marco Scardovi <scardracs@disroot.org>
To: ilpo.jarvinen@linux.intel.com,
	denis.benato@linux.dev,
	hansg@kernel.org
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH] platform/x86: asus-armoury: Add power limits quirk for FA608WV
Date: Wed,  1 Jul 2026 18:39:35 +0200
Message-ID: <20260701164003.4271-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add power limits quirk entry for ASUS ROG FA608WV laptop.
The limits are extracted from the device's ThrottleGear XML configuration
file for the 'Ryzen' profile.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -756,6 +756,40 @@
 	},
 	{
 		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA608WV"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.nv_dynamic_boost_max = 25,
+				.nv_dynamic_boost_min = 5,
+				.nv_temp_target_max = 87,
+				.nv_temp_target_min = 75,
+				.nv_tgp_max = 115,
+				.nv_tgp_min = 55,
+				.ppt_pl1_spl_max = 90,
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl2_sppt_max = 90,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl3_fppt_max = 90,
+				.ppt_pl3_fppt_min = 35,
+			},
+			.dc_data = &(struct power_limits) {
+				.nv_temp_target_max = 87,
+				.nv_temp_target_min = 75,
+				.ppt_pl1_spl_def = 45,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl2_sppt_def = 54,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FA617NS"),
 		},
 		.driver_data = &(struct power_data) {
-- 
2.54.0
