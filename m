Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DA04AE115;
	Fri, 16 Oct 2026 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155846; cv=none; b=M6bq8sHo/EH/mJ8+2/G4fAZTdip7QdSMXMNaO1/jNLF0WZo1pLkKQhjt7rKstsofy8k9ycwUFuFSEbvFEcDB1uhGyOtOOdtt3BqfKCToguFXeoiW22rag7j8nNGKz9fvvgVNFp/4J9HZfBp7wCY2pe3nc6BbJ8a50PdwkZhWh5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155846; c=relaxed/simple;
	bh=kNYixC/KPPGnjKHohkCcTw9dbAIRfFmAItslSgaWAl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L4sxoHbb4YoCFAaKW7n3xr6WoDz84MO1vu9dmTKSHSqQ8btDTf/+pGYSQxGPXgzQjJX2cEFlugtO5t4kyPYW3f2hbf0FA8TO3K/he+lC7mvNuiD8nbTwR1un66n+o6iOiR7DkI/ROeUdQapdr4ndNLfvNQNi4sJ1+ZtjQFb432U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=PpGoUyA/; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="PpGoUyA/"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6A11082BA4;
	Fri, 16 Oct 2026 15:04:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsdwV7NJxKJO; Fri, 16 Oct 2026 15:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792155841; bh=kNYixC/KPPGnjKHohkCcTw9dbAIRfFmAItslSgaWAl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PpGoUyA/WNSit/uJynHm4KtsbMEp/U8Tx36J4VknLJrznBIcf7VRJV8cenx9cDIh+
	 0x+wyRWa+N7bwmgNdeu+Rx8xArnKjsGP1gDZG6J5hH2c/TMTGdaoEEHFX0kc0uE+GD
	 eQq0UX/Y6ueS0G47hRFvPhMBD+WZUfEzYBx/TaOuJVW9EJjcUdiLgaK0POQEGybzSW
	 RmFUQULU9fhDU8yXjfaZp6S1YrtKDgYz5f/lOas/9IOmd5P4pXQn4Gdj0x2gBsaiCK
	 MYoJVUn3fFpw8uBDyNAgdAjlx/vOrwvzFtyzYBfr6HX455y0j+F7O2e6XA+gGZ7b4H
	 MDshh1nbL+5cA==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v3 2/6] platform/x86: asus-armoury: add power limits quirk for FA608PM
Date: Fri, 16 Oct 2026 15:03:38 +0200
Message-ID: <20261016130342.69923-3-scardracs@disroot.org>
In-Reply-To: <20261016130342.69923-1-scardracs@disroot.org>
References: <20261016130342.69923-1-scardracs@disroot.org>
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
 drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
 1 file changed, 31 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -787,6 +787,37 @@
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
+					.nv_tgp_max = 100,
+					.nv_tgp_min = 55,
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
