Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519A83BB690;
	Wed,  8 Jul 2026 19:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540572; cv=none; b=XLStTxIRKY6gzvMBH8/em8K793zpqxdoTQy3+Wy0s7Z0zPf61oUHLCbiFcE+Qgv7ZJ+uEBRZwxpSOTADqDqgMSAVGWUdk14eoMTwQQA4WB2Qs3treIOaOSezPs1Jbt9wpX4/QEY9s7BlXf/60N8ubMvF/dIkkjQJ3ZuPEd3NSPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540572; c=relaxed/simple;
	bh=5GIwHLNlrNHsMDCP0oSmynL1nnIXOJj3Er4B6gJ1GSs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UIJNjPvku8diAcrq2GYBQ/cmd99XgLNJxHa0IM87WapV4BYCFGP+norQ+g02yTGDuPv/00sDeiFJE1mAfpQX0KWp3lNbgzmAsuWMsZzakxScOyw+/dPDz2Ojg9nJFhCkCV9jxiWsYsMahq7D9GEM4f4Cs1aDmkx5ejRB/lJvMqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qGqCvPNe; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qGqCvPNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783540564; x=1784145364; i=w_armin@gmx.de;
	bh=z0R4jIew6nTKXzCb/V9V3s7tnaC63QoNHA6L4t/wPTo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qGqCvPNeOu6acQqbTnmb/LRV2rB1ZmaA7xFxJYtY/rMVzVP9W8AgNnEEhlbtrnyg
	 CY8rog9bZCPgPbAjey50GNRQLPTmiA1HvKbUqOcpFtir2Mop6/uzvZWJTWjNeiT0L
	 ALN8ZUmHbdU4BF9EhbR2bepS0QLk/24is131q6Pl+YqmGPeS8kvNVf7Mj9hovFPcR
	 g2BoknrYjNmmWeqhcVpFzcZlGTtyvpnlDURK4vJxqQBL+HmKYV+qoRhriuoCOQAbh
	 aW4JjoGOpNdy4oQ5H+jjFWLBKpm2TtiDyhq8BX+7UG2XeUiolQCSpRRSYKVC+ZSt+
	 rQXwf60hSLv3FCn8VQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2wKq-1weFWZ48Kq-004WBJ; Wed, 08
 Jul 2026 21:56:04 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] platform/x86: lg-laptop: Add support for additional events
Date: Wed,  8 Jul 2026 21:55:51 +0200
Message-Id: <20260708195553.7762-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260708195553.7762-1-W_Armin@gmx.de>
References: <20260708195553.7762-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D2v4BDl01HhXHCafAdblIzz4sydlslVFM8WUDBsIBPCNNeniHva
 EZfX08nR8o/iTTqOnVaskujt2aWwlsD2rPghVAFAldwrEHtIiMxghqyfH4fZIxLMmxyFA1A
 RIqOURE6PI6y0q/iaQmKmdQ8ZDXSlBbH5f+VHdcYSKq3BExcTq6UarkPYaQxfkHC84a2Zha
 J4hNoBzHXE6ceJK6wXvnA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+MQ1opsC2eQ=;PXS2664eHiJwDvBgFiLvoIhiTmh
 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

Newer devices support a number of additional events:
- 0x0: Placeholder event
- 0x78: Mute audio
- 0xf070002: Open settings
- 0x30010000/0x30010001: Hotkey combination pressed/released
- 0x40020000: Disable camera
- 0x40020001: Mute microphone
- 0x40030001: Fn-lock

Map those events onto appropriate key codes.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/lg-laptop.c | 33 +++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-la=
ptop.c
index 9ba1e872b6fe..9350418c50af 100644
=2D-- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -98,13 +98,32 @@ static struct led_classdev kbd_backlight;
 static enum led_brightness get_kbd_backlight_level(struct device *dev);
=20
 static const struct key_entry wmi_keymap[] =3D {
-	{KE_KEY, 0x70, {KEY_F15} },	 /* LG control panel (F1) */
-	{KE_KEY, 0x74, {KEY_F21} },	 /* Touchpad toggle (F5) */
-	{KE_KEY, 0xf020000, {KEY_F14} }, /* Read mode (F9) */
-	{KE_KEY, 0x10000000, {KEY_F16} },/* Keyboard backlight (F8) - pressing
-					  * this key both sends an event and
-					  * changes backlight level.
-					  */
+	/* Placeholder value send by multiple hotkeys handled by ACPI */
+	{ KE_IGNORE,	0x0,		{ KEY_UNKNOWN }},
+	/* LG control panel */
+	{ KE_KEY,	0x70,		{ KEY_F15 }},
+	/* Touchpad toggle */
+	{ KE_KEY,	0x74,		{ KEY_F21 }},
+	/* Mute Audio, already handled by ACPI */
+	{ KE_IGNORE,	0x78,		{ KEY_MUTE }},
+	/* Read mode */
+	{ KE_KEY,	0xf020000,	{ KEY_F14 }},
+	/* Open settings */
+	{ KE_KEY,	0xf070002,	{ KEY_CONFIG }},
+	/* Keyboard backlight - pressing this key both sends an event and change=
s backlight level */
+	{ KE_KEY,	0x10000000,	{ KEY_F16 }},
+	/* Hotkey combination pressed */
+	{ KE_IGNORE,	0x30010000,	{ KEY_UNKNOWN }},
+	/* Hotkey combination released */
+	{ KE_IGNORE,	0x30010001,	{ KEY_UNKNOWN }},
+	/* Change fan mode */
+	{ KE_KEY,	0x30010051,	{ KEY_PERFORMANCE }},
+	/* Disable camera */
+	{ KE_KEY,	0x40020000,	{ KEY_CAMERA_ACCESS_TOGGLE }},
+	/* Mute microphone */
+	{ KE_KEY,	0x40020001,	{ KEY_MICMUTE }},
+	/* Fn-Lock */
+	{ KE_KEY,	0x40030001,	{ KEY_FN_ESC }},
 	{KE_END, 0}
 };
=20
=2D-=20
2.39.5

