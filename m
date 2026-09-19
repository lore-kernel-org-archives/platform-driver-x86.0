Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459D52C17A3;
	Sat, 19 Sep 2026 05:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795836; cv=none; b=EwCzKXIEdyA3d7wSeakGerM85m71cwjMbjHVIzbF4xSdp/041P5gth+MYZ4/r9Luw+RVZg96Xaj8Uij8otFQx+w14u8z4lF11mk5wadnFANpoUa7q6qeekLGWeLGPlFAzyEy/oIGoa/1xdtKa6QB0CIaDuAL038sAplFN3bs1sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795836; c=relaxed/simple;
	bh=lQ9yfMA9hP5yHacaffa3wfIJEJ3nqjToWmL/wuSkNVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nS78PPdTvZALc14T9TMwVeOT4lKcqzb3/SSdXPChJ64P4EzzHH0wi8Y4xIP+c5NJoZXUXETIPhyY6WhDFhqWWnvwqhqZIjex3mp3ocvMSWEZPds6du7dAzKVSHRLSUWSSbKLLMV51KqIMi8wHfjxMabndLo0p0o02KghaQrAB8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=NQYUONUc; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="NQYUONUc"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 522728101F;
	Sat, 19 Sep 2026 07:30:33 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1QOLK4OyBea; Sat, 19 Sep 2026 07:30:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1789795832; bh=lQ9yfMA9hP5yHacaffa3wfIJEJ3nqjToWmL/wuSkNVs=;
	h=From:To:Cc:Subject:Date;
	b=NQYUONUcsTKWKoFoKMcyAECNnVq1TCVn+spCjDauzJ5zkp4jp7709hEIAQ7Gjupml
	 25xAXwCMPWDCIwieQyz2leTB+DndBo2JfdIUWEXkHgAHGPtMZFGtY/LMF8kioIPnAw
	 8m9283swCNWZaR9tcUCtIjmZL3ZhYk/j28KRP5KochVUDKloESJqg/eirJRTUoWkZC
	 IkBP2KdeM3al72/uB7CamJAWWFSvXZTzOVF1jzjsUPchq2ESFGU/2b0czu4/3pb05g
	 aWsg4XNPMzs/dwpctZ596BkVXlQumnHZN52cXcfuTcu35Trf/oAoA9nhTY3/J5y2RM
	 0fyVQdVOjcK3Q==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Denis Benato <denis.benato@linux.dev>,
	Luke Jones <luke@ljones.dev>,
	Corentin Chary <corentin.chary@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-armoury: add power limits quirk for G713QR
Date: Sat, 19 Sep 2026 07:30:16 +0200
Message-ID: <20260919053016.24335-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add power limits quirk entry for ASUS G713QR laptop.
The limits are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 13 changes(+/-)
 1 file changed, 13 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1056,6 +1056,19 @@
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
 			DMI_MATCH(DMI_BOARD_NAME, "GA401Q"),
-- 
2.55.0
