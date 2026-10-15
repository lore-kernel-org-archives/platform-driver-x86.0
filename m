Received: from mta0.migadu.com (out-122.mta0.migadu.com [91.218.175.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDEA4078F6
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 22:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102279; cv=none; b=vDX+PcpfsorIhbjq32YOhHIlmUy4y7YVPAexFzbF965d7B9tJBwqLTpw/+CoWg8NgMeYqK5jsEdhVL/ILb4Ud/JxlBsy+bHTFBpfsZrhmwWJe7B5qX6FHBq5TSBvW2lXuXNlZTasoGkEWWjuCTeR5Tjld7OeOQy5r5ZZOF50f68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102279; c=relaxed/simple;
	bh=rzu70tPCHyyTI1YOrhizUDH2MZ/Wa/0Zwl02kwjUELU=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=VJjQ2qUqPGAPJC5DhAAbviSRVipPiHYcourFyYjj8ww24WXhtfHDzOu+VWhiQURlf65RtViaqCO3JQo7v9ruibtBxB7Y+hipZ7su2mvP+cEvGfAP+hl/G4sCR4kIGTN3i07B1E0yjxy4+HdE50nVB0N0W/NUe3q533EB9+W8Xg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smmh.dev; spf=pass smtp.mailfrom=smmh.dev; dkim=pass (2048-bit key) header.d=smmh.dev header.i=@smmh.dev header.b=a7kS+i7B; arc=none smtp.client-ip=91.218.175.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smmh.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smmh.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smmh.dev header.i=@smmh.dev header.b="a7kS+i7B"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rzu70tPCHyyTI1YOrhizUDH2MZ/Wa/0Zwl02kwjUELU=;
 c=simple/simple; d=smmh.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792102274; v=1; x=1792707074;
 b=a7kS+i7Ba69O6ZmIy4uDBrVr5DuwXSh6mS0eVMW6KVHZZ6rzX2kykV9T1Q9PYSObuzxp528Q
 BoBenmWWEKNM1cWnJOak5mXxBuQ7WNqN/6TTn4ottsKpR1tE5Ym++MI0Q8K2Z563CY79CPipdHz
 yi0xKTT8n4H8v5a0vPfeQDra7PxrmkQhP9B7JY4mRYmSBCi6nWLR7bRP7emIn0jH17xt2cr+X42
 /cQwSNrtVITjTky/wVKOL1yneb4abCgEH72s4SXYHeGzB55Tdn24KdR7jQ1uUm+yuSFUJUlT5Ir
 LrFPjyyPan/a32L9llhLAJbfECLkqRG+EDxozeW+crbSg==
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5242fd614dd396cb;
	Thu, 15 Oct 2026 22:11:14 +0000
X-Mizu-Trace-ID: 5242fd614dd396cb
X-Migadu-Flow: FLOW_OUT
Message-ID: <d3871d83ee3f5eea3900d8bc0da1de764a8fc2ec.1791672579.git.i@smmh.dev>
In-Reply-To: <cover.1791672579.git.i@smmh.dev>
References: <cover.1791672579.git.i@smmh.dev>
From: Seyed Mohammad Mahdi Hosseini <i@smmh.dev>
Date: Fri, 16 Oct 2026 00:10:54 +0200
Subject: [PATCH 1/2] platform/x86: asus-nb-wmi: Ignore unknown event 0xE5
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

On the ASUS TUF Gaming A15 FA507RF (BIOS FA507RF.306) the firmware sends
WMI event 0xE5 about every 10 seconds, for many hours at a time, while
the laptop is on AC power. Nobody presses a key when it arrives. The
keymap has no entry for it, so asus-wmi logs

  asus_wmi: Unknown key code 0xe5

each time and reports MSC_SCAN 0xe5 with a KEY_UNKNOWN press and release
on the "Asus WMI hotkeys" input device. Desktop environments take that
as user activity: the session never goes idle and a locked screen wakes
up every 10 seconds.

Owners of other TUF models (F15 FX506HE, A17) report the same periodic
event, and that it stops when the charger is unplugged.

Ignore the event, as was done for the AC and charger notifications 0x79,
0x7B, and 0xCF.

Assisted-by: LLM
Signed-off-by: Seyed Mohammad Mahdi Hosseini <i@smmh.dev>
---

Notes:
    Built against 7.2.8 and loaded on this machine in place of the stock
    asus-nb-wmi. The 0xE5 episode had already ended when it was loaded, so
    this entry has not yet been seen silencing the event; until then the
    events were dropped by an input filter on the same device.
    
    The research, the keymap entry, and this changelog were prepared with an
    LLM coding assistant; the logs and observations are from my machine.

 drivers/platform/x86/asus-nb-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index aeb461b1644d..23dce220f974 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -662,6 +662,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0xCB, { KEY_F14 } }, /* Fn+noise-cancel */
 	{ KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */
 	{ KE_IGNORE, 0xCF, },	/* AC mode */
+	{ KE_IGNORE, 0xE5, },	/* Periodic notification while on AC */
 	{ KE_KEY, 0xFA, { KEY_PROG2 } },           /* Lid flip action */
 	{ KE_KEY, 0xBD, { KEY_PROG2 } },           /* Lid flip action on ROG xflow laptops */
 	{ KE_KEY, ASUS_WMI_KEY_ARMOURY, { KEY_PROG3 } },
-- 
2.55.0

