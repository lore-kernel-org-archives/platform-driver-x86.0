Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6781D3D525F
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393344; cv=none; b=J8xyX9n3qokVIUtHiPrq/MSQKBO4iyeIduUrXAjVqAcqVAmrj65YNV0aJio1E0UCqTst5QO7pdNCiLhqIBa3aAD+a8WPBy8xYw/ekd1PMrP0bGmdhAHbkGzcyUE+UEf30ov4m+zurUG2lJp8QjACAIbaj8UfbUg/n6tGUiK5nAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393344; c=relaxed/simple;
	bh=o3r5KTDUMd2Ryp8djVBpnOvccaOXRkX1yt8Yfbuf284=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=owJ0paV+IMA7nJT3MMOsZ9XxTrplbJavKu6ZDUDsNGa8sLzQPmem0oYU3IWMpVG9SRMu9+6XFair9Nji8HbuFDV86THWM9xwkSOkC/dcMhsJx1TD2Z7/Gii8mfQTtktqGukDnU/Q4lTSE7taAjcOxZmeMfYETwiN5YxhKZj4J70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjwW/+1p; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjwW/+1p"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d6ff23d82eso3295885ad.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789393343; x=1789998143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=szMMrZ57zR+vj+A4cF4lARsCWhq/BFFfWh68VaeaZGQ=;
        b=LjwW/+1p/fVerC0w+2NPDuNa2JsBxOLIgz0an3e7d2BYSr4SItnL6NWMuXE+AIdu+E
         CfpxXoEPTwqYNxWIDeaezklNiGFNRuSWYrXoiurqWeB+XF0bfZBKIILBeCCxP+uKFaBN
         24+YfwK0vlxwwVZOFCaDzJg+rEnEJA/fFB5byPIekKPnlqHhYqiZwraz1jylmh66OP41
         iNkFRXuVtIY9wCMb7tfJKbDvJdSg0OqwEspa5Sj54PpN74PhhQ/t5deAlJEDhi8xBtwo
         DBtmZhBW8efS4fvXg3KoODhIn/xYcI7dDDDT2aaL6CEpvgR0sQubl3Mop4zsiDKaz2pI
         TzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393343; x=1789998143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szMMrZ57zR+vj+A4cF4lARsCWhq/BFFfWh68VaeaZGQ=;
        b=jeAufTEeo5KuOYsQ2AlLedQeYGvE2QLmYoybuonNugwejiDd8K7yR6313RG7Wxdyl2
         3gHgLK3WXUF/eRGuh/aHhiLluRWhesL8uOc5KcXVgjZ94Kz2TPTx7A9ly9ed7e6EHgQK
         HDzwwYR+sD/GkSE9DNpFJEhnKdtu/iwlpbB/Nh18FkccVEtSDxMGPPqRo4HcB0jI+dh1
         +AKEC3Kcfli7TewpRzcs4HQGJQyNQJPbk3Q2EMEBuiOW3KUGjFgQBxYUVhDAgi3BQ0wM
         ghPSS2Viz+mdVgfgEG3C1jxm8VjEaclAwlSohM8TBHls0e+Q6FmysHBswTLRboMm3IgG
         SCOw==
X-Forwarded-Encrypted: i=1; AKwUvBzNoDuWAsowA6aBYldGWWiGZ7xtmYpYOyRxjAklrqpp85WsI79BI0u24MYvGxBCsDAsDqcDWjFm2IDlp2KNdPhBdlFS@vger.kernel.org
X-Gm-Message-State: AFuF++luZcUN/ZMpy9cxA3388xnj0/sdQeL/Rct684BIOMWSssv76gmV
	Aqs/iOlL9ZH8g3heySxLpd0N07xAsi5H/zWvEcJLTskDk0kLzTG9WYt3
X-Gm-Gg: AYBFou3UCLEWhl1g2oR39tUdrF/mG00OCX6/Jfj28xqWu1/y5ImxtrhcK0XaOpfb06X
	VwRHzVoNHSAzon5UVCO6kU6VJ0biSf4hNf3xtJoNRzGBD2tm3Hh4qgZrarIytiCXuwlDx9L/wXS
	86TueqCoLWeUkEOFm0zMOWMFdfazc8YMI978PU57qIA3n2k2ccFHt0w2AfSytTWvFw7a0nxJYJZ
	577rEBU2KR+WjgOqFkcKEq/LmJbUgXxT8z5xuroI6KBAxYYy0h7y8/lPAseT55B2TFmb/G4IaQb
	hbHShwcFPy+ZAaOtc6vZmAcWy7CbmlDAVpRyBDwFvpwzn35Tza7Dtfuqxmt0oP9FlPETKK5Mhql
	s4n4+ST4oP0x+iHDE7sGupb9RLaYGXv3TsmJ5vo+GwZZT32fBFRfAYSFJxPURpWVhlr5KWJVR4k
	Gx9KmL1lRecixowDGJlnz/BmVz6yGjBoNN3+An8RAMpRv2+DIt+LfZVxdUbGWsWsf/H07es6zKp
	eWMgapZlH9whv8o8fS2joOLYqe8Zkw2Qr1rEa21nScfNaLUlqypxbZp6viW+TI+2e6SyNRnsJ0G
	YgNgGpZifmfrbuxhoZDG
X-Received: by 2002:a17:903:240c:b0:2d8:f4d4:7044 with SMTP id d9443c01a7336-2dd6c7ca8a6mr35987125ad.3.1789393342816;
        Mon, 14 Sep 2026 06:42:22 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfef639sm48914155ad.71.2026.09.14.06.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:42:22 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: ikepanhc@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Navon John Lukose <navonjohnlukose@gmail.com>
Subject: [PATCH v2] platform/x86: ideapad-laptop: Add Yoga Pro 7 14IAH10 Mode key
Date: Mon, 14 Sep 2026 19:12:16 +0530
Message-ID: <20260914134216.1295740-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The F9 "Mode" key emits WMI fn-key event 0x46, which the keymap does not
cover, so it reaches userspace as KEY_UNKNOWN and cannot be remapped from
there. Under Windows it opens a performance profile chooser. The Fn+Q
button already cycles platform_profile through
ideapad_check_special_buttons(), so map 0x46 to KEY_PROG4 as a
user-assignable key rather than cycling the profile a second way.

Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
v2: reword the entry comment and explain why 0x46 is not routed through
platform_profile_cycle() (Hans).

https://lore.kernel.org/platform-driver-x86/2eab84cb-6d2f-4ec3-9869-e2aa9c1d75da@kernel.org/

Lenovo Yoga Pro 7 14IAH10 (83KF), BIOS QGCN35WW.

Measured with dyndbg on ideapad-laptop.c and a kprobe on
platform_profile_cycle():

  Mode key (plain F9), 2 presses:
      WMI fn-key event: 0x46, twice
      no platform_profile change

  Fn+Q, 2 presses:
      platform_profile_cycle() twice, called from ideapad_acpi_notify()
      no WMI fn-key event

 drivers/platform/x86/lenovo/ideapad-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 8213524..35c13d9 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1360,6 +1360,8 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
 	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
 	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
+	/* Mode, opens a profile chooser; the Fn+Q button cycles the profile */
+	{ KE_KEY,	0x46 | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
 	/* shift + prtsc */
 	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
 	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
-- 
2.55.0

