Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.90.84.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398316;
	b=o/r1ic9L4PM8xdUXwDSuLOdLx0uxx7JiPmWQ5t0DV0rvwU98rs7iWazZk1LEYLc0E8iG
	 NN17Hk/swZ7p8nqPMgntBiCiWtFPXRh+cq0p189T7XGVZA0uB0o/GGfgUIMmBo2GRVRzw
	 zbZ00t+sfRP0Z45WSAQkv2KZQuGqbxMEy8lnuDikDrPpUgPj9IflCge6JgUdhTIvbsiBy
	 JVoWcSjXqpOazSqTX0vbgV5Gb7jglzlLtFjMU8/nwRKiv6WiOSlSw1+csiHF63HubVMsv
	 si0i5FNXMS2SdUFPVfAf1plnRiyNWOPfeVqDXJy4Fu8sE9zBSd6jPC35oXn4sM1qw7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398316;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vRBWdWXdm4oQhc8NWMSHeqzsieYDX4JsnRhEavbz4WA=;
	b=mHT6ii17HYUNHNmIk2DkFkvUhJIvmSSKJo2lBAlX01QznOF3EqixvTcVepHZkrTTnzbQ
	 s9E8vS65tMh8kvbJcwfMG5r/NsOCvto62jx6g0EPvIh2V5UoMWsbgehS7q5Or3LD8STh0
	 VRYtRSutwPD+ChO0mVsDg8XF/qp1xC2HlfDFG6++3aFkte1mLWLul/6ck7e4bCowwbDld
	 l6eiSwbjdFrvep38s6c7HvIy3LD3txVEE7JcAvB8gJNpX0rPxgyiqIVwjN4S39u+48fdW
	 UnCs+Z0VAHBKBH/3DSFuJl8wPkgsxflxXpDWyDU+6ijLNy1AceCp+O32O0004CfjlWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuxedocomputers.com;
	spf=pass smtp.mailfrom=tuxedocomputers.com;
	dkim=pass header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=Q1HtTc4R;
	arc=none smtp.remote-ip=157.90.84.7
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C52606A321;
	Wed, 11 Nov 2026 11:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C52606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=Q1HtTc4R
Received: from wsembach-tuxedo.fritz.box (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 4FF6C2FC007F;
	Wed, 11 Nov 2026 12:58:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1794398307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vRBWdWXdm4oQhc8NWMSHeqzsieYDX4JsnRhEavbz4WA=;
	b=Q1HtTc4Ry9EPFzm8SZkp2vv3UBYKhxh4ZFDOrkvTj0lZ3noH5UaCN+T2rs1OH4gczysJf1
	P9qD32QkAr1Zi9j4bJAWB7QKpTXqh4p9VAQGdpCVwHZ7BWNtMKx4kXrS5QTRpfc8c0d13v
	ixaqZPwn3DWWs0MRlC/c7uV10+ABVrI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: uniwill-laptop: Add TUXEDO Stellaris 16 - Gen8 - Intel
Date: Wed, 11 Nov 2026 12:56:28 +0100
Message-ID: <20261111115811.498955-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
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

Same features as the Gen7. Just 2 new entries for the new boardnames.

I wrote the ident the same way the system product dmi string is written,
which itself now follows how the device is listed in your online shop. The
only actual change was adding the '-' with spaces around.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
This commit was built on top of Armins latest series:
https://lore.kernel.org/all/20261110165318.631010-1-W_Armin@gmx.de/

 drivers/platform/x86/uniwill/uniwill-acpi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index dc99bf8a8568c..e2a6a704e942e 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -3629,6 +3629,22 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
 	},
+	{
+		.ident = "TUXEDO Stellaris 16 - Gen8 - Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAF5xxx"),
+		},
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
+	},
+	{
+		.ident = "TUXEDO Stellaris 16 - Gen8 - Intel",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAF5xxx_mLED"),
+		},
+		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
+	},
 	{
 		.ident = "TUXEDO Book BA15 Gen10 AMD",
 		.matches = {
-- 
2.43.0

