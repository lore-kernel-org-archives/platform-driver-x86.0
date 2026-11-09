Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229801;
	b=aQgLBSWIhaNgChllv+e5O9BE4XxhFe3NgZuBrgwaWdu7Zcj5VjrUGslthvAmTpbGe3st
	 MgaiTpqkb+SvGMNOptLCA5rGFuUGodPIn1/z7o3Ea4E3HKHRTRQht2U6RaXKOSDB9n4s1
	 wK3tEBligx3XwtolhHiTEl5iC3O8O0mMyo7VnuQqsCdclgvnldQF72cRQIQS33oj9GpXN
	 QHnlHbbGC/aqcXfM3YjDiA57gVWza03Guso6CDfNf+oSsBibQRM46kzhdtOYXTup1Xoh4
	 3ZDyI1e44z1v6GIFDuENI4bFh/IGjnPRIDRChR/78j1b6aVikVf/FSlD60pJ2bozSxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229801;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=SJuA2eo6uR76B6sKhvwiziqb98sLe2g/R7fitHG8RHk=;
	b=2TwKDyZSUe4lUpIK8keMxGJ/phBakeGG6vI6XzoTgYr2BVodpdIZ0ghb/RYaOJsZQMY/
	 M1ZRU6189veUmkDQpHft7o6wCEP9CFU9ApZ9L4K8s/V3lXLao3PI5MiQVzUbS0VDSbqXU
	 0GGAfgtIxOV1qR8hY12pBmnmUz+qdndDPsTlHgBYhM4AwTLdgB6I2pWn2cWoZ8KTlEHm6
	 c9NR5RkuVo4I2dEZn7vTrC4hJNktZZBdkUkC3JrhiLT/+IuMl8JmSoQelVprdxVgXY9hr
	 QuPdSzBlsKe9N5JNRMr95cAWC+JylkjQesUij+jK3vrjK+wqMSfqrSS068NDq+ajtBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UG5NP1cR;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA8606D81E;
	Mon,  9 Nov 2026 13:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9DA8606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UG5NP1cR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794229801; x=1825765801;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XJ7iZ/9hFNImc1k1Vj7ucIG66KJl2z1iCynktLOfDCs=;
  b=UG5NP1cR7NEKA+j8Npf5Vz09F7w7ziBG/2OngPu+qHc09ccl2Y6QZUmb
   p0TCF5Uxh+TBb8AFVxLGZm003p62J2MoWJZpz6JeHJldKRR5gJ4b95HdX
   FyQNAuW74xQlP7/nia/IJ49KUmDUUTHXPfUxUegDlzLK+7aZXjI2zyv1s
   yO80MAQobAmXwVnZpfMLXe75eQYbKDeufytMvwkytNYwTvtQkBOzMUHNq
   Nege1OBz7HJGAUgtIdItHHEDvz8LScS3dqwTSGCy2eC/SsShahpzp8rmt
   iGc+t+C4YUyV5qf4SVCWaezcQHqeuO4QQeihHFdU9oWUqoIgRP0gGMir3
   w==;
X-CSE-ConnectionGUID: +gDDIiuESuCYUciZSYXIpw==
X-CSE-MsgGUID: pLNmJMO/TommVbmMwP6/qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2983694"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2983694"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 05:10:01 -0800
X-CSE-ConnectionGUID: AvKixOjaRGa3X8TDSM/ahQ==
X-CSE-MsgGUID: JMxOpLjPQe2nZYUkGdHVww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="9720114"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.139])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 05:09:52 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 9 Nov 2026 15:09:48 +0200 (EET)
To: Mingyou Chen <qby140326@gmail.com>
cc: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Hans de Goede <hansg@kernel.org>, 
    Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>, 
    platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>, 
    Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, 
    Chris Taraszka <chris@miget.com>, 
    Matias Civadda <matias.civadda2342001@gmail.com>, 
    =?ISO-2022-JP?Q?=1B$B9b=1B=28J_=1B$B=3DSJ8=1B=28J?= <btx342@gmail.com>, 
    powerfullz <wleizc7319@gmail.com>, 
    =?GB2312?B?y+8g0/7D+g==?= <wolf109909@outlook.com>, 
    =?ISO-8859-15?Q?Milo=A8_Vlku?= <vlku.milos.fun@gmail.com>, 
    Rsplwe <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>, 
    Anton Karasev <uselessfire@gmail.com>, Jame Jao <jaojame6@gmail.com>, 
    Serhiy Shliapuhin <shlyapugin@gmail.com>
Subject: Re: [PATCH v15 0/6] Merge redmi-wmi into bitland-mifs-wmi
In-Reply-To: <20261028112742.674847-1-qby140326@gmail.com>
Message-ID: <c502f0d3-9ae1-51e2-4410-9f3d532a5d49@linux.intel.com>
References: <20261028112742.674847-1-qby140326@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Oct 2026, Mingyou Chen wrote:

> This patch series consolidates the standalone 'redmi-wmi' driver into the
> 'bitland-mifs-wmi' driver to eliminate code duplication and centralize
> the maintenance of overlapping ACPI WMI event streams.
> 
> Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
> platforms share the exact same keyboard event stream WMI GUID
> (46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
> the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
> it into discrete type/id/value fields.
> 
> Redmi operations were not contained in this patch series, future reverse
> engineering is required.
> 
> This series introduce a newly reported mic-mute hotkey definition
> for Redmibooks, dropped the previous redmi-wmi driver and intrudoced
> the quirks table for the bitland-mifs-wmi driver.
> 
> I don't have a Redmi or other Bitland device. So I cannot work on the
> real device.
> 
> Features are working properly on my device (Lecoo Bellator N176).
> 
> I leave the future reverse engineering work to the community.
> 
> Tests are welcome.
> 
> And by the way, the no_set member in bitland_profile_entry means a
> platform profile is only report by the firmware but not available for
> set.
> 
> > And I've got a question, from sashiko's comment in my v12
> > 
> > https://sashiko.dev/#/patchset/20261012133648.132363-1-qby140326%40gmail.com
> > 
> > > Will this result in the loss of KEY_PERFORMANCE events on event-only legacy
> > > devices?
> > > Looking at bitland_mifs_wmi_probe() in drivers/platform/x86/bitland-mifs-wmi.c,
> > > if dev_type == BITLAND_WMI_EVENT, it returns early after registering the input
> > > device:
> > > 	if (dev_type == BITLAND_WMI_EVENT) {
> > > 		/* Register input device for hotkeys */
> > > 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
> > > 		...
> > > 		return input_register_device(drv_data->input_dev);
> > > 	}
> > > When the performance key is pressed, bitland_mifs_wmi_notify() intercepts it,
> > > invokes the bitland_notifier_list, and returns without reporting an input event:
> > > 	case WMI_EVENT_PERFORMANCE_PLAN:
> > > 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
> > > 		blocking_notifier_call_chain(&bitland_notifier_list,
> > > 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
> > > 					     NULL);
> > > 		return;
> > > Because the platform profile and notifier were not registered during probe
> > > for event-only devices, does this mean the events are silently dropped instead
> > > of emitting KEY_PERFORMANCE like the old driver did?
> > 
> > I ackknowledged that KEY_PERFORMANCE (WMI_EVENT_PERFORMANCE_PLAN_ALT in
> > bitland-mifs-wmi) looks like an event in this LKML thread
> > 
> > > Since the event reports a change that has already happened,
> > > platform_profile_notify() is the natural way to pass it on, as
> > > suggested in my v6 reply: power-profiles-daemon then re-reads the
> > > profile, which is harmless after the driver's own writes too. If
> > > KEY_PERFORMANCE should stay for on-screen displays (Ibragim asked to
> > > keep these events observable), it may be worth not reporting it for the
> > > event that echoes the driver's own write, or at least saying in a
> > > comment that it reports a mode change that already happened. On
> > > Ibragim's TM2209 the profile SET is reported not to work [3], so there
> > > 0x16 can only come from Fn+K and the echo does not exist; Ibragim, can
> > > you confirm?
> > 
> > https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/
> > 
> > So should I follow sashiko's advice?

Do you find Hans' earlier feedback on this not actionable? Or did you miss 
it.

Copying long walls of text from sashiko's findings for an older version to 
the cover letter might not be the best approach in general. Usually, we 
want to get the issues addressed before sending the next version so that 
discussion should have occurred in the thread for the previous version.

> > And some remaining comments from sashiko's review of my v13:
> > 
> > > > -	/* Keyboard backlight: Off / Auto / Low / High (new state in byte 2) */
> > > > -	{KE_KEY, 0x00000501,	{KEY_KBDILLUMTOGGLE}},
> > > > -	{KE_KEY, 0x00800501,	{KEY_KBDILLUMTOGGLE}},
> > > > -	{KE_KEY, 0x00050501,	{KEY_KBDILLUMTOGGLE}},
> > > > -	{KE_KEY, 0x000a0501,	{KEY_KBDILLUMTOGGLE}},
> > > > -
> > > > -	/* Xiaomi G Command Center */
> > > > -	{KE_KEY, 0x00010a01,	{KEY_VENDOR}},
> > > > -
> > > > -	/* OEM preset power mode: 1=Balanced 2=Silent 3=Turbo 4=Full speed */
> > > > -	{KE_KEY, 0x00011601,	{KEY_PERFORMANCE}},
> > > > -	{KE_KEY, 0x00021601,	{KEY_PERFORMANCE}},
> > > > -	{KE_KEY, 0x00031601,	{KEY_PERFORMANCE}},
> > > > -	{KE_KEY, 0x00041601,	{KEY_PERFORMANCE}},
> > > In drivers/platform/x86/redmi-wmi.c, redmi_wmi_notify() reported these
> > > keyboard backlight events (event_id 0x05) as KEY_KBDILLUMTOGGLE and OEM preset
> > > power mode events (event_id 0x16) as KEY_PERFORMANCE through
> > > sparse_keymap_report_entry().
> > > In drivers/platform/x86/bitland-mifs-wmi.c, bitland_mifs_wmi_keymap defines
> > > the four WMI_EVENT_KBD_BRIGHTNESS entries for KEY_KBDILLUMTOGGLE:
> > > 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0), {KEY_KBDILLUMTOGGLE} },
> > > 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0), {KEY_KBDILLUMTOGGLE} },
> > > 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 5, 0), {KEY_KBDILLUMTOGGLE} },
> > > 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x0a, 0), {KEY_KBDILLUMTOGGLE} },
> > > However, bitland_mifs_wmi_notify() returns early for both
> > > WMI_EVENT_KBD_BRIGHTNESS and WMI_EVENT_PERFORMANCE_PLAN_ALT before reaching
> > > bitland_mifs_wmi_report_key():
> > > 	switch (event->event_id) {
> > > 	case WMI_EVENT_KBD_BRIGHTNESS:
> > > 		brightness = event->value_low;
> > > 		blocking_notifier_call_chain(&bitland_notifier_list,
> > > 					     BITLAND_NOTIFY_KBD_BRIGHTNESS,
> > > 					     &brightness);
> > > 		return;
> > > 	case WMI_EVENT_PERFORMANCE_PLAN:
> > > 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
> > > 		blocking_notifier_call_chain(&bitland_notifier_list,
> > > 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
> > > 					     NULL);
> > > 		return;
> > > 	...
> > > 	}
> > > 	payload = get_unaligned_le32(buffer->data);
> > > 	bitland_mifs_wmi_report_key(wdev, payload);
> > > Does this early return leave the WMI_EVENT_KBD_BRIGHTNESS entries in
> > > bitland_mifs_wmi_keymap unreachable and cause a regression on Redmibook
> > > laptops (especially models that only expose BITLAND_EVENT_GUID without the
> > > BITLAND_MIFS_GUID control device) when pressing the keyboard backlight or
> > > power mode hotkeys?
> > > [ ... ]
> > 
> > Don't actually agree with sashiko, if we report the key to the
> > userspace, when WMs handle the KEY_KBDILLUMTOGGLE key, the keyboard
> > light will be triggered twice if the firmware already respond to the event,
> > which is not expected.
> > 
> > So the question is, does the firmware respond the KBD_BRIGHTNESS event?
> > And should we report this key to userspace?
> 
> >From Chris' comment:
> 
> > - Fn+Space (keyboard backlight) sends no WMI event at all, neither 0x05
> >   nor anything else, and does not change the backlight under Linux. So
> >   this model cannot tell whether the firmware handles KBD_BRIGHTNESS.
> > 
> > - Fn+K sends event 0x28 with value_low 0x01 on every press (01 28 01 00),
> >   not 0x16. The firmware does not change the mode by itself: the
> >   SystemPerMode value (EC 0x68) stays the same across the presses. If
> >   0x28 is the performance mode key on this model, it is a request rather
> >   than a notification, so platform_profile_cycle() would fit. 0x28 is
> >   currently logged as "Unknown WMI event".
> > 
> > - On Windows on the same machine, with Xiaomi PC Manager not running
> >   (it fails to start on this install), neither Fn+K nor Fn+Space does
> >   anything either. So Fn+K looks like a request that Xiaomi's software
> >   normally acts on, not a mode change made by the firmware.
> 
> I think different models have different behaviors on this.
> Should we add a quirk item?

For different behaviors, it may well be possible we need a quirk.

But it would be nice to get this refactoring out of the way relatively 
soon as it has been blocking lots of other bitland patches and I'm a bit 
worried the scope of this work is expanding beyond what an initial 
refactor change would need.

If Chris' device lacks support without his series, this refactoring 
shouldn't have to care about that yet as long as it doesn't intentionally 
make decisions we need to change right away. New quirks on top of this 
refactoring to support a previously unsupported model is not a problem but 
too limiting thermal profile mapping would have been problematic as we'd 
have immediately had to rework the mapper.

-- 
 i.

> v15:
> Fix the build issue reported by kernel-test-bot
> https://lore.kernel.org/oe-kbuild-all/202610270608.l51GVbZ8-lkp@intel.com/
> 
> v14:
> Drop the accept_zero_function quirk based on Chris' comment
> https://lore.kernel.org/lkml/CAAcRvKPSk5FYzZGkw12cPVGkxWVGFACwRvupBDDNae7B_JwF0A@mail.gmail.com/
> 
> v13:
> Fix the zero function value problem find on my device
> Fix the memcpy size issue
> Remove WMI_EVENT_PERFORMANCE_PLAN_ALT in the keymap
> Select BITLAND_MIFS_WMI and deprecate REDMI_WMI instead remove the
> config entry
> 
> v12:
> Fix the issues mentioned in https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/ .
> Copy payload_data to output->data at bitland_mifs_wmi_call, not
> overwrite the entire struct.
> Correct the key name (Mic Mute) in the commit message of
> "platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries"
> and my device doesn't have a FN-ESC key, so I renamed the enum variant to
> WMI_EVENT_MIC_MUTE.
> 
> v11:
> Add missing return_code_at_end and accept_zero_function logic
> Fallback to balanced platform profile if resume to performance failed
> 
> v10:
> Replace the previous "profile table" with dmi quirk table
> 
> v9:
> Add the missing feature introduced in the commit
> e0d6312578e1 ("platform/x86: redmi-wmi: report EC state change events").
> 
> v8:
> Correct Ilya Gladyshev's email address in the MAINTAINERS entry
> 
> v7:
> Swap low bit and high bit for WMI_EVENT_KBD_BRIGHTNESS
> in bitland_mifs_wmi_keymap
> 0x00800501 -> BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0),
> 
> Report KEY_FN_ESC when WMI_EVENT_FNLOCK_STATE events received
> Rename the reserved names
> Use Xmas tree order in bitland_mifs_wmi_notify
> Collect the Tested-by and Reviewed-by tags
> 
> v6:
> Drop the wrong Redmi ops
> 
> v5:
> Correct Xiaomi DMI vendor name
> 
> v4:
> Map PLATFORM_PROFILE_PERFORMANCE to wmi performance mode if the device
> doesn't support full-speed mode.
> 
> 
> Mingyou Chen (6):
>   MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
>   platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
>     the bitland driver
>   platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
>   platform/x86: redmi-wmi: Drop redmi-wmi driver
>   platform/x86: bitland-mifs-wmi: Add quirks table
>   platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile
>     if last performance profile is not available
> 
>  MAINTAINERS                             |   7 +-
>  drivers/platform/x86/Kconfig            |  13 +-
>  drivers/platform/x86/Makefile           |   1 -
>  drivers/platform/x86/bitland-mifs-wmi.c | 353 +++++++++++++++++-------
>  drivers/platform/x86/redmi-wmi.c        | 154 -----------
>  5 files changed, 256 insertions(+), 272 deletions(-)
>  delete mode 100644 drivers/platform/x86/redmi-wmi.c
> 
> 
> base-commit: 9d3475065167197742b0882aff21cf8e78393277
> 
