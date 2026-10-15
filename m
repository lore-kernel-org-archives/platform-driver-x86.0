Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1F853D9E5;
	Thu, 15 Oct 2026 18:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088367; cv=none; b=ifNMU/tGfbch7fWVPpyPCysA9skSyV1FiQdI1HXRCg40k138crDdnpLePwoyKw/0OucqOejgoagKOwwli0ghxJCCHWUSEQewmns3+VLQQLklP5vSjm0HMx6Axet61Kp7Qwvt7v17i0FzQdPUx/lm79JlLbcxjeX0X3FvdBITWJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088367; c=relaxed/simple;
	bh=gnJWfv8b3fYQqgOPckOpPGVFUxDd/2qC1aVsUP6BXC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9Yb2b+kUhlPzRwG+ZmmzkqDA13ZOnZZnegDEsteEGcv6pEODTXHCE0re1JeB5ypB5hVG4ewF45XJ34jjKguOpOH6l2f7UbwKNnac8ITHC/IlcNer7eyYaIkByjtfidrIZ9W/NjFL4XfqHczm+N+qycwXsnuRfAbxgIPN5LfCFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=YjQAQ4rl; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="YjQAQ4rl"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F3A4482BE3;
	Thu, 15 Oct 2026 20:19:22 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hbTY7zIsrwB; Thu, 15 Oct 2026 20:19:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792088362; bh=gnJWfv8b3fYQqgOPckOpPGVFUxDd/2qC1aVsUP6BXC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YjQAQ4rlyrDFA2Qyddrz/7NBSuIb19txwCuTM7owqgn444JLaTh/r6RPMyXsOmd2c
	 9OVN8c/d7aDeT0UTNyX7sXvtdfr3mOqfI7pL1yBAmj6pkhnqUIRyiFpC7WIHY/4yqN
	 MV0K4E2BsN4IztfZzwGAarVtckycCX9Ao3T00Es9dfvg1kscbrsqKfLzUFp4MUiydf
	 RCjr4LlmvnzHoH3cBIR+OdMKbacpYrqXIZ6xL/IK/ruwgboBraNN4EVyMhIQis2u4a
	 RE9BPFJNOACpr5n11ulTWhfrDyNxk1gnHr6SxA//GFYIcACeANuw0SZVki0ISDDCpH
	 wfs3aJk9NMMPg==
From: Marco Scardovi <scardracs@disroot.org>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 5/6] platform/x86: asus-armoury: add power limits quirk for GA402NV
Date: Thu, 15 Oct 2026 20:18:49 +0200
Message-ID: <20261015181850.170862-6-scardracs@disroot.org>
In-Reply-To: <20261015181850.170862-1-scardracs@disroot.org>
References: <20261015181850.170862-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add power limits quirk entry for ASUS GA402NV laptop.
The limits are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
 1 file changed, 31 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1294,6 +1294,37 @@
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
