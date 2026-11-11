Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.90.84.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402803;
	b=P7PlAKZ3LcAanjgsZ5FFLpsZD+bmSSfX50cfCrlrsEwJgjOOcIMqd8qZfjui19s1QYuB
	 eq+bGwdVVVYWSwbkdVRNbM0rmkEvjiDIpCP2fZYC0e8Up08hRAEw6ucB8KS8u22Hqn3fX
	 gMATFzrTJz5qSF8LT2VZCFdMLvE9OZBN3KbRMFqztaCpwHK3WULU1KAYDihbG3E1KIVFw
	 jbAawRUbKmoJxdbUlXlaHe6/rxBIvHQ7dA9r0vtE30Xs2cRKfBAzJbBjQwrXuT3LjxNzG
	 ib5JEkzfaso2xQiiWmV3l14uThe8tnIQQXlxZ/MHgQKuphlsTUH+8fJ3xhn3JpHWrIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402803;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6IoNWvV5+bVMo3ahE4ClnQITD/NsY9lAdzPkvSmSQkg=;
	b=Y5MhSgXXbj8TFgou8aT+woPmmEJPPmTTfdqPdRjNSH3cr182YuGOd8UKf9tfASugluXw
	 ff9A+v54txNKVW4NN62L5uqgDZ3J+AUG6SZ7mqCKW6UEmIEn+Vz/Euu+mSsQWkrBf9lU5
	 w80M9Fa/wnLpFJScx+QvuLzplIIStDVcRVppc7eGuIR498f+BQbfbO2DOM+7v7L9Z3TWe
	 7uaOdADxFqNTiMIrlTOjpmN/n15waB3bjlRPzssS0WZ7Tmtw5WmS2zXTydPWJvt4NvO94
	 MFhglsLzNvlpyvZ4Zik8jyN7eM0DmpLcXUazSyAGubuUsfYeCW5QSwVE2rCB68ND9pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuxedocomputers.com;
	spf=pass smtp.mailfrom=tuxedocomputers.com;
	dkim=pass header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=kXRoZAkT;
	arc=none smtp.remote-ip=157.90.84.7
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C89606A31C;
	Wed, 11 Nov 2026 13:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=kXRoZAkT
Received: from wsembach-tuxedo.fritz.box (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id E75F32FC007F;
	Wed, 11 Nov 2026 14:13:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1794402799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6IoNWvV5+bVMo3ahE4ClnQITD/NsY9lAdzPkvSmSQkg=;
	b=kXRoZAkTQRvKb1QOCCSSNrz7Wj6rmwWG7iWkaCKvj1I7+gwgYgfuxwot+4ju6XXX3L8rbp
	KvhClRjBzeuOGK4ul7NXRQHnf2lZIPXWposXPITL3DgjaY4dlc587CDz2AeX1tbCqsqpHl
	pZ1UJJpkOtOkBaa02RUIgvDJbicCJdE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: uniwill-laptop: Add TUXEDO Stellaris 16 - Gen8 - Intel
Date: Wed, 11 Nov 2026 14:06:23 +0100
Message-ID: <20261111131316.504815-1-wse@tuxedocomputers.com>
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

This commit adds 2 new entries for new boardnames. It can reuses an
existing device descriptor because the TUXEDO Stellaris 16 - Gen8 - Intel
has the same featureset as its predecessor.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
This commit was built on top of Armins latest series:
https://lore.kernel.org/all/20261110165318.631010-1-W_Armin@gmx.de/

V2: Better changelog

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

