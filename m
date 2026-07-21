Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8D931B803;
	Tue, 21 Jul 2026 16:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784652468; cv=none; b=V5CcoVh4yKsLoBnBSVKEITdSdz+Ds2JUOWLmvq6SsRfog5VXfd6yW4LgvQutJbyVItYchKlZePLYvcRJ2XtBCAm614tWFaxpRPHbKm7yikMOiHqzABEua8wB9DZHH25MfI66kMGmBp0IW7803nVGjhK3FoZ72+w4qsKJCB1gEx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784652468; c=relaxed/simple;
	bh=9aTcOenferaVgMf/wYCcLIPWt8GbhVyopqbSwG5y35I=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nNCaoP5+U+lDIo4lSBpsc4RoViT+HFXoROvvDt82LDMKAuCTQ8G0bgcmJdh1lfih4nFpsNoanKVxZl6D9lgJrakCdxB+B5ZbhPSIZS0u6Xbf0PWe+H9F2iwknNdxfOqc7r0wjfvUvn7NauxpTAy9C4Lj0F1ZIcXm8+Fkkatn3+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pj5PmEyq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pj5PmEyq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784652466; x=1816188466;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=9aTcOenferaVgMf/wYCcLIPWt8GbhVyopqbSwG5y35I=;
  b=Pj5PmEyqOPi73TlZxn61A1283Dgmuj3+CweZhop513t9YSCC8jayg8YZ
   D8Gf9tR8RmeQ/tB615SVrI/P9xbSB3COMrFS9hC8hkl8qvRhNFKPfgkNk
   cVDp0g8O8QWU1n3qOuCg6Wilgd66TTV0h5zaC2HmNS6TgppYbjKwMwa5R
   DSwtb+OjTH4xLWpuIQ6BuvUXtqSYwgGO6cMQlUQe/wrAz+e9Iac1x39An
   1JyhJF/PE3AQmsNUWS1JS0ijR46Iwd81NHa9E4SfdfHLR5tVHIillaNlW
   slBEU4/qEh2+xoiqdBdkKARpExU9ksgYjE2IoTAR0WoyBpqxwICoc4m5k
   g==;
X-CSE-ConnectionGUID: TWWGwgmgSkSa6lyni1Mzsw==
X-CSE-MsgGUID: XYx+J3CXQ5mveciGrJUGvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="108049960"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="108049960"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 09:47:45 -0700
X-CSE-ConnectionGUID: IIvQkrOCSWeoYhr8QGjW+Q==
X-CSE-MsgGUID: DzPmqPK6Tfa/5/5qA51MMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="257271890"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 09:47:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 19:47:39 +0300 (EEST)
To: Musaev Ibragim <atomicus.xyz@gmail.com>
cc: Gladyshev Ilya <foxido@foxido.dev>, Hans de Goede <hansg@kernel.org>, 
    Mingyou Chen <qby140326@gmail.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: redmi-wmi: report EC state change events
In-Reply-To: <178405473606.25865.4048095379503614221@gmail.com>
Message-ID: <0dccec1c-d0f2-f043-3176-728c53791f3d@linux.intel.com>
References: <178405473606.25865.4048095379503614221@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-814024303-1784652173=:1265"
Content-ID: <19f94048-494e-1536-6ae5-285b2859d19a@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-814024303-1784652173=:1265
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <e6241405-62b7-90d1-6ec5-368f11665d2a@linux.intel.com>

On Wed, 15 Jul 2026, Musaev Ibragim wrote:

> The Redmibook EC/firmware fully handles the keyboard backlight cycle,
> the OEM preset power mode (Fn+K) and the Fn lock toggle by itself, and
> sends a WMI event carrying the resulting state in the third payload
> byte. These events are currently swallowed with KE_IGNORE, so userspace
> never learns that the state changed and cannot give the user any
> feedback (OSD), even though the WMI event is the only notification
> channel for these EC-driven changes.
>=20
> Report them as key presses instead:
>=20
>   - keyboard backlight cycle -> KEY_KBDILLUMTOGGLE
>   - OEM preset power mode    -> KEY_PERFORMANCE
>   - Fn lock toggle           -> KEY_FN_ESC
>=20
> Desktops that only look at the keycode get the usual hotkey behaviour;
> since sparse-keymap emits MSC_SCAN with the raw payload before the key
> event, an OSD daemon can additionally recover the exact new state from
> byte 2 (e.g. backlight Off/Low/High/Auto is 0x00/0x05/0x0a/0x80).
>=20
> Note that the power mode event must keep being read from the WMI device
> in any case: on the TM2209 the ACPI event handler (EV20) applies the
> mode change as a side effect of building the event payload for _WED.
>=20
> Tested on Redmi Book Pro 15 2023 (TM2209).
>=20
> Signed-off-by: Musaev Ibragim <atomicus.xyz@gmail.com>
> ---
> A related problem noticed while testing this: bitland-mifs-wmi lists the
> same event GUID (46C93E13-EE9B-4262-8488-563BCA757FEF, BITLAND_EVENT_GUID=
)
> in its wmi_device_id table, so on a Redmibook both drivers race for the
> event device at boot and whichever probes first wins. When bitland-mifs-w=
mi
> wins, the "Redmibook WMI keys" input device never appears, and since the
> MIFS control methods don't work on this machine either (different SMM
> interface =E2=80=94 platform_profile writes fail, the kbd_backlight LED a=
lways
> reads 0), the laptop is left with no working Fn events at all until
> bitland_mifs_wmi is blacklisted. Should bitland-mifs-wmi gate its binding
> on DMI, or is another way to resolve the overlap preferred? Happy to test
> patches on TM2209.

Hi,

Like you've now noticed (I think), there's another series attempting to=20
fix the GUID problem.

I'd primarily prefer taking the GUID problem fixing series (but it=20
should make sure this too is addressed).

If the GUID problem series not finished in this cycle, I can consider this=
=20
patch instead towards the end of the cycle.

Is that fine with you?

--=20
 i.


>  drivers/platform/x86/redmi-wmi.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redm=
i-wmi.c
> index 5889863..cc82ef5 100644
> --- a/drivers/platform/x86/redmi-wmi.c
> +++ b/drivers/platform/x86/redmi-wmi.c
> @@ -29,24 +29,24 @@ static const struct key_entry redmi_wmi_keymap[] =3D =
{
>  =09{KE_KEY, 0x00011801,=09{KEY_ASSISTANT}},
>  =09{KE_KEY, 0x00011901,=09{KEY_ASSISTANT}},
> =20
> -=09/* Keyboard backlight */
> -=09{KE_IGNORE, 0x00000501, {}},
> -=09{KE_IGNORE, 0x00800501, {}},
> -=09{KE_IGNORE, 0x00050501, {}},
> -=09{KE_IGNORE, 0x000a0501, {}},
> +=09/* Keyboard backlight: Off / Auto / Low / High (new state in byte 2) =
*/
> +=09{KE_KEY, 0x00000501,=09{KEY_KBDILLUMTOGGLE}},
> +=09{KE_KEY, 0x00800501,=09{KEY_KBDILLUMTOGGLE}},
> +=09{KE_KEY, 0x00050501,=09{KEY_KBDILLUMTOGGLE}},
> +=09{KE_KEY, 0x000a0501,=09{KEY_KBDILLUMTOGGLE}},
> =20
>  =09/* Xiaomi G Command Center */
>  =09{KE_KEY, 0x00010a01,=09{KEY_VENDOR}},
> =20
> -=09/* OEM preset power mode */
> -=09{KE_IGNORE, 0x00011601, {}},
> -=09{KE_IGNORE, 0x00021601, {}},
> -=09{KE_IGNORE, 0x00031601, {}},
> -=09{KE_IGNORE, 0x00041601, {}},
> +=09/* OEM preset power mode: 1=3DBalanced 2=3DSilent 3=3DTurbo 4=3DFull =
speed */
> +=09{KE_KEY, 0x00011601,=09{KEY_PERFORMANCE}},
> +=09{KE_KEY, 0x00021601,=09{KEY_PERFORMANCE}},
> +=09{KE_KEY, 0x00031601,=09{KEY_PERFORMANCE}},
> +=09{KE_KEY, 0x00041601,=09{KEY_PERFORMANCE}},
> =20
> -=09/* Fn Lock state */
> -=09{KE_IGNORE, 0x00000701, {}},
> -=09{KE_IGNORE, 0x00010701, {}},
> +=09/* Fn Lock state: 1=3Don 0=3Doff */
> +=09{KE_KEY, 0x00000701,=09{KEY_FN_ESC}},
> +=09{KE_KEY, 0x00010701,=09{KEY_FN_ESC}},
> =20
>  =09/* Fn+`/1/2/3/4 */
>  =09{KE_KEY, 0x00011101, {KEY_F13}},
>=20
--8323328-814024303-1784652173=:1265--
