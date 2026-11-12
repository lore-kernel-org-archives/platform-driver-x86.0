Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794496470;
	b=ylDSoZ3c5M7ZHHXu8W+DSSXK0ZZWwbNyWVAN3E77mKXrnJduzpCwwHRf9BT5/06z2LaP
	 jrhuQu0mpMtnAs50X7+AiwgG2cQrQpKwHheWpWOP9lJWE5oQ2uBoQUjyayIWJziNniDuY
	 DduBFJbz1fPGQPtX5JjYEjd8sykI3nXtRFVibUsTR/8bzXc9Ky8s9VjXKs7mJqxrjhUUq
	 UMqFV9zD6SEsVLe11ZukAqvMSsBuKZQd+PVvx8PwoDlwmfbjcv2CjyeiFH+cM6CJuhE2O
	 KpfpGUeU/Xj5SEOtFxSuU9bFhPwPsDP2JTet0VzntAsBdZzDZ+HXVQDGchiEJ5Nrbeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496470;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:
	 In-Reply-To:References:Content-Type:Date:MIME-Version:User-Agent:
	 X-Zoho-Virus-Status:X-Zoho-AV-Stamp:X-ZohoMailClient;
	bh=z6+BkSmoaAnoOhnm1VUY7FmsTBO81Z8PQQf2B1LU31o=;
	b=StvP+8rqRbk/v03OHLoquKnDoSE317gNLGzllaZ9lYHbB7XKpOZJq2PR1LM/6AYl0/cp
	 JKyEjmD9ZFnPLCI9UwwwV4OIJmZj15TaZgGlkEO6TcVEpvumSbxmug4eiktOCp4vSJz3b
	 eyklqrjs9gUrKwb/ln49DglCTVUTfoTE/Zd7rL9DVZQreuHEDuuM0BRnQIqLpzSRgrW8l
	 2rR4Sv/GnzN1TBx2T7zHYhH0AwRC8GE8vVNYBLykfg66YtGEVlcZDW507o/aqFYB8Tb/9
	 5Pm9gb7uYCxURcNpLCilYt3pQs7wmTJmFOFj9vJ2N76VHvSfING8yCbhREc/N/gk/3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ZURrwkAk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338C6606A33B;
	Thu, 12 Nov 2026 15:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 338C6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ZURrwkAk
ARC-Seal: i=1; a=rsa-sha256; t=1794496454; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZGetVIQ0WD9HRw5UUpzlHxwqJivovwAZvFM/EHSItVo+Ks1LHYdeAoVzWSxtbUzFN3wUBg+makmMeONHl7DpoR5qMEGZYCGhnEkfzf0aGWmLwwoFWdSOPVYWVFu9HhSZK7hhMeNjqDWyZiA+dws8C0Tr9I277JTxKjZNr4dRR48=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794496454; h=Content-Type:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=z6+BkSmoaAnoOhnm1VUY7FmsTBO81Z8PQQf2B1LU31o=; 
	b=GFE2CRYmi2Fwi2g32tM52kP+CO9rguIr6RtncJa1B25G3VEvjJ4rV9uu6HJaSev9OLbQg/wVBGGq7aWlffeT90EEOezJbopxJcEV2/2N7cz0cPDWTyHm1pSoirOIiut/Sp2nncBJww8AT3EY2Q1dElAzNnlgQ25rwwAiv8I0FJk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=ZURrwkAkPHuxnpf8Vx6QugxmCwHZUFtKk2Kr+Xd0vnRa1fdMlu2MIYepyfoUE8iiRrm79LD2Ims0lI7Ijj3llBOIbOEJ4m9B5spWqlhCSc3vp9sV7lhyNizj7AoyjIIf4/+gw7bVbryd8cYJ+RG4igGhZlwhtHcc4t+Csv/gas6dBzrflzdtzhXjMzPOyTkic0b+OSds3flh4kcENOD6i+KYH8R5X4avmtFpXxJEe+ugCxFVMkTUaTgUNqfPbrBSHKylnAWYKgrTVhEiEA66YdEebUPGV7KhTqTUWb4rkSfEs6iNWBtTz6h0+HWt7uJZ7/5HUK+DwyN616Iqt6y8Rg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=z6+BkSmoaAnoOhnm1VUY7FmsTBO81Z8PQQf2B1LU31o=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794496452453851.9618914473282;
	Thu, 12 Nov 2026 07:14:12 -0800 (PST)
Message-ID: <18febc1a4ca8191d1374c586998611952ff0cf75.camel@rong.moe>
Subject: Re: [PATCH v2] platform/x86: lenovo-wmi-other: Deconflict battery
 with thinkpad_acpi
From: Rong Zhang <i@rong.moe>
To: Aaron Ma <aaron.ma@canonical.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>,  "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
In-Reply-To: <20261112074823.853819-1-aaron.ma@canonical.com>
References: <20261112074823.853819-1-aaron.ma@canonical.com>
Content-Type: multipart/mixed; boundary="=-YoFgjqYu05G0v8u/Zazg"
Date: Thu, 12 Nov 2026 23:13:55 +0800
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
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.473.96
X-ZohoMailClient: External

--=-YoFgjqYu05G0v8u/Zazg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aaron,

Thanks for working on this.

On Thu, 2026-11-12 at 15:48 +0800, Aaron Ma wrote:
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
> table check when the corresponding driver is enabled in Kconfig, and
> update the force_load_psy_ext description accordingly.
>=20
> Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery ch=
arge limiting")
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
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
> v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1-a=
aron.ma@canonical.com/
>=20
>  drivers/platform/x86/lenovo/wmi-other.c | 51 ++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index bd64e7b44669d..14b2c3f4cc7ae 100644
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
> @@ -905,17 +905,32 @@ static acpi_status lwmi_acpi_match(acpi_handle hand=
le, u32 lvl,
>  =09return AE_CTRL_TERMINATE;
>  }
> =20
> +struct lwmi_psy_deconflict {
> +=09const char *hid;
> +=09char * const *methods;
> +=09bool driver_enabled;

Why is this required?

IMO the relevant items should be wrapped by #if IS_ENABLED(CONFIG_*). In
this manner, lwmi_om_psy_ext_init() doesn't need to iterate through
useless items in vain.

> +};
> +
> +static char * const lwmi_ideapad_psy_methods[] =3D { "GBMD", "SBMC" };
> +static char * const lwmi_thinkpad_psy_methods[] =3D { "BDSG", "BICG" };
> +
> +static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] =3D {
> +=09{ "VPC2004", lwmi_ideapad_psy_methods, IS_ENABLED(CONFIG_IDEAPAD_LAPT=
OP) },
> +=09{ "LEN0268", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPAD_AC=
PI) },
> +=09{ "LEN0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPAD_AC=
PI) },
> +=09{ "IBM0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPAD_AC=
PI) },
> +};

It could be flattened and simplified into a 2-items array. See the
attached patch (untested, may be completely nonsense).

If you adopt my approach, feel free to add

   Co-developed-by: Rong Zhang <i@rong.moe>
   Signed-off-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

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
>  =09int ret;
> =20
> @@ -928,14 +943,24 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_pri=
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
> +=09=09acpi_handle handle =3D NULL;
> =20
> -=09if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(hand=
le, "SBMC")) {
> -=09=09dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery f=
or device\n");
> -=09=09return;
> +=09=09if (!entry->driver_enabled)
> +=09=09=09continue;
> +
> +=09=09ret =3D acpi_get_devices(entry->hid, lwmi_acpi_match, &handle, NUL=
L);
> +=09=09if (ret || !handle)
> +=09=09=09continue;
> +
> +=09=09if (acpi_has_method(handle, entry->methods[0]) &&
> +=09=09    acpi_has_method(handle, entry->methods[1])) {
> +=09=09=09dev_dbg(&priv->wdev->dev,
> +=09=09=09=09"ACPI device %s manages battery for device\n",
> +=09=09=09=09entry->hid);
> +=09=09=09return;
> +=09=09}
>  =09}
> =20
>  load_psy_ext:

--=-YoFgjqYu05G0v8u/Zazg
Content-Disposition: attachment; filename="flattened-charpp.patch"
Content-Type: text/x-patch; name="flattened-charpp.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2xlbm92by93bWktb3RoZXIuYyBiL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L2xlbm92by93bWktb3RoZXIuYwppbmRleCBiZDY0ZTdiNDQ2Njku
LjAxNzJjNGNlZWQ1OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvbGVub3ZvL3dt
aS1vdGhlci5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2xlbm92by93bWktb3RoZXIuYwpA
QCAtMTg5LDEwICsxODksMTAgQEAgTU9EVUxFX1BBUk1fREVTQyhyZWxheF9mYW5fY29uc3RyYWlu
dCwKIHN0YXRpYyBib29sIGZvcmNlX2xvYWRfcHN5X2V4dDsKIG1vZHVsZV9wYXJhbShmb3JjZV9s
b2FkX3BzeV9leHQsIGJvb2wsIDA0NDQpOwogTU9EVUxFX1BBUk1fREVTQyhmb3JjZV9sb2FkX3Bz
eV9leHQsCi0JIlRoaXMgb3B0aW9uIHdpbGwgc2tpcCBjaGVja2luZyBpZiB0aGUgaWRlYXBhZF9s
YXB0b3AgZHJpdmVyIHdpbGwgY29uZmxpY3QgIgorCSJUaGlzIG9wdGlvbiB3aWxsIHNraXAgY2hl
Y2tpbmcgaWYgdGhlIGlkZWFwYWRfbGFwdG9wIG9yIHRoaW5rcGFkX2FjcGkgZHJpdmVyIHdpbGwg
Y29uZmxpY3QgIgogCSJ3aXRoIGFkZGluZyBhbiBleHRlbnNpb24gdG8gc2V0IHRoZSBiYXR0ZXJ5
IGNoYXJnZSBiZWhhdmlvciBhbmQgYmF0dGVyeSBjaGFyZ2UgIgogCSJjb250cm9sIGVuZCB0aHJl
c2hvbGQuIEl0IHdpbGwgYWxzbyBza2lwIGNoZWNraW5nIGlmIHRoZSBCSU9TIHJlcG9ydHMgdGhh
dCAiCi0JInRob3NlIGZlYXR1cmVzIGFyZSBmdWxseSBzdXBwb3J0ZWQuIEl0IGlzIHJlY29tbWVu
ZGVkIHRvIGJsYWNrbGlzdCB0aGUgaWRlYXBhZCAiCisJInRob3NlIGZlYXR1cmVzIGFyZSBmdWxs
eSBzdXBwb3J0ZWQuIEl0IGlzIHJlY29tbWVuZGVkIHRvIGJsYWNrbGlzdCB0aGUgY29uZmxpY3Rp
bmcgIgogCSJkcml2ZXIgYmVmb3JlIHVzaW5nIHRoaXMgb3B0aW9uLiIpOwogCiAvKiA9PT09PT09
PSBIV01PTiAoY29tcG9uZW50OiBsZW5vdm8td21pLWNhcGRhdGEgMDAgJiBmYW4pID09PT09PT09
ICovCkBAIC05MDUsMTcgKzkwNSwzOSBAQCBzdGF0aWMgYWNwaV9zdGF0dXMgbHdtaV9hY3BpX21h
dGNoKGFjcGlfaGFuZGxlIGhhbmRsZSwgdTMyIGx2bCwKIAlyZXR1cm4gQUVfQ1RSTF9URVJNSU5B
VEU7CiB9CiAKK3N0cnVjdCBsd21pX3BzeV9kZWNvbmZsaWN0IHsKKwljb25zdCBjaGFyICpjb25z
dCAqaGlkczsKKwljb25zdCBjaGFyICpjb25zdCAqbWV0aG9kczsKK307CisKKyNkZWZpbmUgTFdN
SV9QU1lfREVDT05GTElDVF9TVFJTKC4uLikgXAorCShjb25zdCBjaGFyICpbXSl7IF9fVkFfQVJH
U19fLCBOVUxMIH0KKworc3RhdGljIGNvbnN0IHN0cnVjdCBsd21pX3BzeV9kZWNvbmZsaWN0IGx3
bWlfcHN5X2RlY29uZmxpY3RfbGlzdFtdID0geworI2lmIElTX0VOQUJMRUQoQ09ORklHX0lERUFQ
QURfTEFQVE9QKQorCXsKKwkJLmhpZHMgPSBMV01JX1BTWV9ERUNPTkZMSUNUX1NUUlMoIlZQQzIw
MDQiKSwKKwkJLm1ldGhvZHMgPSBMV01JX1BTWV9ERUNPTkZMSUNUX1NUUlMoIkdCTUQiLCAiU0JN
QyIpLAorCX0sCisjZW5kaWYgLyogSVNfRU5BQkxFRChDT05GSUdfSURFQVBBRF9MQVBUT1ApICov
CisjaWYgSVNfRU5BQkxFRChDT05GSUdfVEhJTktQQURfQUNQSSkKKwl7CisJCS5oaWRzID0gTFdN
SV9QU1lfREVDT05GTElDVF9TVFJTKCJMRU4wMjY4IiwgIkxFTjAwNjgiLCAiSUJNMDA2OCIpLAor
CQkubWV0aG9kcyA9IExXTUlfUFNZX0RFQ09ORkxJQ1RfU1RSUygiQkRTRyIsICJCSUNHIiksCisJ
fSwKKyNlbmRpZiAvKiBJU19FTkFCTEVEKENPTkZJR19USElOS1BBRF9BQ1BJKSAqLworfTsKKwog
LyoqCiAgKiBsd21pX29tX3BzeV9leHRfaW5pdCgpIC0gSG9va3MgcG93ZXIgc3VwcGx5IGV4dGVu
c2lvbiB0byBkZXZpY2UgYmF0dGVyeQogICogQHByaXY6IFBvaW50ZXIgdG8gdGhlIGx3bWlfb21f
cHJpdiBkcnZkYXRhLgogICoKLSAqIENoZWNrcyBpZiB0aGUgaWRlYXBhZF9sYXB0b3AgZHJpdmVy
IGlzIGdvaW5nIHRvIG1hbmFnZSBjaGFyZ2UgYXR0cmlidXRlcyBmaXJzdCwKLSAqIHRoZW4gaWYg
bm90LCBob29rcyB0aGUgYmF0dGVyeSB0byBvdXIgV01JIG1ldGhvZHMgaWYgdGhleSBhcmUgc3Vw
cG9ydGVkLgorICogQ2hlY2tzIGlmIHRoZSBpZGVhcGFkX2xhcHRvcCBvciB0aGlua3BhZF9hY3Bp
IGRyaXZlciBpcyBnb2luZyB0byBtYW5hZ2UKKyAqIGNoYXJnZSBhdHRyaWJ1dGVzIGZpcnN0LCB0
aGVuIGlmIG5vdCwgaG9va3MgdGhlIGJhdHRlcnkgdG8gb3VyIFdNSSBtZXRob2RzCisgKiBpZiB0
aGV5IGFyZSBzdXBwb3J0ZWQuCiAgKi8KIHN0YXRpYyB2b2lkIGx3bWlfb21fcHN5X2V4dF9pbml0
KHN0cnVjdCBsd21pX29tX3ByaXYgKnByaXYpCiB7Ci0Jc3RhdGljIGNvbnN0IGNoYXIgKiBjb25z
dCBpZGVhcGFkX2hpZCA9ICJWUEMyMDA0IjsKLQlhY3BpX2hhbmRsZSBoYW5kbGUgPSBOVUxMOwog
CXVuc2lnbmVkIGludCBwcm9wcyA9IDA7CiAJaW50IHJldDsKIApAQCAtOTI4LDE0ICs5NTAsMzAg
QEAgc3RhdGljIHZvaWQgbHdtaV9vbV9wc3lfZXh0X2luaXQoc3RydWN0IGx3bWlfb21fcHJpdiAq
cHJpdikKIAlpZiAoZm9yY2VfbG9hZF9wc3lfZXh0KQogCQlnb3RvIGxvYWRfcHN5X2V4dDsKIAot
CS8qIERlY29uZmxpY3QgaWRlYXBhZF9sYXB0b3AgZHJpdmVyICovCi0JcmV0ID0gYWNwaV9nZXRf
ZGV2aWNlcyhpZGVhcGFkX2hpZCwgbHdtaV9hY3BpX21hdGNoLCAmaGFuZGxlLCBOVUxMKTsKLQlp
ZiAocmV0KQotCQlyZXR1cm47Ci0KLQlpZiAoaGFuZGxlICYmIGFjcGlfaGFzX21ldGhvZChoYW5k
bGUsICJHQk1EIikgJiYgYWNwaV9oYXNfbWV0aG9kKGhhbmRsZSwgIlNCTUMiKSkgewotCQlkZXZf
ZGJnKCZwcml2LT53ZGV2LT5kZXYsICJpZGVhcGFkX2xhcHRvcCBkcml2ZXIgbWFuYWdlcyBiYXR0
ZXJ5IGZvciBkZXZpY2VcbiIpOwotCQlyZXR1cm47CisJZm9yICh1bnNpZ25lZCBpbnQgaSA9IDA7
IGkgPCBBUlJBWV9TSVpFKGx3bWlfcHN5X2RlY29uZmxpY3RfbGlzdCk7IGkrKykgeworCQljb25z
dCBzdHJ1Y3QgbHdtaV9wc3lfZGVjb25mbGljdCAqZW50cnkgPSAmbHdtaV9wc3lfZGVjb25mbGlj
dF9saXN0W2ldOworCQlhY3BpX2hhbmRsZSBoYW5kbGUgPSBOVUxMOworCisJCWZvciAodW5zaWdu
ZWQgaW50IGogPSAwOyBlbnRyeS0+aGlkc1tqXTsgaisrKSB7CisJCQljb25zdCBjaGFyICpoaWQg
PSBlbnRyeS0+aGlkc1tqXTsKKwkJCWJvb2wgaGFzX21ldGhvZHMgPSB0cnVlOworCisJCQlyZXQg
PSBhY3BpX2dldF9kZXZpY2VzKGhpZCwgbHdtaV9hY3BpX21hdGNoLCAmaGFuZGxlLCBOVUxMKTsK
KwkJCWlmIChyZXQgfHwgIWhhbmRsZSkKKwkJCQljb250aW51ZTsKKworCQkJZm9yICh1bnNpZ25l
ZCBpbnQgayA9IDA7IGVudHJ5LT5tZXRob2RzW2tdOyBrKyspIHsKKwkJCQloYXNfbWV0aG9kcyA9
IGFjcGlfaGFzX21ldGhvZChoYW5kbGUsIChjaGFyICopZW50cnktPm1ldGhvZHNba10pOworCQkJ
CWlmICghaGFzX21ldGhvZHMpCisJCQkJCWJyZWFrOworCQkJfQorCQkJaWYgKCFoYXNfbWV0aG9k
cykKKwkJCQljb250aW51ZTsKKworCQkJZGV2X2RiZygmcHJpdi0+d2Rldi0+ZGV2LCAiQUNQSSBk
ZXZpY2UgJXMgbWFuYWdlcyBiYXR0ZXJ5IGZvciBkZXZpY2VcbiIsCisJCQkJaGlkKTsKKwkJCXJl
dHVybjsKKwkJfQogCX0KIAogbG9hZF9wc3lfZXh0Ogo=


--=-YoFgjqYu05G0v8u/Zazg--
