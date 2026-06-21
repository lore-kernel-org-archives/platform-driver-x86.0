Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BBD1E0DD8;
	Sun, 21 Jun 2026 12:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782045076; cv=none; b=jzkm1VGYZhKmGGxu4+YX/aEWlJ4TLwYtlsrMHSjagDh/QRDCeZ0MEvt8lQv56vKdp+puLX60ZkkJH7qo7/G3Z49tg4vajvjhVsJGHf6JdMBIma3XGQxi6880y8xpAwyL/4xVta0RDdwsgufn3EdK4tBBPlBFOrg/2MiZ+0zuk00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782045076; c=relaxed/simple;
	bh=i+090HnrgdvbJPHhomsrxRmwyoBqPpx3dWvNP3uA2N0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fuHwaX/2oL1//8jgoFBN3wGjDFYo5b/7SxEihouBGNWCmBURmbiyq4A+CfehbJ06QqzlvmNP+r+j4G3scqhRPAtLDwuV35UtuOIiOPfph0N4rrzBc1Q78IrDEbrXADXr8qxUwof/Cw6SX8334j25ar55CGDYrjCXYct7OGDbAN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=U/MnU2cm; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="U/MnU2cm"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A89E327027;
	Sun, 21 Jun 2026 14:31:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5o9oBgG-6V8P; Sun, 21 Jun 2026 14:31:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1782045071; bh=i+090HnrgdvbJPHhomsrxRmwyoBqPpx3dWvNP3uA2N0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U/MnU2cmBvclZYOgABfq0IkSJV3uAAshjAUOk7iHQO0i656TC1YY4t0+hz5KfhMj3
	 lb2K6SEh/jcgqbbHyZVj7aWgCL2kR+F7umLg98Jlot54wLHb3ftBo+C27HMnNmGHFn
	 1114vMdaS/V+v6O1y4Rj6LHxNeRjuDQTGHp7ofMbFKF+8+ktDs2vuV9fOuuRzBZMqS
	 nsKdZoAOnFfwF5exCj+++nmG69yY+FdtAtQZ+mW0/VawLpceCRDDYiWRMZramR3Fuk
	 p+qs6gxEJ4X0Nzr1/1HNtlCiU76b3qmhz3Wq5Q+0HAUaIrYb1GH5aJLLQ48TkmXzGr
	 I/XpXPEjU9iOw==
From: Marco Scardovi <scardracs@disroot.org>
To: scardracs@disroot.org
Cc: denis.benato@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 1/1] platform/x86: asus-armoury: Add power limits quirk for FA401KM
Date: Sun, 21 Jun 2026 14:28:59 +0200
Message-ID: <20260621123055.5465-2-scardracs@disroot.org>
In-Reply-To: <20260621123055.5465-1-scardracs@disroot.org>
References: <20260621090230.41249-2-scardracs@disroot.org>
 <20260621123055.5465-1-scardracs@disroot.org>
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
2.54.0
