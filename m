Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010076;
	b=4aZh14XLYFZMNWVFNeXEPd5IQhRQjnTfL1HoTH4/JmkpjSua5+YMdE4p3N6a9mzsqKlK
	 TLhf003Es6rydVZiccm7gfDGxR8hghLDvAORtvVaQan+PR/qj3hPPY7IHTkCOhdIYXOZH
	 YS9KmzHNQG52fi4pAEu8i0C9jXHWDASrxlpFEPnnysxcfA2MXrQ3okMbRJNJiS8jxh+Ag
	 hkmSdjd6+3H7c/fwQ/42krSkEegwZWYE8ovi/JHpWKG+NOcubiqpFPlGLCEYHzPJE7lQX
	 oga5BCug48Us6hiAgPzkgqm+TC1EAWYEkjM8RrijauIcpc2m77vw7xGSCi0C/ZnZQDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EtflxX4ou/rS8siTGeQ9/kzfCic2/dNUrxNTnt/0D+w=;
	b=yu/jDCFX7VH56YplvF3Tu1988EWY8uvaw//xX+eKHVUsV9UaCtEtYpEWWz+lhtOl0lhl
	 UkbQdeirM1zcS6cOARed/tuVRHLsnYAz7dzgFDWHQgjMFrqzEfloVVpGBmlnl8+5Gj+v6
	 riGSHjFONAC0BH+wtHDrR9sPclSgzAy/DQ7aOg9wZnszFhgKKz+QQyMxKpVBwzm1cwJ2r
	 9dSkm33dt21d0d/b8cYazAIuwB02LkQiHIp7BupHKbZP66lwyqYIZOIwmNSusmfjUxcHV
	 M/IsYRRj2kYlfpGhd/RFjKGhuSX2NG5vUhK7+Yope2U+Aa7pq5pMOCQJNrySf00+V8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kIupGhCt;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2E9606A31F
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 10:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B2E9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kIupGhCt
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so784582a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 03:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010074; x=1793614874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EtflxX4ou/rS8siTGeQ9/kzfCic2/dNUrxNTnt/0D+w=;
        b=kIupGhCtuvc6QgZBFOpkyw/qAi7wykuqA/LbsThYkRe3zk+WYXKw9/sBr+vN/uRWUe
         EtuMxDOCoXo/zyNcZCHkomWLyZOhow2Sa+cMxh6XVoxEdFu4m4sEt3YGDY6TvK3uKCfC
         Q+XKCzavwMiXkdE0DfXZXzh0jrSZTGSZdwuO1+TS+Dz5w8SUdN3zQZAME/iY2K9Zwd6y
         VxtUz+xhatWr2uTeo+MX1UuCS2yV8C7hS6Q9bo1SIeNLPOx8hTMeTB9Vs4Z6zGHJTCki
         hF1YdlISqm6sdu5l25kgNpCtqDf8PmS+xv+zzgk0ToNV1DAtW4qZLQL3DsHIjdDtluCQ
         6PZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010074; x=1793614874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtflxX4ou/rS8siTGeQ9/kzfCic2/dNUrxNTnt/0D+w=;
        b=aHqVAwAPYc85yJn8qp5Eax5QVNH6TFS8RuKzQpBqR3TPjwz9LhGZa4jFX53hOR8+2n
         7ppsTCdmrSx4o08qUloD55Sy0ZN2eLnjFEVuy85f+SUhHRNu/6mWRCrCrL03ARRLih80
         BfiO2HOTgRLC+sYPARqib0KKqBiS2kWmuw4aeHXjDT3xupNVhA+6H332x6W+H0KuHMEC
         U16Ijy+lipI5GlAp0wDPHDM31RfK8ayLJk4KJhpgweuhbbPy40D8KE1fzb8HQd0JjWnW
         baXtyI9ZPhWl6qi4SnIyuWtMxWCe7PfDvh2E3iYJknk+LSY9g7GsoudeomQ4QIiBqjwW
         N4SQ==
X-Forwarded-Encrypted: i=1; AKwUvByP9/eUCczY21iXeB04KyFlmkOwIXDeKiLG8kw/I7cLhtTFD8+I+ATjSGpahk5l2l4+sx4yQhHrJfTN9GbTIhv1O3bH@vger.kernel.org
X-Gm-Message-State: AFq9FYIRoxCKVUKldtaPwN+FV0tAymo3wNtgLYWOAY4+maLnsnG9sCOt
	aUSTih4b8yuTBb6VXiUuOfKdHBRXJgP0LvMTMVPpEtiT6DP0NEhUn5ai
X-Gm-Gg: AYBFou0kStJiuRF5BkOZOwAt8vPI9vWCJfFkylgdNab2o9H6cFzR6zhOT6QE3Z/TjZU
	9IgcJdfL+Sf2R9XpWFGwwmtaWNTxwg+jilEU00v+SKdU7vJTwxcXDLOwpdN2n+CaT+E6xvF9RiW
	ckaISX51warofT4XbXu7rFsRgQoZLJI3WGLg/flfy8FmxQOiNYtRctZuJ9fiEugsSeOm1vqlMhB
	Ap6JVqfk6PtZTkr2UWrpGm2QldTG5IdTGJFs1Mey56rHxATAkRfo3rH8QKw+eADRtNKCfJGJNfS
	DEay39Guyc3lZ/TMFxb/GI4VTUtbLP1mMZhCLezz1i32vOgoF4mCjXMnDF4sYJFbiPehlf9/ia8
	XmZ6D/AK5GOeXY/p0wJ7sS4WwXF9tWRjU0ZN9k0CE5B418ZSeondC8ea+7o0NpNqbrU9UCneth9
	MXmn0cDfyvYs0mK9AC8Ui/nqUlImxDnwfWBMZq9CVqrGshoDmiU+PnYC2yX8zQyWnuVUSeHeJDt
	AYB17FYOXuoWNSa7TCrydWwvR4dXqw0n2/btgl1hN7qfnLrTqsCB0uZqms=
X-Received: by 2002:a17:90b:2e8c:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3adead4c1aemr5231728a91.42.1793010074308;
        Mon, 26 Oct 2026 03:21:14 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm7877467a91.5.2026.10.26.03.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:13 -0700 (PDT)
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
Subject: [PATCH v14 RESEND 0/6] Merge redmi-wmi into bitland-mifs-wmi
Date: Mon, 26 Oct 2026 18:20:55 +0800
Message-ID: <20261026102101.224568-1-qby140326@gmail.com>
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

And I've got a question, from sashiko's comment in my v12

https://sashiko.dev/#/patchset/20261012133648.132363-1-qby140326%40gmail.com

> Will this result in the loss of KEY_PERFORMANCE events on event-only legacy
> devices?
> Looking at bitland_mifs_wmi_probe() in drivers/platform/x86/bitland-mifs-wmi.c,
> if dev_type == BITLAND_WMI_EVENT, it returns early after registering the input
> device:
> 	if (dev_type == BITLAND_WMI_EVENT) {
> 		/* Register input device for hotkeys */
> 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
> 		...
> 		return input_register_device(drv_data->input_dev);
> 	}
> When the performance key is pressed, bitland_mifs_wmi_notify() intercepts it,
> invokes the bitland_notifier_list, and returns without reporting an input event:
> 	case WMI_EVENT_PERFORMANCE_PLAN:
> 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
> 		blocking_notifier_call_chain(&bitland_notifier_list,
> 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
> 					     NULL);
> 		return;
> Because the platform profile and notifier were not registered during probe
> for event-only devices, does this mean the events are silently dropped instead
> of emitting KEY_PERFORMANCE like the old driver did?

I ackknowledged that KEY_PERFORMANCE (WMI_EVENT_PERFORMANCE_PLAN_ALT in
bitland-mifs-wmi) looks like an event in this LKML thread

> Since the event reports a change that has already happened,
> platform_profile_notify() is the natural way to pass it on, as
> suggested in my v6 reply: power-profiles-daemon then re-reads the
> profile, which is harmless after the driver's own writes too. If
> KEY_PERFORMANCE should stay for on-screen displays (Ibragim asked to
> keep these events observable), it may be worth not reporting it for the
> event that echoes the driver's own write, or at least saying in a
> comment that it reports a mode change that already happened. On
> Ibragim's TM2209 the profile SET is reported not to work [3], so there
> 0x16 can only come from Fn+K and the echo does not exist; Ibragim, can
> you confirm?

https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/

So should I follow sashiko's advice?

And some remaining comments from sashiko's review of my v13:

> > -	/* Keyboard backlight: Off / Auto / Low / High (new state in byte 2) */
> > -	{KE_KEY, 0x00000501,	{KEY_KBDILLUMTOGGLE}},
> > -	{KE_KEY, 0x00800501,	{KEY_KBDILLUMTOGGLE}},
> > -	{KE_KEY, 0x00050501,	{KEY_KBDILLUMTOGGLE}},
> > -	{KE_KEY, 0x000a0501,	{KEY_KBDILLUMTOGGLE}},
> > -
> > -	/* Xiaomi G Command Center */
> > -	{KE_KEY, 0x00010a01,	{KEY_VENDOR}},
> > -
> > -	/* OEM preset power mode: 1=Balanced 2=Silent 3=Turbo 4=Full speed */
> > -	{KE_KEY, 0x00011601,	{KEY_PERFORMANCE}},
> > -	{KE_KEY, 0x00021601,	{KEY_PERFORMANCE}},
> > -	{KE_KEY, 0x00031601,	{KEY_PERFORMANCE}},
> > -	{KE_KEY, 0x00041601,	{KEY_PERFORMANCE}},
> In drivers/platform/x86/redmi-wmi.c, redmi_wmi_notify() reported these
> keyboard backlight events (event_id 0x05) as KEY_KBDILLUMTOGGLE and OEM preset
> power mode events (event_id 0x16) as KEY_PERFORMANCE through
> sparse_keymap_report_entry().
> In drivers/platform/x86/bitland-mifs-wmi.c, bitland_mifs_wmi_keymap defines
> the four WMI_EVENT_KBD_BRIGHTNESS entries for KEY_KBDILLUMTOGGLE:
> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0), {KEY_KBDILLUMTOGGLE} },
> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0), {KEY_KBDILLUMTOGGLE} },
> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 5, 0), {KEY_KBDILLUMTOGGLE} },
> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x0a, 0), {KEY_KBDILLUMTOGGLE} },
> However, bitland_mifs_wmi_notify() returns early for both
> WMI_EVENT_KBD_BRIGHTNESS and WMI_EVENT_PERFORMANCE_PLAN_ALT before reaching
> bitland_mifs_wmi_report_key():
> 	switch (event->event_id) {
> 	case WMI_EVENT_KBD_BRIGHTNESS:
> 		brightness = event->value_low;
> 		blocking_notifier_call_chain(&bitland_notifier_list,
> 					     BITLAND_NOTIFY_KBD_BRIGHTNESS,
> 					     &brightness);
> 		return;
> 	case WMI_EVENT_PERFORMANCE_PLAN:
> 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
> 		blocking_notifier_call_chain(&bitland_notifier_list,
> 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
> 					     NULL);
> 		return;
> 	...
> 	}
> 	payload = get_unaligned_le32(buffer->data);
> 	bitland_mifs_wmi_report_key(wdev, payload);
> Does this early return leave the WMI_EVENT_KBD_BRIGHTNESS entries in
> bitland_mifs_wmi_keymap unreachable and cause a regression on Redmibook
> laptops (especially models that only expose BITLAND_EVENT_GUID without the
> BITLAND_MIFS_GUID control device) when pressing the keyboard backlight or
> power mode hotkeys?
> [ ... ]

Don't actually agree with sashiko, if we report the key to the
userspace, when WMs handle the KEY_KBDILLUMTOGGLE key, the keyboard
light will be triggered twice if the firmware already respond to the event,
which is not expected.

So the question is, does the firmware respond the KBD_BRIGHTNESS event?
And should we report this key to userspace?

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
 drivers/platform/x86/Kconfig            |  15 +-
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 353 +++++++++++++++++-------
 drivers/platform/x86/redmi-wmi.c        | 154 -----------
 5 files changed, 259 insertions(+), 271 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 9d3475065167197742b0882aff21cf8e78393277
-- 
2.56.0

