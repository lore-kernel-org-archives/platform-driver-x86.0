Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36D23C9EE6;
	Thu, 15 Oct 2026 18:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088367; cv=none; b=dnU/PYUSIvrKP/lH+Es3BtRlgJbldKfgFD+/BAj6XKDAc6MdklGuSM1+LPJzUDhsUiRzUcpenm/7kksF2ZtjH3f4A6sibnQhzULIwa2/U0AhrcaeA7htJ7jAemOIhLMy7ff73aJpkrsRBNo/zjvHy3BQLW7b0akscr+BoClhBKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088367; c=relaxed/simple;
	bh=poq0LQiNViTC5y5UGxeZq2Sbe4nlEkxayA4N6PRK834=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G6TMY+0lKJM/tBjjwhtYiB92JRbJmilrCWOAO6KkdignuWtHdvtwgvhWP3ypXKNUYN96pUMQXILaf+FD6XDdd7qtlhu5RZDbZSqF1aOA9yGaZ2XZ7K+d47Ip3L2YhmGeFq9rE4Unv1k/xApZ3GUTKxOPOGdYKF4AXL1+61zawUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Z3ROilVn; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Z3ROilVn"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 42BA180F6A;
	Thu, 15 Oct 2026 20:19:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xvo8cBAVncFV; Thu, 15 Oct 2026 20:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792088360; bh=poq0LQiNViTC5y5UGxeZq2Sbe4nlEkxayA4N6PRK834=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z3ROilVnmVVcNfDzbC1jtq292mY5EpilFqI8casqkwQYIEPNvBHaoaFInyMr4Zz2w
	 ijwlsV19G6Y6vA1Z8ysvR48N/AhOvWSRIfxeENx31KKXhW7n5xsTMxsY60p8uH5QRx
	 s6uLsKifYjaScru5sPSxLnsSJI/l/ziWha/myea+lPALvDksWmrhdetfLLGuFA6DFU
	 1uS/yz5o99zKd9Bdy3y3RJKYuX2mTdEheDvkSjdQsdK2anUN9hoJftCyTX5M+xOygi
	 9wCEDIk4B81FANF0T24gi9x4YaYDI9bmsNqeGoOAor0u8iGHzIxjG6lqoL7INEhpZ5
	 aun8VLV95iB1w==
From: Marco Scardovi <scardracs@disroot.org>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 2/6] platform/x86: asus-armoury: add power limits quirk for FA608PM
Date: Thu, 15 Oct 2026 20:18:46 +0200
Message-ID: <20261015181850.170862-3-scardracs@disroot.org>
In-Reply-To: <20261015181850.170862-1-scardracs@disroot.org>
References: <20261015181850.170862-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add power limits quirk entry for ASUS FA608PM laptop.
The limits are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 29 changes(+/-)
 1 file changed, 29 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -787,6 +787,35 @@
 			},
 		},
 	},
+		{
+			.matches = {
+				DMI_MATCH(DMI_BOARD_NAME, "FA608PM"),
+			},
+			.driver_data = &(struct power_data) {
+				.ac_data = &(struct power_limits) {
+					.nv_dynamic_boost_max = 15,
+					.nv_dynamic_boost_min = 10,
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.ppt_pl1_spl_max = 100,
+					.ppt_pl1_spl_min = 45,
+					.ppt_pl2_sppt_max = 115,
+					.ppt_pl2_sppt_min = 60,
+					.ppt_pl3_fppt_max = 135,
+					.ppt_pl3_fppt_min = 80,
+				},
+				.dc_data = &(struct power_limits) {
+					.nv_temp_target_max = 87,
+					.nv_temp_target_min = 75,
+					.ppt_pl1_spl_max = 68,
+					.ppt_pl1_spl_min = 35,
+					.ppt_pl2_sppt_max = 71,
+					.ppt_pl2_sppt_min = 36,
+					.ppt_pl3_fppt_max = 74,
+					.ppt_pl3_fppt_min = 70,
+				},
+			},
+		},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FA608UM"),
-- 
2.56.0
