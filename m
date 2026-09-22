Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328414A012B;
	Tue, 22 Sep 2026 19:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790105898; cv=none; b=Gryjg/EaSvDsokN1Xh4tFnulE0Db4Qjo5EaRLG5w+2EB4X6+2o9GqrcvZE/DiNv6vCORUX0VX4PF+cy5PxGyFMDRxwRacSiBCEz7a6xniMjApbMZWUyRWTxvm1B7ydxuf9w8NTkn9rCF3s1ocemj+QUL/BnWW3SW133GFiXE8Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790105898; c=relaxed/simple;
	bh=3og3JaCcSdik6JmXB0MyEfciJO4/lJBnX9Cf+yIyuvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aTSJmor9CPC3K2tTaaxpAI8RVYfhp00k4EFGU8PgnfgONhPtuvB2iIDT5zvCNS3+CQKRSrBfvZmYkJDBklq3+ghkT4H/LRT3PmoYMDqt7EpfqCLS/BDx61yQQCi2vuUn5t3WmH1aHLy24zyUGV8LV/cd7FDUiw80cKVtqi8viHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KVCZTWBy; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KVCZTWBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790105894; x=1790710694; i=w_armin@gmx.de;
	bh=GFram7GaOn4z2X6Ucvce8Iihdk0IK4EYXufnwpD8VQE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KVCZTWBy0BMJUi5iQ5cgXqnTqnm5myL/VAg/7KtdfE8EbxaI1PBgWhBLZhMjrfj/
	 IvLfwl99FTJZcWUc+slbq7mGIR64AA0twNWVfX9HoDYDo/RgWmxzdV/pohaLNtMhR
	 vjuIxs+tPnMGgmZlj1eC3pTPgMFelmMBbJBl3QfQdj5oEXRPuR+L79NBSiHa6PFzQ
	 YS3/divFi57d2fxNe5vz0wfa9D2EvQaHvQ2sGgrNAHMb10UXh5FRBK3gdMyMY621t
	 uPqX++trYAmhD4HkRt+uhryue5Ha/EwWqEI3efydwa6xx0vZ7JUR3ssRH/zOhnWm6
	 x1p6idJ+x7paYcJNJg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McH9i-1wd3t33Btc-00aVQc; Tue, 22
 Sep 2026 21:38:13 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-wmi-aio: Use named defines for event types
Date: Tue, 22 Sep 2026 21:38:04 +0200
Message-ID: <20260922193809.4801-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Jsad90VGFbPgEv3txL6Td3XKcnNbmiSx/AKoTX6EcIDm48gKOGZ
 00hbAnKuv9GGgHKYTMy+A6yyq4YlfCNq3tmcR5+b53ugPjWpmN21p5u7PJt69331dIw1Jnf
 p2BtjD45pmQFGnxHXZnRxcIyqhcngiy6d5UYM/iUZvHB0hJoPHcLnoHv9undLC3cEvIabAh
 E8P2+53OGds3zukGons0Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/FnaOYXnLpw=;Oo021wn+62/mAOeSN5A5mLw91qA
 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
 4hk3We8nTyLFCx5JlqUDwLYNku/QsmLqs7Q==

There exist two types of events recognized by this driver:
single hotkey events (0x0000) and sequences of hotkey events (0x000F).
Until now both literals are used without a named define, making it
harder to understand their meaning.

Fix this by using named defines for both event types.

Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-aio.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-aio.c b/drivers/platform/x=
86/dell/dell-wmi-aio.c
index 8849ad93480b..42c0032991d2 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-aio.c
+++ b/drivers/platform/x86/dell/dell-wmi-aio.c
@@ -32,10 +32,13 @@ struct dell_wmi_aio_data {
 	struct mutex input_lock;
 };
=20
+/* A hot key was pressed or an event occurred */
+#define DELL_AIO_EVENT_TYPE_SINGLE	0x0000
+/* A sequence of hot keys was pressed */
+#define DELL_AIO_EVENT_TYPE_SEQUENCE	0x000F
+
 struct dell_wmi_event {
 	__le16	length;
-	/* 0x000: A hot key pressed or an event occurred
-	 * 0x00F: A sequence of hot keys are pressed */
 	__le16	type;
 	__le16	event[];
 } __packed;
@@ -68,10 +71,14 @@ static bool dell_wmi_aio_event_check(const struct wmi_=
buffer *buffer)
 	event =3D buffer->data;
 	length =3D le16_to_cpu(event->length);
 	type =3D le16_to_cpu(event->type);
-	if ((type =3D=3D 0 || type =3D=3D 0xf) && length >=3D 2)
-		return true;
=20
-	return false;
+	if (type !=3D DELL_AIO_EVENT_TYPE_SINGLE && type !=3D DELL_AIO_EVENT_TYP=
E_SEQUENCE)
+		return false;
+
+	if (length < 2)
+		return false;
+
+	return true;
 }
=20
 static void dell_wmi_aio_notify(struct wmi_device *wdev, const struct wmi=
_buffer *data)
=2D-=20
2.55.0

