Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF301EDA32
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Aug 2026 01:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785632980; cv=none; b=h6otoxWi/724dL8A1ORgxYIFkRTrKIO4ifOacFgeuCXL/E5LNLZ+7XseNARpRrlGXR4JFo6F6Z0E/CjCagMgbAYbaf8Y54ymANCPQYjagsS47NM+u9fy+ROvoOlEtRvLxM0s4xrI1EXK6Rv5t9mm7gN2Y0pkTekUoZKYgpnMyNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785632980; c=relaxed/simple;
	bh=XGVeqwLGG9Yi8rlWz0MjL6XX5o9AEpbMfH8iIsKVna4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XAHNYJSogVanQME/OpG18Z9yKtjmTweMUmx2pcD6trmJHP/zNzdD2VkY5XZ9pEp2YXSzeiuag8iQtorpq/0POCHk5A2kMjLuwrn3V/hD2AMYu65LN+8d7NistYWzvIJy+wU/meL4JHn31e1jhcW1pN6etQhpI4o9qJMTnTnkPxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCSoRAQU; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCSoRAQU"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2604495f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 01 Aug 2026 18:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785632975; x=1786237775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mTIJMZeV8CmN/ypHsLJVAdwnkDUycpvxjXJ8wexL9fw=;
        b=HCSoRAQUeaPbKb0VlD1T3NTlTAS0nRqL06gX+y9vSG6yO1CPnHiCwgGRdYOS29/YSc
         P8M8M/NanWx+z4opl5BbyRGFBb0UUY1t31apQGO//74Q96/23S9MAkojqhKMbseGesfS
         bBg4uKNG2CR29McSnH/kdJYA8EnWOXrzOIXPHoWK8MgqGLtMfd44AT2EeqDkWmbF562/
         H1TWjXbbWwtXwcd4iOttG76rfXLOsWHo7Ii6gqfkJQy70jWRsV7Py5d84kJFXmwWZ44X
         UXOQN65bCvH+lNugt3gmpZSCJ8SqLQ0C/hG8Ks/moH2oJaEBG/tQDTY0xKEqTTwJIUo+
         EJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785632975; x=1786237775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mTIJMZeV8CmN/ypHsLJVAdwnkDUycpvxjXJ8wexL9fw=;
        b=Xpjg6L62eh+x9y4vFufIXpFdkz5Fn/UB9LlOGD2/pacyoFbh7woXWpn/37XecQ9SY1
         2o7nkl7HthxJwWRDVtGqE4RsGU9AbP0O00a2wZeWx3vaf1wm5aXpMqWhVxYS9ZmFIO5A
         zEXK8NmKwytFuYx6A0Wo4cseUqdN9gb77LRbZUv9dkroZO6N7e1+dm3hckMooi880P0N
         rPh/AMGt+nkCN8FQQzNF/wdyPmCJrSoJ8sXlcUW1jccf1Dj4U/xcntKlT4uQmrmE3Pyv
         4A6WB3m1WLAcL4VXQ/w+qfXLh56zZsz0mYLY54NBy+Fa8q3E2PiMOiz/6WlIuUOW2XDi
         b6Fg==
X-Forwarded-Encrypted: i=1; AHgh+RrXC0evpWASznEQlWs66+3eISi3rOEXk+808/31OWV1nRZ9uqSiuJ54gXVnJ3kX06qfOJoywV3QCw/atXbMI/9s7YgK@vger.kernel.org
X-Gm-Message-State: AOJu0YwHtL6X5EzLxpgoJHLMSZODsSn1BHdf76azPN15Wyxiv0FeLte4
	FpAWtQAEuHND/QTndUJYhHfUtd256kcvl81iZM6YXjSqsP8kz5gDPrVS
X-Gm-Gg: AR+sD13v7VTn6hhkK9OHvRew2REXT50WBffaS6tFm5rIFZugOPLoESGmsHZ+bHr1Xjy
	b+dBfk+KevickFxdNjRw+jpWGom9zVKRyxj1CXD+Ep42/BhKhWFqmEHPgLD+w4VEVcz4YIinUav
	nG6MbCkzuDexUNue76ASdiPLymX9gi2POy5ltCDRdMjSa1+jeGQcoqW0vvxU1u7rUvm2tI7Rfse
	wcUjQpFltch9dvyM4Bf4IkcZ0CSM1vT4preby2/3YJd+aiPs0gCDIv66nWd8dTE4tc3Ycccbcvv
	GlhlRNig7+BE0Lqd9du2QHKYQQ5Tx1DqNLFJFulJzMbMafhmUzkxFbhWs0aIdOPHqk+a6hGzU4D
	jhAQVtyY8gPAGQI8HIoviO8LH/ZaiAttcLyjDWjNCP0snr2wBDS9IIOuYTsOZR0Vc9D4EM+qwq8
	eIG4uZStT3jn0Em1+GWFJY1sw827OXdCSkN++C7a30LQjotY2xCBu/7ca3eiDeuAIV6plhB8WQk
	A5UT9ihnuZOtxX8Arlt1J5FM+NFGLibwovAkgQD9Q==
X-Received: by 2002:a05:6000:25f3:b0:46e:1815:6a83 with SMTP id ffacd0b85a97d-47fd72f1666mr11652820f8f.29.1785632974413;
        Sat, 01 Aug 2026 18:09:34 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b73asm17531468f8f.29.2026.08.01.18.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 18:09:34 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] platform/x86: hp-bioscfg: fix slab-out-of-bounds write in hp_convert_hexstr_to_str
Date: Sun,  2 Aug 2026 06:09:21 +0500
Message-ID: <20260802010921.7487-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_convert_hexstr_to_str() sizes its output buffer using the raw
hex-encoded input length, but the decoded string written into it can
need up to two bytes of output per five bytes of input when escaping
'\\', '\r', '\n', or '\t', plus one more byte for the NUL terminator
written unconditionally after the decode loop. For a short encoded
value the decoded length plus terminator can reach or exceed the
allocated size, causing an out-of-bounds slab write.

KASAN caught a one-byte overflow during BIOS attribute enumeration
on boot, triggered by a one-byte encoded input value:

BUG: KASAN: slab-out-of-bounds in hp_convert_hexstr_to_str+0x6d8/0x710 [hp_bioscfg]
Write of size 1 at addr ffff8881032e5d81 by task (udev-worker)/520
The buggy address is located 0 bytes to the right of
allocated 1-byte region [ffff8881032e5d80, ffff8881032e5d81)

Size the allocation to the worst-case decoded length, two bytes per
five-byte input chunk, plus the terminator, instead of the raw input
length.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -442,7 +442,7 @@ int hp_convert_hexstr_to_str(const char *input, u32 input_len, char **str, int *len)
 	*len = 0;
 	*str = NULL;
 
-	new_str = kmalloc(input_len, GFP_KERNEL);
+	new_str = kmalloc(2 * DIV_ROUND_UP(input_len, 5) + 1, GFP_KERNEL);
 	if (!new_str)
 		return -ENOMEM;
 
