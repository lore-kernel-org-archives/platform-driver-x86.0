Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56A51DDC1B;
	Sun, 21 Jun 2026 09:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782032577; cv=none; b=mjDeasSbyI0Pe0zAz/nTYbfdIJCdUyFH2zptcs9OWvHt/chyiyQxWa1jmdI3t96zPoB19eKQzkytu+n48JCYzhSlzkyaoyos/Zy+OlzdaBqKMlMT+prqos4wUXFZtOJB7mJSNOHC7G7lD2AlUZudPduYB42yEFxAnOuOyKPc1q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782032577; c=relaxed/simple;
	bh=PgFkGPkU1RhwX9CDT9mJjdZLM5gSbgYGGQqPdrPmmIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z9fQwKHkquNbSCpDhxmnGrjggoW3mHCpL1ISiAFki4I93yaqSSunPXo+Jmv5ulBNzGHrU2tqGIKvgLun2lH2OnZwnsJ98+GwUnSENItC7Is+/cRYWcK9W/YmcGWi1bQY9OYUcKmXPLSLx1IOlm1K4Fdht9x+X7VnkIRKGf4d2fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=cxUT0XSw; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="cxUT0XSw"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BE22E271E1;
	Sun, 21 Jun 2026 11:02:46 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4OsSfHBNbg4; Sun, 21 Jun 2026 11:02:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1782032566; bh=PgFkGPkU1RhwX9CDT9mJjdZLM5gSbgYGGQqPdrPmmIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cxUT0XSwKXds49YuXXaeQjGQwKXUsFsjKEjuIn8wyu0O88k6tQkZjmPkLUjbSYru1
	 oeU8WsNR1XN+z+KP+afezkPtwOhp5tw+5ORnAwPTiS03xmqR1xiV0/e/EWZMxpyeEg
	 6GWq7Q4I/ohwRqg6mARcZSpie3agE/ZJpxuqH4Vu+MWjfIHLMXqe7EI0d0PUCmnRu9
	 kwRXhesl0RwWBnRzoDby1cjGGgrWlhVEXnsILxup+8joNy7Qb1Jxv9HzTwKW02BMjR
	 30u2KKI9gKLdMkJW5l6RtI1JejJSPxixBKmTSDPDiGN+9RKW3p/Zi2iyQfvJbrswy1
	 yoyJPOGExepxg==
From: Marco Scardovi <scardracs@disroot.org>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: denis.benato@linux.dev,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH] platform/x86: asus-armoury: Add power limits quirk for FA401KM
Date: Sun, 21 Jun 2026 11:02:30 +0200
Message-ID: <20260621090230.41249-2-scardracs@disroot.org>
In-Reply-To: <20260621090230.41249-1-scardracs@disroot.org>
References: <20260621090230.41249-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add power limits quirk entry for ASUS ROG FA401KM laptop.
The limits are extracted from the device's ThrottleGear XML configuration
file for the 'Ryzen' profile.

Assisted-by: ThrottleGear
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -371,6 +371,38 @@
 	},
 	{
 		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA401KM"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.nv_dynamic_boost_max = 15,
+				.nv_dynamic_boost_min = 5,
+				.nv_temp_target_max = 87,
+				.nv_temp_target_min = 75,
+				.nv_tgp_max = 95,
+				.nv_tgp_min = 55,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl3_fppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+			},
+			.dc_data = &(struct power_limits) {
+				.nv_temp_target_max = 87,
+				.nv_temp_target_min = 75,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl2_sppt_max = 44,
+				.ppt_pl2_sppt_min = 31,
+				.ppt_pl3_fppt_max = 65,
+				.ppt_pl3_fppt_min = 45,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FA401UM"),
 		},
 		.driver_data = &(struct power_data) {
-- 
2.34.1
