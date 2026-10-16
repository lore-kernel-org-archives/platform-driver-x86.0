Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44205499F20;
	Fri, 16 Oct 2026 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155850; cv=none; b=SPOgggjEoaY454XpNW1+JM91hNuR/krqQwY1bBDGGiYIe1tfF+4oxCt6jlurF9OxIJGGyQQ+Owkxpp9cE/FUHt1UX2zHJXD+/0Ms7E/CqVDY4F0PcbFeQa4oTvg/Mhf/W2yEaBaHEVOy1G3WtgVjSiv7mfahb/cOxoUz8X/lhDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155850; c=relaxed/simple;
	bh=KjVBTg0ZJlFvUy1VTFM6Wry24SdJBhsAaCVmRJ3Mogs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EdYOTkUd3x+S8SXQ1CLVEIerpHfnctS98BldOYgpHf1IBGr1xLJuDHMGlZ700fEvEIWcRng5bwO4xPDdMPv5xmvDrXc/mxe6VeLOm/IEBKFpcWTkIm+NVjhF7JxeD51MT9XhjJqCleYr9cgCwAmdUBPwtvBCdbxyMnLCPF2t/F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ihUBPWwu; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ihUBPWwu"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7393B82BD4;
	Fri, 16 Oct 2026 15:04:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLHW6QATeQV4; Fri, 16 Oct 2026 15:04:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792155842; bh=KjVBTg0ZJlFvUy1VTFM6Wry24SdJBhsAaCVmRJ3Mogs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ihUBPWwuAI8ErkC9vHU8rY3CCW/PCKO+mU2tQvcYNsUGjR5xMThTQeIlVI5EuBINq
	 rivuVGsZq5nz6G8K+5WXQ+q+HszpAHobjT+BEkRRzWW19Rq78xYJaNSfy9h9M6YXNS
	 pKHxQkaWA1y2PsXANxcvrdOy0T0Ps6ogUeihKzaPsVooDJdejYNokYp60n4tBmPpKO
	 VosDVGLI/ROXELUNNUk/YtVdpB7DQu1ROjxDAQLKuyei6hfHoIOsuy1hs3KqnPglid
	 K+XhNmlrOy9dC9vNQV0Z0ihpAKr/5WPfZzo2Gi+FBa3N2NB0IBDePzwEj8vLJoMzT5
	 O24K+SjFVYtHg==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v3 4/6] platform/x86: asus-armoury: add power limits quirk for FA608UP
Date: Fri, 16 Oct 2026 15:03:40 +0200
Message-ID: <20261016130342.69923-5-scardracs@disroot.org>
In-Reply-To: <20261016130342.69923-1-scardracs@disroot.org>
References: <20261016130342.69923-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a power limits quirk entry for the ASUS FA608UP laptop. The limits
are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 33 changes(+/-)
 1 file changed, 33 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -887,6 +887,39 @@
 			},
 		},
 	},
+		{
+			.matches = {
+				DMI_MATCH(DMI_BOARD_NAME, "FA608UP"),
+			},
+			.driver_data = &(struct power_data) {
+				.ac_data = &(struct power_limits) {
+					.nv_dynamic_boost_max = 15,
+					.nv_dynamic_boost_min = 10,
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.nv_tgp_max = 100,
+					.nv_tgp_min = 55,
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
 			DMI_MATCH(DMI_BOARD_NAME, "FA608WI"),
-- 
2.56.0
