Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C7851DE16
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793104; cv=none; b=ej6k5MzrkxuIJlR6vjSPctvj11U7LySESGJ1eJaEcEWe5uqKSOyV98kpZeCvqSLEBduNnkWT1C/exYBZ7JBV/44B19VIoun7DtiU207CP6tQQRtCFE1FNYJkkjB+57XVy9JeYwHI3joDYrTbfkjvHDofssD9XMucFk7Es/pygto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793104; c=relaxed/simple;
	bh=Y1AbxReCbFLTK+kcmEyfal/AtpsMKf257UxzgRjpa0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bwyE4ISnwPAsEuHxzHXnDr4pMerlv1GFqISwQt4FdxPi6rmGXXBcKiqPe8eVvWPi/91MqqCsfBbuf4g4dBRXrof+sO8WReN0kZ9lVvpiv5IHjjO/E9I7gBdiwiGFzN/7c/bFS/0PONI2MNG50Cxef/VJaEMNqAsjOoxlgcLMGqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6dSmWzL; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6dSmWzL"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so2014817f8f.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 11:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793101; x=1791397901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uonPwqQ8NSF80X5POBxOVp7O/fMWR2NlnkM8fy/9nUQ=;
        b=q6dSmWzLcvGNhJva+d+xfnNv7G8QqqxEudnDRWdTW/xM04Lb03sXJGezoW/Z4V4+4c
         VS+ahrQ26lPcA/oO3OTUdYOSIYNX81lgmseqqTO2baoVuPLsmH7g9cXsW6kRjGI5d6EA
         hE2g5aZkeetKveOh4x+v/CnAk8Jj+lThETUY1Z8BBlCcfiXZo3h9gTgWBfTsy1XNDeKz
         ipt1KOnb6dHXQps7Z8+DEP2mdZQ3/y+HTTTEQ2j4kTMvEgfJ42E2+ClXILLDq+AvWk4z
         MBEaeTDH98xt5N4w44vz49GWmfWC0OKUBBq98kK8IHj7JVRG64nMaqLca3lMPdtfBBa8
         /uCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793101; x=1791397901;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uonPwqQ8NSF80X5POBxOVp7O/fMWR2NlnkM8fy/9nUQ=;
        b=MprPmfgJi1N9zG7kX8f8jp1gyMl7eiMZQR8kdSgd1HB+X0pEZWlZw6mpJz68D7ucRW
         JeyT6Wppr0uxNka1wUv8c5FIr7Gc1ezWrQAtSQ9qymjkZ5D8FgseVaAE8Ivg76YVAKZh
         SoQnHEf+13oLbj0C6/mEV4hT6Twcr60dHMCG4nMHc22ZTupBoxW4arNfTMQQRxjAkSMa
         +iVlG8sQPv3rWEJgbQ3pH+tMp5c6mRlj1ucYeWUmKeyI3ec4cVy8NNLWiNhN6vmMyNgF
         RaXUEuRruwX8M3IB2GW/+y30LYvaKbh74bFS3oEW96BzJk/C+e+XLnDEkUd7u6CKdJKB
         UkUw==
X-Forwarded-Encrypted: i=1; AKwUvBxjyXw8EvR4Atyto7XW8ZsDHg+GC84MpjexCD+tQcBA0TV3MX5kwXMLMbjIM0wbI+i66VDd1apEw76AEgllu3j9lqEY@vger.kernel.org
X-Gm-Message-State: AFuF++n7Me4PLZb4FSZbaqpdUdHxw5DSL2G/R4RwdYVavTZNQgvIE+tK
	oD7PEGYV4QJGK/EYEP2Cn7bOABUht09x5098RyHAMfYKMDjGsw+00wB+
X-Gm-Gg: AYBFou02jslNRrBhWa0wP57xkq5xgcO/U8bGx5D2XWNXx63vHly1OEAV1EythPRN9Il
	zVMSgpvfXgs2CORtA66lu6hJ2+mUE0gf+k/YYnJo4EQmySU3N2wS+B5tXQEftQnCO9a+QLparYi
	wXlPGMRMYmzfRFWQGYEYtzg8f0pxpeEEwI1wAjgXMwTQdlpYTNa6555zQHrAP5YGn2OpYoQrDEN
	4djYFsQiTajvtBJJidMrgtJ+dqlgrpfoTEkhbOkVqH54HzjqRXWR62bH3C+oFmtNalc9hFWaobl
	VfRC8WCRzdQD97mj7kgMOULR8xOlDj7vA2yBNGmUK7HzVlkudx4lhi/iJKgfYGc56USkQ+/QNeB
	RKD9MX0eCH2E4gsSUa8zok/xJS7Vwxfi1j87woxczVuDWZJVMgdVrMejPTSzJ0EkiTXrbzIuNSk
	Zwn+oWPg1U+McRa5scwYFT8463xFEArbv5wBEuLRIxu+gRhBHfGu7btQiPPfa703DuyeJgVi/yC
	o2nTyLU/ziO1N6dBxwPXno2Xy67Qt4o9zppNqzsvTZE5amfyj9f
X-Received: by 2002:a7b:ca5a:0:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a01eb19ffdmr6099075e9.17.1790793100639;
        Wed, 30 Sep 2026 11:31:40 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f90cd4esm3294525e9.1.2026.09.30.11.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:31:40 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v3 1/3] platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
Date: Wed, 30 Sep 2026 23:30:16 +0500
Message-ID: <20260930183018.49629-2-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930183018.49629-1-meatuni001@gmail.com>
References: <20260930183018.49629-1-meatuni001@gmail.com>
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

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v3:
 - Drop a blank line in the declarations (Andy)
 - Mention the buffer advance in the changelog

Changes in v2:
 - Split the bounds and prescan fix out of the conversion rewrite (Ilpo)

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 25 +++++++++++---------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 309634c..74a9086 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -54,8 +54,8 @@ int hp_get_integer_from_buffer(u8 **buffer, u32 *buffer_size, u32 *integer)
 int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_size)
 {
 	u16 *src = (u16 *)*buffer;
+	u16 orig_size;
 	u16 src_size;
-
 	u16 size;
 	int i;
 	int conv_dst_size;
@@ -63,17 +63,20 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
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
@@ -91,7 +94,7 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 	/*
 	 * convert from UTF-16 unicode to ASCII
 	 */
-	utf16s_to_utf8s(src, src_size, UTF16_HOST_ENDIAN, dst, conv_dst_size);
+	utf16s_to_utf8s(src, orig_size, UTF16_HOST_ENDIAN, dst, conv_dst_size);
 	dst[conv_dst_size] = 0;
 
 	for (i = 0; i < conv_dst_size; i++) {
@@ -117,8 +120,8 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 		src++;
 	}
 
-	*buffer = (u8 *)src;
-	*buffer_size -= size * sizeof(u16);
+	*buffer += sizeof(u16) + src_size;
+	*buffer_size -= sizeof(u16) + src_size;
 
 	return size;
 }
-- 
2.43.0

