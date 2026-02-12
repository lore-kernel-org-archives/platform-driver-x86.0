Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A23C26E708;
	Thu, 12 Feb 2026 17:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770918250; cv=none; b=WDTgCV5Al++WJWCYrMcuf/ADA1HWeGBaIhjscT1oNGvygTQ4aqBudE9RtmirFQ1Nm3bT/8aDWw7MoVr0Oq8K5y1ZlRoeNDe+iM67La4wZk9/N1aESy+ihZecYWd/FRskzwwK4Cp6aHJw+JSMw83p0B9jw61La2jovPOcHVq4Q44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770918250; c=relaxed/simple;
	bh=+CLP//bT+AH46tCUnUadqI6N15SCJ1grf7BOsABPDok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SrxXT/qyMI12el0jW+UVl8GewaiApA/3OCY2UB9JTq9ednet/vptkM7ACelAAqX7PINIK/SvOpMg5knjS5R/7X/AxgMCF0Nteg48MkCjtH3NYNonOGa+6sD0pIcX109YNpxRN/Ea0Js0OgjTINQ9dSlEPt/arOZeC50GF/+VGwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ppKipWxn; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ppKipWxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770918247; x=1771523047; i=w_armin@gmx.de;
	bh=0acc3pYpB5cwEVuVwC8fACmKpCFsOSw/Q6adFRZS4sY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ppKipWxnFA5VQ5/uICKXnf5KZtBEztupuMjTlHosxjkNDzMTV9T9Nl67iC54hVn7
	 lEJ7kPSJQiiR0PR8Cx032nZqGuBuBmatxFbAoIhYX5xyssMZ6CzHreFO8pSIC1eJz
	 ZDkRwwd9CRjqJwASjzAszkHyh7/sqGhME2fnxNA81fJcZxY5QJbw93x5DgIh8qL6i
	 FE3b5X3a7pvM0ckhgi+gX3OkC06hKY21VpQhhGFwFyVgnhyuFDFLTWfBLH6u1ejpo
	 APSugapL9b4Z44MnWuCx88D/4ho434ZqUH9sbZXmlYbTLWh/W8pni173EPTLmdLS0
	 UUnXn7RXRkN3jxgHVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M2wGi-1vnIwl0JJc-007STH; Thu, 12 Feb 2026 18:44:07 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] platform/x86: uniwill-laptop: Handle FN lock event
Date: Thu, 12 Feb 2026 18:43:54 +0100
Message-Id: <20260212174355.23965-5-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:YxOnShNSTV9n8+T7FKr5DLDdj7l8om07HtKU8q+eaXpFijzTqhY
 iiHuH/vzOMqwAInetApp/xC5Uq2DJhWeRbH1xkx8qmMu1qf3wQQABrTroyHdePFZHTUWh2L
 ne5Yk7eyCnUVaVeVTSZJc8L03WbPtCr7i5dBRDF8BR+XB7CJWdK5yoVUX9JXGKdLufGgT/f
 JGLTCRIdcs4qH0ze/rMoQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/wYKPN9IGNQ=;pi92StxPFSmbgF4CqzYh6L3Jv/I
 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
 /N34KuQ1nNZ0ZHl4TkrIsOAJ7hoGY

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

