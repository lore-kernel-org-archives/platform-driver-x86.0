Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A03B20013A;
	Sat, 29 Nov 2025 11:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764414945; cv=none; b=kE3p5eSDXL3ke5drKXVE0hNth/qbMRmDMayrYSaOtZ/+04eUwcOgubmJlQOLRw6ph8cV34YCB8jc979t2eYvlpO/oY741RTzoaipAHNBohSyFEyh2wIihYVuDfpxtQ4GSrPfiFf+u2jRpcr/uyH9w7NTyeMXe9tuhSjZTLLrUEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764414945; c=relaxed/simple;
	bh=u/YqoMEoQ7HF2T9A4+6h7diWB0PZZ1phHGxlhXBcMr8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U/ZkPJ5cpzxkf4ScnSLjvX3Pxi6CwwRNgtsrj2AlyP6y7nNTjWDkpNi+nIMQ80fNyiDfnxB0qeZgC4ykirPzEpXY7LU+E+NOpPbbeLYizWZDBPS03m+mP3k6Xw3y9d0IvfzJ4IyEYTAKxSBDmQ8ZPOfV9ietS0TU7/f/veqUrbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DS2nvEla; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DS2nvEla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764414940; x=1765019740; i=w_armin@gmx.de;
	bh=cdRRivkLOiziEvS3VUi3M7GwUgfLfb0ozz6xwmIdBfw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DS2nvElaexwcFJXDJsuvIL7hmhr2S2VqHPlAXZYimp9oEU90PCAE/oxAedY+n0I6
	 eAdMxjoOSFeG9QJH2LoYQc9T16HcD8/we5RUQVKpoljpHlxsmuQsen6XsYfdVXe5M
	 n3pGbCTEVqU9c64C8tvyNY/r5e0N5MimhDExqzCy/E7yRBJJgESFfpVEQfeoRdJz0
	 to2FcaYTEJiY8PLna375cxhhlu92NFILzftFE57Syyjo62ITfwyOzs/t2OL+2O/Ln
	 QkKLGKVxU/LQNZeKHRu6Miolga0jZdMaWUDbYQxqbMdSq9NRU32f2bW/j6SxR7To6
	 gLFfoG5GT74hFBpPuQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MfHEJ-1w0HV11yqR-00jreo; Sat, 29 Nov 2025 12:15:40 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: andriy.shevchenko@intel.com,
	akpm@linux-foundation.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] fs/nls: Fix inconsistency between utf8_to_utf32() and utf32_to_utf8()
Date: Sat, 29 Nov 2025 12:15:35 +0100
Message-Id: <20251129111535.8984-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0L3l19z0p2X4fTPyExeA4ta7kBmnaqANb2iZE/fBQV6tlCh2slM
 c+Aes5G6HWFcZd/8EMofBEgl/dxKwZ9NpC532wSyJbxUh3bxpnpuqvWeRcNbhUaar6OnH8n
 2gjzDTyH+ZuIvHmcpa/7jqBJylmWCdhQaziJtPN3291KdE7W3SufoiQP1afah4yDuKmRnFu
 CwdR9IQPsc8c1WKbFaOFw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:C9ZfzGLZq1c=;mFiozTNawAyshY/FSN4RI0qSGby
 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
 ddX/d0qhafm1miHiKeUQQCQTiHkTjRpmOgMCyi

After commit 25524b619029 ("fs/nls: Fix utf16 to utf8 conversion"),
the return values of utf8_to_utf32() and utf32_to_utf8() are
inconsistent when encountering an error: utf8_to_utf32() returns -1,
while utf32_to_utf8() returns errno codes. Fix this inconsistency
by modifying utf8_to_utf32() to return errno codes as well.

Fixes: 25524b619029 ("fs/nls: Fix utf16 to utf8 conversion")
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Changes since v1:
- add Fixes and Reviewed-by tags

Note: This patch should be applied to the x86 platform drivers tree.
=2D--
 fs/nls/nls_base.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/nls/nls_base.c b/fs/nls/nls_base.c
index d434c4463a8f..a5c3a9f1b8dc 100644
=2D-- a/fs/nls/nls_base.c
+++ b/fs/nls/nls_base.c
@@ -67,19 +67,22 @@ int utf8_to_utf32(const u8 *s, int inlen, unicode_t *p=
u)
 			l &=3D t->lmask;
 			if (l < t->lval || l > UNICODE_MAX ||
 					(l & SURROGATE_MASK) =3D=3D SURROGATE_PAIR)
-				return -1;
+				return -EILSEQ;
+
 			*pu =3D (unicode_t) l;
 			return nc;
 		}
 		if (inlen <=3D nc)
-			return -1;
+			return -EOVERFLOW;
+
 		s++;
 		c =3D (*s ^ 0x80) & 0xFF;
 		if (c & 0xC0)
-			return -1;
+			return -EILSEQ;
+
 		l =3D (l << 6) | c;
 	}
-	return -1;
+	return -EILSEQ;
 }
 EXPORT_SYMBOL(utf8_to_utf32);
=20
=2D-=20
2.39.5

