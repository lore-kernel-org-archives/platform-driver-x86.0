Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3929F480DFF;
	Fri, 16 Oct 2026 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152924; cv=none; b=dnQZID11hl00UBjSaEJ2+AjXlYZs6dKADqoIGXmfTnuGPY4TfFTb5uFWDnOArK/lOzAi8sNFykK6KssaY+WbaUU28TUmqFlEdXK1K9c2jfqqnaxxtZExS9vZW8QLFN/i9F7UfE41wnbMoL/C8OH9pVVl6Xs9uCqpSsAFe4WOPKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152924; c=relaxed/simple;
	bh=/fC2EW/W71AW+nDt2WlDaamSFj+2JOXNULSAwqw15vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5Q7tz3CJfKSOZzeWzv6+vcTitiXHmseoWtC56HTeXYH747KawneWIa3j3YRxTlLVQIr5mbj+YIZz2n0+/zTpsQkMkK1W3ReEGCp0xBDSaAVDsOBdqXv+r7Xx6npH2KpldvoxtCJ4lphq2SbzVGWSl60640cpjsUL979f58rzH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=YF3SDwLv; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="YF3SDwLv"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 14E7982B99;
	Fri, 16 Oct 2026 14:15:14 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWU_hTMuJx0w; Fri, 16 Oct 2026 14:15:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792152913; bh=/fC2EW/W71AW+nDt2WlDaamSFj+2JOXNULSAwqw15vk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YF3SDwLvRSn7dFNQuvB1TmtlwOwwF1qtjJhlCDEBVwovY+dOPQQRQKE1MkSWHUbWo
	 iR8/PYaRjdzyYHxRxvzPBLnH3Sb7HKKNKduC5HRA2w8K2YTLB1REBU2kiEjWy+XDkB
	 eNeajonsnaGrwZdPr+HAEbPjvBWZcE/tyBvgjW98gu89cYP2p9whMWgUiUqaAVodz2
	 V7QPu40kC8rKGgPU1jcc3PWCjNuX84zRGdFeHHGqi557arIgoIBty/WbAmS1do+E+S
	 XB0yZyebUxIVMslOvyMsABa6Mm1Tx9DBVc0/s1voTpGIbNoBA9YXh4wOQZDjppGC6J
	 /JMomNAIkKEpA==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v2 6/6] platform/x86: asus-armoury: add power limits quirk for G533QS
Date: Fri, 16 Oct 2026 14:14:32 +0200
Message-ID: <20261016121432.35071-7-scardracs@disroot.org>
In-Reply-To: <20261016121432.35071-1-scardracs@disroot.org>
References: <20261016121432.35071-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a power limits quirk entry for the ASUS G533QS laptop. The limits
are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 13 changes(+/-)
 1 file changed, 13 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1223,6 +1223,19 @@
 	},
 		{
 			.matches = {
+				DMI_MATCH(DMI_BOARD_NAME, "G533QS"),
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
+		{
+			.matches = {
 				DMI_MATCH(DMI_BOARD_NAME, "G713QR"),
 			},
 			.driver_data = &(struct power_data) {
-- 
2.56.0
