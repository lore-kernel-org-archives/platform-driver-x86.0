Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648894;
	b=f4yXroAUsnNy1FlZv/ev/pCgasvU41YNtQB/4P1JnvBYlfSWLmYqDtsiXpmP/iqO87Ic
	 4Zqa17g4khTbR5Hgzjk8TuNVT8lTkU25w0I7kb3dMEBRb3qp9+cmw2Mby29Ni3KzYom8v
	 GPHbYuQNppN0B83lJZzHyk7EEVGP2ASeiW4HfpMX5TajdrNBqmL9hia4r/Mf8nsARuDrn
	 vvgC+xLtPa8ev3UnhFkEPlPP7EZly/M+V1HF+owZYNn36znNryY8OVTbM/bb0m9KJ+pEs
	 zu8Pm4lNf350Y0vwZyhGlY7ww4U0nAc5CxxuFavpoTzmOot7hDeR7qaZjlp6y0tV+9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gj9qMSHT+Mx/LydFpV6qogu9dyCtEpqGaRibxJJdMRU=;
	b=fGLc7BkKIh6hPzCN4NqO3RuvziqM9OsYnBRXZLGty7sVA8qOENxC5AUP0UIcTB7kosLD
	 RBnu96DNFaSz4MvRu2AJK5i4x5pgCxQTc9UkxJqeobaoE4Gj3ly8wL9sRnbY9XPobw61Y
	 byHVxo193D1qaEJMOb45fz4OPb8ipFanXxi8LIjBW+2HUUDeVCu+NUR+9QmuHg9Sh+y2z
	 x+G1567UxzW4Lcjaf6mgGXLHAPPZES2KRr9/57XvouiUfA8dttC+U48F4SOwj3NTm2T6u
	 GA5O2Z8LhNVCGlc6EeDsO8kpp66+5OQDcQkDR4rSLZiS1pgazXMtNwbuvvnyJPVrrNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hd+TBogV;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCE0606A336
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DCE0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hd+TBogV
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so3238169b3a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648893; x=1796253693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gj9qMSHT+Mx/LydFpV6qogu9dyCtEpqGaRibxJJdMRU=;
        b=Hd+TBogVQCZQ0QxyAJE9K3LubfJJ8SKyDOF6Pb7z/3tawizgA103BN7DnTi2QHz3GN
         rbFrADJ5Q/5sTmKUA7O+LrcdY85+at4ht1qDUiGtjdBrTTZm0I8Ity3HPHCdseV4dqvP
         ATMQiPrAfaWnkyQDhXSgBPJtwIAB/yOie8PGcPYyz3UWhuTL/fblj2bvrquqshtnyoz4
         7G6nBGltJcJWOMyWkm+fNy+3KwCj8y1Fa7IrwuR05Y9vsNkY67UM4sosD9uJbhtFtXwa
         8lsMha1upkbl4V5irEARJWX+oSUYkbjCC/W8bsaSYh7WJlTtPor9YUnCAcA8GdFzonDW
         c1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648893; x=1796253693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gj9qMSHT+Mx/LydFpV6qogu9dyCtEpqGaRibxJJdMRU=;
        b=HeVyh6vahlNiQHa0HDsH/T23IlPin5zki5e1L+zeWd0t19h1OPDgbm1W5dxWC2lmQl
         +hEaMscdfDeRfz3v64jdBCPVwJJtvVwC6E06LWaZrkn0OhbBzznXQ+bxfRtyIyoSKH0M
         VENYwWtK1TLuDu57oHZ+r3cVg3TPKRoSCLunOyGThfkxsZw0g49D6qSBYLjH7aIX7fuR
         boScquUbpQpVSK9lhlbwvAnhJcTak6ZsxPzq3GtbT9wc0B51SE5OGEBErgfj6l72cjh1
         gIakyHadvbc3t/czuQ3FTjMMlM0NS4OkJxELTd4Y09tjbmo6FzXFr1+5zRW2Tkd/XGPv
         WBcw==
X-Gm-Message-State: APuU4Z+vdiomARb1ayGDdI3UvMg7OO4eUuFPNCzKHB1ir5MO0kDr1NlC
	EuvGfGkfnTGa4bZjFXO6gIRoIx2ASi5BRsu0DpiHLkJlipmCMf6B02K8
X-Gm-Gg: AZFdTZfQxR2CJXr3Qb8Vz0ubWBGFN1L+gVS/w+f2zfR0HcMiJJzwHH8j+71G+8Ih8hD
	KHQLKdCwc2BPRdQveYXEX7Cfo24u3o8u5iYYcW7wOrtdj+341GrFsvGzVC7e3qz9gz7QeJkAdGF
	LpzFtN+kPc8NqxiWPtn9tivgepqRodtyFH+FXJ4ircgbE6XMVbbEq2PeLNyBWvbdVqkJZ9W4o77
	T2adn/S5XGUgvY3aGkLBXLbDySKIIovTy8swq7jaalm0IOrWwtdjIbju4IdB6feJZDbHnXLM8aF
	P/kqRRtSCuBQSW37twHV/yU28cLPPa5AWGip9NF5cR3r79OToreiJCLJkXV4Z0lErJnOKEGtN30
	0Q9XaBGRLnXCav+C6U1MCGKwQNMxv/SXQNANNZmPqp9oUeamJiV2SBq2DAZOll0gGwacL9R5h2n
	JbvZ2XJID4lLhoYhSAy3evNPJGPpgrxmPmU+UbVB9oTdPPy1o3B9IQprsY521Gx3cHAIMhKU5WT
	NTja4VCnEXG5turLUqnJTBKsL9EAAkTkdUV1jBVFR85VDY28FCmEs/4l/kzsghUOLQ45+NmB20h
	LQSgMMFIgixq7iVC0nNh1Jt2SOoplIqzQxT8dguX7ko2aU8fr9YUWQ03bzkE5BAOND0/CLAh3Za
	nfRxO1t+QC2tE182KiIdUIxq7z92WfuEuBk2Om36gTyxzylr3DY8zT/R47Ncu+lgbjeqQBpRA9Y
	Bl1j1PiXq5EE+p7I0bjhzxAWY=
X-Received: by 2002:aa7:88d4:0:b0:898:22b4:c8c8 with SMTP id d2e1a72fcca58-8c8794b8edemr17587263b3a.2.1795648892877;
        Wed, 25 Nov 2026 15:21:32 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm9864471b3a.46.2026.11.25.15.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:21:32 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] platform/x86: dell-laptop: Don't use an unread keyboard state at init
Date: Wed, 25 Nov 2026 15:21:08 -0800
Message-ID: <78b2d044b90dfae5dca66c5eed5cbdfeccc1f4e1.1795648586.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795648586.git.rosenp@gmail.com>
References: <cover.1795648586.git.rosenp@gmail.com>
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
v3: unchanged
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

