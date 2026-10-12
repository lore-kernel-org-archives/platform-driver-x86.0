Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6636D40F746;
	Mon, 12 Oct 2026 12:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808151; cv=none; b=qE0SQC45W6yIjQfkYvoThvmfCPvznPSPU414rB6Kw6yJ2mlTCOl2VpMfi/btW5ynkxMYj06Z4Nljn/jxe3LxEQYgNXQSFpHS73WokepEe3+AcnFLsqhuWlV+0ebls5E/XdnJGpyjzdrtYWhOs1vikKsnzo8YqwEcKWRfVxDFQy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808151; c=relaxed/simple;
	bh=+iXmU1LV5NuE6HQVsPl7jR6YAfGMyb3yohqo9OIfv34=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aBCOEUd3Tml7q7reIkSy8rE+PV/B6hQJuE5lsMoF5yAtnLXGcC5oWjYpBHQB64wcaTWAk5xSWxrIzg6rvT9wRAnKZ1kKNMYAxDRLH+2NcYYXID4IgdwgfEOPiv0//znP85q4JyH+Qn5kUYxhwBIBX1jGwG6Wx3LFTXXCU08U3OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0fq0mTH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0fq0mTH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791808150; x=1823344150;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+iXmU1LV5NuE6HQVsPl7jR6YAfGMyb3yohqo9OIfv34=;
  b=S0fq0mTHy7d7/UGy9t9hODQOFeUSVCZ8ps6JJL2qjJjonaPnocMG4nJO
   cwlyP2qHRjp7kyTtmU0v7Jxd276cPHvnF+NwjuPr2IqR1A80zJ0e0VjPQ
   eOMzdWA+zP0ZHBqLF/HX3Q8k3KgvGnJNDeKXSQRtD5CACJR0xPiluMjqz
   7wFj8shFQBehKMQzxXelt4G2HeDbyIS2tSUbugPiPw+Pj7HueKn/ssjSm
   MOc7vnBLDvdknWFwteZxl9SZIlCaXehNmVH+n4xcbRi/FU9uXo8CWC9dF
   IKiT299oNguVyuRATPH0gDuCRPAJQjCiEnbodF8DESKZmyC+yAoFY4IFg
   Q==;
X-CSE-ConnectionGUID: piR9PDIoRImw1pSzl2E7Vw==
X-CSE-MsgGUID: 5flw0XfgSZSHI3gwcCUU/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="524234"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="524234"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 05:29:09 -0700
X-CSE-ConnectionGUID: Ar2fpzBVQG6oppyArIJOZg==
X-CSE-MsgGUID: yFEreGruSbmMEkERdhVBTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1196198"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 05:29:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Oct 2026 15:29:01 +0300 (EEST)
To: Chris Taraszka <chris@miget.com>
cc: TuteMthCD <matias.civadda2342001@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
    Mingyou Chen <qby140326@gmail.com>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14
 platform profile values
In-Reply-To: <CAAcRvKNrRMb44p-v0-wiWQx8QiToYyKCoCzXvVku-o0RGTxEgQ@mail.gmail.com>
Message-ID: <793647dd-8835-3bb2-88f4-ddc053580bd3@linux.intel.com>
References: <20260928153902.139956-1-chris@miget.com> <5430348c-8ff3-c31a-927f-321b2cf94883@linux.intel.com> <CAAcRvKNrRMb44p-v0-wiWQx8QiToYyKCoCzXvVku-o0RGTxEgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-172006283-1791808141=:1222"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-172006283-1791808141=:1222
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 28 Sep 2026, Chris Taraszka wrote:

> Thanks, makes sense.
>=20
> Matias, one thing I ran into when trying your generic part on the
> Xiaomi Book Pro 14: its values are sparse (0x02, 0x03, 0x04, 0x09,
> 0x0a) and 0x02 and 0x0a both mean low-power. With a profile array
> indexed by the firmware value, the unused slots read back as
> PLATFORM_PROFILE_LOW_POWER (0), and the reverse lookup for low-power
> finds index 0, which this firmware ignores.
>=20
> So I'd suggest {value, profile} pairs for the shared part. I have that
> as a standalone patch on pdx86/for-next, with only the profile table
> in the quirk struct, so your response layout and AC check handling
> would go on top in your TM2107 patch. If that works for you I'll send
> it as v2 together with the Xiaomi entry, and you can base your v3 on
> it. If you'd rather own the generic patch, that's fine too, I'll
> rebase the Xiaomi part on yours.

Hi,

I've not seen v2 so far, has there been some progress with this?

(Not having the generalization seems a blocker adding many models.)

--
 i.

> On Mon, Sep 28, 2026 at 5:49=E2=80=AFPM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Mon, 28 Sep 2026, Chris Taraszka wrote:
> >
> > > The Xiaomi Book Pro 14 firmware (BIOS XMAPT4B0P0909) implements
> > > SystemPerMode with its own values. Its WMAA SET handler only acts on
> > > 0x02-0x0a and silently ignores 0 and 1, and GET returns one of 0x02,
> > > 0x03, 0x04, 0x09 or 0x0a. With the generic values:
> > >
> > >  - balanced (0) and balanced-performance (1) are no-ops,
> > >  - performance (3) selects the firmware's balanced mode,
> > >  - reading the profile fails with -EINVAL whenever the firmware is in
> > >    0x04, 0x09 or 0x0a, which it often is after boot. The failed read =
also
> > >    makes bitland_mifs_wmi_suspend() abort system suspend.
> > >
> > > The values were identified from the WMAA method in the firmware's SSD=
T
> > > and by setting each one through WMAA on AC and reading the resulting
> > > sustained package power limit from intel-rapl-mmio:
> > >
> > >   0x02  18 W  (quiet)
> > >   0x03  37 W  (balanced)
> > >   0x09  45 W
> > >   0x04  58 W  (performance)
> > >   0x0a  18 W
> > >
> > > Map low-power, balanced, balanced-performance and performance to 0x02=
,
> > > 0x03, 0x09 and 0x04 on this model. The driver never sets 0x0a, which =
is
> > > only reached through the firmware's own mode cycling, so report it as
> > > low-power.
> > >
> > > Cc: Armin Wolf <W_Armin@gmx.de>
> > > Cc: Mingyou Chen <qby140326@gmail.com>
> > > Signed-off-by: Chris Taraszka <chris@miget.com>
> > > ---
> > >
> > > Notes:
> > >     Tested on the Xiaomi Book Pro 14 on AC with bitland-mifs-wmi from=
 pdx86
> > >     for-next plus this patch, loaded on v7.3-rc5: all four profiles a=
pply
> > >     through power-profiles-daemon and the firmware mode and PL1 follo=
w
> > >     (0x03/37 W, 0x02/25 W, 0x04/56 W). The same mapping on v7.3-rc4/r=
c5
> > >     without the for-next changes was also tested on battery and acros=
s
> > >     s2idle suspend/resume, with the profile restored on resume.
> > >
> > >     This explains the -EINVAL behind my earlier "platform/x86:
> > >     bitland-mifs-wmi: Don't abort suspend when platform profile acces=
s
> > >     fails" (sent 2026-09-11): the profile read failed because of the =
unknown
> > >     mode values. That patch is still useful as a safety net.
> > >
> > >     Note that on for-next each profile change still reports -ENOMSG e=
ven
> > >     though the firmware applies it: this firmware's SET handlers leav=
e the
> > >     function id in the response at 0, which 23cc56f6dea6 ("platform/x=
86:
> > >     bitland-mifs-wmi: Detect failed function calls") rejects. I'll se=
nd a
> > >     separate fix for that.
> > >
> > >  drivers/platform/x86/bitland-mifs-wmi.c | 56 +++++++++++++++++++++++=
--
> > >  1 file changed, 52 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platfo=
rm/x86/bitland-mifs-wmi.c
> > > index dd1648b7de77..4a8e5b4e7853 100644
> > > --- a/drivers/platform/x86/bitland-mifs-wmi.c
> > > +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> > > @@ -14,6 +14,7 @@
> > >  #include <linux/dev_printk.h>
> > >  #include <linux/device.h>
> > >  #include <linux/device/devres.h>
> > > +#include <linux/dmi.h>
> > >  #include <linux/err.h>
> > >  #include <linux/hwmon.h>
> > >  #include <linux/init.h>
> > > @@ -79,6 +80,29 @@ enum bitland_mifs_power_profile {
> > >       WMI_PP_FULL_SPEED       =3D 3,
> > >  };
> > >
> > > +/*
> > > + * The Xiaomi Book Pro 14 firmware uses its own SystemPerMode values=
 and
> > > + * ignores the ones above. Sustained package power limits (PL1) meas=
ured
> > > + * on AC are noted next to each mode.
> > > + */
> > > +enum bitland_mifs_xiaomi_power_profile {
> > > +     WMI_PP_XIAOMI_QUIET             =3D 0x02, /* 18 W */
> > > +     WMI_PP_XIAOMI_BALANCED          =3D 0x03, /* 37 W */
> > > +     WMI_PP_XIAOMI_PERFORMANCE       =3D 0x04, /* 58 W */
> > > +     WMI_PP_XIAOMI_SMART             =3D 0x09, /* 45 W */
> > > +     WMI_PP_XIAOMI_QUIET_ALT         =3D 0x0a, /* 18 W */
> > > +};
> > > +
> > > +static const struct dmi_system_id bitland_mifs_xiaomi_pp_dmi_table[]=
 =3D {
> > > +     {
> > > +             .matches =3D {
> > > +                     DMI_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
> > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Xiaomi Book Pro 14=
"),
> > > +             },
> > > +     },
> > > +     { }
> > > +};
> > > +
> > >  enum bitland_mifs_event_id {
> > >       WMI_EVENT_RESERVED_1            =3D 1,
> > >       WMI_EVENT_RESERVED_2            =3D 2,
> > > @@ -161,6 +185,7 @@ struct bitland_mifs_wmi_data {
> > >       struct device *hwmon_dev;
> > >       struct device *pp_dev;
> > >       enum platform_profile_option saved_profile;
> > > +     bool xiaomi_pp;
> > >  };
> > >
> > >  static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
> > > @@ -213,6 +238,27 @@ static int laptop_profile_get(struct device *dev=
,
> > >       if (ret)
> > >               return ret;
> > >
> > > +     if (data->xiaomi_pp) {
> > > +             switch (result.data[0]) {
> > > +             case WMI_PP_XIAOMI_QUIET:
> > > +             case WMI_PP_XIAOMI_QUIET_ALT:
> > > +                     *profile =3D PLATFORM_PROFILE_LOW_POWER;
> > > +                     break;
> > > +             case WMI_PP_XIAOMI_BALANCED:
> > > +                     *profile =3D PLATFORM_PROFILE_BALANCED;
> > > +                     break;
> > > +             case WMI_PP_XIAOMI_SMART:
> > > +                     *profile =3D PLATFORM_PROFILE_BALANCED_PERFORMA=
NCE;
> > > +                     break;
> > > +             case WMI_PP_XIAOMI_PERFORMANCE:
> > > +                     *profile =3D PLATFORM_PROFILE_PERFORMANCE;
> > > +                     break;
> > > +             default:
> > > +                     return -EINVAL;
> > > +             }
> > > +             return 0;
> > > +     }
> > > +
> > >       switch (result.data[0]) {
> > >       case WMI_PP_BALANCED:
> > >               *profile =3D PLATFORM_PROFILE_BALANCED;
> > > @@ -272,22 +318,22 @@ static int laptop_profile_set(struct device *de=
v,
> > >
> > >       switch (profile) {
> > >       case PLATFORM_PROFILE_LOW_POWER:
> > > -             val =3D WMI_PP_QUIET;
> > > +             val =3D data->xiaomi_pp ? WMI_PP_XIAOMI_QUIET : WMI_PP_=
QUIET;
> > >               break;
> > >       case PLATFORM_PROFILE_BALANCED:
> > > -             val =3D WMI_PP_BALANCED;
> > > +             val =3D data->xiaomi_pp ? WMI_PP_XIAOMI_BALANCED : WMI_=
PP_BALANCED;
> > >               break;
> > >       case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> > >               ret =3D bitland_check_performance_capability(data);
> > >               if (ret)
> > >                       return ret;
> > > -             val =3D WMI_PP_PERFORMANCE;
> > > +             val =3D data->xiaomi_pp ? WMI_PP_XIAOMI_SMART : WMI_PP_=
PERFORMANCE;
> > >               break;
> > >       case PLATFORM_PROFILE_PERFORMANCE:
> > >               ret =3D bitland_check_performance_capability(data);
> > >               if (ret)
> > >                       return ret;
> > > -             val =3D WMI_PP_FULL_SPEED;
> > > +             val =3D data->xiaomi_pp ? WMI_PP_XIAOMI_PERFORMANCE : W=
MI_PP_FULL_SPEED;
> >
> >
> > Hi,
> >
> > Thanks for the patch but I won't accept device specific conditionals li=
ke
> > this done in the code. For a better approach, please see:
> >
> > bitland-mifs-wmi: Fix TM2107 profile handling
> >
> > You two could try to coordinate such that transition into the generic
> > approach is not worked by both independently.
> >
> > It might be best to extract the generalization part to own patch and bo=
th
> > then base their respective device specific patches adding new things on
> > top of that.
> >
> > --
> >  i.
> >
>=20

--=20
 i.

--8323328-172006283-1791808141=:1222--
