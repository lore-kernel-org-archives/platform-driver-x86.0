Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003183;
	b=UVEA3hdTYU4AdBFFjODyot4kClCDViVjNB1Mb51rgXZNTHf9RU5vunF8Bi62frBVaowF
	 nwxZo4agzTnMzzPGY/MXhntGLbi/0Q3KGgA2FskIr1uoRsRlQexiDyzyXljHWy1FZ5q8U
	 jxQ11U1l7dKiOUrP7PQQymj+H25a8pxSq3tsU7kT42XAH9CWSKKT9iceSzLuBPT6GHpKG
	 /JokIDf5Ax5TYXq2YO2+BBvYkX1oZ7SgJ2vvyW76mErvKvP5buBB9Pa5aSq40GO7PXTX1
	 M3T+TH0zvIJb7TcLUNKpXs1wVssDcV4pn2xkGXcUrRoFSJAsyuhZSathCNPPZzJwP5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003183;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=XfwLIkUROrYdB4KwphfdvJCcHKrSEr7wJjah9paB9X4=;
	b=hnYTjt3wHp6G6r0PcwolKKHr+U6GDj1RWHXuhWfSsNnLPibJmgPNUN94IR0srDBjeSyn
	 XKFZei+aH1ZpOoUeDZMyk8Tv0y3uGHvZnrTlPfXF3ugDt24j5ixX+32ear0QxrFdYKN2b
	 hWkSdwp8n/uIyJ3X26n8CudVAiZN4ITsjIabYVDS98VYf1VIpZpJXX5+ABDIinE8gZ1cz
	 wUX9DpUAKgBvJ4H7uzq2btzghPeJyMFSHlL0dz1xV3Zj6KeN9PTxsrPlfhdoNIfwHzhz4
	 iJDhEVKRyQAwPq5Y9gzn2YkEYpyiwesB8JbTCqJIcChivsVdXQymzLsE3M97OwvCBow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BPJRHa5w;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A828606A31C;
	Wed, 18 Nov 2026 11:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A828606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BPJRHa5w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795003183; x=1826539183;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rxoUAVpGL7oGe6fjygtaqhJn8MRA2lCIFh+xjJ13J5w=;
  b=BPJRHa5wzfOJwYKXj/TD4B511rp5ZhS3QHEHNaE/zSDvWMzb7+U4MEbB
   vanxnar3Q04H9TW34lv6qv9yNF4O4J0RjJsNs2+W6/a344OK0HPFlwpm0
   8cJ3HKsV45YC8+2zPSTqgunr0ggncr0aWAIGpCnPg1GAQ8JVXypAriuhm
   Bu7nXCtNOJHr/yM1Ox13xwI/T0EJW2Br1l+c7Qr3OABm0eBuyIOuDpyGw
   7Ttc8UQHX8MfOQZWOaQzTM0VLL/Pgpr75uAopCltpV5sNikwuvrxVF8bh
   0LnTFP0JgZtNpXV2s9zjTOLga+T/CsUER68bDj0NM6tj0txGi5EIsLY6H
   g==;
X-CSE-ConnectionGUID: lr1yUNU1QrKTlviLSkpEOQ==
X-CSE-MsgGUID: vAAry2YUQUaMu42op/Aogg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3850209"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3850209"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:59:27 -0800
X-CSE-ConnectionGUID: qxGiH8FxRV+fheo/hfErKQ==
X-CSE-MsgGUID: MDLEJq2WSsqeMy2ZsAcGSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10366665"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.239])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:59:23 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 18 Nov 2026 13:59:20 +0200 (EET)
To: Aaron Ma <aaron.ma@canonical.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: lenovo-wmi-other: Deconflict battery
 with thinkpad_acpi
In-Reply-To: <CAJ6xRxVLMmK6Vk8h8FYbeuDSKhd_hhN=HKEkF=E5CUisimKtZw@mail.gmail.com>
Message-ID: <c549d6e3-06db-5836-82ae-06f5bdb6fdd8@linux.intel.com>
References: <20261113055726.952551-1-aaron.ma@canonical.com> <b4feb4ce-d818-c6b0-a749-4e58b92c2573@linux.intel.com> <CAJ6xRxVLMmK6Vk8h8FYbeuDSKhd_hhN=HKEkF=E5CUisimKtZw@mail.gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-467769840-1795003160=:1169"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-467769840-1795003160=:1169
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 18 Nov 2026, Aaron Ma wrote:
> On Fri, Nov 13, 2026 at 7:04=E2=80=AFPM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Fri, 13 Nov 2026, Aaron Ma wrote:
> >
> > > ThinkPads expose battery charge thresholds and charge_behaviour throu=
gh
> > > thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. T=
he
> > > Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
> > > charge_behaviour and charge_types on systems advertising those WMI
> > > capabilities.
> > >
> > > When lenovo-wmi-other registers first, thinkpad_acpi fails to create =
a
> > > duplicate charge_behaviour sysfs attribute and unregisters its batter=
y
> > > extension. Conversely, registering or updating any power_supply_ext o=
n
> > > the same battery runs sysfs_update_groups(), which removes standard
> > > power-supply attributes not owned by power_supply_core and wipes out
> > > thinkpad_acpi's charge_control_start_threshold,
> > > charge_control_end_threshold, and charge_behaviour files.
> > >
> > > Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
> > > thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
> > > per-driver table guarded by IS_ENABLED() in Kconfig, and update the
> > > force_load_psy_ext description accordingly.
> > >
> > > Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI batter=
y charge limiting")
> > > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > Co-developed-by: Rong Zhang <i@rong.moe>
> > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > > ---
> > > Changes in v3:
> > > - Wrap deconfliction table entries in #if IS_ENABLED(CONFIG_*) and dr=
op
> > >   driver_enabled, as suggested by Rong Zhang.
> > > - Group deconfliction entries per driver (HIDs list + methods list).
> > >
> > > Changes in v2:
> > > - Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
> > >   device IDs, method pairs, and driver configuration checks, as sugge=
sted
> > >   by Derek J. Clark.
> > > - Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
> > >   instead of relying only on ThinkPad ACPI device presence.
> > > - Check whether the corresponding driver is enabled before looking up
> > >   its ACPI device, including for ideapad_laptop.
> > > - Update the force_load_psy_ext description to cover both drivers.
> > >
> > > v2: https://lore.kernel.org/platform-driver-x86/20261112074823.853819=
-1-aaron.ma@canonical.com/
> > > v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285=
-1-aaron.ma@canonical.com/
> > >
> > >  drivers/platform/x86/lenovo/wmi-other.c | 66 ++++++++++++++++++++---=
--
> > >  1 file changed, 53 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platfo=
rm/x86/lenovo/wmi-other.c
> > > index bd64e7b44669d..340159df5f7cc 100644
> > > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > > @@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
> > >  static bool force_load_psy_ext;
> > >  module_param(force_load_psy_ext, bool, 0444);
> > >  MODULE_PARM_DESC(force_load_psy_ext,
> > > -     "This option will skip checking if the ideapad_laptop driver wi=
ll conflict "
> > > +     "This option will skip checking if the ideapad_laptop or thinkp=
ad_acpi driver will conflict "
> > >       "with adding an extension to set the battery charge behavior an=
d battery charge "
> > >       "control end threshold. It will also skip checking if the BIOS =
reports that "
> > > -     "those features are fully supported. It is recommended to black=
list the ideapad "
> > > +     "those features are fully supported. It is recommended to black=
list the conflicting "
> > >       "driver before using this option.");
> > >
> > >  /* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 =
& fan) =3D=3D=3D=3D=3D=3D=3D=3D */
> > > @@ -905,17 +905,41 @@ static acpi_status lwmi_acpi_match(acpi_handle =
handle, u32 lvl,
> > >       return AE_CTRL_TERMINATE;
> > >  }
> > >
> > > +struct lwmi_psy_deconflict {
> > > +     char * const *hids;
> >
> > Who is only the pointer const, not the char?
> >
>=20
> It only lacked const because it shared LWMI_PSY_DECONFLICT_STRS() with
> methods. I made hids const char * const * in v4.
>=20
> > > +     char * const *methods;
> >
> > If acpi_has_method would input const char * (to me it seems convertable
> > as it only calls acpi_get_handle that takes const char *), this too cou=
ld
> > be const char.
> >
>=20
> Agreed. acpi_has_method() still takes char *, so I kept methods as
> char * const * in v4.

Well, I was kind of hoping we'd get that conversion as well as a=20
side-product of this.

> > > +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) || IS_ENABLED(CONFIG_THINKPAD_=
ACPI)
> > > +#define LWMI_PSY_DECONFLICT_STRS(...) \
> > > +     ((char * const[]) { __VA_ARGS__, NULL })
> > > +#endif
> >
> > What exactly does ifdef'ing this construct achieve? Does something hunt
> > unused macros?
> >
>=20
> Yes, W=3D2 enables -Wunused-macros. The guard avoids the warning when
> both drivers are disabled.

Okay, the cure (ifdeffery) seem worse than the disease... I guess it can't=
=20
be helped then. :-/

> > > +             for (unsigned int j =3D 0; entry->hids[j]; j++) {
> > > +                     const char *hid =3D entry->hids[j];
> > > +                     acpi_handle handle =3D NULL;
> > > +                     bool has_methods =3D true;
> > > +
> > > +                     ret =3D acpi_get_devices(hid, lwmi_acpi_match, =
&handle, NULL);
> > > +                     if (ret || !handle)
> > > +                             continue;
> > > +
> > > +                     for (unsigned int k =3D 0; entry->methods[k]; k=
++) {
> > > +                             has_methods =3D acpi_has_method(handle,=
 entry->methods[k]);
> > > +                             if (!has_methods)
> > > +                                     break;
> >
> > So this goes to dev_dbg + return, why complicate the code flow with ext=
ra
> > break + check that is never true?
> >
> > If indentation is the worry here, the innermost bodies don't seem to
> > require much from the outer ones so they could be moved to a function
> > (j body + k loop).
> >
>=20
> When missing a method then try the next HID. In v4, I moved the lookup
> and method checks into a helper.

It looked much better structured in v4, thanks.

--=20
 i.

--8323328-467769840-1795003160=:1169--
