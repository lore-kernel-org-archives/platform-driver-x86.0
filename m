Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F44AB1AB;
	Fri, 16 Oct 2026 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155847; cv=none; b=JWutm/IGDzT/jp4K01w6AzXcgCGxyg1B8Pc3V06zpVnCLlW6p6uqQzBFQGGxzDFwPWDsXZxf9++sZcLs1bZWhbf7d4Kle1RDd9SQO1L7LuHGvAAzQz5/nPDL0xDkFjSdBPOwvzAyFrJFFEWoLm4qCs06vRCFV2EJRUJid5Hi2u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155847; c=relaxed/simple;
	bh=l7A0xDvBI+H6EN9d788xKyzWcZbkLLoD1tUpEFrkWXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBstEyEzMhoTDqCbDCu1iWD0F+gRkAVwdB4hcneHS2KfGkcueC6rg5fIZ9Lr0ZmF3dGWPv5MPhe/T/lelGpKeLwgzgSYuQUaCtjaEi0xq4FM7qzbw6CNLUIyGo+8XYG9+2hDF+bZbTrYHnD5WOWuOvpQML+/PK2U046UKz8lpNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fSyvSKfr; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fSyvSKfr"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DF56C807BE;
	Fri, 16 Oct 2026 15:04:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SylDGbt23zER; Fri, 16 Oct 2026 15:04:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792155842; bh=l7A0xDvBI+H6EN9d788xKyzWcZbkLLoD1tUpEFrkWXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fSyvSKfrk1xFY+2X7ksVJjNi58I4bV8HgO5mlLaqGLirgy+ZaK/bzj1LsbCSC4PiU
	 La1wYB4SqnqIz8SbVO2h2Hl+bD6NE4FXYYITs1yp371sUz3W07W+YqRvfaYYTIpWuK
	 WJvsGNgYtjVgMEH42ElJNG9nlK0nwRl4ngxNhrh8BPYvq1ex47nyfKt34nredkOWgH
	 CtH+e5djhNs2o4qAXyns7+yHBkcEmbKvcMUDW9iL2NAoWMpMaGB160/MmsUGvzNhIa
	 FcuXMxcKZQdPKkeVZIfYgzitcMUwbqXOX6zHTAbVu9ib/ELPiM6GYC1MRGBtNydpDo
	 io6DSoRyacqkQ==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v3 3/6] platform/x86: asus-armoury: add power limits quirk for FA608UH
Date: Fri, 16 Oct 2026 15:03:39 +0200
Message-ID: <20261016130342.69923-4-scardracs@disroot.org>
In-Reply-To: <20261016130342.69923-1-scardracs@disroot.org>
References: <20261016130342.69923-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a power limits quirk entry for the ASUS FA608UH laptop. The limits
are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 33 changes(+/-)
 1 file changed, 33 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -818,6 +818,39 @@
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
 			DMI_MATCH(DMI_BOARD_NAME, "FA608UM"),
-- 
2.56.0
