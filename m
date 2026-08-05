Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0486842122F
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 10:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927401; cv=none; b=Tp7wQulbw7iEace4kTdDr2gLj8nMUFP3twmJK89vZyDrZ2gvmtPeCQ93t7Oxz6LkeMpiyw4PyQtnWI1/Y/EuR3SZWXGYF/e6SJbb+xxCILreeHG6yubJfWeADWO9CBMbSh8fJcau/txmArw5q+6QVFeRvdBRh+sjyb7Zir2E5yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927401; c=relaxed/simple;
	bh=WBo3GXmmV+sxx/2QRXmQf1IC4WS+wtFEg789+k4eKUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ElifuHGdsrQkUitCkdD27KVNFonyXQSFcDNAg3890OtonIaSP81SbMyYHMR2hg3+x929AUdHFxbOalP1hf8x+1J2wNE6yauhvXEO8pLDtB1AXCh3i05csL4i1aHaGsWMshrnwBSD8Eys3VtP1AwyjHAfybOibziXJ88E/Rjm57A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t69.dev; spf=pass smtp.mailfrom=t69.dev; dkim=pass (2048-bit key) header.d=t69.dev header.i=@t69.dev header.b=PboFhApc; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t69.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t69.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=t69.dev header.i=@t69.dev header.b="PboFhApc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t69.dev;
	s=protonmail; t=1785927395; x=1786186595;
	bh=lq4yxMMtcRaIbXDD2rWr7dD7ti4OuCRuJFl3ekZFoGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PboFhApc5r3qpMjszCaZZFyvbaDi5PZWYzmK5NMb8VR8+8YXqzmRWOpheY2yaPHIv
	 b5ExpjQJyyrPkdSU6iOiiALmcQAatAwbedkGzSNGICmsOHiC19t8/EXbP7qs21IaRS
	 +WrFFiZE1VLvs/Ef8Jv89sO/L8JtjSSbCdho6arvgE0TsJlykwEHewebM5YSNC2RYf
	 cUxmEHW+Hn+h4ImlZ2jNCFk1kf0ZtRJUJFavbyG5MwopxWDU+HrTQPnLT9FDntAJ2W
	 ZnC1zy3RN4ys5Gepn7qVyMdwRyb+D/GG7uIvWzxNc48P05CUnDCpFqxXAK53FLm4X9
	 hauIRYebSVBHA==
X-Pm-Submission-Id: 4hFS5X5mL1z1DDWb
From: Tinoy Thomas <yo@t69.dev>
To: platform-driver-x86@vger.kernel.org
Cc: Tinoy Thomas <yo@t69.dev>
Subject: [PATCH] platform/x86: asus-wmi: add tablet-mode switch quirk for ASUS ProArt PX13
Date: Wed,  5 Aug 2026 05:56:18 -0500
Message-ID: <20260805105618.30736-1-yo@t69.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ProArt PX13 (HN7306WV) is a 360-degree convertible. It exposes no
dedicated SW_TABLET_MODE input switch, but the firmware implements the
ASUS WMI lid-flip query (DSTS dev_id 0x00060062): it returns 0x10000
with the lid open and 0x10001 when the screen is folded back, and the
0xfa (NOTIFY_LID_FLIP) WMI event fires on every fold/unfold transition.

Add a DMI quirk selecting the lid-flip dev-id so the driver registers
SW_TABLET_MODE on the "Asus WMI hotkeys" input device and reports the
hinge state, matching the existing UX360 behavior.

Signed-off-by: Tinoy Thomas <yo@t69.dev>
---
 drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

--- a/drivers/platform/x86/asus-nb-wmi.c	2026-08-05 05:28:53.916829859 -0500
+++ b/drivers/platform/x86/asus-nb-wmi.c	2026-08-05 05:28:53.928922114 -0500
@@ -137,6 +137,10 @@
 	.tablet_switch_mode = asus_wmi_lid_flip_devid,
 };
 
+static struct quirk_entry quirk_asus_proart_px13 = {
+	.tablet_switch_mode = asus_wmi_lid_flip_devid,
+};
+
 static struct quirk_entry quirk_asus_tablet_mode = {
 	.wmi_backlight_set_devstate = true,
 	.tablet_switch_mode = asus_wmi_lid_flip_rog_devid,
@@ -562,6 +566,15 @@
 		},
 		.driver_data = &quirk_asus_z13,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUS ProArt PX13",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HN7306WV"),
+		},
+		.driver_data = &quirk_asus_proart_px13,
+	},
 	{},
 };
 
