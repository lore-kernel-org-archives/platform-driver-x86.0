Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404128;
	b=YOYNFkVHLbQRN75ao2DAL/TH2YYZZ5IYsA12pKd+1ITGam5J8Tusvq1Wiwl56NzYituD
	 vemABXO/k6g3yhkf1WhkLMbetNNlt9/+voxWyoxx22hQ5eBzDVGu7wzI6PtMrseHYMb6x
	 Nxl9DcOj1nuE1mzayyzDNmXzDKQnr/j0rvkWTK9hv0ynByyvCrmhvKAR9hKDIgIA2A5HO
	 cgujGwKVFKdyMR8CXxthb1Awg+8wS9C7SZNoymzhSPnzRWrn9e8PrScjDRwKKTGPeHISq
	 6RgdePZ3dx6AsNz5T2Aj+QMbLL813gENarY1Jex8zQaBNhwkuCojr+Fv5eiqAc1yLxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404128;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=9oOGAKtK6RxL2MC34FwAXszHZwVhpbIMLMRhgjxUCYw=;
	b=d8j9sGKst21us5/iF3s+OBK8WOhpjMf850rwA0syeF8vxGnfyiB51t0Fw+2u7VxEhHNO
	 bc+94GSz6gXbKS0Ckj1q6d0xjjzcxSyeailwgK/W+lhnWLxNaGX9AyjUkGB1JZ6rKq57A
	 R5BCD4pcpaOgP0+17MIANtXDIE3iqKqsrLRNvRq1h0GUah6XK1irA9fC6zHZcDwhhU0xI
	 67agkEkfikpVLGEPp7FfSTNoJppKCnTs5bYD18bVoYJ8yiENGjg/NLjMXaUwMQYzfUcNK
	 EScOYFS9eFtZETqM1CT0v7TmAzuzvbqcpGDnttkKdFmwH7E6TC0R6y01l37IXwDbdEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=McPBTWLo;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A20606A321;
	Wed, 11 Nov 2026 13:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A20606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=McPBTWLo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794404127; x=1825940127;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+0EuHpMabHB5tGJS/8GXByYQDo4/GLtVN3VlA80A22c=;
  b=McPBTWLo1kNLMICl0Ef2pVHBwnEQssqKDvTUp3QlLzRstemxbQRPco1w
   W8uyrwxCHlLBvj4RjSjyEY/bB7+jY0GTxgAvFWYxtc9kYpq5o4tLPuanb
   s2NqL+W3UBuCxpJJuvxpVkORiZk4Z9QRTavoSDJgMU78MTiO1K6c/AN5t
   iq8DRiGoXemVgoWsN4MxDMfUx8jrOdbbFI/idVVMcmfjggEtFzLy6RNKs
   +vJXAEjwiiKGFXvXFuW05xpg9tqHhQxK0Ibb+nkADZocShTxbKSwTAg7R
   kJf5P9t4RcpRp/5r6FcmItFz87iRPAcLHMVjPYo5PnoZlCzlD+F9N78CT
   w==;
X-CSE-ConnectionGUID: 1r6v8hSiRkeiRURA6PFauw==
X-CSE-MsgGUID: ukiUz94YTJG8jjoNZSBDlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3055465"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3055465"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 05:35:25 -0800
X-CSE-ConnectionGUID: uiQt4h4TTLCwYpGtznrBYQ==
X-CSE-MsgGUID: rJUAxyS9Tjmin5Q3hDvuKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="10146020"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 05:35:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Nov 2026 15:35:15 +0200 (EET)
To: Mingyou Chen <qby140326@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, 
    Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>, 
    platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>, 
    Armin Wolf <W_Armin@gmx.de>, LKML <linux-kernel@vger.kernel.org>, 
    Chris Taraszka <chris@miget.com>, 
    Matias Civadda <matias.civadda2342001@gmail.com>, 
    =?ISO-2022-JP?Q?=1B$B9b=1B=28J_=1B$B=3DSJ8=1B=28J?= <btx342@gmail.com>, 
    powerfullz <wleizc7319@gmail.com>, 
    =?GB2312?B?y+8g0/7D+g==?= <wolf109909@outlook.com>, 
    =?ISO-8859-15?Q?Milo=A8_Vlku?= <vlku.milos.fun@gmail.com>, 
    Rsplwe <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>, 
    Anton Karasev <uselessfire@gmail.com>, Jame Jao <jaojame6@gmail.com>, 
    Serhiy Shliapuhin <shlyapugin@gmail.com>, okluar <okluar@gmail.com>
Subject: Re: [PATCH v15 0/6] Merge redmi-wmi into bitland-mifs-wmi
In-Reply-To: <5baeb1e2-7cc5-43dd-9408-e5f0365a08b1@gmail.com>
Message-ID: <12efd5a9-8da0-6294-4514-7e26e15737da@linux.intel.com>
References: <20261028112742.674847-1-qby140326@gmail.com> <c502f0d3-9ae1-51e2-4410-9f3d532a5d49@linux.intel.com> <5baeb1e2-7cc5-43dd-9408-e5f0365a08b1@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1139782864-1794404115=:1170"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1139782864-1794404115=:1170
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 11 Nov 2026, Mingyou Chen wrote:

> On 11/9/26 21:09, Ilpo J=C3=A4rvinen wrote:
> > On Wed, 28 Oct 2026, Mingyou Chen wrote:
> >=20
> > > > And I've got a question, from sashiko's comment in my v12
> > > >=20
> > > > https://sashiko.dev/#/patchset/20261012133648.132363-1-qby140326%40=
gmail.com
> > > >=20
> > > > > Will this result in the loss of KEY_PERFORMANCE events on event-o=
nly
> > > > > legacy
> > > > > devices?
> > > > > Looking at bitland_mifs_wmi_probe() in
> > > > > drivers/platform/x86/bitland-mifs-wmi.c,
> > > > > if dev_type =3D=3D BITLAND_WMI_EVENT, it returns early after regi=
stering
> > > > > the input
> > > > > device:
> > > > > =09if (dev_type =3D=3D BITLAND_WMI_EVENT) {
> > > > > =09=09/* Register input device for hotkeys */
> > > > > =09=09drv_data->input_dev =3D
> > > > > devm_input_allocate_device(&wdev->dev);
> > > > > =09=09...
> > > > > =09=09return input_register_device(drv_data->input_dev);
> > > > > =09}
> > > > > When the performance key is pressed, bitland_mifs_wmi_notify()
> > > > > intercepts it,
> > > > > invokes the bitland_notifier_list, and returns without reporting =
an
> > > > > input event:
> > > > > =09case WMI_EVENT_PERFORMANCE_PLAN:
> > > > > =09case WMI_EVENT_PERFORMANCE_PLAN_ALT:
> > > > > =09=09blocking_notifier_call_chain(&bitland_notifier_list,
> > > > > =09=09=09=09=09     BITLAND_NOTIFY_PLATFORM_PROFILE,
> > > > > =09=09=09=09=09     NULL);
> > > > > =09=09return;
> > > > > Because the platform profile and notifier were not registered dur=
ing
> > > > > probe
> > > > > for event-only devices, does this mean the events are silently dr=
opped
> > > > > instead
> > > > > of emitting KEY_PERFORMANCE like the old driver did?
> > > > I ackknowledged that KEY_PERFORMANCE (WMI_EVENT_PERFORMANCE_PLAN_AL=
T in
> > > > bitland-mifs-wmi) looks like an event in this LKML thread
> > > >=20
> > > > > Since the event reports a change that has already happened,
> > > > > platform_profile_notify() is the natural way to pass it on, as
> > > > > suggested in my v6 reply: power-profiles-daemon then re-reads the
> > > > > profile, which is harmless after the driver's own writes too. If
> > > > > KEY_PERFORMANCE should stay for on-screen displays (Ibragim asked=
 to
> > > > > keep these events observable), it may be worth not reporting it f=
or
> > > > > the
> > > > > event that echoes the driver's own write, or at least saying in a
> > > > > comment that it reports a mode change that already happened. On
> > > > > Ibragim's TM2209 the profile SET is reported not to work [3], so =
there
> > > > > 0x16 can only come from Fn+K and the echo does not exist; Ibragim=
, can
> > > > > you confirm?
> > > > https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gm=
ail.com/
> > > >=20
> > > > So should I follow sashiko's advice?
> > Do you find Hans' earlier feedback on this not actionable? Or did you m=
iss
> > it.

You did not reply to this question (which is my only remaining concern=20
with this series)!?


> > Copying long walls of text from sashiko's findings for an older version=
 to
> > the cover letter might not be the best approach in general. Usually, we
> > want to get the issues addressed before sending the next version so tha=
t
> > discussion should have occurred in the thread for the previous version.
> >=20
> > > > And some remaining comments from sashiko's review of my v13:
> > > >=20
> > > > > > -=09/* Keyboard backlight: Off / Auto / Low / High (new state i=
n
> > > > > > byte 2) */
> > > > > > -=09{KE_KEY, 0x00000501,=09{KEY_KBDILLUMTOGGLE}},
> > > > > > -=09{KE_KEY, 0x00800501,=09{KEY_KBDILLUMTOGGLE}},
> > > > > > -=09{KE_KEY, 0x00050501,=09{KEY_KBDILLUMTOGGLE}},
> > > > > > -=09{KE_KEY, 0x000a0501,=09{KEY_KBDILLUMTOGGLE}},
> > > > > > -
> > > > > > -=09/* Xiaomi G Command Center */
> > > > > > -=09{KE_KEY, 0x00010a01,=09{KEY_VENDOR}},
> > > > > > -
> > > > > > -=09/* OEM preset power mode: 1=3DBalanced 2=3DSilent 3=3DTurbo=
 4=3DFull
> > > > > > speed */
> > > > > > -=09{KE_KEY, 0x00011601,=09{KEY_PERFORMANCE}},
> > > > > > -=09{KE_KEY, 0x00021601,=09{KEY_PERFORMANCE}},
> > > > > > -=09{KE_KEY, 0x00031601,=09{KEY_PERFORMANCE}},
> > > > > > -=09{KE_KEY, 0x00041601,=09{KEY_PERFORMANCE}},
> > > > > In drivers/platform/x86/redmi-wmi.c, redmi_wmi_notify() reported =
these
> > > > > keyboard backlight events (event_id 0x05) as KEY_KBDILLUMTOGGLE a=
nd
> > > > > OEM preset
> > > > > power mode events (event_id 0x16) as KEY_PERFORMANCE through
> > > > > sparse_keymap_report_entry().
> > > > > In drivers/platform/x86/bitland-mifs-wmi.c, bitland_mifs_wmi_keym=
ap
> > > > > defines
> > > > > the four WMI_EVENT_KBD_BRIGHTNESS entries for KEY_KBDILLUMTOGGLE:
> > > > > =09{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0),
> > > > > {KEY_KBDILLUMTOGGLE} },
> > > > > =09{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0),
> > > > > {KEY_KBDILLUMTOGGLE} },
> > > > > =09{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 5, 0),
> > > > > {KEY_KBDILLUMTOGGLE} },
> > > > > =09{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x0a, 0),
> > > > > {KEY_KBDILLUMTOGGLE} },
> > > > > However, bitland_mifs_wmi_notify() returns early for both
> > > > > WMI_EVENT_KBD_BRIGHTNESS and WMI_EVENT_PERFORMANCE_PLAN_ALT befor=
e
> > > > > reaching
> > > > > bitland_mifs_wmi_report_key():
> > > > > =09switch (event->event_id) {
> > > > > =09case WMI_EVENT_KBD_BRIGHTNESS:
> > > > > =09=09brightness =3D event->value_low;
> > > > > =09=09blocking_notifier_call_chain(&bitland_notifier_list,
> > > > > =09=09=09=09=09     BITLAND_NOTIFY_KBD_BRIGHTNESS,
> > > > > =09=09=09=09=09     &brightness);
> > > > > =09=09return;
> > > > > =09case WMI_EVENT_PERFORMANCE_PLAN:
> > > > > =09case WMI_EVENT_PERFORMANCE_PLAN_ALT:
> > > > > =09=09blocking_notifier_call_chain(&bitland_notifier_list,
> > > > > =09=09=09=09=09     BITLAND_NOTIFY_PLATFORM_PROFILE,
> > > > > =09=09=09=09=09     NULL);
> > > > > =09=09return;
> > > > > =09...
> > > > > =09}
> > > > > =09payload =3D get_unaligned_le32(buffer->data);
> > > > > =09bitland_mifs_wmi_report_key(wdev, payload);
> > > > > Does this early return leave the WMI_EVENT_KBD_BRIGHTNESS entries=
 in
> > > > > bitland_mifs_wmi_keymap unreachable and cause a regression on
> > > > > Redmibook
> > > > > laptops (especially models that only expose BITLAND_EVENT_GUID wi=
thout
> > > > > the
> > > > > BITLAND_MIFS_GUID control device) when pressing the keyboard back=
light
> > > > > or
> > > > > power mode hotkeys?
> > > > > [ ... ]
> > > > Don't actually agree with sashiko, if we report the key to the
> > > > userspace, when WMs handle the KEY_KBDILLUMTOGGLE key, the keyboard
> > > > light will be triggered twice if the firmware already respond to th=
e
> > > > event,
> > > > which is not expected.
> > > >=20
> > > > So the question is, does the firmware respond the KBD_BRIGHTNESS ev=
ent?
> > > > And should we report this key to userspace?
> > > >From Chris' comment:
> > >=20
> > > > - Fn+Space (keyboard backlight) sends no WMI event at all, neither =
0x05
> > > >    nor anything else, and does not change the backlight under Linux=
=2E So
> > > >    this model cannot tell whether the firmware handles KBD_BRIGHTNE=
SS.
> > > >=20
> > > > - Fn+K sends event 0x28 with value_low 0x01 on every press (01 28 0=
1
> > > > 00),
> > > >    not 0x16. The firmware does not change the mode by itself: the
> > > >    SystemPerMode value (EC 0x68) stays the same across the presses.=
 If
> > > >    0x28 is the performance mode key on this model, it is a request
> > > > rather
> > > >    than a notification, so platform_profile_cycle() would fit. 0x28=
 is
> > > >    currently logged as "Unknown WMI event".
> > > >=20
> > > > - On Windows on the same machine, with Xiaomi PC Manager not runnin=
g
> > > >    (it fails to start on this install), neither Fn+K nor Fn+Space d=
oes
> > > >    anything either. So Fn+K looks like a request that Xiaomi's soft=
ware
> > > >    normally acts on, not a mode change made by the firmware.
> > > I think different models have different behaviors on this.
> > > Should we add a quirk item?
> > For different behaviors, it may well be possible we need a quirk.
>=20
> This is included in Chris' patch series.
>=20
> https://lore.kernel.org/r/20261106114300.936782-5-chris@miget.com

I know, so it shouldn't be a concern in the context of _this series_.

We'll be applying Chris' series after this one (and relatively soon after=
=20
it too, I think).

> > But it would be nice to get this refactoring out of the way relatively
> > soon as it has been blocking lots of other bitland patches and I'm a bi=
t
> > worried the scope of this work is expanding beyond what an initial
> > refactor change would need.
> >=20
> > If Chris' device lacks support without his series, this refactoring
> > shouldn't have to care about that yet as long as it doesn't intentional=
ly
> > make decisions we need to change right away. New quirks on top of this
> > refactoring to support a previously unsupported model is not a problem =
but
> > too limiting thermal profile mapping would have been problematic as we'=
d
> > have immediately had to rework the mapper.
>=20
> I think it's enough for the known cases except this [1].
>=20
> [1]
> https://lore.kernel.org/all/CAFbNUuLmaoq22pQPzrUidJ+RC2xf2u5Ovxzy5d0LQZ7o=
wH52OA@mail.gmail.com/
>=20
> I'm confused with this bug report, everything looks correctly.

My point is, that we should focus on getting this refactor series applied
first.

This again, while nice you're trying to help the report, looks future work=
=20
from the perspective of this refactor series as you again had to add=20
another profile table. That is, it is not supported until more work is=20
done, which will only happen after this series in terms of applied=20
commits.

Also, we don't need to make the rework series perfect, it will take=20
forever that way. We might still need to refactor something but I think=20
the major problem with the profiles is already dealt with and we're good=20
to go in that front.

So the only remaining concern I have is the one I reflagged above. Please=
=20
share your thoughts on that.

--=20
 i.

--8323328-1139782864-1794404115=:1170--
