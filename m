Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB2229992B
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 01:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790733492; cv=none; b=V/XgK1lh2+IMfK1qsD7jWNfAooL5nrzu7fDQ+52CKlfspsbYHYQSeD4g7N8pG8TdYXYfF4P8OaXAXMhHKBxenIH7G2P47zcyLnoz/H7oOvvRnXBHh6hX2VZhuijiV32djwl5wNamVsFeNRbXutGQA/N0WBKK5ZaN6FLlWECF7YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790733492; c=relaxed/simple;
	bh=upTA6b+ISAdaYmRHMvqHLX3cvwXVoURxqHCS3QMWDuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lN6NWvdYF3Tjcm57YuVwyUuXwhnOmXXNG/RT/vW3rDtKjic+MetNJZHlZ+IMJk65WdJT0eMSFIsutqfIt7I6OjS6Hy03sy/XwEbU1G7oil77zgnfeKScD3+edZmloinGZe740ECAgxHs1cilXeapJcny9XsGLCzHN6TBe/JY1Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJetreYe; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJetreYe"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3e27d525so74811e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 18:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790733489; x=1791338289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSXObVSJjkgBIuTWTnU+6eeTHwWMHYD0oSzvFJkg21s=;
        b=hJetreYem+LxKLlbroTdCSjmJt9PMh6Sq4BOJHnn4cAYJ0KSvQTijrfPL5/jPGKfGg
         JgxII3DQT7e3mtRvl6covbZjUj1sQIklHx2DuRQy9UAqZe31LE7cK11NHMv5CfSAAp9e
         wYeD7b1+EzKzgz3ATlFie0fdQ+uMFoS/BxP9Wd9/DfkKya6KtGolp6mqKd+lPKbvHnrv
         twAemS43lizsmiUfVUyqN6I7LtkgEruIrF2hSchpH212ROVfH1tUwBHbWADtitoub4hy
         oi9HwhMuTVWlSoqqBU+gkoHzYa5nxtiHypI/hAXdrSAu8WU+tF+DVfur0xZQp/JE2CwR
         aTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790733489; x=1791338289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OSXObVSJjkgBIuTWTnU+6eeTHwWMHYD0oSzvFJkg21s=;
        b=M1FhbsOQn5jMlwEd9bFk3JfzMbWkX4d0nO1pUp4FS+nUfdBoZWy19zPoInoAvpMknx
         IMc/pIqpqDuEbd00Ru/w9qQXKrZSIiYBDIgyrdGg0ZFeAV71LQL5+TSzhAbApG/O97bu
         titOnp6u1/8ftJ11c+t7SSr6ymysKy5B+wO9ieTOv46XNUw6IOvDNO7keJLgZcrn8D/K
         ek1A4v3n6XakAv+eHMELFVIBTDMmDtGHBtvD+jQXQnzvO0cpNrs8966+zc97SUUXwxUK
         4yJTkNYXy3OM1pPipWJmkGCesIlRz+JtNWpsUZb8Oa1Pbn8uRGoPwk2JUa2QDg/p5gLE
         FbpA==
X-Forwarded-Encrypted: i=1; AKwUvBwbI8DTZp35g4agrLjpTcP+8GS4UqyxCHbq5EVQ4I8nPuaomf1LD01TIcR5HS9t+uGqSd2rrCNsbE5cyjHwSc3mWFiK@vger.kernel.org
X-Gm-Message-State: AFq9FYJsOPF7IDcOeBWsAmjeoZneMEz94D5yHoDLxbZcwdhnTac/JZAt
	d5vWLY9Mh6zHJDLYeZb93t0df5RfPNMnx89w+1kc/SrPT8TZRPg+x4OC
X-Gm-Gg: AYBFou0x4ctrsQBZ3dYDCjL0Ik8GN1QKf+7JEapT7LxjjiqRX1kqnGvRXfVWrdeYWYz
	mmcXWDQOOOau/XxjRFyHHKs6hoHafcvuJsLbnF0zJJg+i7gwWCXByoJcFl18HH9zRUvy9Wama3P
	8lQBY1JpOatOMG2r/r818WKuu9p7ovH9YCCBRPc5+0ZAK10GRhW/aVekpIk+yy08s5ZOXSWyGLx
	HTQ4dltTNcNLWzy9DGhlMoUcO/IOgo2ZXot5pgq1Fi4GPmdWTn8yfMSLSWVImjabSXcJ1MVaCvy
	SJc99sAb3FhJdjPxm7Y+a5o5mW9Qm69cClTbfDuvJJKVuNoOM1uQrfNPm1C8AzPPgqv1/E+LXIx
	VR7V2/6mPydgTzY6H93BtZKLBI8vPNYPiY+AeHX/qUG0DhVeJrhHnH7mZxIRxWMramKeik1/YuQ
	A1Kafoql8tti0bAKasXvYpnGRpTU0jF0OLia+nYKz7STQDhbi098HeI75AeogLtw3DHKqnyDk21
	3SMi1wzQUToBeUbGmO0hV11aoO9CHqX7LXRZc9gQm6K041oRhUsrt7ckPyfgN75kYJb
X-Received: by 2002:a05:6512:159c:b0:5b8:f8f9:e080 with SMTP id 2adb3069b0e04-5ba3bcb67bamr436973e87.26.1790733488684;
        Tue, 29 Sep 2026 18:58:08 -0700 (PDT)
Received: from wildarch.lan ([109.72.228.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fb75e76sm5690e87.0.2026.09.29.18.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 18:58:07 -0700 (PDT)
From: Anton Karasev <uselessfire@gmail.com>
To: qby140326@gmail.com
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ilya.gladyshev@linux.dev,
	foxido@foxido.dev,
	W_Armin@gmx.de,
	kento@kekto.ru,
	ericted8810@gmail.com,
	chris@miget.com,
	matias.civadda2342001@gmail.com,
	btx342@gmail.com,
	wleizc7319@gmail.com,
	wolf109909@outlook.com,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	bozhenpeng93@gmail.com,
	nika@nikableh.moe
Subject: Re: [PATCH v6 2/5] platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into the bitland driver
Date: Wed, 30 Sep 2026 04:58:06 +0300
Message-ID: <20260930015806.3111929-1-uselessfire@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929134503.17249-3-qby140326@gmail.com>
References: <20260929134503.17249-1-qby140326@gmail.com> <20260929134503.17249-3-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On a Xiaomi Redmi Book Pro 16 2024 (DMI: XIAOMI / TM2309, BIOS
RMAMT6B0P0B0B) the display-switch key sends payload 0x00000101 -- the
short form. The merged keymap in this patch only carries the long one:

  { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_1, 1, 0), { KEY_SWITCHVIDEOMODE } },

With WMI_EVENT_RESERVED_1 = 1 and WMI_EVENT_TYPE_HOTKEY = 1 that expands
to 0x00010101, so on this model the key produces no input event at all:
sparse_keymap_entry_from_scancode() finds nothing and the event is
dropped.

redmi-wmi has exactly the same gap; it is being fixed there by

  https://lore.kernel.org/platform-driver-x86/20260928221417.37875-1-ilya.gladyshev@linux.dev/

which I tested on this machine: with that patch the key reports
KEY_SWITCHVIDEOMODE and the desktop reacts to it. If this series lands as
is, that fix is lost again for this model. The equivalent here would be
one more line:

  { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_1, 0, 0), { KEY_SWITCHVIDEOMODE } },

Note that the keymap already carries both forms for the settings key
(0x1b with low 0 and low 1), so the two forms are already known to the
driver; the display-switch key is simply missing its short variant.

While tracing this firmware, two more payloads showed up that neither
driver handles: 0x00000901 and 0x00010901. They are not key presses. The
EC echoes back the Caps Lock LED state that the host itself has just set
-- the third byte carries the new state (1 = on, 0 = off), the same
scheme as the Fn Lock events at 0x00000701 / 0x00010701. Verified by
switching between windows with per-window keyboard layouts, which changes
the LED without anyone touching the key: the events still arrive,
200-500 ms after the LED change. On a system where Caps Lock switches the
keyboard layout, each of them ends up in the "Unknown WMI hotkey"
dev_dbg path. If you agree they are just an echo, KE_IGNORE would
silence them:

  { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_CAPSLOCK_STATE, 0, 0), {} },
  { KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_CAPSLOCK_STATE, 1, 0), {} },

Two more things about how this patch treats events from this firmware.
The observations below were made on 7.2.7, with redmi-wmi owning the
event GUID and a local build of bitland-mifs-wmi bound only to the
method GUID, reading the EC registers while doing it; what this patch
would do is from reading it. The ACPI references are to the SSDT with
OEM Table ID XMCC1806 (\_SB.PC00.WMID) and to the DSDT.

1. Fn+K. This firmware never sends WMI_EVENT_PERFORMANCE_PLAN (0x0f);
   QV20(1, 0x0f) is not called anywhere in its tables. A mode change is
   reported as event 0x16 with the new EC mode (register QFAN) in
   value_low: the Fn+K query handler in the DSDT (_Q24) calls
   QV20(1, 0x16) and then NTDP(QFAN), and the MIFS SET of
   WMI_FN_SYSTEM_PER_MODE in WMAA sends the same QV20(1, 0x16) after
   writing QFAN. EV20 fills value_low only for QFAN 1..4, so after a SET
   of 0 -- what the default Bitland map writes for balanced -- the event
   is 0x00001601.

   This patch maps 0x16 with value_low 1..4 to KE_IGNORE, has no entry
   for 0x00001601, and calls platform_profile_notify() only for 0x0f.
   So after Fn+K userspace is told nothing: the EC mode and the DPTF
   policy applied by thermald --adaptive change, and so does the value
   read back from platform_profile, but power-profiles-daemon keeps the
   old profile. That is already the case today; in my test PPD stayed
   on balanced while the EC ran in Turbo. But redmi-wmi at least reports
   KEY_PERFORMANCE for these events, as it reports KEY_KBDILLUMTOGGLE
   and KEY_FN_ESC for the backlight and Fn Lock events. With this patch
   they all become KE_IGNORE, so userspace gets neither a key nor a
   profile notification.

   Treating 0x16 as a profile change -- value_low 0..4, including
   0x00001601 -- and calling platform_profile_notify() for it would
   close the gap. It would also fire after the driver's own writes,
   because the SET sends the same event: when userspace writes the
   profile through bitland-mifs-wmi right after Fn+K, two 0x16 events
   arrive 0.2-1 s apart. That is harmless.

2. Keyboard backlight (F10). On this model the event's value_low
   cycles 0x00 -> 0x05 -> 0x0a -> 0x80 -> 0x00: off, dim with the BIOS
   idle timeout, bright with the idle timeout, bright and always on.
   The EC keeps the same state as 1 / 2 / 4 / 8, and EV20 translates
   it into value_low. In this patch
   BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0x80) is 0x80000501,
   while the firmware (and redmi-wmi's 0x00800501) has 0x80 in
   value_low. All four KBD_BRIGHTNESS entries are unreachable anyway:
   notify() returns for WMI_EVENT_KBD_BRIGHTNESS before the keymap
   lookup, so the KEY_KBDILLUMTOGGLE that redmi-wmi reports today is
   gone. That early path passes value_low (0, 5, 10 or 128) to
   led_classdev_notify_brightness_hw_changed() for an LED with
   max_brightness 3, and on this BIOS the LED has nothing behind it,
   because WMAA does not implement WMI_FN_RGB_KB_BRIGHTNESS (0x12) and
   answers 0xE000.

The full acpidump of this machine is attached to the bug:
https://bugzilla.kernel.org/attachment.cgi?id=310971

Details, traces and the exact verification steps for the key events:
https://bugzilla.kernel.org/show_bug.cgi?id=222062

I am happy to test patches on this model.

Thanks,
Anton Karasev
