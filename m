Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42E0392811;
	Thu, 15 Oct 2026 18:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088371; cv=none; b=YwmU9+lfwSGNlSNK6l0zJqwQ1/N2pr5UQwnqXC4NkwfrAUZpFO+LH2+C+viSlXBYI3jeq5dQhJsteNs6H4YtXRqc4hm6Y3O9t5YbQMTpOUxiB6KtQA6m/mCfYUQ191JFX912DC5V35vakWtk/nhxcBjoXSGLRjrMpyHjzrUpK4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088371; c=relaxed/simple;
	bh=tuY2wEjeijmGRDVH5GNggr/8Uedsjc4fxfzo6ScV2/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQQI4V5h54lX9kkIzsQ7PDVRL4Xx8G8glMVcEmPHB5SJPETflfj7UDyssD+zXeMStXWwENjSUbDmGWJllY0Cbx0X1NxN+Y5zm/PC1G9ps4u29L7Fl2nBjWMcTCmCdeSWIkjU75iR4Ugu7jy9sm84LoCkbM5IhFVE1sUBM6UjfI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ctn8PW9T; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ctn8PW9T"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A5E9E80E1D;
	Thu, 15 Oct 2026 20:19:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mArAy-gTVJJM; Thu, 15 Oct 2026 20:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792088360; bh=tuY2wEjeijmGRDVH5GNggr/8Uedsjc4fxfzo6ScV2/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ctn8PW9TlDuP3P06iYbs9lXapF7uL1iDO5s8aDvvdVcak9X+wtAVMapC/5nXJsOsr
	 2Bwe+XBrpQnCH/fpHUVfPRECcCxSzHFcDDinONIi4hWqQez34BrdEwKyuNbh8WwL1E
	 byeOYe/RrFzH+8c7L3hWfYSOUEVUejZYj5KKaTYgHr3jYFIEOMcEzoeqG8ww9FMszC
	 1907uY9EEvbg/H0lvCZbGWN0lbQpqlJFYBlsEO31isFGf0dgbGSOPuYavkzVdnyWOo
	 CgwqtfVr/Y3igiAdCWOCl/f99wEXa7YDLZPxKCOLrTTjvkHT4Ul/fymbgfH5TwCDpk
	 McfCiuw70NW6A==
From: Marco Scardovi <scardracs@disroot.org>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 1/6] platform/x86: asus-armoury: add power limits quirk for G713QR
Date: Thu, 15 Oct 2026 20:18:45 +0200
Message-ID: <20261015181850.170862-2-scardracs@disroot.org>
In-Reply-To: <20261015181850.170862-1-scardracs@disroot.org>
References: <20261015181850.170862-1-scardracs@disroot.org>
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
