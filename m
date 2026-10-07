Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8061B493621
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380873; cv=none; b=kN6K6pOBB5aKhm+ksSrZoYRBlV7h6S9GxMZ9iRaLoV+sZLtifCOYH6e/hlRaI6UFIjk73SU5tmtLGfxUVfcFPe7fJ1dczKBrqepZ7BkDSCHM2MYnSIxzmblqytDWX9CH+kCFxMPG5XXovvs1CYWM22yCJ9gcXar6ZHHRglK3NAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380873; c=relaxed/simple;
	bh=/hNINl3FIbHsl5JH9CJ3m955ftL4CUUjPcvdPYjMC6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dS7TRDgJopV0+VjDpRivafBUk1++TTeyGxlQeqHcsKP5FoUvBWldtu3aq64ZLqb+g18pduECryj8iAjElx/SC6CbIjYjIjjlWPsNfv2e1lVfPf5h33CLEPF8AY+s13ftx87ssS/rnxwtHrqiwxB9GmFF2CxY/doTbeavghBq5ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhRxCnSr; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhRxCnSr"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3516f981835so156254eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 06:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380858; x=1791985658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t/Kk1Bq0E2CjOKHj+zxqOvhyPWu5Ka2XDmh6oVm4A5Y=;
        b=HhRxCnSrXE3iJ0IaLlZOzZKqKutBvdBvv/jZw8WZp/w2A7tepMX31rjooyuv+Nrvtv
         ShFeKYT3L5wLdvVnkvuA6Fyu8QGsluxB7q+14oqS0BExWHiCbe7QJzJTejYC9OaifJBr
         HCiYu69uqzs3VsuJYEP3wGptzgL1mAKNw+FGny81Uh8BJrCZv2wz/K169ICMtPfw7g2F
         J3OaVjH9RUekaLfS84LTPboT1aTDODnagtWeBfDxlSIKKTllQDIiTevUWNkbcarTXbmp
         SHxyn6qvhLJNXOR6bzuWo4seoMKNxRkpOCL7QR0MZGu4+phpsrBdKr7GP3lwjhVfnEp6
         NR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380858; x=1791985658;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/Kk1Bq0E2CjOKHj+zxqOvhyPWu5Ka2XDmh6oVm4A5Y=;
        b=ta4J1GIwwpYzDmxgzjBkERDW92A/tibnRRDT082kOlfPcmM/KrASjfGIjAvm4cQJAz
         79GsWOANyFHG+/DF6lX2a+vXNmrIibjJiabqSi3sx7pYixdmhNocPT0WXmIToms9KBsc
         ija2VAZu08nF3dr78xsXGQPYGlT9G/67xCIDuuqM32VW46/Ptv9vpgS0EGvxAHX/3sDO
         WRp/v2CJVH1CXkV5aX4SF406K9EY+UKImi70RADLTGx92WvrTXdFFMGKq82JqiwgL6U3
         LWcIS5qVxXly1tIl3W2FAPaouGnC371L0MSjFLUGthbXZB+MkPoDfH5G/95qPIzV4lRM
         JBhw==
X-Forwarded-Encrypted: i=1; AKwUvByi2YB9Pt4FAdVtsWvSUCy7ovWFbUYUgyo+6kKFO7MEnqYn+UyMK3+ymp+dBKU7u6/4UgE+pUYhXR+B7+GSO4DBrjQE@vger.kernel.org
X-Gm-Message-State: AFq9FYJYXl8adXk7Eovjkz1fdo9e5X1FKNnStUgCIi4Ug1xLzL3hpbVH
	HwZuA+kklE6kUwmeX2sKcndD7rB91oInIFp/Ww0spOpBWMSpkVYt3ruV
X-Gm-Gg: AYBFou1K0txO4fCT1THA39X5IJWl+Fgu5oLLqbWdh6v3dzUVqd0rv7p7lB249Ll6RRL
	X5O9hTMcXCzaVf6G3KxLFU2cVt1n7Ab6fH1y0NWtIXYjKPchZ2RFVxxpXLi8YBoG0SXSK43Jkjw
	i7kY9G4qXwgVulahmXTfJ6EMLflh+lVbGY5q2XdZAMSZcGENFh4QNcq18oWKs3EcaZhv5Nk0R8a
	X1i4JJC6ER8NMzCDiRNM+fEG7lvRS+c5VeGyFmcAgiu4s9WQ33Cw5x3tNZ1eWG+Ge98GrlDAqq6
	KaF/QX/pNLLVoNttJCKDdm3KQ6KdFKhakWCBYsDqP2tzWLg9/I7yzgINTvyZrPqkCc1Fh78ZasS
	aFOQBPNrAlpoJkrrWwdnk5+l8jGdMg6oXb32Xz0k52TInaRiK3kR0dHe2DnfgW8Zbc06CSP9fuW
	oCWgIuct8QCQUvE9HXfdPRouVyfDPa08P+FhDXVPL5Obziem0UIr9Ave3WiFxQUGLV3elG0eHie
	+KLEHXsjKySHSbRFeHngdkcErkibh5WaoyUrhEOZgczX6w=
X-Received: by 2002:a05:7301:6186:10b0:351:27f0:e411 with SMTP id 5a478bee46e88-3515de5a17fmr2272799eec.20.1791380858348;
        Wed, 07 Oct 2026 06:47:38 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:47:37 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 1/9] platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
Date: Wed,  7 Oct 2026 18:47:03 +0500
Message-ID: <20261007134711.473857-2-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007134711.473857-1-meatuni001@gmail.com>
References: <20261007134711.473857-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The escape prescan loop uses 'size' as both its bound and its
accumulator, so each escape character found extends the loop and
reads past the end of src[].

Use the original u16 count as the loop bound. Also include the 2-byte
length prefix in the bounds check, pass the u16 count instead of the
byte count to utf16s_to_utf8s(), and advance the buffer by the bytes
actually consumed instead of the escape-inflated count.

Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7).

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v5:
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 26 +++++++++++---------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 32b99a862082..919735ddba25 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -58,8 +58,8 @@ int hp_get_integer_from_buffer(u8 **buffer, u32 *buffer_size, u32 *integer)
 int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_size)
 {
 	u16 *src = (u16 *)*buffer;
+	u16 orig_size;
 	u16 src_size;
-
 	u16 size;
 	int i;
 	int conv_dst_size;
@@ -67,17 +67,21 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 	if (*buffer_size < sizeof(u16))
 		return -EINVAL;
 
-	src_size = *(src++);
-	/* size value in u16 chars */
-	size = src_size / sizeof(u16);
+	src_size = *src;
 
-	/* Ensure there is enough space remaining to read and convert
-	 * the string
+	/*
+	 * Ensure there is enough space remaining for the length prefix
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

