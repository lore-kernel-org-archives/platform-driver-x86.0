Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004512;
	b=k2MoVmbTlyCPoCryadleLRfgAizmW5bO/NJ2L5uhSt7gUfWnqDYrreRfk1oeYplmiLUc
	 uAAG71g3SFWl9Lqw5w3z+1bVx0br2S+SlsfvwL0/ZldTneYG+If4JCUXbrIfB/RCijqqj
	 /EcKPJReolOQnlqMYsV4qlnc5WoOi+hv+Y/wMsMSgyQ1ceq1rKOn7ouesR6uA45Loa+nL
	 6kLmeHviFiKJFWPgWYT5X9jrJk/WaLd7HdFNbTsgTnX33fWsMwHXy4VO5CZDPv74oemar
	 FG+LqLnlSSeA2gA73tpPFyHRqv+yD4NqrhodTlKv2dUXqA+AUJ7EG3JwqvB+ANlYmnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004512;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=g1Oq09voSMXtT76rVmtjCavzCQ+naUA8sJkAcnRGf4g=;
	b=IWrD1c4QfkCgizo8LR/WLhWaf2Eumld3cct+5qQC9RafUiNFxpZjuAHdLN0LIEo997M+
	 QWqVMkf05G/Rvtf4uBQaVWP6nfi8FBKFC45psuaKy4PLgnAdMFPfGOc4E3l0rYJZQ/plV
	 apDJapZXYeMnM5N9gRoqqYGwBW3GdyyFV20XulYtMsSV8FLYWJYOBTZfa/oT5W/b15FDT
	 v4KAary8SRP3ACCHy3W2MN1WEAjUlINuwjjjFwJW8VAc87mVaePfyYXS1euF8kDVdYf6E
	 sJkpP0/zjnyFiayN2LBVkoXkYkmY6qekiBcgnSAcCMV/YRi1uoYAA0t0WiZQJQIA/hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I7+ownV7;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBD3606A334;
	Wed, 18 Nov 2026 12:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFBD3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I7+ownV7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795004512; x=1826540512;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Le3Nv5BuozPjdcpHLBUrefH84avTr4K5dyapktWDHXQ=;
  b=I7+ownV7DMk80yMNFXTFHZAwvEcfB/FzxpLXUk4QU2WM4c4dNxtMxvsY
   5vZykm7t1AakuNt8GfF2EDzU2I76tJVEmwyOQ+BaMFlYI4jyMMpkkRTO5
   HslPWC/PEbsfuuTRmfl1eHsv3HqTHr5DYm6Mee4y1JFHNa4F27mK6n2pD
   S1BKX4zUwiqucKr+o4HEOwpwys/bPPFzjhAh9sbAeCjuSCcXz5B0d4N3R
   QSYC3kdk3Z9SgI9DzVdW6V+lSEdvXrm1y8gp05YXK2fldvoJzE0rGU0V6
   y3uzoIQY71ogFyWyNjQGIbv3Tjg3AxGFAWYZElL2tJcKWarOqkdlBMsFR
   A==;
X-CSE-ConnectionGUID: 0yLuz04GQO2zOUfWxU6wCQ==
X-CSE-MsgGUID: NAk0/NDUTSW6dSSczx7OgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3803204"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3803204"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 04:21:41 -0800
X-CSE-ConnectionGUID: 0A7PRLF4S+6HnzgTkWVT7A==
X-CSE-MsgGUID: m/TXeOeJToiAd2FylLHDOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10274181"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.239])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 04:21:38 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 18 Nov 2026 14:21:34 +0200 (EET)
To: Rong Zhang <i@rong.moe>
cc: Aaron Ma <aaron.ma@canonical.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] platform/x86: lenovo-wmi-other: Deconflict battery
 with thinkpad_acpi
In-Reply-To: <1acc12bacafe9d454b284d095709ed0d90dd465e.camel@rong.moe>
Message-ID: <8f0225a2-2fbb-db6b-a4e7-bed783de5088@linux.intel.com>
References: <20261118063058.157862-1-aaron.ma@canonical.com> <1acc12bacafe9d454b284d095709ed0d90dd465e.camel@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1446424806-1795004494=:1169"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1446424806-1795004494=:1169
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 18 Nov 2026, Rong Zhang wrote:

> Hi Aaron,
>=20
> On Wed, 2026-11-18 at 14:30 +0800, Aaron Ma wrote:
> > ThinkPads expose battery charge thresholds and charge_behaviour through
> > thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. The
> > Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
> > charge_behaviour and charge_types on systems advertising those WMI
> > capabilities.
> >=20
> > When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
> > duplicate charge_behaviour sysfs attribute and unregisters its battery
> > extension. Conversely, registering or updating any power_supply_ext on
> > the same battery runs sysfs_update_groups(), which removes standard
> > power-supply attributes not owned by power_supply_core and wipes out
> > thinkpad_acpi's charge_control_start_threshold,
> > charge_control_end_threshold, and charge_behaviour files.
> >=20
> > Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
> > thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
> > per-driver table guarded by IS_ENABLED() in Kconfig, and update the
> > force_load_psy_ext description accordingly.
> >=20
> > Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery =
charge limiting")
> > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > Co-developed-by: Rong Zhang <i@rong.moe>
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > ---
> > Changes in v4:
> > - Make hids const char * const * with separate HIDs and methods macros,
> >   as noted by Ilpo J=C3=A4rvinen.
> > - Move HID lookup and method checks into lwmi_acpi_device_has_methods()=
,
> >   as suggested by Ilpo J=C3=A4rvinen.
> >=20
> > Changes in v3:
> > - Wrap deconfliction table entries in #if IS_ENABLED(CONFIG_*) and drop
> >   driver_enabled, as suggested by Rong Zhang.
> > - Group deconfliction entries per driver (HIDs list + methods list).
> >=20
> > Changes in v2:
> > - Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
> >   device IDs, method pairs, and driver configuration checks, as suggest=
ed
> >   by Derek J. Clark.
> > - Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
> >   instead of relying only on ThinkPad ACPI device presence.
> > - Check whether the corresponding driver is enabled before looking up
> >   its ACPI device, including for ideapad_laptop.
> > - Update the force_load_psy_ext description to cover both drivers.
> >=20
> > v3: https://lore.kernel.org/platform-driver-x86/20261113055726.952551-1=
-aaron.ma@canonical.com/
> > v2: https://lore.kernel.org/platform-driver-x86/20261112074823.853819-1=
-aaron.ma@canonical.com/
> > v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1=
-aaron.ma@canonical.com/
> >=20
> >  drivers/platform/x86/lenovo/wmi-other.c | 84 ++++++++++++++++++++-----
> >  1 file changed, 70 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform=
/x86/lenovo/wmi-other.c
> > index bd64e7b44669d..485e9a9e4afbd 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
> >  static bool force_load_psy_ext;
> >  module_param(force_load_psy_ext, bool, 0444);
> >  MODULE_PARM_DESC(force_load_psy_ext,
> > -=09"This option will skip checking if the ideapad_laptop driver will c=
onflict "
> > +=09"This option will skip checking if the ideapad_laptop or thinkpad_a=
cpi driver will conflict "
> >  =09"with adding an extension to set the battery charge behavior and ba=
ttery charge "
> >  =09"control end threshold. It will also skip checking if the BIOS repo=
rts that "
> > -=09"those features are fully supported. It is recommended to blacklist=
 the ideapad "
> > +=09"those features are fully supported. It is recommended to blacklist=
 the conflicting "
> >  =09"driver before using this option.");
> > =20
> >  /* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 & =
fan) =3D=3D=3D=3D=3D=3D=3D=3D */
> > @@ -905,19 +905,69 @@ static acpi_status lwmi_acpi_match(acpi_handle ha=
ndle, u32 lvl,
> >  =09return AE_CTRL_TERMINATE;
> >  }
> > =20
> > +struct lwmi_psy_deconflict {
> > +=09const char * const *hids;
> > +=09char * const *methods;
> > +};
> > +
> > +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) || IS_ENABLED(CONFIG_THINKPAD_AC=
PI)
>=20
> The #if did not exist in my original patch. Please don't increase the
> maintenance burden simply because of a W=3D2 warning.
>=20
> See also my reply to v3.
>=20
> > +#define LWMI_PSY_DECONFLICT_HIDS(...) \
> > +=09((const char * const[]) { __VA_ARGS__, NULL })
> > +#define LWMI_PSY_DECONFLICT_METHODS(...) \
> > +=09((char * const[]) { __VA_ARGS__, NULL })
>=20
> My original patch safely dropped the const qualifier with cast when
> calling acpi_has_method(). If you really don't want to introduce new
> cast, please refactor acpi_has_method() instead of abusing the .data
> section.
>=20
> > +#endif
> > +
> > +static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] =3D=
 {
> > +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
> > +=09{
> > +=09=09.hids =3D LWMI_PSY_DECONFLICT_HIDS("VPC2004"),
> > +=09=09.methods =3D LWMI_PSY_DECONFLICT_METHODS("GBMD", "SBMC"),
> > +=09},
> > +#endif /* IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) */
> > +#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
> > +=09{
> > +=09=09.hids =3D LWMI_PSY_DECONFLICT_HIDS("LEN0268", "LEN0068", "IBM006=
8"),
> > +=09=09.methods =3D LWMI_PSY_DECONFLICT_METHODS("BDSG", "BICG"),
> > +=09},
> > +#endif /* IS_ENABLED(CONFIG_THINKPAD_ACPI) */
> > +};
> > +
> > +/**
> > + * lwmi_acpi_device_has_methods() - Check if an ACPI device has all me=
thods
> > + * @hid: ACPI hardware ID to match
> > + * @methods: NULL-terminated array of required ACPI method names
> > + *
> > + * Return: true if a matching ACPI device is present and exposes all @=
methods,
> > + * or false otherwise.
> > + */
> > +static bool lwmi_acpi_device_has_methods(const char *hid, char * const=
 *methods)
> > +{
> > +=09acpi_handle handle =3D NULL;
> > +=09int ret;
> > +
> > +=09ret =3D acpi_get_devices(hid, lwmi_acpi_match, &handle, NULL);
> > +=09if (ret || !handle)
> > +=09=09return false;
> > +
> > +=09for (unsigned int i =3D 0; methods[i]; i++) {
> > +=09=09if (!acpi_has_method(handle, methods[i]))
> > +=09=09=09return false;
> > +=09}
> > +
> > +=09return true;
> > +}
> > +
> >  /**
> >   * lwmi_om_psy_ext_init() - Hooks power supply extension to device bat=
tery
> >   * @priv: Pointer to the lwmi_om_priv drvdata.
> >   *
> > - * Checks if the ideapad_laptop driver is going to manage charge attri=
butes first,
> > - * then if not, hooks the battery to our WMI methods if they are suppo=
rted.
> > + * Checks if the ideapad_laptop or thinkpad_acpi driver is going to ma=
nage
> > + * charge attributes first, then if not, hooks the battery to our WMI =
methods
> > + * if they are supported.
> >   */
> >  static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
> >  {
> > -=09static const char * const ideapad_hid =3D "VPC2004";
> > -=09acpi_handle handle =3D NULL;
> >  =09unsigned int props =3D 0;
> > -=09int ret;
> > =20
> >  =09if (lwmi_psy_prop_is_supported(priv, POWER_SUPPLY_PROP_CHARGE_BEHAV=
IOUR))
> >  =09=09props |=3D LWMI_PSY_PROP_BEHAVIOUR;
> > @@ -928,14 +978,20 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_p=
riv *priv)
> >  =09if (force_load_psy_ext)
> >  =09=09goto load_psy_ext;
> > =20
> > -=09/* Deconflict ideapad_laptop driver */
> > -=09ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NUL=
L);
> > -=09if (ret)
> > -=09=09return;
> > +=09for (unsigned int i =3D 0; i < ARRAY_SIZE(lwmi_psy_deconflict_list)=
; i++) {
> > +=09=09const struct lwmi_psy_deconflict *entry =3D &lwmi_psy_deconflict=
_list[i];
> > =20
> > -=09if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(ha=
ndle, "SBMC")) {
> > -=09=09dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery=
 for device\n");
> > -=09=09return;
> > +=09=09for (unsigned int j =3D 0; entry->hids[j]; j++) {
> > +=09=09=09const char *hid =3D entry->hids[j];
> > +
> > +=09=09=09if (!lwmi_acpi_device_has_methods(hid, entry->methods))
> > +=09=09=09=09continue;
>=20
> Flip the branch to drop the `continue'.

No, continue is preferred if there's no work to do with the current entry=
=20
and we want to look the next entry. It's more obvious (analoguos to handle=
=20
error early with return) than nesting if construct that would require=20
looking what comes after it.

--
 i.

>=20
> Thanks,
> Rong
>=20
> > +
> > +=09=09=09dev_dbg(&priv->wdev->dev,
> > +=09=09=09=09"ACPI device %s manages battery for device\n",
> > +=09=09=09=09hid);
> > +=09=09=09return;
> > +=09=09}
> >  =09}
> > =20
> >  load_psy_ext:
>=20

--8323328-1446424806-1795004494=:1169--
