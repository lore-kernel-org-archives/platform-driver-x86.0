Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748024;
	b=lmas8SoFfcxl9vJe2WNed5ptrbDPyqhr+nTKtGsOjGhvhgNil2ek0/1g/UlUD+bRLk30
	 depaLtO7l6C+MfAwobGcbArgQqBJnHUbymPJPTg0uiz1vnGBdlthWElkMuuFUsh3EJKyA
	 V9nsi06jeRi8TxgTRwpDYW2HepriqadWOfjyS5owTsGT9VNb/+ytaDWO91yKCaYtLqt8P
	 FnqdtJSCrWYZem8vaj5zgZphALnHvM1MKTpXBPr7u5goY/LIw3qDnUlabRX1rvKEMuPgn
	 OoIMzENraIOOa9t5u1PTz5lnLcYbE36ScnzCdY0m/mOfmX7TEvVh17bTHIA2/4ZVFYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KXNHMPifP/e5qRDE0bFaZtFJnTIFQv9fIXCkFWUz1ls=;
	b=tuw7DM03AfJ6foYPuZxMNurOxwa5KaBJjBhYuIHoI6RlR61amYX02M3aYU+L0/J32xvI
	 /HasyEkrU3kxhY9a1ei2S7ocVshrpVKoC2IcGY+UB8WXHViFARS0km+lIkmo0V5FqSGug
	 iRA6qFmG9Vz19sZsm+zIPLrgo4KzotbNdBjX1Cwtgg08wMZ66tcPxOSJuL8gGwwX4E03O
	 hq/7F+OFFG+i0ebAjqhe0BS2gc8GHPAEo2XY3KJoXjZCWYqEk3N0Efkl+ppX9Y/APe078
	 Il0NlGfJTMgjNqLKqhRTM3AMnc9wFx/2ojuvR/mWCP10elsTanJxu7mR79zSdKlrgGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vA0y//77";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558F8606A334
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 02:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558F8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vA0y//77
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3869f03af6aso6702306eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 18:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748023; x=1796352823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXNHMPifP/e5qRDE0bFaZtFJnTIFQv9fIXCkFWUz1ls=;
        b=vA0y//77SsF+5kLh3TbONqfnJKRRO1lstaDpusYK1bEhLcD9o/PcoE7+h0xRhVeark
         8NwRbapFbc9sNagT6RQ5Aod4id0d6P/E1+qVmCV9bnYmQvtmQm1Cfj2g1rNAMLDrppYq
         q1i8bBrnUjowYW2ZWgNCboCcYpSQO0QuCyCO2bZy6AIWaAk9v/4SdhPUALJdnVtHHsZr
         ZN+lGZBI7+hc0QFOrETVUq40d4iLQIa32/y1MlbIP3kA4iQT02yJLRN2SigiPrtYp+cV
         NFe4zbP8Z6Qq0ufcQgrJykFR/qaT/gMk4M8yIvZ//eUdMgK8/YQEnpTszqzdy30QZwES
         YOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748023; x=1796352823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXNHMPifP/e5qRDE0bFaZtFJnTIFQv9fIXCkFWUz1ls=;
        b=Mf9z3y0QPWieuEYhjycGIri3bkp57wKSlBxwjAR6HtPnOY9HoQIyignu2As51Kn67T
         ZA3DqUGLPIkUH9e1fLC/MARAzS2+pQzQE5aNOWplrAkcMzc3wdgrnec0VEaI8yw946Q4
         mPWOhKVWQDB7CFB55qcHoDw57Uom2v+qPcqglteBi1LADZYymQuonuDBNmIZmlcsGPdu
         BF5uRAL6VC1yRJ56a3Rl7Z+8JGjC447E7mpfZD+1guDbGTtL//mTd3XjIqhWxmH32+lx
         j1CwjXEiDVzikuE91hYTYMp6HgoU0mBLURlkhkMk6fT/XlR1pT3rO92BvYxfQ6lhw6km
         C6dg==
X-Gm-Message-State: APuU4Z9i6hqbqom9GK/JFEQ+AjcYVV7WLSI5+ewkAEmWNfV5IpsFqRTZ
	d9jBCZeqbwTyjVmgd1xWhhRrz7mYEHXLl3+Y4BKHLK2U4IEK7TUAoFWu
X-Gm-Gg: AZFdTZfnSl9MpPDINcvWrYiTHqyjBieM/kcaBdprOQ5O/TbjPOvZD56G9S/9OKKg4pk
	FbVjwDSwrNvFVccTVwwEvrkzqOlcrXNRbaEU9ggJZqA9t7nbc26PCvrkxh+B2Sn3c35vwhNhKZv
	WNe/aGyU9hVkpIXBP3sJaW1zqt2EPJ/WKhccnB8SYG/+U2Mg61KoJc4Qf6ozJfqUGEQ2OF19BNk
	fp48myp5Y2qoqdQ7R0klJdRVKUKdRmZLCwlS4wCcZKoBV+7AOCbpzgmDFVS3kNBsoPDoYSJLEVq
	jpV1Ch0kfQK+Hi8q7ebxvRfAIo9nTtqK2Fra0/W3vU5QZ5ueumMp0iH7fqY0kBSlu4k/CiVWd+X
	nt46CMh4OSaDJnEsn/Ru6wQiP67iO7BB6TanMEhYcmhNg8gggqBxaZIkfjEiausvAhxPCxdKPsG
	UdrTiMeTRYY43J3f8P+yogy3gQM+XCz2hlakwpyXwCmPzFYO8Sc6Ug5jSnGGbdt/9dPgDl6nXBG
	+JpcFJ4igeRWVaQZ/SSvDdBzIvZry3ZvATsl29bliKfiz+Hk1VMK/iRiilZup61894s+sW4zrUA
	+ku6aUHRXO01kzXVdpAumGlwmanvuG4CxYyBA+MZ94sVobaRtjj3yzrEhw0onTYO/sElFG8Ak5f
	0CwMltfqrbgEF0rOm30fwXvAIRGIqgLTVS9ZQXHWcVE2xoo5OMKcsMqX/ikLSRHN4RGByvukzBr
	DWC/OZBFjdZzLn3B83LcDp6AI=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr23615847eec.7.1795748023378;
        Thu, 26 Nov 2026 18:53:43 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm75811610eec.24.2026.11.26.18.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:53:42 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] platform/x86: dell-laptop: Don't use an unread keyboard state at init
Date: Thu, 26 Nov 2026 18:53:37 -0800
Message-ID: <d1041fca76cb1ad27880d2e20a464993db13e975.1795747885.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795747885.git.rosenp@gmail.com>
References: <cover.1795747885.git.rosenp@gmail.com>
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

Fixes: 6cff8d60aa0a ("platform: x86: dell-laptop: Add support for keyboard backlight")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v4: Fixes: 6cff8d60aa0a instead of the reverted 02b2aaaa57ab
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

