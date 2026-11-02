Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.180.73.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640784;
	b=R/pYT7ucYIeEghgkWh343ZIfsIAmCi2dh2zonCjLJ0WtUKew08UuJMVzJMtp+MZVIYHJ
	 g+Ya5o5B1BKqvfmBqnNqTo5nUHX0VPtGXh+OUXl4vICzwf0uDBogaaj3nUFM2mI3J6EXd
	 rwW87WKUYyhSOBcifMuE18XYHT2tfcNd/2Jk4ALB4kaGt0l17CF0a4ie/VZQshNRqj7pV
	 k1Us/WTGvBrbYvQivNm1qVJKm9TBQa/pXXmBNoRX9IS1hk4DvrQyepyDKFcPlK7c+AbMl
	 XpDnc19cjk+Vv3VtlTnApOHdclyBqLMNYaXmXnj6esIFzbh98uSydbFNs6D8iyGCxyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640784;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-PPP-Vhost:
	 X-Virus-Scanned:X-Virus-Status;
	bh=5fML9tUIwgImRKpLe7/6ncWp2skBfOFYI8Flwm2dsaU=;
	b=2eOwxGg6fnwDTYWMX67IXwfDjDwVUkpfU+s/VnTrWbIDyp6yPKH1ve1Bvp7PfCUECTHV
	 O5nJBrQ8taRUNfrBykews1FfyUMJFdM3BKt47Phv2R730qX6rVR4Kh7/X8TculiVTRa8b
	 x1MM6UNZe26sqQiK7duxUEW89cxySKJWHt+FhF07Hu6wGuRxvDZHeJ9lH/uotv0r9YMJq
	 u94QWbPDPCeq7rN4XNL/PPDBGVttA+rimU6w2xnfBodlpL67/96S+o4HZDSoF6jtH7NQk
	 m8Rwd/HbbXnyhjVsb1cwrmmlBgOS7Atmz19k9UgaFjdPEQp0Wb73988IQDwzEs8na1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=ieaOxcRs;
	arc=none smtp.remote-ip=157.180.73.62
Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE864606EEBE;
	Mon,  2 Nov 2026 17:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE864606EEBE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=ieaOxcRs
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id 0795A3ECF0;
	Mon,  2 Nov 2026 17:32:55 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id 191043EBF2;
	Mon,  2 Nov 2026 17:32:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c5:43c3:0:addf:9aff:bff3:4b66])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 06F791FD956;
	Mon,  2 Nov 2026 19:32:52 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793640773;
	bh=5fML9tUIwgImRKpLe7/6ncWp2skBfOFYI8Flwm2dsaU=; h=From:To:Subject;
	b=ieaOxcRs8FDcQUz3cAUXJPg6jlhzv3TpJp4ShTMu8r/mIBgh6EkoU7QqP0zzevtxx
	 p+vuSg31EBI15wWtDUwkOSOfzQXT5UXx2631PDOHOh9UVtQ5OdMkRzuJKMWcckVN0Z
	 xJWwYb/aZhM0CI8XsAvjAhrS1ofEg9VBczE/ek8YGUAqbLE/YXgDlUP+MCD1LA2lOP
	 ahV+f5i9gdVQLiDwnVXGuuWxYmm9ohfcaSlWkrmXAwVFoYPCgm6clh2mpO8OUiM9xQ
	 IJOfQl3679tXZlNYYUH0CPCyo1JPiw3/xYnG3LhkJBrUgsM0I0F2GNdISwmDOLRMjV
	 SD60xmIacx+fg==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:addf:9aff:bff3:4b66) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1 1/3] platform/x86: ayaneo-ec: Add SuiPlay0X1 support
Date: Mon,  2 Nov 2026 18:32:39 +0100
Message-ID: <20261102173241.1212460-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.56.0
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
X-PPP-Message-ID: 
 <179364077349.149100.18163552843400762888@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

The SuiPlay0X1 is an Ayaneo 2S rebrand but with a different BIOS. Match its
system vendor and product name and select quirk_fan to expose fan speed
monitoring and PWM control. It is not clear if it supports charge control,
so we defer that for now as the vendor has not implemented charge control
in their OS yet.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/ayaneo-ec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
index 81dac81262e7..08e679347e9b 100644
--- a/drivers/platform/x86/ayaneo-ec.c
+++ b/drivers/platform/x86/ayaneo-ec.c
@@ -146,6 +146,13 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)&quirk_ayaneo3,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Mysten Labs, Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "SuiPlay0X1"),
+		},
+		.driver_data = (void *)&quirk_fan,
+	},
 	{},
 };
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0


