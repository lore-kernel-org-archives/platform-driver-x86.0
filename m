Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104223;
	b=sTJl3LjmKalyeye/WukbWReDlHUJGe9Pyv2procGnWdaBAbAHdUTzxv701RX+I+NMRmx
	 l3TrP/VilEPZBJ7DNyS5lViZBP1v6S+YyNN/KYYqwgCMHqt2dIRT2tVy9NWQ82Di69Kwb
	 1wyzOmHy2VuscLWET2X4sAuMpw5bfoXdh5gHY75s4hxguz4Hh1GTOgeBFL+aQc7Vu00Ar
	 J9nfX0R6zaMeh/RdiNwnqnHhoiiqszj8hQZPgS5ZEB6Z/v7XJr5PV+MqyOb8LznOT/MCc
	 LvwGSvIwe0RHZmXEZwrP/YjEoEcJCZmwcrbuBLJ5AsTQnQxay3tzNj4bsm+J2FKeDIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104223;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=ie6MZ2wG49Kc1X2+LWoMWa3DM5RWgwCewzYj25/KsU8=;
	b=ACJvQFy60zSiSObv8yjuBKA1Ah1tVqD2urUkU4gXpp+ffZHgqqsX3qNuehvMGhRltLs6
	 zqwgkyhK9uI/NXck70XINb5o7v+mDFJlaErDT+M+GN+7F3DNDrjhrZyL/sQbYWfW3q7PZ
	 L+X62EKtHtk0Vlyng1aCrxqtijqb2AGw7GXr+t6cmxgOOa/4Fqzf0rpW0Cjg7Pky6R9Gt
	 NNM1Yo2QDeqQzsC/+Fe8mHyDk8M3CL6qupZd27bVGcdfsTY6jxJmQMMPyzCyeXgxylzYg
	 0XhKhldQtc8PZsVMhhWtbiBqssgWFtOWqriKCN5s/MeIumBPsf7PByO5wAwHUQDwgeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=N0NdKt2b;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=StTKDGNt;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F756606A320
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 16:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F756606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=N0NdKt2b;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=StTKDGNt
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C0CF77A02BD
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 11:03:41 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Thu, 19 Nov 2026 11:03:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795104221;
	 x=1795190621; bh=ie6MZ2wG49Kc1X2+LWoMWa3DM5RWgwCewzYj25/KsU8=; b=
	N0NdKt2bG7W30OpQvspn3DDyFQ+e7q9XKAFyxfJcU1b9L6GW/rfjn+eEoaDDfQvj
	YZKClN2nbMhP5tcCJ1VGyz9cd+cFA6l+qZqP9c+WEve5jqhoccdwqw0DusCZC4WG
	5jPVwmpJj4LfNM56M/coVM3TUCimWB02Q4F77ortEBfhjrfm5tC97lHlTiqT9a7E
	xUYEcl6z/pCNi0yvkLfgjeKl/rIrMTCDEAD5tODDM0jdn37Tbgt3TvWcIg4KNvMz
	ipEKIPzs6DIT6s/gcu9CxuzQ2HQLXSAsh3P6bfR10S9nwzwGQ0AYptaT5TXgTu2d
	B5O4L70V7DzSqyWPgrqIpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795104221; x=1795190621; bh=i
	e6MZ2wG49Kc1X2+LWoMWa3DM5RWgwCewzYj25/KsU8=; b=StTKDGNt5NDmttW2b
	Lyje0NciAgHznVW/5mGHtPFF2YU985fVe+uwqBZhXH6XmASogh4U/kGBvRmAmCdf
	ZQLGOnR3sB7016Hw5392Vijwm0f3r249QOfPrjyE2qOBUIEZJWRbt5/P4Yt4QOfX
	uQB5NNekeTaHaI8mnuNUl8w4nmv0YaOv5TmsclKzj3wfjfQHTlbqu6hEwSLEhkAZ
	r9t2bc9OfCfOpivUUOSpv/6SpquyzoSbdXYKGf2/t6lGKUWJ7mHjzL6qOTkKJyAG
	sm2Y1UFQSjc5HhhokU6AOpXs06o79UZ3EipqNvPvu1uIZgGHBmbkhpSIxpaEne2p
	6t8uQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795104221; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:itvFkxwidYujN+aSgkIIpceztRCa+9PJ7ibjOWDMH6sN9fN
	RKk/Z9rZyXq9JmZRdNKeptJhJf/OxGb3uCMTVBtYmKJXJbqnSHsxrunwoDUBXrpb
	2wogzNGtl4r/0g76j45Z/w9AwJ6Slq3Ug1o6ZFikDid18a5ZKTIVGOrBBCmo207T
	n4cq+oUlnN1JBSYkpsqu2sVlBBkfXxguBTiX5TIOMxC7xu7EicdJwGYdT3Q+VveH
	wQHhlJCa6EBWGK+TG2khQb5BL+aZkY/xTXAgwk9KXpzhqoom0NLmYXTuZsL23e6S
	5o8f1Psmy5B34wBDy3UjEXQAsYDFvizeTQfYt/g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:W22v5eP9LE8JbB4gClXdTCx4ZaX6trGS0QSwdS2Xgm0=:GH8m4tDxsG2ZrKzUN6xvqI2R9eqTs5ZtySGVGKZrvmI=;
X-ME-Sender: <xms:3B3_aoWnL4B5i33qAGOFuf4wXhYUPZV-P1n02gF5ccjbtqpacubJ3Q>
    <xme:3B3_anal9gSmq8GrTiZCbTu1VVr-7uzix-5qbsDg4l3_ngOqFN3BZS1HCAlWhMDR0
    Y9_DUwf1FwSbjluVseaHhSafTJ-l6B8DlJ4l5ASjRgGYsFX2TFy2L9n>
X-ME-Proxy-Cause: dmFkZTEzIOgRAVHZk6ke7d3iGoUGrv4/6MXTcS2ZI/YZfkKoDdBBJpO6Qf6Ao4a4oXOeEc
    eX8TT/sn//KQEeJGA7G2ikrjBSy1qXcG0eezJdoTKaGWsLzVWV0kgMIS7DCky6qFMc9Z1V
    8dcuTqozqkAvcq27MpDJkc1P2juhg4Ka31gGSOUiMQBfquai8owQs14NmdzaE8bj5vbUEQ
    uM5tDJiihRQ6k+CQlz94YiJsntR4fcnE64L3DH2f4OK9tI3GOtRMvoQNrDkuuBE+6KY1mA
    HvavYcL/+kyPqH4TozhXcgRiVVatq56IXx5DoPPiQZUqSaZluQaIUSP72zA91Ly7a4uoGt
    T1E4Zy6fVISw8KyDMcppULm1J8gdTdnnly750DPAvZiJqcbtzh2f6KiMJE4jFm8/9h/0xM
    LwKTxTU/J8EEYjzY6Y/k4BtBiPrYSvvT1jRpSQpa1FOKwYVB75MKJatsL+QhpaMFsV0bGF
    BPIRfprqRXq2oxFZm2ADusz//gjxjVoyqkcHR+xfvZ3cpRbfGqADDFoSLdiadrANdQ0kZo
    KlOlevk4R+lMIm0yt55O22xI99mM5+swEcOAg2cXjaHGBxtRkgAYyF1z3QphRqFE7USr6g
    ns39DIG8NJ2Eka/QjXwAdoJ7O+Jz7C3MwKaU07zQqEW78i597gErcDozBeKw
X-ME-Proxy: <xmx:3R3_ag0W7D7_wcXGzZprXlv-HKnNKPO3suokl5Ca1qzVn8c794hJuw>
    <xmx:3R3_amAwgQ9ESUiwfQSmR1Vi2Lo07zg0Tk2LabMlj5V9BV0XhmicJw>
    <xmx:3R3_an5PAJJNRa0cMFraZAyEevj2wXlUnWjSQHscURlo4a751UKHUw>
    <xmx:3R3_avIQg_wVNWbmS4I_zObN1WPcnZ0zrspTZTqqCh54oeSFgtk64Q>
    <xmx:3R3_ajEpispy0GkXjuNnn38bWWjcXZtug2kyBAcejVB_z0Cg37iPJWJ_>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id CF5602C00085; Thu, 19 Nov 2026 11:03:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AfE8UDJlb3EJ
Date: Thu, 19 Nov 2026 11:03:20 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Aaron Ma" <aaron.ma@canonical.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <0f1ee0d9-6fdd-4925-824d-b45eba19114d@app.fastmail.com>
In-Reply-To: <20261119072516.309524-1-aaron.ma@canonical.com>
References: <20261119072516.309524-1-aaron.ma@canonical.com>
Subject: Re: [PATCH v5] platform/x86: lenovo-wmi-other: Deconflict battery with
 thinkpad_acpi
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Thu, Nov 19, 2026, at 2:24 AM, Aaron Ma wrote:
> ThinkPads expose battery charge thresholds and charge_behaviour through
> thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. The
> Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
> charge_behaviour and charge_types on systems advertising those WMI
> capabilities.
>
> When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
> duplicate charge_behaviour sysfs attribute and unregisters its battery
> extension. Conversely, registering or updating any power_supply_ext on
> the same battery runs sysfs_update_groups(), which removes standard
> power-supply attributes not owned by power_supply_core and wipes out
> thinkpad_acpi's charge_control_start_threshold,
> charge_control_end_threshold, and charge_behaviour files.
>
> Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
> thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
> per-driver table guarded by IS_ENABLED() in Kconfig, and update the
> force_load_psy_ext description accordingly.
>
> Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery=20
> charge limiting")
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Co-developed-by: Rong Zhang <i@rong.moe>
> Signed-off-by: Rong Zhang <i@rong.moe>
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
> Changes in v5:
> - Drop the outer #if guard around the macro definition, as requested by
>   Rong Zhang and Ilpo J=C3=A4rvinen.
> - Make methods const char * const * as well with a single
>   LWMI_PSY_DECONFLICT_STRS() macro, casting at acpi_has_method(), as
>   suggested by Rong Zhang.
>
> Changes in v4:
> - Make hids const char * const * with separate HIDs and methods macros,
>   as noted by Ilpo J=C3=A4rvinen.
> - Move HID lookup and method checks into lwmi_acpi_device_has_methods(=
),
>   as suggested by Ilpo J=C3=A4rvinen.
>
> Changes in v3:
> - Wrap deconfliction table entries in #if IS_ENABLED(CONFIG_*) and drop
>   driver_enabled, as suggested by Rong Zhang.
> - Group deconfliction entries per driver (HIDs list + methods list).
>
> Changes in v2:
> - Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
>   device IDs, method pairs, and driver configuration checks, as sugges=
ted
>   by Derek J. Clark.
> - Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
>   instead of relying only on ThinkPad ACPI device presence.
> - Check whether the corresponding driver is enabled before looking up
>   its ACPI device, including for ideapad_laptop.
> - Update the force_load_psy_ext description to cover both drivers.
>
> v4:=20
> https://lore.kernel.org/platform-driver-x86/20261118063058.157862-1-aa=
ron.ma@canonical.com/
> v3:=20
> https://lore.kernel.org/platform-driver-x86/20261113055726.952551-1-aa=
ron.ma@canonical.com/
> v2:=20
> https://lore.kernel.org/platform-driver-x86/20261112074823.853819-1-aa=
ron.ma@canonical.com/
> v1:=20
> https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1-aa=
ron.ma@canonical.com/
>
>  drivers/platform/x86/lenovo/wmi-other.c | 81 ++++++++++++++++++++-----
>  1 file changed, 67 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c=20
> b/drivers/platform/x86/lenovo/wmi-other.c
> index bd64e7b44669d..33be29bafabf5 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
>  static bool force_load_psy_ext;
>  module_param(force_load_psy_ext, bool, 0444);
>  MODULE_PARM_DESC(force_load_psy_ext,
> -	"This option will skip checking if the ideapad_laptop driver will=20
> conflict "
> +	"This option will skip checking if the ideapad_laptop or=20
> thinkpad_acpi driver will conflict "
>  	"with adding an extension to set the battery charge behavior and=20
> battery charge "
>  	"control end threshold. It will also skip checking if the BIOS=20
> reports that "
> -	"those features are fully supported. It is recommended to blacklist=20
> the ideapad "
> +	"those features are fully supported. It is recommended to blacklist=20
> the conflicting "
>  	"driver before using this option.");
>=20
>  /* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 &=
 fan) =3D=3D=3D=3D=3D=3D=3D=3D */
> @@ -905,19 +905,66 @@ static acpi_status lwmi_acpi_match(acpi_handle=20
> handle, u32 lvl,
>  	return AE_CTRL_TERMINATE;
>  }
>=20
> +struct lwmi_psy_deconflict {
> +	const char * const *hids;
> +	const char * const *methods;
> +};
> +
> +#define LWMI_PSY_DECONFLICT_STRS(...) \
> +	((const char * const[]) { __VA_ARGS__, NULL })
> +
> +static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] =3D=
 {
> +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
> +	{
> +		.hids =3D LWMI_PSY_DECONFLICT_STRS("VPC2004"),
> +		.methods =3D LWMI_PSY_DECONFLICT_STRS("GBMD", "SBMC"),
> +	},
> +#endif /* IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) */
> +#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
> +	{
> +		.hids =3D LWMI_PSY_DECONFLICT_STRS("LEN0268", "LEN0068", "IBM0068"),
> +		.methods =3D LWMI_PSY_DECONFLICT_STRS("BDSG", "BICG"),
> +	},
> +#endif /* IS_ENABLED(CONFIG_THINKPAD_ACPI) */
> +};
> +
> +/**
> + * lwmi_acpi_device_has_methods() - Check if an ACPI device has all=20
> methods
> + * @hid: ACPI hardware ID to match
> + * @methods: NULL-terminated array of required ACPI method names
> + *
> + * Return: true if a matching ACPI device is present and exposes all=20
> @methods,
> + * or false otherwise.
> + */
> +static bool lwmi_acpi_device_has_methods(const char *hid,
> +					 const char * const *methods)
> +{
> +	acpi_handle handle =3D NULL;
> +	int ret;
> +
> +	ret =3D acpi_get_devices(hid, lwmi_acpi_match, &handle, NULL);
> +	if (ret || !handle)
> +		return false;
> +
> +	for (unsigned int i =3D 0; methods[i]; i++) {
> +		if (!acpi_has_method(handle, (char *)methods[i]))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>  /**
>   * lwmi_om_psy_ext_init() - Hooks power supply extension to device=20
> battery
>   * @priv: Pointer to the lwmi_om_priv drvdata.
>   *
> - * Checks if the ideapad_laptop driver is going to manage charge=20
> attributes first,
> - * then if not, hooks the battery to our WMI methods if they are=20
> supported.
> + * Checks if the ideapad_laptop or thinkpad_acpi driver is going to=20
> manage
> + * charge attributes first, then if not, hooks the battery to our WMI=20
> methods
> + * if they are supported.
>   */
>  static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
>  {
> -	static const char * const ideapad_hid =3D "VPC2004";
> -	acpi_handle handle =3D NULL;
>  	unsigned int props =3D 0;
> -	int ret;
>=20
>  	if (lwmi_psy_prop_is_supported(priv,=20
> POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR))
>  		props |=3D LWMI_PSY_PROP_BEHAVIOUR;
> @@ -928,14 +975,20 @@ static void lwmi_om_psy_ext_init(struct=20
> lwmi_om_priv *priv)
>  	if (force_load_psy_ext)
>  		goto load_psy_ext;
>=20
> -	/* Deconflict ideapad_laptop driver */
> -	ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL=
);
> -	if (ret)
> -		return;
> +	for (unsigned int i =3D 0; i < ARRAY_SIZE(lwmi_psy_deconflict_list);=
 i++) {
> +		const struct lwmi_psy_deconflict *entry =3D &lwmi_psy_deconflict_li=
st[i];
>=20
> -	if (handle && acpi_has_method(handle, "GBMD") &&=20
> acpi_has_method(handle, "SBMC")) {
> -		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery fo=
r=20
> device\n");
> -		return;
> +		for (unsigned int j =3D 0; entry->hids[j]; j++) {
> +			const char *hid =3D entry->hids[j];
> +
> +			if (!lwmi_acpi_device_has_methods(hid, entry->methods))
> +				continue;
> +
> +			dev_dbg(&priv->wdev->dev,
> +				"ACPI device %s manages battery for device\n",
> +				hid);
> +			return;
> +		}
>  	}
>=20
>  load_psy_ext:
> --=20
> 2.53.0

Thanks Aaron - this looks good to me
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
