Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637778;
	b=ucRXgNgGiOVSNRhe/Kvh2rI1S8XPY4xU0g0Cg53QpIWFZuRd6qM+SebfC1OeZxB4CXGn
	 1cpTZ+YumAFwvUdp+2pNfhmOozn+HNVRDlPBt5qzHm5nk6nbkhkIVbzfDBZj0P4GUdJHp
	 74Loc6qps+AcmNFpvRJFvuKb57RIOD8qeQTthMxEwF5xKRACjN6WjJ3l+Q8xnLKLF7ma8
	 djqUUFu1nRvTsiLPJqLPwBD1QfQgAVW2h6DqpdG8d02DDZVDLLI5SXTdRfxGzitCZhrhw
	 A9YkLZFFhPog8+Zn3aN3fY+f+eCiWQn6A65FeHLY7zQ3gybPrv5QNj07IHJk7rurXpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mlBezjdELFCtMxn9x7yttaCF4buMcCnnIvVu8VTskyY=;
	b=OYPFjmZ70kDhBcu0Svi781RB2DqRn1v7dix3a3TeNEkrTEu2MEubpgVGFz2hBjFVillt
	 wP/abQr9dOYVxMiZKl1ovoW7WYkKIN1XYADBR4I+eh9nMJBgOlqYayP2OlIsmY6/QdzpO
	 b3dw21dzwqjlaQm0K6kmPJH1kpJttg3ptCnQvyAsOY8MQU4BzVSlkoW5DeC6boJlL3Zuo
	 UDP8AkYWcyOMElaNh//VkUnxQ4TlXvjPCESvlk50HEB4x430OR29s/B9DpXkCJ/reWmYM
	 XFLRQHU4uDNeepd5vEua6zL7KnEt0JYUAYn8aPhMjWe7FC4tgF6NljPOq6JJ4oHrhyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8GM62o2;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BDF606A33E
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 06:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38BDF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8GM62o2
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e940d5d2beso6529065ad.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 22:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637777; x=1795242577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlBezjdELFCtMxn9x7yttaCF4buMcCnnIvVu8VTskyY=;
        b=B8GM62o2l2x9KWesi/jbdGINqM1XgJ4O01CNaOQviynn3PJ9DLVUaFqwoVBZ80u58b
         l6neX7qaQioVthR2Adzrmaqjh0vmHPOSm62XfOEivwYNFC8VrJ9oDyfJGCRv1C8nVHnp
         NevFtg5U4E7S3XwvD+rrR4v5K7LTjdp1CAFct6wEFwPS063aMAigAasjS5L3pDJS2qfT
         ZIijZhwQv4ryNrM9iXZSafDdJXqAQq+FUxYHg9rYQdlN+xO8w274nBKEyw4EHdSMgmVG
         +7OmmN/0aKNpfzaTMC0Dm/u+EqLxXmgxivXcVSp1XqniREEQEykg5tI43+mwkGgXUY1+
         3CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637777; x=1795242577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mlBezjdELFCtMxn9x7yttaCF4buMcCnnIvVu8VTskyY=;
        b=er5R4nKBRTirgDhS0r1Kfg2yEXctLmUbjgIbX4Z3nNa0FY6ZqqH8GGDRztdVl5okbn
         IPLtMOG4rmcttlDqP4SsKzUvyECXXSrKCK2FZEd0+BaXf81IM4UJjxvaLdT95Jlnzypn
         L9RpXq0UGcSsu6YXBk1koV+EeWmksvkrwck+aGl96mYYLkafJ4osKAROz1sWIMU3mDJI
         OnMcoYCKXfgkxovOoixvztRYtmT5ysivex3NqWTDITvw+OL7KKb54GtwlqV9xzJNEeSe
         pLJS74hl5X/tmA8y5Vc6FR0kFhaq0MYFu+Qh+xEG/30DMZEfM8y9LMOS+pyEjEnVsFIg
         LsfQ==
X-Gm-Message-State: APuU4Z+qajpS/nB+pWN9oKj5xdHU/5M6J5EiOXuI2Pr4DKZn+dGFEyBu
	BeklOOAuERTxTBwK4MaDy64dPcjOaNBor+VWBu/Vv01lUcmDmD0Kw/m9
X-Gm-Gg: AYBFou2w6HMcWcGyL1I8zlD1MNZ6XjMZWgZum//TzLrycck3wP50hh+DukhBktSyFff
	ncoUq4apFZPUPAVM6nIMiLgbX3iiM6h9+L52KFaXO2cbsYcMMVS3HX6PFYVh8vrQdBciOBRvGsl
	CzlGOY+6KqbX0R1f9eZS51N/diPhwez+U7TL0SYvGBP2IZB478q3pCskOv3Y6fiN5/L1I774MRG
	4/FuYCfuWbJTJDDHJOFCa00PNwTObHZoxZIaRFVPcCzqLBOiEpFzWpJpeOuAY37ozfNUnqX1HuD
	OYL1d9kRtuqg3pOwUDSXTusbpUom1LLKAsZeJ1OL5ZxFkCIqIbcwsXfB+d/jPuH1pR/3dWwGiiO
	WCxtRcO1McCr6Qng3qCHYA/OqwTCf+yV7tJxm4LEpSCP94ZHbQKfsOLZUmEpWrnR2Nt/OGYwu2L
	8ePtv30JnmSM4TpjPtoatAj5Gwx/7NTOtcNWWZCJFhOyBKl6R5YzBlIDEmn+ouLnLdqJAhDaQLS
	k7jTs1mJSmKbxtDlVSmDbO+4pQhhy8tu/AHO5q8EvHFuGG3nsmGaT8Z+6H7ld4qFWnX0U+hxcGo
	zY2O3KjuHzeY2muVGNsSbHEk9XJaH/iYM2xpvF3/gAnI07qx8Rxt/S2ixAegu86qNc5l8epqlxY
	y9NUsv6ugma1XNdsUYYqUe8cOBCzvF0k1u8+V56ERQUnOZ9brmvIpA0XX6vpU37P3zX159UwuF8
	UF2+F/Ef00h884WnwdgmTGgZyL
X-Received: by 2002:a17:902:ec8d:b0:2ed:1b26:2be7 with SMTP id d9443c01a7336-2ee0dc06bf0mr49299195ad.46.1794637777551;
        Fri, 13 Nov 2026 22:29:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f224370sm18382465ad.0.2026.11.13.22.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:29:37 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: dell-laptop: Don't use an unread keyboard state at init
Date: Fri, 13 Nov 2026 22:29:26 -0800
Message-ID: <7d253bc056c2d6f68992d0d046affef331c57830.1794633179.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633179.git.rosenp@gmail.com>
References: <cover.1794633179.git.rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kbd_init_info() ignores the return value of kbd_get_state(). If the
call fails, the uninitialized state on the stack is used to set
kbd_previous_level and kbd_previous_mode_bit, which are later sent to
the BIOS when triggers are enabled or the backlight is turned back on.

Return the error instead. kbd_get_info() has already filled in
kbd_info at that point, so clear it as well: level control through
kbd_get_state() cannot work, and kbd_init() then still registers the
LED if at least two keyboard backlight tokens are available, which
works without it.

Fixes: 02b2aaaa57ab ("platform: x86: dell-laptop: Add support for keyboard backlight")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-laptop.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index bee347e1d60c..171728d63c81 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -1455,7 +1455,12 @@ static inline int kbd_init_info(void)
 	    dell_smbios_find_token(KBD_LED_AC_TOKEN))
 		kbd_timeout_ac_supported = true;
 
-	kbd_get_state(&state);
+	ret = kbd_get_state(&state);
+	if (ret) {
+		/* Leave level control to the SMBIOS tokens, if there are any */
+		memset(&kbd_info, 0, sizeof(kbd_info));
+		return ret;
+	}
 
 	/* NOTE: timeout value is stored in 6 bits so max value is 63 */
 	if (kbd_info.seconds > 63)
-- 
2.56.0

