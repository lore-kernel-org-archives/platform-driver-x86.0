Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795006715;
	b=TZpQr+RuW4pAt7xb1HjfjGf6h7wLs/GTQTP2/Dc3fEe3U7Bq+pF3iG9ZxWGV+YDtgsw5
	 z8MyBlc3gavcwOxyVbYegfsl1ccxHJrC+7JE7H6+sDAwKwl20LZsj3NeECI/qvwBPu4ix
	 5brhu+6D1mKRBWTPH5gPTlcRX8HhRpyLcbCHZgs+Wn8QkiuhV3HpWbV7KWWkZGDb40Bs5
	 MZjWJvL+D4CjpnOlJcjdNFEoFqm+OqPcAs3EDXZtm5jz28ZaR3AvcQ34uUCg+E4EnsZAG
	 iiuqokc1NPF2B8rSrUq50k1NiC/zU0iPZyYOpFEZv1uLwkaJDEIgGvMbu2OvND2V+SQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006715;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=8XT1cvzNiwoIOGohopm0lYzR1BPX6LSyeupTZjaM8Y8=;
	b=sRBBYBOnLDoxJ82U0RAbK43RiZ1dDAsBVxDkMV3lGfOPVHmfU4kScdKelERgIeSGhIYF
	 JUG7yF+x3LENXElBJNzTz/jQz9EH+90Wxgs9xx+D16ek6OVTs5+pBzSrODnLvpEhshNU5
	 A+3rHsT+ixo8QJdZGPnbfnSBuwfJMzQGLQdL/MH2RhDssHhvKMlFB/N3ZCEFChOvMuZtK
	 T9KWtlLMUnoJBiv0evFaH+Me84cCzz5V30Rq5jNXLQmq6uSL31IMZEAHQRJtU4vLhsWLK
	 CRkDtw1xunEomo6artO+hJcq0YbjFtVoikawCDrSDxMcV5idXwxtZmJNAFhMfo5weGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=WsNE5bFe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D39606A320;
	Wed, 18 Nov 2026 12:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53D39606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=WsNE5bFe
ARC-Seal: i=1; a=rsa-sha256; t=1795006704; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CKpG2/Eontr1gKLhROX8sEYsy8bQCwDdXjOIVsKZ4x8mMWQXGVNQLk26roopYIyUoswhM2rGosHWDW/lMqUKs4fEuy2aApFOFKksAh52znF7tBV1TH3fCfmOhzHoxToA4rBZIxFRZB+Yvml5rY9niSByEmLoUc+88CYu6WTp3hU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795006704; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8XT1cvzNiwoIOGohopm0lYzR1BPX6LSyeupTZjaM8Y8=; 
	b=M4dfwNwQfMiK57OR1ejUv9fY2x5Vzv1UChCzwU+z5UqvPuQY/SwB+xChykeAWphTqUbFkx1cqRA++tnqf9nOFqjV99whz0cYfjx1qTMaDm7e09ulTuDaESxXyhXzOt+YVNADuWP+XcPguBJJAxLFweAnNGZY1QEMblUjWV8lRSA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=WsNE5bFe4XY+h/fMWyzCdT5/09+SRzuLWxFUtWUz2R7mRsV9gOR77liCFOyK3gpUhmoeNxWQYWTkTNkDLDsdLggK6s/pHx55F3cLssbL3WLpFLo5dP8dfcK4vCujijl6ci7hmH0RALixUoCe271ccY2phR9y9+Ty+G7Ry7YpH5GBCR6c+gTbXWLTByJWiBAEyeFhW5spnab0+/0wkUaKarn/8x5kMf3O3uG6o+HAWzz/gmM0nkEewwUVpYDVjaegh5PZ22RSOu6QXG77EZs7nPyZ2XyM2Vov37jKqWA2Xlzzd2Q10lf6NDkE5CJyT3daR5hMqfCN0n9xwFOFuP7LlQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=8XT1cvzNiwoIOGohopm0lYzR1BPX6LSyeupTZjaM8Y8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795006700764579.5976253290352;
	Wed, 18 Nov 2026 04:58:20 -0800 (PST)
Message-ID: <abac3ec77879eb7443f09853e419aedab974c603.camel@rong.moe>
Subject: Re: [PATCH v4] platform/x86: lenovo-wmi-other: Deconflict battery
 with thinkpad_acpi
From: Rong Zhang <i@rong.moe>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Aaron Ma <aaron.ma@canonical.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>,  "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <8f0225a2-2fbb-db6b-a4e7-bed783de5088@linux.intel.com>
References: <20261118063058.157862-1-aaron.ma@canonical.com>
	 <1acc12bacafe9d454b284d095709ed0d90dd465e.camel@rong.moe>
	 <8f0225a2-2fbb-db6b-a4e7-bed783de5088@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 20:53:13 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Ilpo,

On Wed, 2026-11-18 at 14:21 +0200, Ilpo J=C3=A4rvinen wrote:
> On Wed, 18 Nov 2026, Rong Zhang wrote:
>=20
> > Hi Aaron,
> >=20
> > On Wed, 2026-11-18 at 14:30 +0800, Aaron Ma wrote:
> > > ThinkPads expose battery charge thresholds and charge_behaviour throu=
gh
> > > thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. T=
he
> > > Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
> > > charge_behaviour and charge_types on systems advertising those WMI
> > > capabilities.
> > >=20
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
> > >=20
> > > Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
> > > thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
> > > per-driver table guarded by IS_ENABLED() in Kconfig, and update the
> > > force_load_psy_ext description accordingly.
> > >=20
> > > Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI batter=
y charge limiting")
> > > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > Co-developed-by: Rong Zhang <i@rong.moe>
> > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > > ---
> > > Changes in v4:
> > > - Make hids const char * const * with separate HIDs and methods macro=
s,
> > >   as noted by Ilpo J=C3=A4rvinen.
> > > - Move HID lookup and method checks into lwmi_acpi_device_has_methods=
(),
> > >   as suggested by Ilpo J=C3=A4rvinen.
> > >=20
> > > Changes in v3:
> > > - Wrap deconfliction table entries in #if IS_ENABLED(CONFIG_*) and dr=
op
> > >   driver_enabled, as suggested by Rong Zhang.
> > > - Group deconfliction entries per driver (HIDs list + methods list).
> > >=20
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
> > >=20
> > > v3: https://lore.kernel.org/platform-driver-x86/20261113055726.952551=
-1-aaron.ma@canonical.com/
> > > v2: https://lore.kernel.org/platform-driver-x86/20261112074823.853819=
-1-aaron.ma@canonical.com/
> > > v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285=
-1-aaron.ma@canonical.com/
> > >=20
> > >  drivers/platform/x86/lenovo/wmi-other.c | 84 ++++++++++++++++++++---=
--
> > >  1 file changed, 70 insertions(+), 14 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platfo=
rm/x86/lenovo/wmi-other.c
> > > index bd64e7b44669d..485e9a9e4afbd 100644
> > > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > > @@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
> > >  static bool force_load_psy_ext;
> > >  module_param(force_load_psy_ext, bool, 0444);
> > >  MODULE_PARM_DESC(force_load_psy_ext,
> > > -=09"This option will skip checking if the ideapad_laptop driver will=
 conflict "
> > > +=09"This option will skip checking if the ideapad_laptop or thinkpad=
_acpi driver will conflict "
> > >  =09"with adding an extension to set the battery charge behavior and =
battery charge "
> > >  =09"control end threshold. It will also skip checking if the BIOS re=
ports that "
> > > -=09"those features are fully supported. It is recommended to blackli=
st the ideapad "
> > > +=09"those features are fully supported. It is recommended to blackli=
st the conflicting "
> > >  =09"driver before using this option.");
> > > =20
> > >  /* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 =
& fan) =3D=3D=3D=3D=3D=3D=3D=3D */
> > > @@ -905,19 +905,69 @@ static acpi_status lwmi_acpi_match(acpi_handle =
handle, u32 lvl,
> > >  =09return AE_CTRL_TERMINATE;
> > >  }
> > > =20
> > > +struct lwmi_psy_deconflict {
> > > +=09const char * const *hids;
> > > +=09char * const *methods;
> > > +};
> > > +
> > > +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) || IS_ENABLED(CONFIG_THINKPAD_=
ACPI)
> >=20
> > The #if did not exist in my original patch. Please don't increase the
> > maintenance burden simply because of a W=3D2 warning.
> >=20
> > See also my reply to v3.
> >=20
> > > +#define LWMI_PSY_DECONFLICT_HIDS(...) \
> > > +=09((const char * const[]) { __VA_ARGS__, NULL })
> > > +#define LWMI_PSY_DECONFLICT_METHODS(...) \
> > > +=09((char * const[]) { __VA_ARGS__, NULL })
> >=20
> > My original patch safely dropped the const qualifier with cast when
> > calling acpi_has_method(). If you really don't want to introduce new
> > cast, please refactor acpi_has_method() instead of abusing the .data
> > section.
> >=20
> > > +#endif
> > > +
> > > +static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] =
=3D {
> > > +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
> > > +=09{
> > > +=09=09.hids =3D LWMI_PSY_DECONFLICT_HIDS("VPC2004"),
> > > +=09=09.methods =3D LWMI_PSY_DECONFLICT_METHODS("GBMD", "SBMC"),
> > > +=09},
> > > +#endif /* IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) */
> > > +#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
> > > +=09{
> > > +=09=09.hids =3D LWMI_PSY_DECONFLICT_HIDS("LEN0268", "LEN0068", "IBM0=
068"),
> > > +=09=09.methods =3D LWMI_PSY_DECONFLICT_METHODS("BDSG", "BICG"),
> > > +=09},
> > > +#endif /* IS_ENABLED(CONFIG_THINKPAD_ACPI) */
> > > +};
> > > +
> > > +/**
> > > + * lwmi_acpi_device_has_methods() - Check if an ACPI device has all =
methods
> > > + * @hid: ACPI hardware ID to match
> > > + * @methods: NULL-terminated array of required ACPI method names
> > > + *
> > > + * Return: true if a matching ACPI device is present and exposes all=
 @methods,
> > > + * or false otherwise.
> > > + */
> > > +static bool lwmi_acpi_device_has_methods(const char *hid, char * con=
st *methods)
> > > +{
> > > +=09acpi_handle handle =3D NULL;
> > > +=09int ret;
> > > +
> > > +=09ret =3D acpi_get_devices(hid, lwmi_acpi_match, &handle, NULL);
> > > +=09if (ret || !handle)
> > > +=09=09return false;
> > > +
> > > +=09for (unsigned int i =3D 0; methods[i]; i++) {
> > > +=09=09if (!acpi_has_method(handle, methods[i]))
> > > +=09=09=09return false;
> > > +=09}
> > > +
> > > +=09return true;
> > > +}
> > > +
> > >  /**
> > >   * lwmi_om_psy_ext_init() - Hooks power supply extension to device b=
attery
> > >   * @priv: Pointer to the lwmi_om_priv drvdata.
> > >   *
> > > - * Checks if the ideapad_laptop driver is going to manage charge att=
ributes first,
> > > - * then if not, hooks the battery to our WMI methods if they are sup=
ported.
> > > + * Checks if the ideapad_laptop or thinkpad_acpi driver is going to =
manage
> > > + * charge attributes first, then if not, hooks the battery to our WM=
I methods
> > > + * if they are supported.
> > >   */
> > >  static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
> > >  {
> > > -=09static const char * const ideapad_hid =3D "VPC2004";
> > > -=09acpi_handle handle =3D NULL;
> > >  =09unsigned int props =3D 0;
> > > -=09int ret;
> > > =20
> > >  =09if (lwmi_psy_prop_is_supported(priv, POWER_SUPPLY_PROP_CHARGE_BEH=
AVIOUR))
> > >  =09=09props |=3D LWMI_PSY_PROP_BEHAVIOUR;
> > > @@ -928,14 +978,20 @@ static void lwmi_om_psy_ext_init(struct lwmi_om=
_priv *priv)
> > >  =09if (force_load_psy_ext)
> > >  =09=09goto load_psy_ext;
> > > =20
> > > -=09/* Deconflict ideapad_laptop driver */
> > > -=09ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, N=
ULL);
> > > -=09if (ret)
> > > -=09=09return;
> > > +=09for (unsigned int i =3D 0; i < ARRAY_SIZE(lwmi_psy_deconflict_lis=
t); i++) {
> > > +=09=09const struct lwmi_psy_deconflict *entry =3D &lwmi_psy_deconfli=
ct_list[i];
> > > =20
> > > -=09if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(=
handle, "SBMC")) {
> > > -=09=09dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages batte=
ry for device\n");
> > > -=09=09return;
> > > +=09=09for (unsigned int j =3D 0; entry->hids[j]; j++) {
> > > +=09=09=09const char *hid =3D entry->hids[j];
> > > +
> > > +=09=09=09if (!lwmi_acpi_device_has_methods(hid, entry->methods))
> > > +=09=09=09=09continue;
> >=20
> > Flip the branch to drop the `continue'.
>=20
> No, continue is preferred if there's no work to do with the current entry=
=20
> and we want to look the next entry. It's more obvious (analoguos to handl=
e=20
> error early with return) than nesting if construct that would require=20
> looking what comes after it.

Fine. This also makes sense.

Thanks,
Rong

>=20
> --
>  i.
>=20
> >=20
> > Thanks,
> > Rong
> >=20
> > > +
> > > +=09=09=09dev_dbg(&priv->wdev->dev,
> > > +=09=09=09=09"ACPI device %s manages battery for device\n",
> > > +=09=09=09=09hid);
> > > +=09=09=09return;
> > > +=09=09}
> > >  =09}
> > > =20
> > >  load_psy_ext:
> >=20
