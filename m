Received: from mta0.migadu.com (out-124.mta0.migadu.com [91.218.175.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5ED3B42CB
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 22:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102280; cv=none; b=RjsotLX651YZRy2dQDut9YJXqbV/nzCVv2hort+jaI9ceOdcogIjkZXY733HElQfdBTxS1neOHZ4ZZNnm4xbohl23bt3ojZh5bhMVXLMnJnx4HM36jIsP4O66EuAiG6dDijaW458MAbfmNj8NJVzGjOErVEGOkcRsevtK/ZC+kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102280; c=relaxed/simple;
	bh=xHvRN68WhLc49TchwdnCm3VKs/8a9Z6A9pp/Drm4vjY=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=Bt08Xt3jjmiiCyU79pPtJcD2vMZu+5q+VQenf4b4fdcB0VOOmIT3SewbN9a1EftxSPnLiz7QyKf5ckRSz2cG6+mU2tiMMPM1ScB9aSL5Qa344lRIPYKU4Sk799EiSLZlzVtSYMb5qjRL63IR3rifduW6XVDYPEZNq1iUpoHiXPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smmh.dev; spf=pass smtp.mailfrom=smmh.dev; dkim=pass (2048-bit key) header.d=smmh.dev header.i=@smmh.dev header.b=AQ5KJmJp; arc=none smtp.client-ip=91.218.175.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smmh.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smmh.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smmh.dev header.i=@smmh.dev header.b="AQ5KJmJp"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xHvRN68WhLc49TchwdnCm3VKs/8a9Z6A9pp/Drm4vjY=;
 c=simple/simple; d=smmh.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792102275; v=1; x=1792707075;
 b=AQ5KJmJp4zRQvv6eQ37PtpLts2XgZN/zb/JDl7SdZeZ/wG3kA0rIcezeVcDOsKHe9Ncr8bEy
 0nqAnlLc+UV9b9szyNEcZ+kyNgzzn3WuNYEyhSkLztXUPn8MwN71UhDGedLfMiXs1XqkBL8nUlZ
 3nF/4DzKMNZPNwjvZyTJ7FkG2Z490URtBGnpsizBpct+5DbHnSa5vrhdRuQ64uu0pCcQpyQI0Do
 ClOcVCUCMsoqnFlAOiBTD4xRkRfVcqVI1n5UsSjFuMNtq6t+3VHtq9mayScLNc0scOZ/fK1dWti
 lWjsAbv6pU/IZmfavwYqC4VQxcoD4DkaWj3mAm0n9rQDw==
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d5c3b91505c1e84c;
	Thu, 15 Oct 2026 22:11:15 +0000
X-Mizu-Trace-ID: d5c3b91505c1e84c
X-Migadu-Flow: FLOW_OUT
Message-ID: <debbc20cc0fd7e463d934a77979d40e671c49d89.1791672579.git.i@smmh.dev>
In-Reply-To: <cover.1791672579.git.i@smmh.dev>
References: <cover.1791672579.git.i@smmh.dev>
From: Seyed Mohammad Mahdi Hosseini <i@smmh.dev>
Date: Fri, 16 Oct 2026 00:10:55 +0200
Subject: [PATCH 2/2] platform/x86: asus-nb-wmi: Ignore Windows key lock event
 0x4F
To: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>,
 "Luke D. Jones" <luke@ljones.dev>,
 Denis Benato <denis.benato@linux.dev>,
 platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

On the ASUS TUF Gaming A15 FA507RF (BIOS FA507RF.306), pressing Fn+Win
makes the firmware send WMI event 0x4F. The keymap has no entry for it,
so each press logs

  asus_wmi: Unknown key code 0x4f

and reports MSC_SCAN 0x4f with a KEY_UNKNOWN press and release on the
"Asus WMI hotkeys" input device. Pressing Fn+Win twice gave two such
lines, one per press.

Fn+Win toggles the Windows key lock, and the firmware applies the lock
by itself; the event only tells the OS that it happened. G-Helper, which
handles the same ATK WMI events on Windows, has "case 79: // Fn + Win"
right after "case 78: // Fn + ESC" (0x4E, NOTIFY_FNLOCK_TOGGLE in
asus-wmi). For Fn+Esc it sets the Fn lock through ATK, as asus-wmi does
for 0x4E; for Fn+Win it only shows a notification.

The event carries no lock state, asus-wmi has no device ID for a
Windows key lock, and there is no input key code that means one, so
neither the kernel nor user space has anything to do with it. Ignore it,
as is done for other events about things the firmware has already
handled, such as 0x2B and 0x2C (keys also sent via PS/2) and the AC and
charger notifications 0x79, 0x7B, and 0xCF.

Assisted-by: LLM
Signed-off-by: Seyed Mohammad Mahdi Hosseini <i@smmh.dev>
---

Notes:
    Tested on this machine with 7.2.8: with this entry, pressing Fn+Win
    twice logs nothing; the 0x4F lines above were logged by the unpatched
    driver for the same presses.
    
    The research, the keymap entry, and this changelog were prepared with an
    LLM coding assistant; the logs and observations are from my machine.

 drivers/platform/x86/asus-nb-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 23dce220f974..f4a6e9c02b76 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -601,6 +601,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x43, { KEY_STOPCD } }, /* Stop/Eject */
 	{ KE_KEY, 0x45, { KEY_PLAYPAUSE } },
 	{ KE_KEY, 0x4c, { KEY_MEDIA } }, /* WMP Key */
+	{ KE_IGNORE, 0x4F, }, /* Fn+Win, Windows key lock done by firmware */
 	{ KE_KEY, 0x50, { KEY_EMAIL } },
 	{ KE_KEY, 0x51, { KEY_WWW } },
 	{ KE_KEY, 0x55, { KEY_CALC } },
-- 
2.55.0

