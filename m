Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2932147ECF9;
	Fri, 16 Oct 2026 12:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152922; cv=none; b=nqWqJrLjWNHJOHODFVv+MR+ovQ6rd2k8G7zMrL0p/UQofe69XrRkYoB3Zb0J0molCixWOx7JlAtmTD8+Dwv4YrIfRjj2yR+15a+7rl3VEiZNnvwgi4BiWm3R6BoxmCNRS5Gh/UM5HPgWy70KBYlAAARVD3ujPHLbq5losAzf7uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152922; c=relaxed/simple;
	bh=If+n+XgHGOQcq0LttvU6Mpu3lWXLkdNv42AOWEBtLOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cCHgshYhLeHeOhuLC6zte6DMSlm5if0o/TBhUZ7G6kVXycZTac9mruQpJvB7zQqlEzVTDKiTOCdohWnyDnl0rw82vh/sRW9Hr4oZpROAvGj89Rl/vC3mM8hJiF1ykA81JbW1xPJXhq4PnV+MylNDdEQMuON8+AhKo4IlUpnrb3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=czFMdMWb; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="czFMdMWb"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0176282BFF;
	Fri, 16 Oct 2026 14:15:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRnCh15INGgH; Fri, 16 Oct 2026 14:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792152911; bh=If+n+XgHGOQcq0LttvU6Mpu3lWXLkdNv42AOWEBtLOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=czFMdMWbeIt7ouEdmt3Oe0C2gO9z2i78D9lqMRuC1j5p6FIuKxTDXjLONjNqME/x+
	 VRJfARaGOJjdmue8DhumzJaCrkR9ZVIODGxUeg/XpffaFRwGOqMn4c2I2TZU9+6ihX
	 2PoFjtrWO9dcq3/eB5jalwhlpAbHigl9wbdO186uw27+zMV099dHvsNte9Nyz5fela
	 8RcDj6tF6MZoeWXXzfdvWmA4xulwBwcEmg3rvO9Yb1RO+IDmAfw+6WW4iIiqsPJigH
	 PYs+0gwHj6gXvD2rBe93iJ4D0722UK+5Ylm9J8nhA3WT9MIi8+X1PofokMj6LA/95V
	 pcDnBWVaaFneg==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v2 2/6] platform/x86: asus-armoury: add power limits quirk for FA608PM
Date: Fri, 16 Oct 2026 14:14:28 +0200
Message-ID: <20261016121432.35071-3-scardracs@disroot.org>
In-Reply-To: <20261016121432.35071-1-scardracs@disroot.org>
References: <20261016121432.35071-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a power limits quirk entry for the ASUS FA608PM laptop. The limits
are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 29 changes(+/-)
 1 file changed, 29 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -787,6 +787,35 @@
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
2.56.0
