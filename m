Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219785;
	b=WMvWl8Jdi7KSLzj6jxOTTKTs4re50bF8knkDi6LVCrrnmIniAAef/R9vpzS5BpwJiHda
	 +e27rw73hfYE1ZXlRvJE+/Mk9/DwwP7/R9V6ekpV2BI+pwQJloAVnYIA+el9F4p76KORk
	 Kz0QkZeZgEWWWTFbiuRD734JYbegTKa6u1g2sgztPrBzN8KhIrVwpYIsXuuz920BbiNZx
	 GIGEhFSqB4941UH9hqwOMWQTgwoc30UewiCKt+1qxhHkHsDNYsIwxKBzvifmpjEUsBu6I
	 8KbvJf3Z8FE9kRYBrPgDRAZk0hk6EtQ8npCK9MiLr9sNlpuKSKFeySR8WOkQNxdoiZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TfQjOJG+q5TH420hZgXUi3pJVIA7KahJ9KaSEEIWQjE=;
	b=Dk1DhPzu3gCaZ4Svz0a/FRei1QUtlS0q6PG9cXUD28yt6tlVxRhlYMDXIvpY7eJ4OF+t
	 7zmgyepSx3F53k2aXkulrhsE0QMkBpuNYYU2ZJcM47+mUWjmVbe48K5xF0akpcYuB9clF
	 Pka6Wv4eR10CSqqXkxGRnlIlEUvI+M2h4hMXJG2hvxPY5NU3tB4gxSwv6bu+YtNFbPZ9k
	 eejiDgoq+F3Das56movA/IU9lTQkdfFlP9JC3oVIgXGTnKUZQnIufzlMyIOpugiXKLhKN
	 vei9ZpeLzaeVaXIqVFZPgQzS15DEoDotaMVxiH7hIzElG4Iv4GlhOgtGL148XuZr4gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kON81Z98;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4F460A3815
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 00:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4F460A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kON81Z98
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2eff92780daso11229575ad.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 16:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219783; x=1795824583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TfQjOJG+q5TH420hZgXUi3pJVIA7KahJ9KaSEEIWQjE=;
        b=kON81Z98izEq58TMyQcgKe9WUeQP6YbIHJLq+evgtNpTyFOu5oslMTJT4O8OWzMqTH
         TDSmInsdP+oXsLpI0wA+1hP3Ok0NcwplapI+Tl6z1YNqxQFEi7u9XHRjkVDAb74siw6r
         6eW2qWW25iU3hny0h3xgDHnTzs2S7Oc6jRayjdUs5bJd3ILz+YMnrvTZSQJKWVFntCMy
         FW06Zf58rryvzWAoxDR1GysL9UynQQ7sAElzvkSjmzxFZz+WUP4MYxUteA8D1z6w+zmk
         8vXs4bhQTFhOVteitbjt7aLtgl7Lr+QEWPf7Zt1AKZJ0UjTx0nJn7Dqe6O2TnGRi6pLy
         2mUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219783; x=1795824583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TfQjOJG+q5TH420hZgXUi3pJVIA7KahJ9KaSEEIWQjE=;
        b=KdNEOqqnXjhb4iN0rYFt2Bxe0yMoOTpt81u8P8uDpKOkYJCHsA/kRUyw0cFQDVP6GI
         3zqvxv5bLqQop+4sxCnZrhotWsXYWm22Wl4/Kc4PGZNkiU2wtLWwcj3lBxHYmb9tW/vd
         D1dG4v7IchrtBgA3DDD4AqM/5T18B2VRf9QYos1UYsZPt86ydQqJR725UfZhBn4qCe1B
         woWvdG/CpkSRXr/SWEHqHxPZ4Gs4yzUNYfQDHUof8xprkaShi07Mc/3dHKRZoZTsdoMF
         Iv2kSKuPLL4SDfKz2mjDKbkpt9Uu9ma/HbbQ50CRQZhLSmv3cN0ZZ1Cr9ki2xGeKiciG
         +h2w==
X-Gm-Message-State: APuU4Z/x5nQN1j3dGr0sDBEBWpodtCrVdaAaosP4Pe7EtmP0paXRjrBT
	3M06zL0CO3usneooXRT7GTdUQI0C0NzdVCCh4IlggOiaScZ2HnWuHP2b
X-Gm-Gg: AZFdTZexqns0ud9n0jvPhoHfj0UQU7gW4ze0MBDaYXrrwHSZBDpzbmPd5Hso3e5cuY/
	lbOQzRQc5txr5vcB0siaqq+TbURcK3uGBs+GzNR29gs5rZYKDt6UiRRGEmpbDE/h1hzpBEqeDBN
	cZQKLqYA8Uk9nIt+JZq815+zogNSz1eI0JRLXn4UQq6jmj1iGjxnlxzDk0bUwcBX4J11QOZDel5
	EljUkgIALVupcXrh9icNor8KfRmWXYwvgyt2VQ4wX6JsXfsgEC9p5sSsxn4RJN9EEzXvKt0BLUZ
	7JB6h1+lyhAPPbsMtN+ZU0FUvf6Wryj3Mv/OckoQWOpPwNT2iukWUESOKtdi0k6kfB7wa44WqnX
	1CNsiP7jvwlLp4VPG3JoEvRdpEy+MEjdY1vkngabRvbyuRJL5PDD+cKLgH+tpcnrrBd/tokJs8A
	onBtk6mfVvoT895DfCxqD0HzmVXcHXOMcK8V0kZ5FpNWTiH28UjLrpQ5T0DMygUiuYlqjTlf0sf
	hLf6wrsdw3okGeHvdXkm/Q37urWKLd5tS8QSmIjaV9WVKgyte0d9ODccDq0UlW4EpAxkLcyOFrL
	1iDiZ57PqrSo9bmspxDlApZINu8aIRPSurtKVYTo2Koa0z9PR9PnwQ7KWui/bN4sHXJdGtws09J
	SgAADKQs5ieVDvN2S0VzWDCahBHgZfKUW3iI679Lyh0kNVLQqA1JE35tQPlku5DWBAN446KRCT6
	PMtA==
X-Received: by 2002:a17:90b:2f8f:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3b41c98a3f1mr3511276a91.19.1795219782916;
        Fri, 20 Nov 2026 16:09:42 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc613csm1920509a12.5.2026.11.20.16.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:09:42 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	Darren Hart <dvhart@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] platform/x86: dell-laptop: Don't use an unread keyboard state at init
Date: Fri, 20 Nov 2026 16:09:30 -0800
Message-ID: <78b2d044b90dfae5dca66c5eed5cbdfeccc1f4e1.1795219225.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795219225.git.rosenp@gmail.com>
References: <cover.1795219225.git.rosenp@gmail.com>
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

kbd_get_info() has already succeeded at that point, so a failure here
may well be transient and is not a reason to give up on the keyboard
backlight. Start from level 0 and the off mode instead: the code below
then picks level 1 and the first supported mode, as it already does
when the backlight is off at boot.

Fixes: 02b2aaaa57ab ("platform: x86: dell-laptop: Add support for keyboard backlight")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v2: fall back to level 0 / off mode instead of returning the error

 drivers/platform/x86/dell/dell-laptop.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index c1a51bf95c25..eca348497ac3 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -1455,7 +1455,7 @@ static inline int kbd_init_info(void)
 	    dell_smbios_find_token(KBD_LED_AC_TOKEN))
 		kbd_timeout_ac_supported = true;
 
-	kbd_get_state(&state);
+	ret = kbd_get_state(&state);
 
 	/* NOTE: timeout value is stored in 6 bits so max value is 63 */
 	if (kbd_info.seconds > 63)
@@ -1472,8 +1472,13 @@ static inline int kbd_init_info(void)
 	 */
 	kbd_info.modes &= ~BIT(KBD_MODE_BIT_ON);
 
-	kbd_previous_level = kbd_get_level(&state);
-	kbd_previous_mode_bit = state.mode_bit;
+	if (ret == 0) {
+		kbd_previous_level = kbd_get_level(&state);
+		kbd_previous_mode_bit = state.mode_bit;
+	} else {
+		kbd_previous_level = 0;
+		kbd_previous_mode_bit = KBD_MODE_BIT_OFF;
+	}
 
 	if (kbd_previous_level == 0 && kbd_get_max_level() != 0)
 		kbd_previous_level = 1;
-- 
2.56.1

