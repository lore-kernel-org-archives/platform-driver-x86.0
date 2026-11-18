Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795002964;
	b=Nm1tD25UECh9vQ26kCXpCxm/Y6fTDWlSDkmY+2bTMHVKU7f/rEiEAlYVe5jG6IQ0/PIK
	 3WNcvu6+ebvukUp22Vr0Tz23pZdZNE0gLEH4kOyoVETFltoUXLYZ4eflZ9z/e+3QTJF30
	 7ONJyKlTQ+arJkTBdfblc3g4RHnjUosmyvOvcj3bNSPftKyTMH+X+JjCAyIsRNVOHzXAA
	 adJ5CZTnshtl6KQMz9Yh+XpZn8B+4EEbdry1y8LWgL6NpxVr+shVlIBg4ppQNOpKsroDw
	 jzULmyUombk4apXx0RQA+AAFg0BYotdJL2Z5Cm2SIYiXU4WV04myIlc+ldbhATSvNMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002964;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=nJlwIImPlixjp7X5B4NCBy8TDIUFoUdnVyr1GczSTWw=;
	b=CEEFuh4bBCAlgUvqocPrh8CcxIc1oiAszqatlSK0qa6DjsqWhHzqVITMC8U/6vA0Aqu6
	 9dDuzsIKFyu2YDWT903PF7+HsCWGupd/ORRFm8PI9iRFekBpVCE5O3lT5CNmmjR04y4T/
	 DyyfPI96GKVYr9kJREk9FuZuDhC6JsfAaxlYYaExLvLJnBm5u3EgqvTho9bOX5DY3ihSe
	 nF5KYFZtHl+xBopLTp/TAy9DAJO2fuoZaQBfhjl1yPak5DF28r47f+uADI4l5sG9lrDJn
	 rs87Gg4LWR6ZsQ8mYaJy+Qi2HGKcfyLCxcAaWLHKlcY5lQ44ahHrjVH+A9+PS2Hto/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=nxKWCTe9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB49606A320;
	Wed, 18 Nov 2026 11:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAB49606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=nxKWCTe9
ARC-Seal: i=1; a=rsa-sha256; t=1795002953; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iU/+zDL2/4r6e0U3ITelqFxKMVnfVWdS1UF8e/1/P6XUYdOSoOARdZ2G8885+c8DmL4IgCP2TKkbATRIFYST1AtSL1A/O4IbJdkjbEhyqiKvUW7Ee3nQNw2PpIwLp0OtLjyG223cEvx64+Wi7RBghUZhOisMgc1JM8Zf77AH1RQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795002953; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=nJlwIImPlixjp7X5B4NCBy8TDIUFoUdnVyr1GczSTWw=; 
	b=dVrkh3FVdMCsmhQ46qmVijG49+Bd/ky8Obd3esDy+obxo5w4rUXyFEftBVBr0dwSeeeydYOl8wXzG4wee5Rm5vGOY6NiKreujD5ZAHVrb2/N0ysp/S0Yq0a65JbeeSWcCJxyUOmZwEnkLhUlV/jJJDZFal12q+tZZo85Jhd6T2o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=nxKWCTe9lmtqg2e6qaYp5duj9U1rYjhy20ZMMmm2rFYJHyLrzReUJEy5TCQ+aDP/oOLozuXEqBOJUelUP5OVcuXWOBVqLXsk9URIMifiIY+EExcF9O4CJev++reeqwtJsQa6Zec0E6UiTlyOiAq38aHCzzRlIAzvV5H4EZYKeUKkxynwLm4o3YvS6NYtyoid3MWT8klkJvIdL0GRgOEGKvOLrG2bVGYfgEQ2w3ku6J4ZoGlQhGuZkV4BYnnKSZRwicr4Ae5oCScbNfgyivrHV/45uQX3xJRRU1DfiRPXTfD53VAW0j8KQnt5h1WJoJPWsPiyNE5wgu+SSy37ZxJa5A==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=nJlwIImPlixjp7X5B4NCBy8TDIUFoUdnVyr1GczSTWw=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795002950447881.0839473863601;
	Wed, 18 Nov 2026 03:55:50 -0800 (PST)
Message-ID: <1acc12bacafe9d454b284d095709ed0d90dd465e.camel@rong.moe>
Subject: Re: [PATCH v4] platform/x86: lenovo-wmi-other: Deconflict battery
 with thinkpad_acpi
From: Rong Zhang <i@rong.moe>
To: Aaron Ma <aaron.ma@canonical.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>,  "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
In-Reply-To: <20261118063058.157862-1-aaron.ma@canonical.com>
References: <20261118063058.157862-1-aaron.ma@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 19:50:33 +0800
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

Hi Aaron,

On Wed, 2026-11-18 at 14:30 +0800, Aaron Ma wrote:
> ThinkPads expose battery charge thresholds and charge_behaviour through
> thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. The
> Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
> charge_behaviour and charge_types on systems advertising those WMI
> capabilities.
>=20
> When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
> duplicate charge_behaviour sysfs attribute and unregisters its battery
> extension. Conversely, registering or updating any power_supply_ext on
> the same battery runs sysfs_update_groups(), which removes standard
> power-supply attributes not owned by power_supply_core and wipes out
> thinkpad_acpi's charge_control_start_threshold,
> charge_control_end_threshold, and charge_behaviour files.
>=20
> Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
> thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
> per-driver table guarded by IS_ENABLED() in Kconfig, and update the
> force_load_psy_ext description accordingly.
>=20
> Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery ch=
arge limiting")
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Co-developed-by: Rong Zhang <i@rong.moe>
> Signed-off-by: Rong Zhang <i@rong.moe>
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
> Changes in v4:
> - Make hids const char * const * with separate HIDs and methods macros,
>   as noted by Ilpo J=C3=A4rvinen.
> - Move HID lookup and method checks into lwmi_acpi_device_has_methods(),
>   as suggested by Ilpo J=C3=A4rvinen.
>=20
> Changes in v3:
> - Wrap deconfliction table entries in #if IS_ENABLED(CONFIG_*) and drop
>   driver_enabled, as suggested by Rong Zhang.
> - Group deconfliction entries per driver (HIDs list + methods list).
>=20
> Changes in v2:
> - Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
>   device IDs, method pairs, and driver configuration checks, as suggested
>   by Derek J. Clark.
> - Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
>   instead of relying only on ThinkPad ACPI device presence.
> - Check whether the corresponding driver is enabled before looking up
>   its ACPI device, including for ideapad_laptop.
> - Update the force_load_psy_ext description to cover both drivers.
>=20
> v3: https://lore.kernel.org/platform-driver-x86/20261113055726.952551-1-a=
aron.ma@canonical.com/
> v2: https://lore.kernel.org/platform-driver-x86/20261112074823.853819-1-a=
aron.ma@canonical.com/
> v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1-a=
aron.ma@canonical.com/
>=20
>  drivers/platform/x86/lenovo/wmi-other.c | 84 ++++++++++++++++++++-----
>  1 file changed, 70 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index bd64e7b44669d..485e9a9e4afbd 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
>  static bool force_load_psy_ext;
>  module_param(force_load_psy_ext, bool, 0444);
>  MODULE_PARM_DESC(force_load_psy_ext,
> -=09"This option will skip checking if the ideapad_laptop driver will con=
flict "
> +=09"This option will skip checking if the ideapad_laptop or thinkpad_acp=
i driver will conflict "
>  =09"with adding an extension to set the battery charge behavior and batt=
ery charge "
>  =09"control end threshold. It will also skip checking if the BIOS report=
s that "
> -=09"those features are fully supported. It is recommended to blacklist t=
he ideapad "
> +=09"those features are fully supported. It is recommended to blacklist t=
he conflicting "
>  =09"driver before using this option.");
> =20
>  /* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 & fa=
n) =3D=3D=3D=3D=3D=3D=3D=3D */
> @@ -905,19 +905,69 @@ static acpi_status lwmi_acpi_match(acpi_handle hand=
le, u32 lvl,
>  =09return AE_CTRL_TERMINATE;
>  }
> =20
> +struct lwmi_psy_deconflict {
> +=09const char * const *hids;
> +=09char * const *methods;
> +};
> +
> +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) || IS_ENABLED(CONFIG_THINKPAD_ACPI=
)

The #if did not exist in my original patch. Please don't increase the
maintenance burden simply because of a W=3D2 warning.

See also my reply to v3.

> +#define LWMI_PSY_DECONFLICT_HIDS(...) \
> +=09((const char * const[]) { __VA_ARGS__, NULL })
> +#define LWMI_PSY_DECONFLICT_METHODS(...) \
> +=09((char * const[]) { __VA_ARGS__, NULL })

My original patch safely dropped the const qualifier with cast when
calling acpi_has_method(). If you really don't want to introduce new
cast, please refactor acpi_has_method() instead of abusing the .data
section.

> +#endif
> +
> +static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] =3D {
> +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
> +=09{
> +=09=09.hids =3D LWMI_PSY_DECONFLICT_HIDS("VPC2004"),
> +=09=09.methods =3D LWMI_PSY_DECONFLICT_METHODS("GBMD", "SBMC"),
> +=09},
> +#endif /* IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) */
> +#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
> +=09{
> +=09=09.hids =3D LWMI_PSY_DECONFLICT_HIDS("LEN0268", "LEN0068", "IBM0068"=
),
> +=09=09.methods =3D LWMI_PSY_DECONFLICT_METHODS("BDSG", "BICG"),
> +=09},
> +#endif /* IS_ENABLED(CONFIG_THINKPAD_ACPI) */
> +};
> +
> +/**
> + * lwmi_acpi_device_has_methods() - Check if an ACPI device has all meth=
ods
> + * @hid: ACPI hardware ID to match
> + * @methods: NULL-terminated array of required ACPI method names
> + *
> + * Return: true if a matching ACPI device is present and exposes all @me=
thods,
> + * or false otherwise.
> + */
> +static bool lwmi_acpi_device_has_methods(const char *hid, char * const *=
methods)
> +{
> +=09acpi_handle handle =3D NULL;
> +=09int ret;
> +
> +=09ret =3D acpi_get_devices(hid, lwmi_acpi_match, &handle, NULL);
> +=09if (ret || !handle)
> +=09=09return false;
> +
> +=09for (unsigned int i =3D 0; methods[i]; i++) {
> +=09=09if (!acpi_has_method(handle, methods[i]))
> +=09=09=09return false;
> +=09}
> +
> +=09return true;
> +}
> +
>  /**
>   * lwmi_om_psy_ext_init() - Hooks power supply extension to device batte=
ry
>   * @priv: Pointer to the lwmi_om_priv drvdata.
>   *
> - * Checks if the ideapad_laptop driver is going to manage charge attribu=
tes first,
> - * then if not, hooks the battery to our WMI methods if they are support=
ed.
> + * Checks if the ideapad_laptop or thinkpad_acpi driver is going to mana=
ge
> + * charge attributes first, then if not, hooks the battery to our WMI me=
thods
> + * if they are supported.
>   */
>  static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
>  {
> -=09static const char * const ideapad_hid =3D "VPC2004";
> -=09acpi_handle handle =3D NULL;
>  =09unsigned int props =3D 0;
> -=09int ret;
> =20
>  =09if (lwmi_psy_prop_is_supported(priv, POWER_SUPPLY_PROP_CHARGE_BEHAVIO=
UR))
>  =09=09props |=3D LWMI_PSY_PROP_BEHAVIOUR;
> @@ -928,14 +978,20 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_pri=
v *priv)
>  =09if (force_load_psy_ext)
>  =09=09goto load_psy_ext;
> =20
> -=09/* Deconflict ideapad_laptop driver */
> -=09ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL)=
;
> -=09if (ret)
> -=09=09return;
> +=09for (unsigned int i =3D 0; i < ARRAY_SIZE(lwmi_psy_deconflict_list); =
i++) {
> +=09=09const struct lwmi_psy_deconflict *entry =3D &lwmi_psy_deconflict_l=
ist[i];
> =20
> -=09if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(hand=
le, "SBMC")) {
> -=09=09dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery f=
or device\n");
> -=09=09return;
> +=09=09for (unsigned int j =3D 0; entry->hids[j]; j++) {
> +=09=09=09const char *hid =3D entry->hids[j];
> +
> +=09=09=09if (!lwmi_acpi_device_has_methods(hid, entry->methods))
> +=09=09=09=09continue;

Flip the branch to drop the `continue'.

Thanks,
Rong

> +
> +=09=09=09dev_dbg(&priv->wdev->dev,
> +=09=09=09=09"ACPI device %s manages battery for device\n",
> +=09=09=09=09hid);
> +=09=09=09return;
> +=09=09}
>  =09}
> =20
>  load_psy_ext:
