Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C98625
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 04:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773548231; cv=pass; b=bscuW/zc9szTeMp6TKLwdGELWrr4+d4UQr6E7gC/LqdgNKEE5nlHurfiI1rnDhDT68HlNFWgcM6hGP4ZphjV2McUmU5rDj2kGw3H3UMyz1JoUN0RpFxTf1333l2cU1ez4N6nlXFqtmgHycLlPV3cx3h3+YC83tynlZslYp4J6W0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773548231; c=relaxed/simple;
	bh=7btbLjU/6kxNPvgoN5lmc13gNM3TV1O/pDSf+gAEQ5c=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=I6dCmAFVHGZtRlBL5nKYWHBAimfmlqbRXvXq7tf+jBhyg/Bmi8yCD82pjiW+BYfb/+129C+AeaWQye4QXoSXp+s2s61gbAd94hDx69qdshoZcZpZNwgkc58sdsUEI5m8vCrnzkrZ5zVI5Vv0Bb1LTdMMG6f0eDTXFH1xMAf/8Tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=hycEJ3F6; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="hycEJ3F6"
ARC-Seal: i=1; a=rsa-sha256; t=1773538683; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NWFPgST0jmEiZmvzWQUSjnYTqPTrzCbjz/dswSJ4XP8/Yr4U9Nv1+9SAfUJoadKqQzSRqkYcsymyOMvEd3eqLb/tG7VjbbyuNuYi2C36xFQQT+mVEjdQOe6Nm2O0+g0RA/OvohA1q9OYCytS/Mv/N7QKcuUYWYB6Qbx7UqD3rEM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773538683; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YglQ+hR8VPAMqYmCiUOUa3s15feyvRp3k24Jq13mGxE=; 
	b=SlwZn8sOtbCR7ObZDFvzZ6CFEIQwHZoB73WcBjYjFVxHoYiiu+67+d//neCfeaNPnFA/IXI99u7jM3yB2xOVtAtZQ+kNvTAeAmG30wBEhwH5NC2WeaD5fC4mtOQezCCFmxQeGToMBOF6b4n5Nyv4ZpcrvViz/PoAyXGUw82KZQM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773538683;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=YglQ+hR8VPAMqYmCiUOUa3s15feyvRp3k24Jq13mGxE=;
	b=hycEJ3F67A/kPbG/+gRCiP1X3eN9PU2ox85FebY7/jqgHIFhFIycFJQMIZguNu06
	BBkE4q6wnURYa5ZQq068abL32ExbkTAbD4oQhuHCyU/DP0rvrUdRn9rvaZRjar5HnEw
	ozWmmmHZB6+G9TyGFj1FDHKe7fXT4jO5KPR0DAG4hdh07TghUOlchb0CUTuBhZcVZA0
	Vb8ywpUNxYVgR989N88DOOKmkRenwnVrn2caCjD1uNYNCy9NWWshkDXQv9Gl3OYpfx2
	kn5WAaKd5hWfXJxCpMuuFYvF8aQUlkPf5ij+4XJwffSJnOR+HS/q2019o10959s9ZgM
	14NGcfctrA==
Received: by mx.zohomail.com with SMTPS id 1773538679810237.11267587085365;
	Sat, 14 Mar 2026 18:37:59 -0700 (PDT)
Message-ID: <ba6cc9d717923b4ad6bc906971aff1ee802ee282.camel@rong.moe>
Subject: Re: [PATCH v4 3/8] platform/x86: lenovo-wmi-other: Add
 lwmi_attr_id() function
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260312031032.3467565-4-derekjohn.clark@gmail.com>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
	 <20260312031032.3467565-4-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Mar 2026 09:32:51 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Thu, 2026-03-12 at 03:10 +0000, Derek J. Clark wrote:
> Adds lwmi_attr_id() function. In the same vein as LWMI_ATTR_ID_FAN_RPM(),
> but as a generic, to de-duplicate attribute_id assignment biolerplate.
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v4:
>   - Switch from macro to static inline to preserve types.
> ---
>  drivers/platform/x86/lenovo/wmi-gamezone.h |  1 +
>  drivers/platform/x86/lenovo/wmi-other.c    | 59 +++++++++++++---------
>  2 files changed, 35 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.h b/drivers/platfor=
m/x86/lenovo/wmi-gamezone.h
> index 6b163a5eeb95..ddb919cf6c36 100644
> --- a/drivers/platform/x86/lenovo/wmi-gamezone.h
> +++ b/drivers/platform/x86/lenovo/wmi-gamezone.h
> @@ -10,6 +10,7 @@ enum gamezone_events_type {
>  };
> =20
>  enum thermal_mode {
> +	LWMI_GZ_THERMAL_MODE_NONE =3D	   0x00,
>  	LWMI_GZ_THERMAL_MODE_QUIET =3D	   0x01,
>  	LWMI_GZ_THERMAL_MODE_BALANCED =3D	   0x02,
>  	LWMI_GZ_THERMAL_MODE_PERFORMANCE =3D 0x03,
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index c1728c7c2957..9fff9c1f768c 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -73,10 +73,26 @@
> =20
>  #define LWMI_FAN_DIV 100
> =20
> -#define LWMI_ATTR_ID_FAN_RPM(x)						\
> -	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
> -	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
> -	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
> +/**
> + * lwmi_attr_id() - Formats a capability data attribute ID
> + * @dev_id: The u8 corresponding to the device ID.
> + * @feat_id: The u8 corresponding to the feature ID on the device.
> + * @mode_id: The u8 corresponding to the wmi-gamezone mode for set/get.
> + * @type_id: The u8 corresponding to the sub-device.
> + *
> + * Return: u32.
> + */
> +static u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 type_id)
> +{
> +	return (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev_id)   |
> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat_id) |
> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode_id) |
> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type_id));
> +}

Hmm, I'd suggest adding them to wmi-capdata.h so that you can refactor
LWMI_ATTR_ID_FAN_TEST in wmi-capdata.c too.

Thanks,
Rong

> +
> +#define LWMI_ATTR_ID_FAN_RPM(x)                                   \
> +	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> =20
>  #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
> @@ -550,6 +566,8 @@ struct tunable_attr_01 {
>  	u8 feature_id;
>  	u8 device_id;
>  	u8 type_id;
> +	u8 cd_mode_id; /* mode arg for searching capdata */
> +	u8 cv_mode_id; /* mode arg for set/get current_value */
>  };
> =20
>  static struct tunable_attr_01 ppt_pl1_spl =3D {
> @@ -715,12 +733,8 @@ static ssize_t attr_capdata01_show(struct kobject *k=
obj,
>  	u32 attribute_id;
>  	int value, ret;
> =20
> -	attribute_id =3D
> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK,
> -			   LWMI_GZ_THERMAL_MODE_CUSTOM) |
> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	attribute_id =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->fe=
ature_id,
> +				    LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_attr->type_id);
> =20
>  	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>  	if (ret)
> @@ -775,7 +789,6 @@ static ssize_t attr_current_value_store(struct kobjec=
t *kobj,
>  	struct wmi_method_args_32 args;
>  	struct capdata01 capdata;
>  	enum thermal_mode mode;
> -	u32 attribute_id;
>  	u32 value;
>  	int ret;
> =20
> @@ -786,13 +799,10 @@ static ssize_t attr_current_value_store(struct kobj=
ect *kobj,
>  	if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
>  		return -EBUSY;
> =20
> -	attribute_id =3D
> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->featu=
re_id,
> +				 mode, tunable_attr->type_id);
> =20
> -	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
> +	ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
>  	if (ret)
>  		return ret;
> =20
> @@ -803,7 +813,8 @@ static ssize_t attr_current_value_store(struct kobjec=
t *kobj,
>  	if (value < capdata.min_value || value > capdata.max_value)
>  		return -EINVAL;
> =20
> -	args.arg0 =3D attribute_id;
> +	args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->featu=
re_id,
> +				 tunable_attr->cv_mode_id, tunable_attr->type_id);
>  	args.arg1 =3D value;
> =20
>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> @@ -837,7 +848,6 @@ static ssize_t attr_current_value_show(struct kobject=
 *kobj,
>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>  	struct wmi_method_args_32 args;
>  	enum thermal_mode mode;
> -	u32 attribute_id;
>  	int retval;
>  	int ret;
> =20
> @@ -845,13 +855,12 @@ static ssize_t attr_current_value_show(struct kobje=
ct *kobj,
>  	if (ret)
>  		return ret;
> =20
> -	attribute_id =3D
> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	/* If "no-mode" is the supported mode, ensure we never send current mod=
e */
> +	if (tunable_attr->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
> +		mode =3D tunable_attr->cv_mode_id;
> =20
> -	args.arg0 =3D attribute_id;
> +	args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->featu=
re_id,
> +				 mode, tunable_attr->type_id);
> =20
>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
>  				    (unsigned char *)&args, sizeof(args),
