Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA154A5EDC;
	Fri, 16 Oct 2026 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155848; cv=none; b=Zo6ovH8ojKShnh9KticaH3aSivMyLBLAyjfdj7+EXuwzQN9oOnyTUsw28d5ilrTzCdVh2Jo2Zd5K3LGaI6gAfPHYPpcVrSkRhSCeKvjmhUuE1td4Gj4Owzkv30NUQneiSO8JSh2XTxjN7BxGSMsYmqGcXilw7DEdfy7QRz9T+yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155848; c=relaxed/simple;
	bh=QkB7vMtytSu4tjKmc7LetvdIbt9VLgw521xcOE1ATfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFw6CeF7SzAHKkoEVDZ4nTGB0hwHld+GmQtQfeCPyfzgqR8LfBycgoX29zeltXEr8ebw8crfyYYdP9TrMI1koCVJlurcn61f9e8+VMMC6fpAfoGP6xhq7Vgb/J0GE+yLM+hxGG9CjUDvM8txcZ0SzZ6sqxWlFgc5hZOK/KH0g0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=EiYqoBcr; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="EiYqoBcr"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E2D7F82C0F;
	Fri, 16 Oct 2026 15:04:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7jq81_w9o-e; Fri, 16 Oct 2026 15:04:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792155843; bh=QkB7vMtytSu4tjKmc7LetvdIbt9VLgw521xcOE1ATfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EiYqoBcrFcqFwiraLGZejObegS5n6Z8kvT0APqnsybmCcjxi1HagMTBR1HpcVOQd6
	 jnDIU/hqpermZxZd82s+IVtWXNiiSIVp22YNAP9adl2WQnqa34H2VvX4MUhyjCpjyA
	 mQVAtTLuryP9fSo0N9/Bg71Tnlufa7wN+aIm1zBLauapCrXpYx6zaYTfLLFzO2i5Ws
	 x+R8RTNHGU53ln7+FpR8UGe798HLzdsl6ujmG+CygdTWmI4xLOEQIPZwlubywcN1/w
	 6u/EtTiVS1Y/FJNZtXzShtC2kd6mTkV+KgFW8IOfOBiODMQcBrvjjSYvGE/Gs4Kxam
	 +lt4zFkv99F6g==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v3 5/6] platform/x86: asus-armoury: add power limits quirk for GA402NV
Date: Fri, 16 Oct 2026 15:03:41 +0200
Message-ID: <20261016130342.69923-6-scardracs@disroot.org>
In-Reply-To: <20261016130342.69923-1-scardracs@disroot.org>
References: <20261016130342.69923-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a power limits quirk entry for the ASUS GA402NV laptop. The limits
are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
 1 file changed, 31 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1300,6 +1300,37 @@
 			},
 		},
 	},
+		{
+			.matches = {
+				DMI_MATCH(DMI_BOARD_NAME, "GA402NV"),
+			},
+			.driver_data = &(struct power_data) {
+				.ac_data = &(struct power_limits) {
+					.nv_dynamic_boost_max = 25,
+					.nv_dynamic_boost_min = 5,
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.ppt_pl1_spl_def = 35,
+					.ppt_pl1_spl_max = 80,
+					.ppt_pl1_spl_min = 15,
+					.ppt_pl2_sppt_def = 65,
+					.ppt_pl2_sppt_max = 80,
+					.ppt_pl2_sppt_min = 25,
+					.ppt_pl3_fppt_max = 80,
+					.ppt_pl3_fppt_min = 35,
+				},
+				.dc_data = &(struct power_limits) {
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.ppt_pl1_spl_max = 35,
+					.ppt_pl1_spl_min = 15,
+					.ppt_pl2_sppt_max = 35,
+					.ppt_pl2_sppt_min = 25,
+					.ppt_pl3_fppt_max = 65,
+					.ppt_pl3_fppt_min = 35,
+				},
+			},
+		},
 	{
 		.matches = {
 			// This model is full AMD. No Nvidia dGPU.
-- 
2.56.0
