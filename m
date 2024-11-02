Received: from t4v5.calgera.eu (t4v5.calgera.eu [185.69.53.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936871A0B07
	for <platform-driver-x86@vger.kernel.org>; Sat,  2 Nov 2024 18:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.69.53.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730572666; cv=none; b=lolvZwSg8rliGXAOdbLjJ+eWY0W0wDy0PJgHUmrmguNPikhpjGpf9K5z7G7b4DtxqSZv4A1KegbSaBTUOZ5ssvinlgL0pta/9F6ahDHfVEIW6Q+0Lr4Af8ZBbas/cycGXm0lPUkjgE5kKrh+4S9QhJc7eMtB7vLem4uDGaPcBM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730572666; c=relaxed/simple;
	bh=6EbP8zS0EdI+cOIlsq0LdPctFfLonHYCMhpvQDXYtYA=;
	h=From:To:Cc:Subject:Date:Message-ID; b=M+rtLUHPiwWQR84V/SykFGa4UvzoYXUzp8h9eSOkUGJjFIyl7jFyi4M8TD7EZ+IWiWnQKeg4O0JdnknIn+gTTf3eVsRknQ+ximfxKouQxmGnDHY0+YdMfPP3qkr3rFeK6pZEMy3LzZ/1GkwO3TTN352pxFNi5oLH+3PpfG6VHbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=calgera.com; spf=pass smtp.mailfrom=calgera.com; dkim=pass (2048-bit key) header.d=calgera.com header.i=@calgera.com header.b=CNlIWl/B; arc=none smtp.client-ip=185.69.53.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=calgera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=calgera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=calgera.com header.i=@calgera.com header.b="CNlIWl/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=calgera.com; s=mail;
	t=1730572191; bh=6EbP8zS0EdI+cOIlsq0LdPctFfLonHYCMhpvQDXYtYA=;
	h=From:To:Cc:Subject:Date:From;
	b=CNlIWl/BZqRVcy53sICE+2r/uRw3dV+nS5omKj1V7AMmhlGTpWUiW6+kGlSz3Wrlo
	 3Mr7uHp8x5PZfpPd811j2Lq9dj6LQfmmSY3wuxY11kM5lTwvAVEjeZGqiqXLe4apuX
	 ti5TyU5NaCs80sNhyk0yYqVx7Ldj23HsLc3/OkNzXKy/7JvGYkCbuPfKglMA49VaWy
	 jgXxJxjE1FX/ZyVhQ1axxdQzYzd56FP6PFLsJuq5q0id14DNmbgG110PhYyaD0Aqeo
	 +nKtXZUHk17Lgf3Pu5xQiDlyD9dP6H65JC9jGvlJEZuaVeFbPqCpcpGJW+qW6KYMtK
	 3Ncz9dTOGv5tw==
Received: (nullmailer pid 30162 invoked by uid 1000);
	Sat, 02 Nov 2024 18:31:26 -0000
From: Renato Caldas <renato@calgera.com>
To: platform-driver-x86@vger.kernel.org
Cc: Ike Panhc <ike.pan@canonical.com>, Renato Caldas <renato@calgera.com>
Subject: [PATCH] platform/x86: ideapad-laptop: add missing Ideapad Pro 5 fn keys
Date: Sat,  2 Nov 2024 18:31:16 +0000
Message-ID: <20241102183116.30142-1-renato@calgera.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The scancodes for the Mic Mute and Airplane keys on the Ideapad Pro 5
(14AHP9 at least, probably the other variants too) are different and
were not being picked up by the driver. This adds them to the keymap.

Apart from what is already supported, the remaining fn keys are
unfortunately producing windows-specific key-combos.

Signed-off-by: Renato Caldas <renato@calgera.com>
---
 drivers/platform/x86/ideapad-laptop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index c64dfc56651d..c908f52ed717 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1294,6 +1294,9 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY,	0x27 | IDEAPAD_WMI_KEY, { KEY_HELP } },
 	/* Refresh Rate Toggle */
 	{ KE_KEY,	0x0a | IDEAPAD_WMI_KEY, { KEY_REFRESH_RATE_TOGGLE } },
+	/* Specific to some newer models */
+	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
+	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
 
 	{ KE_END },
 };
-- 
2.45.2

