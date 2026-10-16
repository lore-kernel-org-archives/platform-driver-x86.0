Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BE747ECCB;
	Fri, 16 Oct 2026 12:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152921; cv=none; b=AyLo1STLfzY/ktiJpwebxboB2h3/JfbeJQdumg/Y3ktejhg+SPTRRA965C17GtbvgrWDd2q73oRzG+u0Yeh7cQOlx5C4y5tn5oRT2D+jAq1Lvk1wCELmj+33KYS9E+lm3DXber6KY8rAo1pSVEm/aoQIB7YOv6SY0wuxTYe6ASc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152921; c=relaxed/simple;
	bh=ASObSo+0+eKvDuBgBfGr6fJLZeslfvltu3qJp1NIVu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4rVfaEstxMLt4Pa/AE0gR/AeIVPvKQO2O/fo1PzQMyVN4U7WiHuR0UHBdBl7a6qOrBlQSDlipoiMOTZ+vdmtBnsJPSDrnMXH17MtNeqJ2ob/vcw92zSopRBsGfo6eMj1xwAQCIVTsSaK51ag1xcGFhGnptf55Mf1S5dwU50Ay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Wda39NxU; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Wda39NxU"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7D31282B8D;
	Fri, 16 Oct 2026 14:15:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xusmK-hUtwOA; Fri, 16 Oct 2026 14:15:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792152910; bh=ASObSo+0+eKvDuBgBfGr6fJLZeslfvltu3qJp1NIVu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wda39NxUvZm+QOz/ko+AluH6ii5KoqeXiH2WnYGsuBINsUGYgIc9PHVojLSG2f8gI
	 K5JoeckSBzFflMPAiwdkWIwrwVFDXYGIEl0UEFF2z5J/T4A6mNc24mnZIQ46BrggOo
	 EOBrlpKXag4VGBfaz5DrCv98I8H6syutfqZXBYYt6cU7yjFDgP1uPVumckYho/ybTd
	 Zg28q2xpIOUT2NpCk2039Gpi0SA7CyW3kFtcu7ygRCFVmORb883PzY9y7cWCCmH35o
	 IT3BDTFdCGpX02NLGKfj/AJKeVXivbM4q5hfWtxs0bBGjfk3Ay7ZViV6X9E0/EQL+d
	 lQ77M6owjjrTw==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v2 1/6] platform/x86: asus-armoury: add power limits quirk for G713QR
Date: Fri, 16 Oct 2026 14:14:27 +0200
Message-ID: <20261016121432.35071-2-scardracs@disroot.org>
In-Reply-To: <20261016121432.35071-1-scardracs@disroot.org>
References: <20261016121432.35071-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a power limits quirk entry for the ASUS G713QR laptop. The limits
are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 13 changes(+/-)
 1 file changed, 13 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1130,6 +1130,19 @@
 			.requires_fan_curve = true,
 		},
 	},
+		{
+			.matches = {
+				DMI_MATCH(DMI_BOARD_NAME, "G713QR"),
+			},
+			.driver_data = &(struct power_data) {
+				.ac_data = &(struct power_limits) {
+					.ppt_pl1_spl_max = 80,
+					.ppt_pl1_spl_min = 15,
+					.ppt_pl2_sppt_max = 80,
+					.ppt_pl2_sppt_min = 15,
+				},
+			},
+		},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GA401IHR"),
-- 
2.56.0
