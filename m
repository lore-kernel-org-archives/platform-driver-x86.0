Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795098620;
	b=YmResd1cQo4renfjbIyW+frdAJvgHpoGtN7/JnP1pt0sos/OoJpFfdd31pxGWhvDHc2Q
	 rXAtTIPFekqPKkDvbAo/bXx+DtyoNOz817j757pt/cDN0UPaPEo3Hx7ei96RXZsQbDRcU
	 8ZJFjZZX6K/aiFqqNXgo5z0hvb6FOXhVvg/SnXRDWNpB5GM1+MxrplApebigkXUF4j6/i
	 qxZkXDoujMtyhDneOEYjHAfZPSSwmnUAjeu+WAh6tTB/3PFeVceSRIRNBxzAtUZwdQHck
	 iiptDX8YlctP4B+Lx1GPQd0xD7lNpX8m7xJLcVhSk/ZxXUI8YuBQXcE51+KIqQ26dcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098620;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=gXUh9NgRXsUvVhlhdHrD3K+LvJHIeDDuq0BHIzoUtIE=;
	b=TSgRMjcCN4HqzHlVOtRP7QNwzNPeuCtIlGQhESybyhOO5B5xGhoOWf5rascGxwzkDoX8
	 Sr22f1NDp1xT7SNnvpMKWm6+D34BY+O7spCdYZyslV3eE++vqMnS0VFZc5Sd9h1Qa4/+b
	 nt/AG5/VlW/clz/qIu4jNF0ASOa5LOYZwU3KhIfdowD0Kc1JTtymmGiTq3HDELiBL41Fb
	 yx0vuPeu3kqnGm1k2o0QpYTroo/Xtg8hHcII3Vo6C+P1TWWGCf6YjtevneOQ37kTYdTdN
	 9wLHrEfPGCqkXyLZ3wbQpAvL7Iv+1v+tKikYZRPM5sPy4q5vrsVnsBBHc2dOegvUPKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=pTyR+c5O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14685606A324
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 14:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14685606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=pTyR+c5O
ARC-Seal: i=1; a=rsa-sha256; t=1795098608; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fxee2Ntb3h9u6LSUHECtepHud0TeN+tUu7S+xQbuccwk2T2UoYtHVeZ1dNyrYC/UDUzzoIt7iNHj1Q8Hg834y342lwPfFsMJUH7HMZbBZhAyY3m46bxB6/gO0/QF4O2lgCUiS7t0T/N7pW9TFziyFdoM352KhtmVoe7uEALCeHM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795098608; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=gXUh9NgRXsUvVhlhdHrD3K+LvJHIeDDuq0BHIzoUtIE=; 
	b=SsG2tDoC3epE4IKBXqwWV7rIUboYL6QIZL9jVn2WWr0E+KT55vq+82FBNEgKUsBJJWgpYp1QJ4AoFzUSlLwyjkftX0zKjjgidvZfE4BvJBOU5tAkGRqBM3qA4XmWpG84HhzOx/RIQqfWR1kUBk9shT14bBJLUh0rBkcAM2fWi6w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=pTyR+c5OwGyqivYwQpFZOW/1KPwcGd+7z5H8BJxMfhOoiRtdvQuKTurh5t+TWh6Euv6DV4nroGoziR98+wy7zwMvWgTjPTxZ6mv8TyzKSUX/U9azcOLe0dHlE+fULcem7+BIqRyWmOZe+q+h2E4mcpHM5xNeoOn4NzhgtgQTJl2dwPxj4N/f3mA3ShGWq/Dt6xUs5j1XArL59PnjddX77DsyTNi4ApqPhALBNrt+TKflY0S43CXkm6w1TaG5EF13kRhquLcrkzngQQSwY1yEoEoJDG3aOY5X0Xc+rYtHiDsu+EgJeBJC8caBzTxCZxk1KyrpjdeCwZ8KGifMAqVhqA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=gXUh9NgRXsUvVhlhdHrD3K+LvJHIeDDuq0BHIzoUtIE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795098603859177.4593189418008;
	Thu, 19 Nov 2026 06:30:03 -0800 (PST)
Message-ID: <9878245f401ed1cd129435865b28e5dc06401d3a.camel@rong.moe>
Subject: Re: [PATCH v5] platform/x86: lenovo-wmi-other: Deconflict battery
 with thinkpad_acpi
From: Rong Zhang <i@rong.moe>
To: Aaron Ma <aaron.ma@canonical.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>,  "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
In-Reply-To: <20261119072516.309524-1-aaron.ma@canonical.com>
References: <20261119072516.309524-1-aaron.ma@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 22:24:07 +0800
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

On Thu, 2026-11-19 at 15:24 +0800, Aaron Ma wrote:
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

Now the patch looks good to me.

Thanks,
Rong

> ---
> Changes in v5:
> - Drop the outer #if guard around the macro definition, as requested by
>   Rong Zhang and Ilpo J=C3=A4rvinen.
> - Make methods const char * const * as well with a single
>   LWMI_PSY_DECONFLICT_STRS() macro, casting at acpi_has_method(), as
>   suggested by Rong Zhang.
>=20
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
> v4: https://lore.kernel.org/platform-driver-x86/20261118063058.157862-1-a=
aron.ma@canonical.com/
> v3: https://lore.kernel.org/platform-driver-x86/20261113055726.952551-1-a=
aron.ma@canonical.com/
> v2: https://lore.kernel.org/platform-driver-x86/20261112074823.853819-1-a=
aron.ma@canonical.com/
> v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1-a=
aron.ma@canonical.com/
>=20
>  drivers/platform/x86/lenovo/wmi-other.c | 81 ++++++++++++++++++++-----
>  1 file changed, 67 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index bd64e7b44669d..33be29bafabf5 100644
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
> @@ -905,19 +905,66 @@ static acpi_status lwmi_acpi_match(acpi_handle hand=
le, u32 lvl,
>  =09return AE_CTRL_TERMINATE;
>  }
> =20
> +struct lwmi_psy_deconflict {
> +=09const char * const *hids;
> +=09const char * const *methods;
> +};
> +
> +#define LWMI_PSY_DECONFLICT_STRS(...) \
> +=09((const char * const[]) { __VA_ARGS__, NULL })
> +
> +static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] =3D {
> +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
> +=09{
> +=09=09.hids =3D LWMI_PSY_DECONFLICT_STRS("VPC2004"),
> +=09=09.methods =3D LWMI_PSY_DECONFLICT_STRS("GBMD", "SBMC"),
> +=09},
> +#endif /* IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) */
> +#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
> +=09{
> +=09=09.hids =3D LWMI_PSY_DECONFLICT_STRS("LEN0268", "LEN0068", "IBM0068"=
),
> +=09=09.methods =3D LWMI_PSY_DECONFLICT_STRS("BDSG", "BICG"),
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
> +static bool lwmi_acpi_device_has_methods(const char *hid,
> +=09=09=09=09=09 const char * const *methods)
> +{
> +=09acpi_handle handle =3D NULL;
> +=09int ret;
> +
> +=09ret =3D acpi_get_devices(hid, lwmi_acpi_match, &handle, NULL);
> +=09if (ret || !handle)
> +=09=09return false;
> +
> +=09for (unsigned int i =3D 0; methods[i]; i++) {
> +=09=09if (!acpi_has_method(handle, (char *)methods[i]))
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
> @@ -928,14 +975,20 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_pri=
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
> +
> +=09=09=09dev_dbg(&priv->wdev->dev,
> +=09=09=09=09"ACPI device %s manages battery for device\n",
> +=09=09=09=09hid);
> +=09=09=09return;
> +=09=09}
>  =09}
> =20
>  load_psy_ext:
