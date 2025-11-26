Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9006527BF7C;
	Wed, 26 Nov 2025 20:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764189849; cv=none; b=El07S4O+TICUdiYlJYcJHyKh3RuuRl4pNR9/5eLyoqb/6jtBe/3tSEL8n97PXnQQAHc8NYRpvZeGke6vuI0cgCaBpS30oxPTK9p3XOJGBQsp0+nevHFR7BE32YXt9rTnR5LbhD/gMfkDMj+UiUBCuZwkN7eyWt0ZJ4g+0TMDQE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764189849; c=relaxed/simple;
	bh=qoBYHw8ZuTLi9SYdhNMb1LK5+DHet4e+/Rigdy6kp3E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dF1D512Pk6Szm1RGrdyKyuBW44kf/PA8CTUo2BmgWQS1isjtDZ5hl5r3tCrP3b77fkkYCo8nhezXuuXTlRMP9BND5VP6a08Ro0IX33tzQCNJ9ASbBknsuGCzybv2SG8L2bOkVUXMTbhi5sgJKlokxQUL7tRH7eOzRWovOdlOS8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=sRGagb43; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="sRGagb43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764189844; x=1764794644; i=w_armin@gmx.de;
	bh=vNPd9nG1BQSyvqbEHaeBu+5D/0IeTEmZMVdFXvsNFqY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sRGagb43c3Fj4Gh70Jn+ZwbFWixdh6R2IgHuowzs5tXTZQrP4f+onnnnqFlPBrWP
	 5TY+hrsbH0774mzQ/CRXWNeNC3ltpL6wYvtqwU9/S7r3ftJCjZ3/FH0TXCj8EKqZI
	 V8QHMBi6bNnArlwTcpOrRKn5Jzg09d4vn9rBAHzwYAzYqp0+yemvhotgw6FPTKxWz
	 ZPPN0NUGnNt9Gmi37t61HiDFBJo5/wAJIH0Y9AgCGTCchlhcd0F42sL9SOmmr5yE0
	 A1Z8uHym9L0G/fx/rtzWvXM7ogDHONTV1dDlDaIPqRyz1iei34aRKn8LiBKZ4dZIu
	 4+z+X8z8tYQw6EzfrQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MybGh-1wKTKT1akn-00wLRy; Wed, 26 Nov 2025 21:44:04 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: andriy.shevchenko@intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/nls: Fix inconsistency between utf8_to_utf32() and utf32_to_utf8()
Date: Wed, 26 Nov 2025 21:43:55 +0100
Message-Id: <20251126204355.337191-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rWuYAhy91uQyA1rRWKOO0A1n/3UrL7L+8vh2ALoVgWO/VxS241g
 9cOJ+2vz3rIdGmVWOnfAo6A2ANNERFCsTXWChk9GGpKrN9ZIRgNRRPjooc1akH3brlPzCSD
 j/yrnIJt5WkCKYUOSq8iyN6RgHr+nZNdOnhct3iawEAk7IBV+tvn/kDwfZwI7cqrMQKFnZD
 bHP9d9A4oEUGeW+nK/AXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5eqbQMosR50=;jnvvtcqbm34PT4atAZbTsdtT39c
 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

After commit 25524b619029 ("fs/nls: Fix utf16 to utf8 conversion"),
the return values of utf8_to_utf32() and utf32_to_utf8() are
inconsistent when encountering an error: utf8_to_utf32() returns -1,
while utf32_to_utf8() returns errno codes. Fix this inconsistency
by modifying utf8_to_utf32() to return errno codes as well.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
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

