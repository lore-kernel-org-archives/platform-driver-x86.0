Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04A239B4A6;
	Sat, 30 May 2026 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780160906; cv=none; b=kwiwNRVgMTYVTeMNCkLcyEkDfy/HX8Hdt7rFM1Jbf4ICoF7QunlBu//iTWV22JzTuu1ew4zU/FvOtu7t8YYvTqj6XQcTOXKCA6jKNsMClih1yMXX1BF5okUjlFoEB8Uf+xAS+7vTsvxwH1SkC8r0ApVRwCS/OA0wazKvyezpu3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780160906; c=relaxed/simple;
	bh=M8ssyN9mD6lorYGimnlKG2wqW+UTPXpbAoRi43u++w0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WsNpDIsjnDN6ORZslj9F1xOoOgVptzrX46NnUFDWI5DBxtAz2jhDccgjZY1vFafYS5fFxuGb/nu+A9rweQzfP0uweh3xw+GlHbcgONtXQbkU7uRtPQSGDn/TMvQ5yNlLLzTuMRK78EnBY5UKPpULGiCHo3zapitWVh/tf1a5dps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=EVC5kXYX; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="EVC5kXYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780160903; x=1780765703; i=w_armin@gmx.de;
	bh=3FeRx3dxf7O/GClUiYx6fg0+4G3NLV5bY8Sa9qtB4ng=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EVC5kXYXRSspo+dTq+WS3BuT2MW4FsgBQPmm3138sCLHybF1yWAiUDHK4T5Jr44Z
	 AhdKuVhmViWBkTubsG16hyfhXAGz8Oktp712uvzrjjX65fArdnyDrsHV4AX+pp89z
	 Ak0YZgV9U+2axOt68hw6u+YjcoBkebDxAlnXXZzUccGfAAW9eSJeqUtwA4GIiDRJn
	 AUkBJCPlrzKOoAmLoctYw0O9qaGxtconJdCuxD9otgnYY47HJv5YDGcjt8xUMf3Pg
	 73giJPIsofjW7fmoKUucmzK+7QAlnrrF1nEm2qturdGCnWZfwptritKpXrcclRlCA
	 zHURnCW5QYMRUnx2EA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDywu-1wdJKt1P3E-00Gw8C; Sat, 30
 May 2026 19:08:23 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wse@tuxedocomputers.com
Subject: [PATCH 2/7] platform/x86: uniwill-laptop: Handle screen-related events
Date: Sat, 30 May 2026 19:08:08 +0200
Message-Id: <20260530170813.10166-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260530170813.10166-1-W_Armin@gmx.de>
References: <20260530170813.10166-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ba2qRDY1AeNI5pcH+SKV2CQV1x3ChH0DOWZSYU8gRdCyGKXg9be
 dUafvYk3V9FlD2dxovgBNEBhjoTuj1sphDJ+iav2hm3KwTi5v5X2BEO+Fu/rmiHDdBB8q5Q
 KPRlGYuuUdO2Z7tzs8YCY4j86h0q39hJL38w8eX34OrLc1Xvg4E9UqOAquOaZX4KKyPxqim
 lPuCvm6gARVmc4vOWwqZg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TYK/hODzVmo=;eso2D+wlvQcIxFg0sShG7CofSvk
 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
 WsOCV2JWbuNq7NTix8=

The EC will report event 0xCC on some devices when the screen
has been enabled/disabled during resume/suspend. Ignore this
event because it is currently unused by the driver.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 6 ++++++
 drivers/platform/x86/uniwill/uniwill-wmi.h  | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index fd040197b189..b3be2f2dbdd8 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -95,6 +95,9 @@
=20
 #define EC_ADDR_MAIN_FAN_RPM_2		0x0465
=20
+#define EC_ADDR_SCREEN_STATUS		0x0466
+#define SCREEN_SUSPENDED		BIT(6)
+
 #define EC_ADDR_SECOND_FAN_RPM_1	0x046C
=20
 #define EC_ADDR_SECOND_FAN_RPM_2	0x046D
@@ -488,6 +491,9 @@ static const struct key_entry uniwill_keymap[] =3D {
 	/* Reported when the user wants to toggle the benchmark mode status */
 	{ KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN }}=
,
=20
+	/* Reported when the screen is enabled/disabled during resume/suspend */
+	{ KE_IGNORE,	UNIWILL_OSD_SCREEN_STATE_CHANGED,	{ KEY_UNKNOWN }},
+
 	/* Reported when the user wants to toggle the webcam */
 	{ KE_IGNORE,    UNIWILL_OSD_WEBCAM_TOGGLE,              { KEY_UNKNOWN }}=
,
=20
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platform=
/x86/uniwill/uniwill-wmi.h
index fb1910c0f741..b25b2f31211c 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-wmi.h
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
@@ -113,6 +113,8 @@
=20
 #define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE	0xC0
=20
+#define UNIWILL_OSD_SCREEN_STATE_CHANGED	0xCC
+
 #define UNIWILL_OSD_WEBCAM_TOGGLE		0xCF
=20
 #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
=2D-=20
2.39.5

