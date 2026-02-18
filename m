Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ACC28B4FA;
	Wed, 18 Feb 2026 00:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771375888; cv=none; b=S15gsoI1B/EeZSivexP1IXTsvBIv6/05GCFUOrpUJFTyRNcv9SZRR8Zmb4w+rwarynAX2eOEHxtmK51zIi77oyzFirWTyVrgJgEX/QMYKyE5WM+jhaVi06qBrXYQQDZUMYPBGhTokfX2kJMh149GnA8X93f6or3LgAZQA0PMIKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771375888; c=relaxed/simple;
	bh=+CLP//bT+AH46tCUnUadqI6N15SCJ1grf7BOsABPDok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pQVhbS9WzwZDREpoHG+odLTHn7Bx3qKFabNMYfPrYHo3DopACFx35loSdnH7ycy5omFNqjB4bb3b0hpXZpbzNBnQk36DAYCj3BV182V83GDdieKDtXaXPMmFJyaEkJLVPsgfxzyAqe2G2uRs20NhfLHRYzMK509E3lu7+QWaI0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Ra9BA+6P; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Ra9BA+6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1771375879; x=1771980679; i=w_armin@gmx.de;
	bh=0acc3pYpB5cwEVuVwC8fACmKpCFsOSw/Q6adFRZS4sY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ra9BA+6PRbFO2dye6nWKsJ7QT4eIoGr9nSMR8AQjJJ1IKnOV0aTyExFjcR6mHJq7
	 4a1Os2CQQTxTEbAaEWkVPlKobBpJ8ABCiLeltHfIl4TQdXV5lxSXaVlkTF0Lk6efE
	 PQxFZvx75r2nzhm+qFEMnRqm92RlKpmcFEVwTEvHqfUg/85mFaXjpugf5eVil2wj/
	 pExwqKlkIkagZw6qrHymUeslSLfe9unhg3EQRBA5Rp1+/KjZIBPyvseNA3cVqRFka
	 SNgNHBjK0sTT2xmit66TngFr/D+hrNC5J0GkNbQF/coAD6xN114BpsRRt7Jtt2bsW
	 1zXDkEhwzcGdRUmH1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MhU9j-1vFLU52H9n-00eChx; Wed, 18 Feb 2026 01:51:18 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] platform/x86: uniwill-laptop: Handle FN lock event
Date: Wed, 18 Feb 2026 01:51:01 +0100
Message-Id: <20260218005101.73680-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260218005101.73680-1-W_Armin@gmx.de>
References: <20260218005101.73680-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QbRL43xLXd/29G2YLCmnvM0dNSu3RVCos0h0wwMeSLL1yObMFSk
 ADM1vpvR6DSj1SdaoaWwjjWhprphaipQbJicodD2CZWbdS2n7p4WfT3gbMYCgXACt4ZX6P3
 Br3o5hs3Tj65dvWXBhqG3ZCFHr4Se0nPi0bHnCfwiES0t+YlpbjSzGrgpke8ll4tCiw6qK6
 l3cOjNZpDWH3XDW/xMJ4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vp2g2Fag7WY=;NzBt/W7g9yL0GDNdNYxgl2nBE4K
 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
 wbQ5wZkE=

On many devices, the user can toggle the Fn lock state by
pressing Fn + Esc. Forward the associated event to the fn_lock
sysfs attribute as a poll notification.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 29daf83c0b26..8f214489e9ed 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -406,9 +406,6 @@ static const struct key_entry uniwill_keymap[] =3D {
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
@@ -1376,6 +1373,13 @@ static int uniwill_notifier_call(struct notifier_bl=
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

