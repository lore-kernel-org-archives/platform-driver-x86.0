Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341E71C3BFC;
	Fri, 16 Oct 2026 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152921; cv=none; b=CjRoZbhVlmvflO3YpbLZHRpCwdHCeXb5JgTvz3iXY0AIXlVTp0WnlkkmLvFgcUoa891zia/RqVg+jfvQCAKywQanviOnF983A4sjCLLmr4H9AR7wvAkpG6VpAmxliAF3WDY1ZPCEC4xYrzk/J5BhZoVnxgSjKgTTYHYAVEujHgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152921; c=relaxed/simple;
	bh=HLwzPpaL3zTFOuvjZx6YZu2iqk6DnziCs0DOL7ItLSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ba8NF6N6Gvcy5OlD/Z+RI1Rgo4BHi53Pf2e1BHanj6rw4X18gEVOmO6iKGNSl4d9EsUQqWRj+vRLocJ3E151rFNfj296t9AWUEwjAV/9/qtcU/l4kmhcyx75iF/kXrDu51Ygs+eBtlToVE6AKUK0i4RmOR3WzK2KGZMfW6rHXWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IrZkpyZe; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IrZkpyZe"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1969082B97;
	Fri, 16 Oct 2026 14:15:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGBu6Dp7cVtC; Fri, 16 Oct 2026 14:15:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792152912; bh=HLwzPpaL3zTFOuvjZx6YZu2iqk6DnziCs0DOL7ItLSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IrZkpyZesFptld/lempuotj9umOxKSzwl2zbJ9GgakJz/9qFp7eN6qOigkW2oPuK1
	 Kb74IMcYSqSViuytFOaAZ5whzP6OK331w3HzrmlOJ86ckZZH+NKO2vwFeeeDpZBYue
	 VD9+4shjzPkrjIX4KAmgzuFgIGtrafiJv3vC3XGhZVLTDYgWO8l+JXk/+LI3gMnUxX
	 eI1eBZD72VCy2clXctVHvrXPm3K9lzN/3+JCXUcEP/OM9bDI9qLZL63iWJUavPWSt1
	 ETOfpcK8hFKn52arh7+qXmGvHnu7QZyuzU2gLMooE81hWnYh3+vrHpJmPDo0hgkk64
	 +Y3x4NX3WjPTQ==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v2 4/6] platform/x86: asus-armoury: add power limits quirk for FA608UP
Date: Fri, 16 Oct 2026 14:14:30 +0200
Message-ID: <20261016121432.35071-5-scardracs@disroot.org>
In-Reply-To: <20261016121432.35071-1-scardracs@disroot.org>
References: <20261016121432.35071-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a power limits quirk entry for the ASUS FA608UP laptop. The limits
are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
 1 file changed, 31 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -883,6 +883,37 @@
 			},
 		},
 	},
+		{
+			.matches = {
+				DMI_MATCH(DMI_BOARD_NAME, "FA608UP"),
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
 			DMI_MATCH(DMI_BOARD_NAME, "FA608WI"),
-- 
2.56.0
