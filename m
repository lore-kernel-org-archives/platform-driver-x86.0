Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792566639;
	b=nYYh8NzXTLV2vCsTIYa4a+iCiWofWROHQkvX8yPVoctI3riaIRSCWTdfzjX1fmQ6yjQd
	 qH4Ws/UVG5/LMpdGjxzRbzVLR9xKcoeZ5O9SMYRjWitI0nwZ4LVs2Xprf23Nw9+r8ZPd/
	 Pu5zARnJjTTBbURQypZfx+UB0JHR6RwVfW6K0JGHhI7uhQ6X7pMZVebzGfmAs5mvfwNFs
	 OUH8NSVCOoIP0isH7J0RWtZUnynxny9fzWIzN3BdG4BzPO+HlKe6ZizbEcMEIqhs83vH8
	 N5vid4u/bx+6P6RxPDz5/ayG3BWayRGRLuwDSpco8+pWjFmdhs8HW5BUg6UZtQWhiCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566639;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bXQ9bHeZhIZOBzDhGR77Fz4SPcyaYiMFmA48iVikfB8=;
	b=uEuiJgpirK1x6OAanGXmUOC3nEoLkAkdaRFx4FbDzI1m+yNBWoaW3kpLggHJEsOSr8MY
	 8Qz4Zfzz779ujHlAUv12bS9R64evl4Ama3xWcvJpzRlOUebgMBZ7UiE/MExL7H0qeuFsi
	 8rxCVi2apTX9koMQ1KGq4JnUG/ayE8ksTAwN9L9jPISwAts3xH2dEcRVZo1ALybJTUDmw
	 piqzOccEasnsnZYpFo9y4F5tvB1DaSJHVIbhpZTkBEnU/hsupdMRbcwz8GR/SY/fXdfnX
	 puPzYideGBycVSXNlXoJ+XDYQLybuM6QfyGP+gwnakRAXWmozKX5/NcdMl2Nhke5h/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b="SIO7wxb/";
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E9A606A31D;
	Wed, 21 Oct 2026 07:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88E9A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=SIO7wxb/
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0DEFB805AE;
	Wed, 21 Oct 2026 09:10:26 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUDsiL4ssVs0; Wed, 21 Oct 2026 09:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792566625; bh=MABOBPsNnP4hd8xBxZONUVT1qEfmSg/ms19RWRb82nk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SIO7wxb/bU1ipxO9d5zz5ICqhRAfbrQ8GgNa7n8iPzAXm81wpqSfjO5rvOTgrNQHe
	 uT/FmVeKQCsW7NzKoBJ5+FuvT+fRX0GiWBFc8B7fD+xF6G2hvAcZXzFL5ZKo+npke+
	 zTRiNZE7cR0TQikE34qd/Sr/VSJ9ieQNit6csOt/wBtcOexVBjodgbiguZXVLjFmup
	 F3zY7UvvVb9CJyQ83Uwm2x0/GnQz+7fvWpepK78OARGQR+qqZeeRX5ad6yyIE8febk
	 phNqvIASKdbHcYf/Xssq2cJQYLqpZfDkSNTf+CEkpFdMDolpXa37nV2z4YWEXh6ceO
	 3KadSbh9aSEBQ==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v4 7/7] platform/x86: asus-armoury: add power limits quirk for GU605CM
Date: Wed, 21 Oct 2026 09:08:19 +0200
Message-ID: <20261021070948.19916-8-scardracs@disroot.org>
In-Reply-To: <20261021070948.19916-1-scardracs@disroot.org>
References: <20261021070948.19916-1-scardracs@disroot.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a power limits quirk entry for the ASUS GU605CM laptop. The limits
are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
 1 file changed, 31 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1731,6 +1731,37 @@
 	},
 	{
 		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GU605CM"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.nv_dynamic_boost_max = 15,
+				.nv_dynamic_boost_min = 5,
+				.nv_temp_target_max = 87,
+				.nv_temp_target_min = 75,
+				.nv_tgp_max = 95,
+				.nv_tgp_min = 55,
+				.ppt_pl1_spl_def = 85,
+				.ppt_pl1_spl_max = 75,
+				.ppt_pl1_spl_min = 45,
+				.ppt_pl2_sppt_def = 110,
+				.ppt_pl2_sppt_max = 95,
+				.ppt_pl2_sppt_min = 56,
+			},
+			.dc_data = &(struct power_limits) {
+				.nv_temp_target_max = 87,
+				.nv_temp_target_min = 75,
+				.ppt_pl1_spl_def = 85,
+				.ppt_pl1_spl_max = 75,
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl2_sppt_def = 110,
+				.ppt_pl2_sppt_max = 95,
+				.ppt_pl2_sppt_min = 32,
+			},
+		},
+	},
+	{
+		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GU605CP"),
 		},
 		.driver_data = &(struct power_data) {
-- 
2.56.0
