Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FCB4B0E3F;
	Fri, 16 Oct 2026 13:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155851; cv=none; b=le1rM7CjE2N3C2gseExboCQIZ70yXX2qTrOfYJlvATNFbAlsAHtOIZPDh7aeAK4Eu8lajuEm/S2O+aDKY/srBqc89YMGVFNO0OTjD1yyuJqtOMXNUYHJGYHfR31gqIujzc3GJdXpV9yY5zSNfjFo+pyBghLwpVc45MyxNE60qMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155851; c=relaxed/simple;
	bh=a2Tz6GWkVodNRbLiH6mIWaaxf/2de/eksL13lTdLNaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMaslDv0HWtWGnFnXYo+em9tvyQoWtQbe9w4YkFz9CQVCHeuXe8Jgr1TGMvBTGGqpcK4qywep3/sc9rkjAkdL5U25xjwcQ3l0zCB+evO3eMWWkZAaBlb8Na2MU2158F1PKzJFhA9HGjs7J8vszOopnA5W5vQyr6NHvZFdIqIRtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Tz2L68//; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Tz2L68//"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 814F582BA8;
	Fri, 16 Oct 2026 15:04:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GzNgFT6sHPnY; Fri, 16 Oct 2026 15:04:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792155843; bh=a2Tz6GWkVodNRbLiH6mIWaaxf/2de/eksL13lTdLNaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tz2L68//IvTrfeVKbQ89SBtiEP4uFx+XPLsHt27+fDOq4KpuFW4W2KeMUWeuPenzc
	 0rP5ud+Bo4y/nPUFLZ5LKMS7v3NPOdu1mnhQk2bO1YTh9M3mDjwiGJtPmXAnxp+Qiv
	 Nd/60YmYf66nw6YeuRY3S8JuKnNjhvfUCssU07X8GuODiJl7vPexDthYWtcuEeG29u
	 sfjplbcQYTWsmKEdDhhbAF/9ahOhqNynoUqQPA+fV4PJ7aFGK1PX8VMlU1E0Rv4RZH
	 uJPNNJHtB/rJ0vNwmrR/gs3blr8gAjNWSfeYrR9lciGI3r1WFkWtSyCD5+OpejosdN
	 0cuxWKKNbJ9uA==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v3 6/6] platform/x86: asus-armoury: add power limits quirk for G533QS
Date: Fri, 16 Oct 2026 15:03:42 +0200
Message-ID: <20261016130342.69923-7-scardracs@disroot.org>
In-Reply-To: <20261016130342.69923-1-scardracs@disroot.org>
References: <20261016130342.69923-1-scardracs@disroot.org>
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
@@ -1229,6 +1229,19 @@
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
