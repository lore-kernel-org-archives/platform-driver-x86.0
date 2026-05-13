Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0789A388877;
	Wed, 13 May 2026 14:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683833; cv=pass; b=POSSOBz2yjWQ7W3uGy0EJcSjj+MWAjXYOnzSA/vFoB0CAXQZDy/kOfmldf/4bcdykgwE4TnmUdb/AC32Wm7RdgJHnNtxCinOv33FQznWWa4Iw6Q55cxcEZRmERd99YuKSrCmzH6Y0x89SZa+kU5ZnNlfhB5ClCPwxWdsAzVWsgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683833; c=relaxed/simple;
	bh=dk+t77UYyUAG+COtndZ584lOvCbI4ZnUxz8nPZlFNn8=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MYTff1qSaw3lsKr0gl6NKmW7moYf5oK0okpfq0YXQFMUkACLTkuZMnx4Yp7xgQzTqZxYsp1QtZfB8tgeKz0UzRb1AqweeKBs0VxqFYnGCEAAEWxOoet6MIRn/q0IhuT2hpAkEKqE40kzrUXkf9OioCfmB40I5weXX/zvpSQZoZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=EGNZHhPZ; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="EGNZHhPZ"
ARC-Seal: i=1; a=rsa-sha256; t=1778683816; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mdppJSkhKXOXMOdHJBS9ZJWuk5ROy2w9S1mNNVsIP/xEphw01ttuPVBU15E6u6OlcOaBK3JEmQnNTZD2wUazMpqHihm9Ib+8txOMX6hjy7jbndiTyp/GBkI/XoRz0XhF8kIdl5BuJTBUSRz0vn9FyKUMfO3cSOuAm2mmnkvCqgU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778683816; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t1K7slC9kNVZ/qRvLLxQRrltRc6PI8CvEaqEsnZhF0k=; 
	b=L8/BOU7fzPOwpTscdxVKZXHys+4PHbbIy3TAFotsY/Qo8m4ZmFakcPpkE95JVuxKYXl0LzkWjhyd7p4f7i1NRWlDmCrvDg/c5ZL+s2r7ZUXf7E0Gg9S11ycdZAJy+UnAX5xk1Fn8WmL3pCDGaKtL7IetoDwFxZB+BXlodd2jvAc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778683816;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=t1K7slC9kNVZ/qRvLLxQRrltRc6PI8CvEaqEsnZhF0k=;
	b=EGNZHhPZG4pUb68sx1Jaw0ImA/yt+wxjsjt4T5f/4GqMzYljxLJSRCrp34dzPi+4
	UyVsnMVE9cqpwhYGXd8GCSNYTShEmt5UiLcwJBEj1LjnlLZ+dJQmqcr0WNUhIKFm93H
	Jieg/Nvd4vtuQQAZR9VHiv2N6tpmTczUtLbe5iRGqvL7kNeaRXfA8ntof1GVd0e1NIr
	hC49EOSZqMGpnJnsPgSR4z/JvgyVdx+D5wfZ++G/haDBu+Y3VV/7YR7+rO58Al3u6BF
	W0SYfn7FeCUhj45K3kKkBTZBknZm/KMycrbtQvzSEMXnFIaXT0x0+aZU5t+8BVQLcdb
	mR8kJZLe9w==
Received: by mx.zohomail.com with SMTPS id 177868381495175.63825719229135;
	Wed, 13 May 2026 07:50:14 -0700 (PDT)
Message-ID: <72e3e15c2b69513a4405b2df96765bd80e0907b8.camel@rong.moe>
Subject: Re: [PATCH v13 5/7] platform/x86: lenovo-wmi-other: Add
 force_load_psy_ext module parameter
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 "Pierre-Loup A . Griffais"	 <pgriffais@valvesoftware.com>,
 =?ISO-8859-1?Q?N=EDcolas?= "F . R . A . Prado"	 <nfraprado@collabora.com>,
 marshall@shzj.cc, hyacinth@shzj.cc, 	platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260512235808.691046-6-derekjohn.clark@gmail.com>
References: <20260512235808.691046-1-derekjohn.clark@gmail.com>
	 <20260512235808.691046-6-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 22:44:03 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2026-05-12 at 23:58 +0000, Derek J. Clark wrote:
> Some Lenovo BIOS have been shown to have incomplete and/or broken
> capability data and WMI attribute IDs. In some cases the capability data
> reports that a feature is not supported when the get/set methods are
> fully implemented. It is also possible that the ACPI methods from the
> ideapad_laptop driver we defer to could be bugged while the WMI method
> is fully working. To aid end users in submitting more complete bug
> reports in these situations, add an override to skip the ACPI and
> compatibility checks to force load the power supply extension as if it
> is fully supported and has no conflicts.
>=20
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

LGTM!

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> ---
> v13:
>   - Ensure is_writable and is_supported always return true when
>     force_load_psy_ext is true.
> v12:
>   - Move the force_load_psy_ext into its own distinct patch.
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index a423bd563291..9d5250d41a3f 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -185,6 +185,16 @@ MODULE_PARM_DESC(relax_fan_constraint,
>  	"Enabling this may results in HWMON attributes being out-of-sync, "
>  	"and setting a too low RPM stops the fan. Use with caution.");
> =20
> +/* Visibility of power supply extensions */
> +static bool force_load_psy_ext;
> +module_param(force_load_psy_ext, bool, 0444);
> +MODULE_PARM_DESC(force_load_psy_ext,
> +	"This option will skip checking if the ideapad_laptop driver will confl=
ict "
> +	"with adding an extension to set the battery charge behavior and batter=
y charge "
> +	"control end threshold. It will also skip checking if the BIOS reports =
that "
> +	"those features are fully supported. It is recommended to blacklist the=
 ideapad "
> +	"driver before using this option.");
> +
>  /* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 & fa=
n) =3D=3D=3D=3D=3D=3D=3D=3D */
> =20
>  /**
> @@ -755,6 +765,9 @@ static bool lwmi_psy_prop_is_supported(struct lwmi_om=
_priv *priv, enum power_sup
>  {
>  	int ret;
> =20
> +	if (force_load_psy_ext)
> +		return true;
> +
>  	ret =3D lwmi_psy_prop_get_supported(priv, prop);
>  	if (ret < 0)
>  		return false;
> @@ -781,6 +794,9 @@ static int lwmi_psy_prop_is_writeable(struct power_su=
pply *ps,
>  	struct lwmi_om_priv *priv =3D ext_data;
>  	int ret;
> =20
> +	if (force_load_psy_ext)
> +		return true;
> +
>  	ret =3D lwmi_psy_prop_get_supported(priv, prop);
>  	if (ret < 0)
>  		return false;
> @@ -909,6 +925,8 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv =
*priv)
>  		props |=3D LWMI_PSY_PROP_TYPES;
>  	if (!props)
>  		return;
> +	if (force_load_psy_ext)
> +		goto load_psy_ext;
> =20
>  	/* Deconflict ideapad_laptop driver */
>  	ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
> @@ -920,6 +938,7 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv =
*priv)
>  		return;
>  	}
> =20
> +load_psy_ext:
>  	/* Add battery hooks */
>  	priv->battery_ext =3D lwmi_psy_exts[props];
>  	priv->battery_hook.add_battery =3D lwmi_add_battery;
