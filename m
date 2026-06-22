Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D644349CCD;
	Mon, 22 Jun 2026 19:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157175; cv=none; b=mPgGkonKhv7fTr+BaclG/v8B59AGndJgzESqJOTQdTagZfct8IGk9x0t6IeAMxJj0sx3j4SxNDsv7Xoq+OMGLqYZn1OT97cr5KESNcmS//ay3P/118tih6WgjfVpmT4Gsi5IvxAXqqWc0oX6TR8TJo0LytfW8lQnGLlu9f18htM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157175; c=relaxed/simple;
	bh=6rCp/m6soUY/+0n/aDQOjwsVnZHnh0tZI5Vk3IBC7BA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n3jtrruTvI2fXStjTIzltHu4MWrd/p1BFmYRzWs+72N3+gXQziM8Lh/kQVYBpagNBG5yAHK8ZvPuK3Md10nv4MRdbm1ZtJSqoEIMKRQc/9IKvyN/zJGbAKVXG2C4vTiR87sa+lphmMBWMYivkO17vM7OM0uDo+iwTY49+Q0KTHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=RUESE/WB; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="RUESE/WB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782157171; x=1782761971; i=w_armin@gmx.de;
	bh=pyeh/an0YAEF+dQvnkrO8++/Ul3a+o/E4nJXj8PrQOA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RUESE/WB+F/Bpg60FCNcKcnUltbqA7DWbnYoT38q/e56U9t0KtreuZhkruzX0Mxk
	 6ADGX56iAoxmrmM+bA84mb6O0RGSeYaRcHvPjOhKw+sk2FPJaJK49CNSkvICM04no
	 OfDxU4DsyJHNfgQtoacTqB1SmkA63w2CqfvWtxArUewBpRB9US3hjDlT0qraWDnR5
	 d9uwMz4jey5JhH8VoXTVxsWHXj/bNFJXhVdNs8TVI7SJFKo43r4/gSj7eZETxJ62x
	 XZJ+rgpAydWWmPfSKRp7R+JIaIWrJ7mR2xXu/UMqKbJSWDKGz8ye0j4xI/C5oZKuL
	 /jd990m/6GeerKM0+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPGW7-1wne2Q10xR-00MVwC; Mon, 22
 Jun 2026 21:39:31 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] platform/x86: lg-laptop: Add support for additional events
Date: Mon, 22 Jun 2026 21:39:12 +0200
Message-Id: <20260622193914.116999-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260622193914.116999-1-W_Armin@gmx.de>
References: <20260622193914.116999-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xowVPBlMjWP0N9QGKvqQIqWD2cVKfQDSdNebf+P51LmUCvbSfuT
 jXv22YDwNBDQDx8dNS34EOxot6teou36Y9UNTBl/PlnzvnyG7Ef6vWNdVUxSNbMCURWwFUX
 XtQ+I1f0KwTyGsktlqX1JGpFna5PX6Vo9sysBu5/a6YEOwN2sX4dmCgp8Lp5h/4CR8Mjwmm
 jLUmqVLHIVW8BRVn062CA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+e7q/OtLVRk=;7Gy0vw62nAlLsj8L4LM9FxG30eQ
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
index ead0c3cc74a8..c8e45e8b9d74 100644
=2D-- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -96,13 +96,32 @@ static struct led_classdev kbd_backlight;
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

