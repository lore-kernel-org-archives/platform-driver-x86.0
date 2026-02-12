Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB648277007;
	Thu, 12 Feb 2026 17:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770918253; cv=none; b=WUsLe0U/HTsIWkpdvpMyTLKtoSmavPxlHQLKyE5DEnJAFsl/4XILpuoh8ADQWHRJdBexZCbM2T0h+KeG/9nIgTKGg8yDMGp4qDiYnOiyru3sIefUtbzVbz5I2cnknzlrkAVD+MvNYeZtaVi3ewT2/Z8s3NJsG31rEFIURLSd77c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770918253; c=relaxed/simple;
	bh=zVKaKQSH81vJWOw3IGI7XlFzy9Bu1HYUfBN5cVJRBrs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eVPSfe5r/0CbyvhOC52pld30xaq38aw11TzVqcOjVNrKt9gmm8Ac05I7wpEp/+RYYa9pm+f+RbXzGe0M1SCSiKvw1U31UFIfdsUgNP8n5A18U2cKxHrN1MYiOF4r2nf+qUY/z8KWAf9Vt5NS1CDjr38RMgnRgO/O7BH6BmJPM2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KLF+/U11; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KLF+/U11"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770918249; x=1771523049; i=w_armin@gmx.de;
	bh=Sv6ldGFWGmIy44q/Orc6+U8waHotjQ5RU2OczETEweQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KLF+/U11xt4Nksq0kqdnjF6ZdTEDL5AqbQ8vKPzRqlsETCdgW3DyyswvpQmWQwZs
	 dTWyDihTL7Neasosb71HUd94oXTFCmHx4wvAkmcnaQC6Ni27mtDM4/ZiHWw03Vvti
	 3eQZLchTz0A4plqATZEbznNhWb61WZHDaSHWi7ZZJBgPbMGuWh22OHccfxkFYMER2
	 MYvt/2usiX71qdUjeGhzfIPtUfkIv14HHIi85M697z+K/wlJDzmAY9f5cUa198ZC4
	 5gdiuBeLcAQ+pnTI6PkzwZzBtnql3FwZ4bRX1OMY+fV+OvK9wCt8FG20iOfUtDhyE
	 s3H46cW379iK8QdqOg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M72sJ-1vrPgV3qpD-002FzP; Thu, 12 Feb 2026 18:44:09 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] platform/x86: uniwill-laptop: Handle super key changed event
Date: Thu, 12 Feb 2026 18:43:55 +0100
Message-Id: <20260212174355.23965-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260212174355.23965-1-W_Armin@gmx.de>
References: <20260212174355.23965-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:A6W0g8bVOxxnqsuWRFdPofz/SG6V7VV64aE3DVFkKidjFivohyT
 HwrI/NLXvWbb0tSGChpRX+iEx4REJhwtMX4xEAZDvXOaa+aQOgn5MAuw4KgZKrrjPVLTSul
 aBTSf1cp0CA0AvOKHt5pF79NUJ80V0JjtqLey27s+S6qdRjywQiWQ7DH3C3TjnYZlZIvZIu
 XK9NhSfGWxihSZ93W+grg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A9ptfDGn/Uo=;8N2fEs295YpQrE8dslKrG9xFT71
 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
 IUL7BCY0=

On many devices, the user can enable/disable the super key by
pressing Fn + F9. Forward the associated event to the
super_key_enable sysfs attribute as a poll notification.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 8f214489e9ed..c1478878569b 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -385,8 +385,6 @@ static const struct key_entry uniwill_keymap[] =3D {
 	 */
 	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_DISABLE,		{ KEY_UNKNOWN }},
 	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_ENABLE,		{ KEY_UNKNOWN }},
-	/* Optional, might not be reported by all devices */
-	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_STATE_CHANGED,	{ KEY_UNKNOWN }},
=20
 	/* Reported in manual mode when toggling the airplane mode status */
 	{ KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL }},
@@ -1357,6 +1355,14 @@ static int uniwill_notifier_call(struct notifier_bl=
ock *nb, unsigned long action
 	struct uniwill_battery_entry *entry;
=20
 	switch (action) {
+	case UNIWILL_OSD_SUPER_KEY_STATE_CHANGED:
+		/* Optional, might not be reported by all devices */
+		if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
+			return NOTIFY_DONE;
+
+		sysfs_notify(&data->dev->kobj, NULL, "super_key_enable");
+
+		return NOTIFY_OK;
 	case UNIWILL_OSD_BATTERY_ALERT:
 		if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
 			return NOTIFY_DONE;
=2D-=20
2.39.5

