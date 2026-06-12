Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31858405C49;
	Fri, 12 Jun 2026 17:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285704; cv=none; b=i2QxgAa2mm0HSrmTYphFNUNqUTVs8+w6iIfwQDKFE31btFjyL+tkbHPeu7ZHNc/4YjHt8J4U+5b5N8U3gjTEkIkt9U/zfyuMYa5/ahDJHX1Sdx754rWI63SpWyTzfLjOGWnkRxpj7J4Q3N0Drv9h35EJoEdMCV5GhwdyTpHMtp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285704; c=relaxed/simple;
	bh=28adcfvB65z6b68b7nsJWwpF2wY2mcoTJYdbS0XD698=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dgPzx7bYpu9thyWtB4QGbKpMXLggQsWMmRa/QyZnoex7telp9awidGGUKaRGJvxSMt735gwGRdFqsooSAb4SFNOdvu8pXNTTbXFrVeRahmZASbc1X4/sTVIy16wiRuMInISknhUKmBLvtLQuLuRqthQW1HZTimLCzIgoCgPimOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bxD5O5oo; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bxD5O5oo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781285696; x=1781890496; i=w_armin@gmx.de;
	bh=ebA1pv4QefLJduzPeCALp0orFY+fLNuh0mk65uSOji0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bxD5O5ooK+xS9+gPqQmBP5j3WfHajfo8BWAR4/V7UWj2Dpjceo5W8liY8GbQ6nZ7
	 EBZRR50/8NThnCSurjF5VNBqocvAj9rGjfmotYY3emb+MmJpeBomMuVER5C32Lkdk
	 x0/hkqVWQTKakYJMLuCHllYp/i1sMZr/VHkSGF1dCUsO4+yfzMQ54wTu+TJO8DLhb
	 Y5HbPHT6nrB6oyk1vfbdNwiaL/XrX1tgGQ3/RO2ojQttD7/Q1uab4IWIAPQ6L5Plu
	 4LaXvNU9mWeYNOtpCu78eNaP9fNf7pi4JPEw8le9bmwXCzMF/nhXM7L/U69G3aVqD
	 TmdJLV2ypaG74VPhGg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsYx-1wRHN12hZf-008CBh; Fri, 12
 Jun 2026 19:34:56 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] platform/x86: dell-wmi-base: Fix handling of ultra performance key
Date: Fri, 12 Jun 2026 19:34:50 +0200
Message-Id: <20260612173451.467629-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260612173451.467629-1-W_Armin@gmx.de>
References: <20260612173451.467629-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WFFArMr2bRiAmBlIr4ASCaj0qbNVjMvL82BYHYSA9QC6ornr/A9
 LSO/yV9qWPnHrU12dzJRXdaMG2hsKOf8zUSq2gGmmIBDLbTKoA4rnCdm+A8oT4rVTBqVEaA
 aGPYuCKcC9+EpqFpnJqjOYgYEk1QQT2tajfE686mc2igOW76Tcn6pfd2B2MMGlwbkME7I8u
 33GR7Zguj+eKr3Bu7o5NA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:le7fHUqJvAM=;PYni/0LF2JwEbI2tDlkKsVJ6Ixb
 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
 /Ncsi8ttozmeu90y5s=

The commit message of commit 5fbd827eb9c2 ("platform/x86: dell-wmi: Recogn=
ise or support new switches")
states that the ultra performance key contains additional data
after the type and code fields. The event data passed to
dell_wmi_process_key() is already parsed, so "buffer" already
starts after those two fields.

Use the correct index for accessing the first data field to avoid
a potential buffer overread.

Fixes: 5fbd827eb9c2 ("platform/x86: dell-wmi: Recognise or support new swi=
tches")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/=
x86/dell/dell-wmi-base.c
index fd6a508cd902..38a6b3ae2f75 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-base.c
+++ b/drivers/platform/x86/dell/dell-wmi-base.c
@@ -456,7 +456,7 @@ static int dell_wmi_process_key(struct wmi_device *wde=
v, int type, int code, __l
 			key++;
 		used =3D 1;
 	} else if (type =3D=3D 0x0012 && code =3D=3D 0x000d && remaining > 0) {
-		value =3D (le16_to_cpu(buffer[2]) =3D=3D 2);
+		value =3D (le16_to_cpu(buffer[0]) =3D=3D 2);
 		used =3D 1;
 	}
=20
=2D-=20
2.39.5

