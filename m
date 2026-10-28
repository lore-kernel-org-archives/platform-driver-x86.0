Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186880;
	b=lOY+w0kJG7n/uyRhsPb52qlmY3eBOTv8ZCOWr03QQmoVpb712l/nROynQT2pgXwf1pby
	 xMFPxSCN3rwZkpYiXZwMdRc139jWSrdKLoa3FG+wai6qIRXPqKpe2CAm4Z/W1SajiLnMT
	 8MOTSTNUqUMxXR2cDBvlqv9souRuS5TmTbRBdE0CETM/OYgw10Yw0JBQ6HYz3HGlazkJW
	 mECGPxynEvDVFF38qwoJSV1+2EcfQeNQhOUqsPe5k5VbbA1PDYpM/mQJIZpKyGPM0ad16
	 yLVtxmhs59LNq9JC2G7T/i3PI7sacIQlKyatQDn1lOfvvJc0q6oESaZCBiROHewcz8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G7OzWzvRh2xS3ZzKhQe5HuPbzhRsIKav7ZXo/atSQLI=;
	b=zlchF0wkEdwtHOjdbcYLc/GyEQcpZ+2osB5XwmKi5GTlca7GamQbe2gHcZBGtRfaUoaw
	 frceboaHiiN2mX9G0b7B4CGKaR4sctgCgPVYgbFhtyTMgTiguyJh2wGXR/CZIp5rth5Z4
	 ftLAPfx5ifny1i1uesICX/DAsGAtiJ1hkaIrWP2ndubKPY5f1HBPlNQ57YcyK6fzEB6h0
	 DiKKH7lfMNg21y/ZfqvqDYV3YJycwZe12hJXTFFtEhQxluVapaMKnt3wk/kCAmvjbH0Cc
	 lR8lushyT8UstL+A+H0JHvjsFSPTzmGgIDXRlrzPVkBtCiJ1C8BDCkt9V/KPo3J4qIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w7mQpC7i;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B3C606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 11:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0B3C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w7mQpC7i
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8fe8e343fso4502475ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 04:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186879; x=1793791679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G7OzWzvRh2xS3ZzKhQe5HuPbzhRsIKav7ZXo/atSQLI=;
        b=w7mQpC7indGz6AIXB2CG1lyA9spAVBoTCNhbj3R9biYEhw/vTobAp1N5vanx4oXLXV
         ttnngbcJwGbO/Wa0ysp2KJJuvDDAMHb2h/7rT/S2fmk309I4ph9UjiLLOAul7u1+Zg6o
         ktgJDBJG4Da/iei6yu+06yh3Mypy1/IvEiVsEeu301LHaUimGDeGeVDYPV1PmEUAX0MS
         UjdqFKpr4d9qILwA5Y/SXmu6BWt9NfKM4gEFvmGFv4+StwG3TpVO2aQtPV13suqDt/sL
         cKr4HcIo7+GUnYusyajzC7AifdxTwdzDbUEipEIMSU9Sa4uMciuMi8a0gFirYZxhtKKD
         YxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186879; x=1793791679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7OzWzvRh2xS3ZzKhQe5HuPbzhRsIKav7ZXo/atSQLI=;
        b=0josK6us5veU9aR+Si7jiXS/Cdu3DOduesMNXXOQrZWUUD1YOJ/6lhMDkiHiY6hQqY
         Z7Qsx0s7f3TTN0NQ4cxzROB2z3mcdU7n/tle9/QcuT5cDQcbqypq9p9gYWlPJ2LEeglX
         OL12J+dvWA/Chg9sOiILItE4gxwvf0fEIHQIMs7EbKZbw53v/9FFWsDQie41Re47VsDV
         Im4EJH9doIIpbQhQI4IyQtkT/Kj9BV58ArIcm9OpINrMj4fTXe/IGW2JwsAbLwH/FRkK
         2VKa8DuFs0PSuwtqeBB1mvcirxFfB8LN94qnzOjuuKPdcwUoWbXz4jpoRUCeWqluEZWy
         DUlw==
X-Forwarded-Encrypted: i=1; AKwUvBwYGEhAFZn68ibG6O4k5EMnOZcxQmcd12Rfy7r3TCJZOvVngA4MY7xhvw01wpnnDfLrYZ5lkRdg8lb/R0fNdzbma2Sv@vger.kernel.org
X-Gm-Message-State: AFq9FYLzVmCAWC3oKlJlRx1gyuM9Dh3Fba/miZzQUDZhHheS8GNRdgda
	zQz+sSO/21PPrHfsja3fAXK67jIucGXol9V6VoY0qY9iJFvIIVqa+Y5V
X-Gm-Gg: AYBFou3yZdJG+vg7WC/LCUIU0bRhBwBVeql+zK2d5kaBbI5dl0NTM0KQbCuA+YF3xi2
	gJ24uFYL+zYy2wpceicFu2SmFH49DfQLOLgwEczMnX3/7tNkfz1raE/DOPKTDGOap0Lxk+Puuui
	A6HJCq1IMAU6sntI/GdE8A5X2IKsqqUQnnYKWZfSjJt/dl3gmix9M/tA24pCI77OxJH8DrEhAV5
	fOGi3rQDEByS7NjXLCn6BLiEYo+kiyyrWnzj5pmJGxNVgiV+kb8ZHukuOYr9ilUMV/RKo3Cyf0p
	QbJWtzXhNoZ0B+g5Gi9hCofZbvvGCEO68fy4S6+pNLx7tkIxkhH/iaEwGKTuIqaYVzMcjVj78IL
	rxzxtbI66osrQYHnSS0RWYUYt6P1yHmuKuAZ0VFVXhPmKT31W8VItxhyPINIsg1EUoL+Mfq6BTC
	60r4nXb4Nab63a4GXuKiXPMQaAnPglw7kgoTiL7qPuXZohgI6XGNteBdUqpN9paamMO4npRtPZi
	IwZrtiRJ0Nqi7+Z8rm4Q0RB6HuZAay282mRivadzkZVFoWXAtapZR4ElmTDeKYIrcJZjWo4V0PQ
	p/4hbdxk06A=
X-Received: by 2002:a17:902:f545:b0:2e9:5ed2:c398 with SMTP id d9443c01a7336-2eb004cbcc6mr16280275ad.38.1793186878970;
        Wed, 28 Oct 2026 04:27:58 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b76dafsm20128745ad.18.2026.10.28.04.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:27:57 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v15 0/6] Merge redmi-wmi into bitland-mifs-wmi
Date: Wed, 28 Oct 2026 11:27:36 +0000
Message-ID: <20261028112742.674847-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This patch series consolidates the standalone 'redmi-wmi' driver into the
'bitland-mifs-wmi' driver to eliminate code duplication and centralize
the maintenance of overlapping ACPI WMI event streams.

Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
platforms share the exact same keyboard event stream WMI GUID
(46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
it into discrete type/id/value fields.

Redmi operations were not contained in this patch series, future reverse
engineering is required.

This series introduce a newly reported mic-mute hotkey definition
for Redmibooks, dropped the previous redmi-wmi driver and intrudoced
the quirks table for the bitland-mifs-wmi driver.

I don't have a Redmi or other Bitland device. So I cannot work on the
real device.

Features are working properly on my device (Lecoo Bellator N176).

I leave the future reverse engineering work to the community.

Tests are welcome.

And by the way, the no_set member in bitland_profile_entry means a
platform profile is only report by the firmware but not available for
set.

> And I've got a question, from sashiko's comment in my v12
> 
> https://sashiko.dev/#/patchset/20261012133648.132363-1-qby140326%40gmail.com
> 
> > Will this result in the loss of KEY_PERFORMANCE events on event-only legacy
> > devices?
> > Looking at bitland_mifs_wmi_probe() in drivers/platform/x86/bitland-mifs-wmi.c,
> > if dev_type == BITLAND_WMI_EVENT, it returns early after registering the input
> > device:
> > 	if (dev_type == BITLAND_WMI_EVENT) {
> > 		/* Register input device for hotkeys */
> > 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
> > 		...
> > 		return input_register_device(drv_data->input_dev);
> > 	}
> > When the performance key is pressed, bitland_mifs_wmi_notify() intercepts it,
> > invokes the bitland_notifier_list, and returns without reporting an input event:
> > 	case WMI_EVENT_PERFORMANCE_PLAN:
> > 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
> > 		blocking_notifier_call_chain(&bitland_notifier_list,
> > 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
> > 					     NULL);
> > 		return;
> > Because the platform profile and notifier were not registered during probe
> > for event-only devices, does this mean the events are silently dropped instead
> > of emitting KEY_PERFORMANCE like the old driver did?
> 
> I ackknowledged that KEY_PERFORMANCE (WMI_EVENT_PERFORMANCE_PLAN_ALT in
> bitland-mifs-wmi) looks like an event in this LKML thread
> 
> > Since the event reports a change that has already happened,
> > platform_profile_notify() is the natural way to pass it on, as
> > suggested in my v6 reply: power-profiles-daemon then re-reads the
> > profile, which is harmless after the driver's own writes too. If
> > KEY_PERFORMANCE should stay for on-screen displays (Ibragim asked to
> > keep these events observable), it may be worth not reporting it for the
> > event that echoes the driver's own write, or at least saying in a
> > comment that it reports a mode change that already happened. On
> > Ibragim's TM2209 the profile SET is reported not to work [3], so there
> > 0x16 can only come from Fn+K and the echo does not exist; Ibragim, can
> > you confirm?
> 
> https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/
> 
> So should I follow sashiko's advice?
> 
> And some remaining comments from sashiko's review of my v13:
> 
> > > -	/* Keyboard backlight: Off / Auto / Low / High (new state in byte 2) */
> > > -	{KE_KEY, 0x00000501,	{KEY_KBDILLUMTOGGLE}},
> > > -	{KE_KEY, 0x00800501,	{KEY_KBDILLUMTOGGLE}},
> > > -	{KE_KEY, 0x00050501,	{KEY_KBDILLUMTOGGLE}},
> > > -	{KE_KEY, 0x000a0501,	{KEY_KBDILLUMTOGGLE}},
> > > -
> > > -	/* Xiaomi G Command Center */
> > > -	{KE_KEY, 0x00010a01,	{KEY_VENDOR}},
> > > -
> > > -	/* OEM preset power mode: 1=Balanced 2=Silent 3=Turbo 4=Full speed */
> > > -	{KE_KEY, 0x00011601,	{KEY_PERFORMANCE}},
> > > -	{KE_KEY, 0x00021601,	{KEY_PERFORMANCE}},
> > > -	{KE_KEY, 0x00031601,	{KEY_PERFORMANCE}},
> > > -	{KE_KEY, 0x00041601,	{KEY_PERFORMANCE}},
> > In drivers/platform/x86/redmi-wmi.c, redmi_wmi_notify() reported these
> > keyboard backlight events (event_id 0x05) as KEY_KBDILLUMTOGGLE and OEM preset
> > power mode events (event_id 0x16) as KEY_PERFORMANCE through
> > sparse_keymap_report_entry().
> > In drivers/platform/x86/bitland-mifs-wmi.c, bitland_mifs_wmi_keymap defines
> > the four WMI_EVENT_KBD_BRIGHTNESS entries for KEY_KBDILLUMTOGGLE:
> > 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0), {KEY_KBDILLUMTOGGLE} },
> > 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0), {KEY_KBDILLUMTOGGLE} },
> > 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 5, 0), {KEY_KBDILLUMTOGGLE} },
> > 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x0a, 0), {KEY_KBDILLUMTOGGLE} },
> > However, bitland_mifs_wmi_notify() returns early for both
> > WMI_EVENT_KBD_BRIGHTNESS and WMI_EVENT_PERFORMANCE_PLAN_ALT before reaching
> > bitland_mifs_wmi_report_key():
> > 	switch (event->event_id) {
> > 	case WMI_EVENT_KBD_BRIGHTNESS:
> > 		brightness = event->value_low;
> > 		blocking_notifier_call_chain(&bitland_notifier_list,
> > 					     BITLAND_NOTIFY_KBD_BRIGHTNESS,
> > 					     &brightness);
> > 		return;
> > 	case WMI_EVENT_PERFORMANCE_PLAN:
> > 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
> > 		blocking_notifier_call_chain(&bitland_notifier_list,
> > 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
> > 					     NULL);
> > 		return;
> > 	...
> > 	}
> > 	payload = get_unaligned_le32(buffer->data);
> > 	bitland_mifs_wmi_report_key(wdev, payload);
> > Does this early return leave the WMI_EVENT_KBD_BRIGHTNESS entries in
> > bitland_mifs_wmi_keymap unreachable and cause a regression on Redmibook
> > laptops (especially models that only expose BITLAND_EVENT_GUID without the
> > BITLAND_MIFS_GUID control device) when pressing the keyboard backlight or
> > power mode hotkeys?
> > [ ... ]
> 
> Don't actually agree with sashiko, if we report the key to the
> userspace, when WMs handle the KEY_KBDILLUMTOGGLE key, the keyboard
> light will be triggered twice if the firmware already respond to the event,
> which is not expected.
> 
> So the question is, does the firmware respond the KBD_BRIGHTNESS event?
> And should we report this key to userspace?

From Chris' comment:

> - Fn+Space (keyboard backlight) sends no WMI event at all, neither 0x05
>   nor anything else, and does not change the backlight under Linux. So
>   this model cannot tell whether the firmware handles KBD_BRIGHTNESS.
> 
> - Fn+K sends event 0x28 with value_low 0x01 on every press (01 28 01 00),
>   not 0x16. The firmware does not change the mode by itself: the
>   SystemPerMode value (EC 0x68) stays the same across the presses. If
>   0x28 is the performance mode key on this model, it is a request rather
>   than a notification, so platform_profile_cycle() would fit. 0x28 is
>   currently logged as "Unknown WMI event".
> 
> - On Windows on the same machine, with Xiaomi PC Manager not running
>   (it fails to start on this install), neither Fn+K nor Fn+Space does
>   anything either. So Fn+K looks like a request that Xiaomi's software
>   normally acts on, not a mode change made by the firmware.

I think different models have different behaviors on this.
Should we add a quirk item?

v15:
Fix the build issue reported by kernel-test-bot
https://lore.kernel.org/oe-kbuild-all/202610270608.l51GVbZ8-lkp@intel.com/

v14:
Drop the accept_zero_function quirk based on Chris' comment
https://lore.kernel.org/lkml/CAAcRvKPSk5FYzZGkw12cPVGkxWVGFACwRvupBDDNae7B_JwF0A@mail.gmail.com/

v13:
Fix the zero function value problem find on my device
Fix the memcpy size issue
Remove WMI_EVENT_PERFORMANCE_PLAN_ALT in the keymap
Select BITLAND_MIFS_WMI and deprecate REDMI_WMI instead remove the
config entry

v12:
Fix the issues mentioned in https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/ .
Copy payload_data to output->data at bitland_mifs_wmi_call, not
overwrite the entire struct.
Correct the key name (Mic Mute) in the commit message of
"platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries"
and my device doesn't have a FN-ESC key, so I renamed the enum variant to
WMI_EVENT_MIC_MUTE.

v11:
Add missing return_code_at_end and accept_zero_function logic
Fallback to balanced platform profile if resume to performance failed

v10:
Replace the previous "profile table" with dmi quirk table

v9:
Add the missing feature introduced in the commit
e0d6312578e1 ("platform/x86: redmi-wmi: report EC state change events").

v8:
Correct Ilya Gladyshev's email address in the MAINTAINERS entry

v7:
Swap low bit and high bit for WMI_EVENT_KBD_BRIGHTNESS
in bitland_mifs_wmi_keymap
0x00800501 -> BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0),

Report KEY_FN_ESC when WMI_EVENT_FNLOCK_STATE events received
Rename the reserved names
Use Xmas tree order in bitland_mifs_wmi_notify
Collect the Tested-by and Reviewed-by tags

v6:
Drop the wrong Redmi ops

v5:
Correct Xiaomi DMI vendor name

v4:
Map PLATFORM_PROFILE_PERFORMANCE to wmi performance mode if the device
doesn't support full-speed mode.


Mingyou Chen (6):
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Add quirks table
  platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile
    if last performance profile is not available

 MAINTAINERS                             |   7 +-
 drivers/platform/x86/Kconfig            |  13 +-
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 353 +++++++++++++++++-------
 drivers/platform/x86/redmi-wmi.c        | 154 -----------
 5 files changed, 256 insertions(+), 272 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 9d3475065167197742b0882aff21cf8e78393277
-- 
2.56.0

