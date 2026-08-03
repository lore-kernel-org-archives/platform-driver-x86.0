Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823FE313531
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 14:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767457; cv=none; b=rlpuCNWyz6p7miRHOyYsbDe3b0/MSLqY1T1QJ5UveRikYQZRR7K5kOcUAKMDITMfJPEfLi5YMpj5nMJwVM6BTi9hQ39fZE+i1k46Dfn5BPSygpDYce5AbDiaDGP6qVVYsrQg3EF1h67nFgqj9VgPyKSl4qUZdGPAYQhP/jtDsts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767457; c=relaxed/simple;
	bh=OA1LKTN49b5FUMf9V/yVYL0uyXf1T9fnPQ99xO6TDc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J35zECd+pDVSL5bId9ESPR8HpOLHnOlxByrVjnEgvOJmxHOTXAh/qUnirGzzAA/Buy8NnnbxQQEA5r3KHChSWnMQemI9Sxnr6Hyr2sS2fL2n9NWXIwKqeNZ8Q3LWM70nrps2Rurc3mEOhZ8dqbnIbB1pt+Z7NoP3wFM/5jsp31U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5U5yhws; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5U5yhws"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4955de8797cso13012685e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767452; x=1786372252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gdrr7AdAYBlVDbcFRIgxo33EdXDmWd6yiBKqM/w3XU=;
        b=j5U5yhwsTyH+U4iVWzHP8r5NInK1VVUwZW1yOXBWcT/bJGPZbJ428AEpdRbAWPRake
         ZFtN2WPAwhCQs7wpo3uVAQdmAxfA8kdaZTXVniLGgqjt+z9cURPQuEUJgUv5kZMpmbFi
         u7ppiqqdvSJdP7OTyDDbc1+pFgxKItGFHXCpRuBBb7DoTFrSGhg70pvQ5mV4s+9Dc0sC
         SFCUf5F8R44nhU5Flznl3ESnEVtsvQng9hk09yNSaEYBBNSXZqHXAF4HA/wgyBL52IP8
         JJ4HkwwxpcOu28y2VR1SfMpO1WBALv0YVAw2Ad0DhUgV5E+tGH2jVALM1RZTt174SsKn
         flUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767452; x=1786372252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9gdrr7AdAYBlVDbcFRIgxo33EdXDmWd6yiBKqM/w3XU=;
        b=LBq8GGzdias9rFpNS6I19NV/AZARUCr1g729Pyj38Wz+sy00w9vQJZQxouS7t0HfuP
         9yTqJhTLJ9YS5YZFm0OoKD5uBSePlbFwzeQa0bdnqhk0f8VO6vTOv2BuGKC6D7sAxHHX
         vDKxJcrbiQ14appsr8TusVKroTwb0rzBYj4tQwFixTaVutF90rD/WjX3vN//NVCW+EsY
         GG32mFWnT2axWVlLMKV5OwKremHxTO7P7oCsdiCY0ARcT5RJ+t6DwIjtYKIplDR2alsn
         J3/w0aKp3FDjLBaq5j5kTvhCmCIhc6elj0ethO//4sW/3IyoEIsmIdGJs2A2ERdDyjyT
         w8ow==
X-Gm-Message-State: AOJu0YwIykef54K50Zm+mzuTnX4T1j9DdILqg26gTGqVosCjXw7WzXgc
	9Do8JfbTPpEd66VTqod6qMTISfJ2zLu/FfmPvNC4qb3bdSb2PS0Cxc9OtI3mh5wKHXo=
X-Gm-Gg: AR+sD11tTQLqgv2euYz+hNbLnoHkhBnbBQkFASbYn+9SOw5kp5fswla2Rnnx0A86f/p
	oPHtacqoXMVKzcQQtMVbhBU3E+o5nmkp/0jPS83ki2Dy4SseHJ/uI2Bg/duohLw95ziBmuCl6GQ
	owdFQc/fbOphbj7AhLWFlXxvaCK3EcdYNzXegW0+xv0wpRFyUWw2MCEnVoHALEXiQ4G5U/k+WQT
	mJh9GVDQHht1BoJIuOMgORAFV5iGcUBRCZce6YNtT/amhqrQd7p+d+YSyPSyW/FSJMLY0SFf48N
	NsMT77CnpGWJuTNRPb2Ttxp8xoUc4Ye6mgkH30fUrklBV/BeaTY5G2UGCB0byqsBwoWtnZG4B2h
	vCygCJxL7Ygl6VNOsGQdx//Xbo7L+hZ4GpuJ+wkd8VExAlgkp3ap5iie/EPQyRbOkUtuVxHv5rX
	lxRtgM5f5bcmaGs/FpQzS2JqNMKKQFK8ponp41V3FIS8xvZDI+Qk3pWe8O9NEGgspS2+ndxYnDA
	RFaFe2smccdw9XW94Xd0/8qu8Elx9L4IbizGZsNYg==
X-Received: by 2002:a05:600d:8492:b0:496:c2fd:1731 with SMTP id 5b1f17b1804b1-4980c64b96dmr166980395e9.1.1785767451905;
        Mon, 03 Aug 2026 07:30:51 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm236575295e9.12.2026.08.03.07.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:30:51 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	meatuni001@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 01/13] platform/x86: hp-bioscfg: fix off-by-one write in hp_get_string_from_buffer
Date: Mon,  3 Aug 2026 19:30:24 +0500
Message-ID: <20260803143037.93105-2-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803143037.93105-1-meatuni001@gmail.com>
References: <20260803143037.93105-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_get_string_from_buffer() clamps the converted string length against
the destination buffer size with "size > dst_size", so when the
converted length is exactly equal to dst_size, conv_dst_size is left
at dst_size and the unconditional NUL terminator write

	dst[conv_dst_size] = 0;

lands one byte past the destination buffer. This is the same shape of
bug as the previously fixed off-by-one in hp_convert_hexstr_to_str():
the buffer is sized correctly for the content, but the terminator
write is never checked against that size.

Fix by changing the comparison to ">=" so conv_dst_size is always left
with room for the terminator.

All fixed-size destinations that reach this function (path[512],
current_value[512], current_password/current_value[64], and the
per-entry buffers in encodings[][512] and prerequisites[][512]) are
affected.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 2bf57e6eade4..0edc6e7cfa9a 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -85,7 +85,7 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 	 * bytes.
 	 */
 	conv_dst_size = size;
-	if (size > dst_size)
+	if (size >= dst_size)
 		conv_dst_size = dst_size - 1;
 
 	/*
-- 
2.55.0

