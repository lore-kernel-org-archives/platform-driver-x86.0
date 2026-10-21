Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792566633;
	b=oIq+ORgHnxu+skqMT+8VQhtsq7S6PFoRyObBYsQ/48Z/pVQRUXfUSXPfaxI7uwpgo5tQ
	 3re7W4TBAZIZxRnqHIJxClELONDfhN4nSisrSsepcZPZVWDpSB6OXio+pPWxxNyOtqret
	 67QKGw6B+RIvlUKJUGfRobXYMjZ2wqde+p4ZtkAlY+bH5qJHFl091LlJwnQaJtvGzYNIf
	 DIxVfTiIYIxaIgptfiolq1Qa7dG3maA65NwJUQBRrandNvCNQ8jP1VBKbVW/4MdxdVbKb
	 PspCxyHQ7plt1BuyiVtRp6EsyYAliu5YwohCAow+yK6xzBbWY7E9TDLnn3apsAzzIOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566633;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p+y4touULggKGF4W7cSl1bvIkpo5vuKH1xXIAx2R4uU=;
	b=tKtcE5ZThopyF5RPUkqv9XkgE2Rb6VxUGee0daHnu27I0d/bH4p6ejvTqkqmVQSGc8Z2
	 Izae258PRTV54s2acq2BHyBOzT2c+VJYlPcq9R3S5q4DjvirdlL5HImVQ5WAeuB6mK9HU
	 WREYGRk5Qf1Z2h8PoGfZZafb1p4Y4UOIu6ciZB4Tya2xBJzEexVbBzgkxTlhfLNQqeAFD
	 DjjJRMa5UevYu46ZrrC45HMzPC5u1bctBlPQyrtPhDk9aj4W+8Pkw97c7MO8tuMIGfray
	 kb9ud4rTf8NUMM0/8Q2QpC9rVs+e/KeGNHHzBfqkVSeuDsptZ6dj8frIs5uu3CetKHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=VrsdOihl;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D85B606A31C;
	Wed, 21 Oct 2026 07:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D85B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=VrsdOihl
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0DB9C81087;
	Wed, 21 Oct 2026 09:10:25 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3OAe3VBjoCB; Wed, 21 Oct 2026 09:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792566624; bh=3z8xQbXYWpbTAzqG97bVJbM2Ya0vtJo5HsDWyCMnUVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VrsdOihlUAUNGTgrJuwwQZwthIdw3uWNZr2GvdxgwJH+h5X9+fevkor/OIlfHUeex
	 R6o380L5iLuvT5Sg0Khm/fKLBCf+ZWoo5PiCSRJXTVQwaMZJaOdPUnhAGtLeqvJF9Q
	 0M5u3ZH/ofabyCILwQUJADlpceKcZG3X4zP/KyMEwDxA7Lp2qG5gvzp4mMHyPHx2XI
	 BT5qM2lo71sFaG+uZjJsbyw0CwLoQL/JvCiI8AoiOaqpSuQASs+RIdLp/Dl+SapLt2
	 aJKbLZULDMDZxLnysYDDb1xkbfwrCKBh2+ewymoXxi/2heNizqxUv8qQEkZIVs9g8z
	 BT4OztFsWd4+w==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v4 5/7] platform/x86: asus-armoury: add power limits quirk for GA402NV
Date: Wed, 21 Oct 2026 09:08:17 +0200
Message-ID: <20261021070948.19916-6-scardracs@disroot.org>
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

Add a power limits quirk entry for the ASUS GA402NV laptop. The limits
are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
 1 file changed, 31 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1302,6 +1302,37 @@
 	},
 	{
 		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA402NV"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.nv_dynamic_boost_max = 25,
+				.nv_dynamic_boost_min = 5,
+				.nv_temp_target_max = 87,
+				.nv_temp_target_min = 75,
+				.ppt_pl1_spl_def = 35,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl2_sppt_def = 65,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl3_fppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+			},
+			.dc_data = &(struct power_limits) {
+				.nv_temp_target_max = 87,
+				.nv_temp_target_min = 75,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl2_sppt_max = 35,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl3_fppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
+			},
+		},
+	},
+	{
+		.matches = {
 			// This model is full AMD. No Nvidia dGPU.
 			DMI_MATCH(DMI_BOARD_NAME, "GA402R"),
 		},
-- 
2.56.0
