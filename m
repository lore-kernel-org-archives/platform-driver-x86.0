Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54D532694A;
	Tue, 10 Feb 2026 23:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770766211; cv=none; b=MWvbSGVMyuO776rwJ/EFB1r2PhZlAs8pSRLClISqX2blFzR3Gb+kra+Y1bErnnFNHQJW4GTsWg5zmY6+wEN/BvB+hspXUR2jkk+oqm+4m5wWRp2sGrXLugHafk5E/8uOlI4sQxP8x6mdOnXYbmzmL2H2b0bl+Qs7V2KbQ0PyF/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770766211; c=relaxed/simple;
	bh=TrJHzYjterZ/rudL0a5Cmv/05KwT7f0/ZmjUkzdbZMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GDUykD5hnlmlF2niPo+dtL+Q64KBanC7p4wqLHsLRrSmP+QiJroOBXc9+XorLi16Wj2ABgClHMPHDchjB89TQC0gGu9+4QGZi6ydEhHbmYaBqHkLc2x04XEsNkTItTltbANFZS5l8qi5xs6yuFEfRotq9CcYdCiF51OaPG0uJgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ANB5wyk3; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ANB5wyk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770766203; x=1771371003; i=w_armin@gmx.de;
	bh=vFl5nSVzsFLkWB8ebMtJNw/74UNa322NIlh2BsTfvP8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ANB5wyk3Giupg/gllKXXDLL+kx8j9sYf2SmbX17uS5lBIJuuQTeA2t1DyQ+/C3xT
	 0OGjPt39oXWpSdyD1BpJ8/EBqyXRUzkvjA4o8fQj3PKHlADEBXX8Q2+fYliB3IEA2
	 WL5F5eSpS1CJZrvUqRHfnQQbyVhAGJ+ozMoii+eBp3Q6VFr1YaAPSh0iPGLIikXyS
	 wZaFUjp5dh4deQ9Kc22i+4N366rpDnUvnz1Yj3MX/nStimC+w9aAMIWeL0uU3DnUb
	 hMXQwqXS6HUxOruGFsOAm9DEFfonWlpkdnPRadtbhdHVmTtBBSAyInCXgrrhu3Exu
	 fmPgF1y1XFjbnSeQcw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N49lJ-1vgm781qTJ-015rM2; Wed, 11 Feb 2026 00:30:03 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] platform/x86: uniwill-laptop: Handle FN lock event
Date: Wed, 11 Feb 2026 00:29:45 +0100
Message-Id: <20260210232946.302936-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260210232946.302936-1-W_Armin@gmx.de>
References: <20260210232946.302936-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QzwBVJXIWzJbv/hFJzsMk7BhVDMROgAbcmWfot9ChesmRsgAXHn
 mllQLzlFNj3ohG7aa4FpEMp6pYo2e7XFjvHvRQSh43Ehoa0GttsUm4OLZuQYV92qYe8byFE
 Cx9CQxTmE7CbRxVZF9Z+bWN6kmw7BIU28kGhgxtDwYrpIMZnvVuvCY09o24rNKe3THw9F1h
 lEJciO1PokhojADbWHMTg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rwphQk+3VS8=;TE5ftL4ehEmpTS+TcGITIzfqFUx
 +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
 vTNxmi3M=

On many devices, the user can toggle the Fn lock state by
pressing Fn + Esc. Forward the associated event to the fn_lock
sysfs attribute as a poll notification.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index fa1ffe541983..e162af1d9118 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -402,9 +402,6 @@ static const struct key_entry uniwill_keymap[] =3D {
 	/* Reported when the user wants to toggle the mute status */
 	{ KE_IGNORE,    UNIWILL_OSD_MUTE,                       { KEY_MUTE }},
=20
-	/* Reported when the user locks/unlocks the Fn key */
-	{ KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC }},
-
 	/* Reported when the user wants to toggle the brightness of the keyboard=
 */
 	{ KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             { KEY_KBDILLUMTO=
GGLE }},
 	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL0,              { KEY_KBDILLUMTO=
GGLE }},
@@ -1372,6 +1369,13 @@ static int uniwill_notifier_call(struct notifier_bl=
ock *nb, unsigned long action
 		 * gets implemented.
 		 */
=20
+		return NOTIFY_OK;
+	case UNIWILL_OSD_FN_LOCK:
+		if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
+			return NOTIFY_DONE;
+
+		sysfs_notify(&data->dev->kobj, NULL, "fn_lock");
+
 		return NOTIFY_OK;
 	default:
 		mutex_lock(&data->input_lock);
=2D-=20
2.39.5

