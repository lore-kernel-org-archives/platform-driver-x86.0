Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34280380FEA;
	Fri, 16 Oct 2026 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152922; cv=none; b=cO6GZLUMdbZUoGRKpz618b9FfDiM0cNcQ1SXcfE3zrsEXmY+HbyyrTGkrnCHrDrG1V1Ac3f2J/HeBUAcpXAXgO70+z3831HktCCOgYNF4eBQQhRCGYJjRhDqSIiupANaCF5ZyOlWhCTgECk67XNE9ybypBZZdgBUnYRW4+o4PgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152922; c=relaxed/simple;
	bh=HwqPxEc/VRoAty3zZmRH8dzc7Jd0Viee9QKNZCUAphw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TvQSqkSJ7skl0BtHXz9bthiNL4btR7EiOB+//ifsH4vQczU4QsphojU0vLoY4Bq0QH1NRfmF9A8Imgs+Fzsu1pzYjYesmqzz4wdrVNEqJtGaFvTnokJdSt3+dflIWboCnEiHdNVCocfu0N0oUOjwAccGVXOkxXVYZFLH97E70XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=YgwMMe3K; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="YgwMMe3K"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B4E9E82C14;
	Fri, 16 Oct 2026 14:15:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3wkXQTkr30U; Fri, 16 Oct 2026 14:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792152911; bh=HwqPxEc/VRoAty3zZmRH8dzc7Jd0Viee9QKNZCUAphw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YgwMMe3KGdM45XT4NkPCBc38VVH8WGWEy80lX3NOLxU+Tp1erwpNe70VHVRyM7iy6
	 /z/KrFjR2EE3QVPEGZILfB+70Fh0zGzM0AFTrdNASx/l2/kSVBr6Dya4bCZsZiLiKu
	 j2t7iK22Z9cD5IKbQzE2hJV1KqKDNDHeJhYhZ5aufNDORfPl5r0a7LelkDEtUmUJkE
	 XLq9ic5pjD8OODFbwZ9YmuCXKJFsOHaqo+bdEH7zSW0o3znbfzmqkgiEsIisbhIDju
	 Vv9Snu2oj0JLjUqJnRrqjYWkmPTzdv2aMicUJNKhJYJQUFQPx1jdA6rNJNl12ijbhG
	 4Ll6H86c6lnTw==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v2 3/6] platform/x86: asus-armoury: add power limits quirk for FA608UH
Date: Fri, 16 Oct 2026 14:14:29 +0200
Message-ID: <20261016121432.35071-4-scardracs@disroot.org>
In-Reply-To: <20261016121432.35071-1-scardracs@disroot.org>
References: <20261016121432.35071-1-scardracs@disroot.org>
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
 drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
 1 file changed, 31 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -816,6 +816,37 @@
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
