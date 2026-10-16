Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F811472782;
	Fri, 16 Oct 2026 12:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152923; cv=none; b=d0YD2WwXTMM/HVzqpukxUS9bGGk5653vorKYSTZ6KoLgAX387WpYMm8ykeeVAPNCC1et6BkTkCIOwWtL5KUCIt+/a9Tntm2QRTWh5/vxK/83DsC01j8j0RV7VWrkySVQhxm3oXuy3QipGbraF0zAipmPYPkzxr7/bO33XZIf23I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152923; c=relaxed/simple;
	bh=qlubKLSu5MMCebEFxqQ6N98NoCOiWaJIKyBzOqn+RaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0q+73yVIfRAy3xBI3/C8KbNzPmuP5y+6Ss7o8kEpAJASHY+DhGf9hkv96V9Jhie1yXVLyqtWyyKDW5HK5njyfyxesePzUAbeFCKTA3OKjOAfdbxE0FDF0xe2pYF6mszR2BsWbkx89NcRCeRVXU7DZw2XBgf3Z1PSwO9nRwYdXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Tuj1lWgv; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Tuj1lWgv"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A390B82A6A;
	Fri, 16 Oct 2026 14:15:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-Aw7Hb8zHcx; Fri, 16 Oct 2026 14:15:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792152912; bh=qlubKLSu5MMCebEFxqQ6N98NoCOiWaJIKyBzOqn+RaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tuj1lWgvHuvXPZyUt8ktXvz8pzyjTYzx8Cro7gHYG/nNu4NIArANzsfMVz23t7hlk
	 pBAVLGLy+d7rXXiSEdYqgzYxzi37UYHEocu+EyFExkX1GSEPYcGi6ae00MxbY4kYZd
	 C6OPg69tuqtMfmuy9j7Pb9fg8y8Arm+XR09WCQu5Jr63mBxNScL8Ne+JBpvedP6yRK
	 PPx5eQ56ZFTlyH9M1LcTGeqAsWExh2EQRSVqHufNVguDg/RiWSerRFwWBu+EyFDUAE
	 maZ8KwgRWz4NbEIOoNURGpd+mSAHpZ4OS89U16ztypgJu8xYHWzE5orAY1/RHK75lH
	 St2ub1qwMikVg==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v2 5/6] platform/x86: asus-armoury: add power limits quirk for GA402NV
Date: Fri, 16 Oct 2026 14:14:31 +0200
Message-ID: <20261016121432.35071-6-scardracs@disroot.org>
In-Reply-To: <20261016121432.35071-1-scardracs@disroot.org>
References: <20261016121432.35071-1-scardracs@disroot.org>
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
