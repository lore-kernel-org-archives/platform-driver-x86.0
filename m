Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881304F7976
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 20:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625817; cv=none; b=NUt10MutTwNcR3nnoHC68fMus2I6jftvkWViOeKhjxEjfZbQ1jkhSD81KxE9+zYEu49kK4SVAGfBLovH9rJvhu/lPWuB/BUb3/2O/g51952OoCvVIoVJ+D1y8Pb3XZRP3MVIVPizueyEBwyCTNxDWkGugnsurRKYbyUls4CLBVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625817; c=relaxed/simple;
	bh=rCH+vNfr+HAz68hgE6ad8RdsLo1ZvJU0FFwXRjA0dbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=INbqjpyKzITt6rbV+k05xr2qVrgFWXrNO+WGNp8CMOY/n5BGwFujVgED12UZQGqOdO0a+SBvJHzT3BATNIyMvhz/VpkxJIQAU8PxCVlbqL4h2Hwzjzh7kEouHID9UPZ3/qCUbjlBkmvYhqkLjhpU/NYoSvNn0aSB8DJQ40Zbu3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSL1+QI8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSL1+QI8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so21319985e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 13:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790625813; x=1791230613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a2byg8jmBVjsxhPhVSYeY+o32k/rUgSaVIfDZBu776Q=;
        b=gSL1+QI8iOgw1fW2yvak7CYkKOALBOMFGGQfz5fKY7zMvgyE4IVbXYzMhpzgpKwhMk
         Mb/VMOn+71s1Jch8pvUSV9kgSK9P/W6sVd5N1yP4w/juTnJ1qKnaxlW02HnLbEENaa05
         Y83XM+LP6cp9FWulKR8ATyQtJm0Nhj/gJ0zkPLNRXBfROeiZfuLxP5mtPHl7FMSAIyYC
         +VGxUFGoqxberTbxgY2N3NNf465XejcFslLEtxeCZu+ig6Z7tF4StmNx2h5yOA9eEme4
         mmt/bGiwzd/qNrrkIXyGm/AXXjlEQ76eA5raJ38fBochTQaMo89ap11s6DbDrSBljG//
         fi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790625813; x=1791230613;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a2byg8jmBVjsxhPhVSYeY+o32k/rUgSaVIfDZBu776Q=;
        b=scrIA/N49tU+ZFcMKFDsP6yx2+QRq8EAq+hB7+C7yUSI6IjYq7D3UxPnNuf0iGnGNM
         UeV7YTGsm+pdDQ2xJKAWGr/wdNx3wJdTfYA56uVLvu0jF68jL+vJd75wNtGcTM2jsJKr
         OjbkK32elhrq84vTmQvu5GZO1zO52VpMh9cofZ1cWLiubrd3631nqk5iF+vI/s65UjN5
         sMxvCcY0zAmfwgcBpkOkREomPlNZ/tcTk8HSpLy9VYIxSu1LKSAPi5uA18tIMOHPOLNx
         rIoRVe8SWm2XmB5DKZI1bwN1bRyyW/LIEhJ43/mdsPI9/xumfuwNmXlPQJFkiHsj5vcb
         p1Sg==
X-Forwarded-Encrypted: i=1; AKwUvBw9LITNp+LMyPnppvpsB88zrJQiT1eCYxbu4xt+7vzoLDdQ0bAEWvy25/cSlHpikPHi0X9D2de+HWvgCFTHFCQNJMWc@vger.kernel.org
X-Gm-Message-State: AFuF++n2Hc/F7geiE1Jr/WcAF9Dhg1RGS9ufqcDTO72DiJllliig0mFC
	xSVrS3/9Jf0aLwJ9cSSbz4psXSaVBZc1ndBWk84KzJYjiahZzEOD/lVB
X-Gm-Gg: AYBFou3HyWWbLTgXneau3KxGsrTEtndvTm94s3AlTNesKnq6wzTdEkWqT0mCYGW+byI
	QW/DpxqE239S1V/d4WfEzHjNrKmKKFUPBlf/jaSvwBy5QroypQFBGnjMYvGgBH2l8BbmkIiLv3J
	TqdxAIE7Ch+YKlJdCS6WUPEPU8v4TEnyc6BLNZhp8Qpk2OK3wSySJ2XLnUeDVQx38AfTbaBUY/z
	plaiaZ/1jCb4WRwfwq2aZj0Vy3T0CJkGkaSUacTwrFVIJoN2D5bCaVJ7Ip+KDL9J+0fhfdi0VeW
	GeaVR08EPgtV9h9/Dp9ha8/f2Zp++X+yRY1UXrkjmI1nXijeRTxegWbcOZls5E4VimIqi6oAI9u
	vYTOjHOKBuPn6b3fbpDsKOdY52l1sRKWx+TLfiCTioKnSbGupq36LsLKjc8fYQZiH7zDTXRzuM9
	X9igTRfePiyZmtZ2j6KgIIzpOS7iFTwDI23hKaJvLpH2X92uvbMZzRooTJiiLdwvwjt4ILy8+6U
	amQfKk1UPyyDFLPMymwfJWGuh57aFFG4k2eKqamRwEQ/gJC6HLk
X-Received: by 2002:a05:600c:530f:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-49fffdc9a4amr81501985e9.9.1790625812777;
        Mon, 28 Sep 2026 13:03:32 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c0730a8sm26506625e9.0.2026.09.28.13.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:03:31 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 1/3] platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
Date: Tue, 29 Sep 2026 01:03:16 +0500
Message-ID: <20260928200318.63383-2-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928200318.63383-1-meatuni001@gmail.com>
References: <20260928200318.63383-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The escape-prescan loop uses 'size' as both loop bound and
accumulator, so each match extends the bound and reads past src[]:

  for (i = 0; i < size; i++)
      if (src[i] == '\\' || ...) size++;

Snapshot the real char count into orig_size and loop against that.

Also fix two adjacent issues: the bounds check omits the 2-byte
length prefix already consumed, and utf16s_to_utf8s() receives the
byte count (src_size) instead of the u16-unit count (orig_size).

Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7).

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v2:
 - Split bounds and prescan OOB fix into a separate patch, as
   reviewed by Ilpo Järvinen.

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 24 ++++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 32b99a862082..ab1eff1deca1 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -60,6 +60,7 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 	u16 *src = (u16 *)*buffer;
 	u16 src_size;
 
+	u16 orig_size;
 	u16 size;
 	int i;
 	int conv_dst_size;
@@ -67,17 +68,20 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 	if (*buffer_size < sizeof(u16))
 		return -EINVAL;
 
-	src_size = *(src++);
-	/* size value in u16 chars */
-	size = src_size / sizeof(u16);
+	src_size = *src;
 
-	/* Ensure there is enough space remaining to read and convert
-	 * the string
+	/* Ensure there is enough space remaining for the length prefix
+	 * just read plus the string data it describes.
 	 */
-	if (*buffer_size < src_size)
+	if (*buffer_size < sizeof(u16) + src_size)
 		return -EINVAL;
 
-	for (i = 0; i < size; i++)
+	src++;
+	/* size value in u16 chars */
+	orig_size = src_size / sizeof(u16);
+	size = orig_size;
+
+	for (i = 0; i < orig_size; i++)
 		if (src[i] == '\\' ||
 		    src[i] == '\r' ||
 		    src[i] == '\n' ||
@@ -95,7 +99,7 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 	/*
 	 * convert from UTF-16 unicode to ASCII
 	 */
-	utf16s_to_utf8s(src, src_size, UTF16_HOST_ENDIAN, dst, conv_dst_size);
+	utf16s_to_utf8s(src, orig_size, UTF16_HOST_ENDIAN, dst, conv_dst_size);
 	dst[conv_dst_size] = 0;
 
 	for (i = 0; i < conv_dst_size; i++) {
@@ -121,8 +125,8 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 		src++;
 	}
 
-	*buffer = (u8 *)src;
-	*buffer_size -= size * sizeof(u16);
+	*buffer += sizeof(u16) + src_size;
+	*buffer_size -= sizeof(u16) + src_size;
 
 	return size;
 }
-- 
2.55.0

