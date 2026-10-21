Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577754;
	b=kyPk9nC2HmqTSHn14oJ60CWezyJFLWe7O8oSu6ZcbgIoSVI6Oi67SPUSlJnrIZIjOEtW
	 yRxPWua67iOGcx9Imk2q0Qo49h1GZOu9ETKOqvE2LT+e99LgGqKBcOsUu8x1jPOOTT5hM
	 C+76KIVoovvNTUzIN7zIWz8JfeXl/cbkRg+VAUTFQe7xjALW0yueJLkCeuZviGmm6rV/w
	 kIsp9nGMmT5aw2BWf9KxSrBGFyNFYw0k9iv1vnmBnH3lEPIgmGzeIRMxs4uGbepFQk+Mv
	 eIFcTs6WBD+dB898TvCXr0IQbo1UpZIWa/+5YOGLUFcB8YuUDD6cN6tmHuBNlNHF9fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577754;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=OgMHZaXBZqmzmAFfdwaCX1dBGKamnihtUq3ZFISLsz0=;
	b=FR70+DkhitfmBbgZu4Dg/vZIp92HljErl/XtI0WbYIy2NexxQwAxJJSJDjx1LpRE9Ogo
	 S4yeWHhKriLFPEqvfltnMfYaTchK14nwlbFexQeGECprMOTWOGGkUH1jtQCJAFV1wVUYG
	 wmEIp/bpfV/VJnZb5Q0LY14VQoXZUW6uLd+hFzv9yZTJJk8kiWvNjDxmc7/QlOW0c/azT
	 JZA8D66vweu53nJ65e8qOoHvYWq4Uk+AVIna7A5wa4ssmMDINGtS69ntoRUl+9UOvReGW
	 lXT0RcpV83aIW3ygLzz8+7/f3KuuwYC7Yr4PsJDu0Cp+d8ItRGLsuVflvx7El+LYXOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WYoT6PZ0;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86585606A32C;
	Wed, 21 Oct 2026 10:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86585606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WYoT6PZ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792577754; x=1824113754;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/6JuKXN0BhnHzfwk6lhEplsVokmPryH+w8nl4F8DTm0=;
  b=WYoT6PZ0JtwS7uPJO8KPd7A43xqs1vsFzbGfrbsEIQEGuUVLscNFtGFm
   Hmhqa/TQSJkaFNi60pW0ivhXFqLk2kcmpoUJHlzNStnEfEMFBXS3pcb87
   fA9DJ8V1MdwERJkvg3fhpT7/Vm1CsBJ2DHlziNzLF0WnPpSAE3YPJtbA3
   dXT6Acy7jMikBNFAYBianhbgKK74OIQmuQVDEiq761CiZM24dzgFIaZVT
   rWNy2/NvmlocjDePXGcjqJQ1mqa+fTS8zdRycHefC7xW1k2xcQToe9d43
   dJliqVM9bdvbsy/ef8ARTqVq19vT2fI0L/oeSiY2jLkQuS3iCIBLw8Z00
   g==;
X-CSE-ConnectionGUID: edRJbbTHS56axl83tmmi8w==
X-CSE-MsgGUID: YmVPel+aQGKje1cZqdGpGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1309135"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1309135"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 03:15:53 -0700
X-CSE-ConnectionGUID: ZQ8RM/aHTOChhWixpIFqQA==
X-CSE-MsgGUID: 47c2YtIxTsac4KLmJv7AoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3401190"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 03:15:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 Oct 2026 13:15:45 +0300 (EEST)
To: Denis Benato <denis.benato@linux.dev>, 
    Idotoho Reimon Simanjuntak <idotohors@gmail.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH v3 1/3] platform/x86: asus-wmi: use named masks for TUF
 RGB commands
In-Reply-To: <3e0e1a74-b6bf-426c-9248-4debddb15e70@linux.dev>
Message-ID: <2a505332-9b6f-9e30-742b-747c751d2320@linux.intel.com>
References: <20260902174718.16228-1-idotohors@gmail.com> <20260902174718.16228-2-idotohors@gmail.com> <3e0e1a74-b6bf-426c-9248-4debddb15e70@linux.dev>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-745815525-1792577745=:1258"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-745815525-1792577745=:1258
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 2 Sep 2026, Denis Benato wrote:
> On 9/2/26 19:47, Idotoho Reimon Simanjuntak wrote:
> > Replace open-coded bit shifts and magic numbers in kbd_rgb_mode_store()
> > and kbd_rgb_state_store() with FIELD_PREP() and named GENMASK() masks.
> >
> > Define ASUS_WMI_TUF_RGB_STATE_CMD_ID (0xbd) as a named constant instead
> > of an inline literal, making the required arg0 command ID self-document=
ing.
> >
> > In kbd_rgb_state_store(), remove the unused intermediate "flags" variab=
le
> > entirely. The old BIT(1)/BIT(3)/BIT(5)/BIT(7) construction is replaced =
by
> > FIELD_PREP with per-flag named masks (TUF_RGB_STATE_BOOT, _AWAKE, _SLEE=
P,
> > _KEYBOARD), building arg0 directly. This preserves the exact sysfs inpu=
t
> > format ("cmd boot awake sleep keyboard") and the resulting WMI argument
> > bit layout =E2=80=94 no behavioral change.
> >
> > In kbd_rgb_mode_store(), replace the positional shift expressions for
> > arg1 and arg2 with FIELD_PREP using TUF_RGB_MODE_{CMD,MODE,RED,GREEN}
> > and TUF_RGB_MODE_{BLUE,SPEED} masks respectively.
> >
> > This is a preparatory cleanup to improve readability before adding
> > model-specific quirks that depend on these definitions.
> I can see that there is some code that I wrote and Ilpo already
> reviewed: when you use the work of someone you have to include
> his Signed-off-by (that has to be present in the original patch).
>=20
> I already know that this works because I tried it in my TUF
> when I wrote it:
>=20
> Reviewed-by: Denis Benato <denis.benato@linux.dev>

Hi,

I cannot knowingly take patches with unclear authorship so please clear=20
that part first before resubmitting.

> > Signed-off-by: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
> > ---
> >  drivers/platform/x86/asus-wmi.c | 48 ++++++++++++++++++++++++++-------
> >  1 file changed, 38 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asu=
s-wmi.c
> > index a65090429..efc730c2c 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -15,6 +15,7 @@
> > =20
> >  #include <linux/acpi.h>
> >  #include <linux/backlight.h>
> > +#include <linux/bitfield.h>
> >  #include <linux/bits.h>
> >  #include <linux/debugfs.h>
> >  #include <linux/delay.h>
> > @@ -1047,6 +1048,27 @@ static DEVICE_ATTR_RW(gpu_mux_mode);
> >  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> > =20
> >  /* TUF Laptop Keyboard RGB Modes *************************************=
*********/
> > +
> > +/* Command IDs passed in arg0 byte 0 for TUF RGB WMI methods */
> > +#define ASUS_WMI_TUF_RGB_STATE_CMD_ID=090xbd
> > +
> > +/* Bit mask for the save-to-BIOS command flag in kbd_rgb_state_store (=
arg0 bit 10) */
> > +#define TUF_RGB_STATE_SAVE=09GENMASK(10, 10)

That GENMASK() is same as BIT(10), the latter form is preferred.

> > +
> > +/* Bit masks for kbd_rgb_state_store flags field (arg0 bits [23:16]) *=
/
> > +#define TUF_RGB_STATE_BOOT=09GENMASK(17, 17)
> > +#define TUF_RGB_STATE_AWAKE=09GENMASK(19, 19)
> > +#define TUF_RGB_STATE_SLEEP=09GENMASK(21, 21)
> > +#define TUF_RGB_STATE_KEYBOARD=09GENMASK(23, 23)

These we implemented by another developer in the meantime slightly=20
differently. Please base the refresh of this series on the code I've in=20
the review-ilpo-next branch (the changes in review-ilpo-next will=20
propagate into the for-next branch in a few days if LKP build test okays=20
it).

> > +
> > +/* Bit masks for kbd_rgb_mode_store fields */
> > +#define TUF_RGB_MODE_CMD=09GENMASK(7, 0)
> > +#define TUF_RGB_MODE_MODE=09GENMASK(15, 8)
> > +#define TUF_RGB_MODE_RED=09GENMASK(23, 16)
> > +#define TUF_RGB_MODE_GREEN=09GENMASK(31, 24)
> > +#define TUF_RGB_MODE_BLUE=09GENMASK(7, 0)
> > +#define TUF_RGB_MODE_SPEED=09GENMASK(15, 8)

These seem still useful even after the changes I've already accepted.

> >  static ssize_t kbd_rgb_mode_store(struct device *dev,
> >  =09=09=09=09 struct device_attribute *attr,
> >  =09=09=09=09 const char *buf, size_t count)
> > @@ -1093,7 +1115,12 @@ static ssize_t kbd_rgb_mode_store(struct device =
*dev,
> >  =09}
> > =20
> >  =09err =3D asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS, asus->kbd=
_rgb_dev,
> > -=09=09=09cmd | (mode << 8) | (r << 16) | (g << 24), b | (speed << 8), =
NULL);
> > +=09=09=09FIELD_PREP(TUF_RGB_MODE_CMD, cmd) |
> > +=09=09=09FIELD_PREP(TUF_RGB_MODE_MODE, mode) |
> > +=09=09=09FIELD_PREP(TUF_RGB_MODE_RED, r) |
> > +=09=09=09FIELD_PREP(TUF_RGB_MODE_GREEN, g),
> > +=09=09=09FIELD_PREP(TUF_RGB_MODE_BLUE, b) |
> > +=09=09=09FIELD_PREP(TUF_RGB_MODE_SPEED, speed), NULL);
> >  =09if (err)
> >  =09=09return err;
> > =20
> > @@ -1119,28 +1146,29 @@ static ssize_t kbd_rgb_state_store(struct devic=
e *dev,
> >  =09=09=09=09 struct device_attribute *attr,
> >  =09=09=09=09 const char *buf, size_t count)
> >  {
> > -=09u32 flags, cmd, boot, awake, sleep, keyboard;
> > +=09u32 cmd, boot, awake, sleep, keyboard;
> > +=09u32 arg0;
> >  =09int err;
> > =20
> >  =09if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &key=
board) !=3D 5)
> >  =09=09return -EINVAL;
> > =20
> > +=09arg0 =3D ASUS_WMI_TUF_RGB_STATE_CMD_ID;
> > +
> >  =09if (cmd)
> > -=09=09cmd =3D BIT(2);
> > +=09=09arg0 |=3D FIELD_PREP(TUF_RGB_STATE_SAVE, 1);
> > =20
> > -=09flags =3D 0;
> >  =09if (boot)
> > -=09=09flags |=3D BIT(1);
> > +=09=09arg0 |=3D FIELD_PREP(TUF_RGB_STATE_BOOT, 1);
> >  =09if (awake)
> > -=09=09flags |=3D BIT(3);
> > +=09=09arg0 |=3D FIELD_PREP(TUF_RGB_STATE_AWAKE, 1);
> >  =09if (sleep)
> > -=09=09flags |=3D BIT(5);
> > +=09=09arg0 |=3D FIELD_PREP(TUF_RGB_STATE_SLEEP, 1);
> >  =09if (keyboard)
> > -=09=09flags |=3D BIT(7);
> > +=09=09arg0 |=3D FIELD_PREP(TUF_RGB_STATE_KEYBOARD, 1);
> > =20
> > -=09/* 0xbd is the required default arg0 for the method. Nothing happen=
s otherwise */
> >  =09err =3D asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
> > -=09=09=09ASUS_WMI_DEVID_TUF_RGB_STATE, 0xbd | cmd << 8 | (flags << 16)=
, 0, NULL);
> > +=09=09=09ASUS_WMI_DEVID_TUF_RGB_STATE, arg0, 0, NULL);
> >  =09if (err)
> >  =09=09return err;
> > =20
>=20

--=20
 i.

--8323328-745815525-1792577745=:1258--
