Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5ED6FC5;
	Wed,  8 Apr 2026 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775663625; cv=pass; b=e/C6kyXWL1xqAbqgWOwaqpvOp71owcIvQmuN62wP7fmBjoEYyvfLYJxZ9Pp6Q34ohQUUlg+FHgYKcZs9/3RkS3Op/RQPCj9rQmNMfEg7/SaPkj+4xMkndyiE4cy8dE75mOGDYXkc6m1cllJ7oh41tyGmHEmSQF1gdIMNucCgMng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775663625; c=relaxed/simple;
	bh=L0RXfUiNBQmyvoBmHYCkC3AaMzrC8x+vy4FoQXo4cNY=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ij+Knw8Br1itBLvBuAw+dhPWiYnZR6ApJrVet1Xulj7MQXQDiNLRtK3GkrjrKH4bNVTR3rA14hJezHiEv8eiagm6XmLOGf+Qr2tV3uROZAa7sUSc3i9DEl3gSMBQe/feCbsFBQ4r68oJiPx5myCCQxXHjRlnjl38q/swwbc/FPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=TM1zWwEg; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="TM1zWwEg"
ARC-Seal: i=1; a=rsa-sha256; t=1775663611; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QmXdBtGz4unjorZJGG+vT+/TEYGdasJ2Skjo1ixSr6sTjS92X7BLv35G5TeUzL9B3WnKYsRzFMCHAhXyp2nkMc4/8bJpidwgvPH67i88exBptSeB4KZ7q35djeVYfvGAV+/wqlcrjVQtm0z3ZNN78dS1IxNhVpseHueylwyx66I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775663611; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=e+ROqYI4z/8WtIuDNmHxdwXaRMx2W6sqn2Enw33/PYg=; 
	b=UIzh6rNP5FXC5dr9q/+nHJmDzSFpsESFEdDLLK1NwPCPphpoLBR1Ze9CK/PM5poQW6SJxp9SlsJjUnlZtKTIFgoOnS9I8A1M+5jWw5lhJ0rpy6ryOlsMCM9+UzhPZggO0vMNApNGLiYGaTR6BMnSdBKs8I44ud2vS+8eht2b1Ys=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775663611;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=e+ROqYI4z/8WtIuDNmHxdwXaRMx2W6sqn2Enw33/PYg=;
	b=TM1zWwEgidm+vVa49FWGf+mR6p5fbH1TOaZnC8vR2chwk/BZ9Wq7cR83Bek3xyWY
	V+Ug+5tL2K0W407niv4VoQ+N18p49NexJzCC255RS9Hkszy6/gkxBG2P9hc+YpPJeTe
	OaOvJX0nv36JDdaSdDaIj1osR7Qmf2P9ZTo3NLaILAms9db9omWl+Xuu2kkoxf20jky
	uJfaPP8bGY4OsYOKE9NI6Uwwj0xFLHHLgiUYtWjZkjpRvlUehREQEt7I7DCTq4CT2du
	ddpiQQ3/tN7+cOQvzRTYm5ES4367Z/X8fcTBcqQZbKG8pgSeA+rDiA6H1ZK+mdcKDZM
	yl0g6O0uJw==
Received: by mx.zohomail.com with SMTPS id 1775663609328770.3353191730517;
	Wed, 8 Apr 2026 08:53:29 -0700 (PDT)
Message-ID: <672641d5618e117600ec423e2e5910f63bad0369.camel@rong.moe>
Subject: Re: [PATCH v8 10/16] platform/x86: lenovo-wmi-other: Add
 lwmi_attr_id() function
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260406201400.438221-11-derekjohn.clark@gmail.com>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com>
	 <20260406201400.438221-11-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Apr 2026 23:48:21 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Mon, 2026-04-06 at 20:13 +0000, Derek J. Clark wrote:
> Adds lwmi_attr_id() function. In the same vein as LWMI_ATTR_ID_FAN_RPM(),
> but as a generic, to de-duplicate attribute_id assignment biolerplate.
>=20
> Reviewed-by: Rong Zhang <i@rong.moe>
> Tested-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v7:
>   - Incorporate additional replacements in lwmi_attr_01_is_supported
>     after moving the patch that adds it to earlier in the series.
> v6:
>   - Move lwmi_attr_id to wmi-capdata.h as static inline.
> v5:
>   - Move references to cv/cd_mode_id to patch 4/8.
>   - Move lwmi_attr_id to wmi-capdata.c and export with namespace.
> v4:
>   - Switch from macro to static inline to preserve types.
> ---
>  drivers/platform/x86/lenovo/wmi-capdata.c |  8 ++--
>  drivers/platform/x86/lenovo/wmi-capdata.h | 20 ++++++++
>  drivers/platform/x86/lenovo/wmi-other.c   | 56 ++++++++---------------
>  3 files changed, 43 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform=
/x86/lenovo/wmi-capdata.c
> index ee1fb02d8e31..169665be4dcf 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -27,7 +27,6 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> =20
>  #include <linux/acpi.h>
> -#include <linux/bitfield.h>
>  #include <linux/bug.h>
>  #include <linux/cleanup.h>
>  #include <linux/component.h>
> @@ -48,6 +47,7 @@
>  #include <linux/wmi.h>
> =20
>  #include "wmi-capdata.h"
> +#include "wmi-helpers.h"
> =20
>  #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB=
300E"
>  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE01=
8154"
> @@ -58,9 +58,9 @@
> =20
>  #define LWMI_FEATURE_ID_FAN_TEST 0x05
> =20
> -#define LWMI_ATTR_ID_FAN_TEST							\
> -	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |		\
> -	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_TEST))
> +#define LWMI_ATTR_ID_FAN_TEST                                      \
> +	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_TEST, \
> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_TYPE_ID_NONE)
> =20
>  enum lwmi_cd_type {
>  	LENOVO_CAPABILITY_DATA_00,
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform=
/x86/lenovo/wmi-capdata.h
> index 8c1df3efcc55..1388eaf4ab4a 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -6,6 +6,7 @@
>  #define _LENOVO_WMI_CAPDATA_H_
> =20
>  #include <linux/bits.h>
> +#include <linux/bitfield.h>
>  #include <linux/types.h>
> =20
>  #define LWMI_SUPP_VALID		BIT(0)
> @@ -19,6 +20,8 @@
> =20
>  #define LWMI_DEVICE_ID_FAN	0x04
> =20
> +#define LWMI_TYPE_ID_NONE 0x00
> +
>  struct component_match;
>  struct device;
>  struct cd_list;
> @@ -57,6 +60,23 @@ struct lwmi_cd_binder {
>  	cd_list_cb_t cd_fan_list_cb;
>  };
> =20
> +/**
> + * lwmi_attr_id() - Formats a capability data attribute ID
> + * @dev_id: The u8 corresponding to the device ID.
> + * @feat_id: The u8 corresponding to the feature ID on the device.
> + * @mode_id: The u8 corresponding to the wmi-gamezone mode for set/get.
> + * @type_id: The u8 corresponding to the sub-device.
> + *
> + * Return: u32.
> + */
> +static inline u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 typ=
e_id)
> +{
> +	return (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev_id)   |
> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat_id) |
> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode_id) |
> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type_id));
> +}
> +
>  void lwmi_cd_match_add_all(struct device *master, struct component_match=
 **matchptr);
>  int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct ca=
pdata00 *output);
>  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct ca=
pdata01 *output);
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index 25ddfd54f692..19a072bea2d4 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -27,7 +27,6 @@
>   */
> =20
>  #include <linux/acpi.h>
> -#include <linux/bitfield.h>
>  #include <linux/cleanup.h>
>  #include <linux/component.h>
>  #include <linux/container_of.h>
> @@ -59,8 +58,6 @@
> =20
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> =20
> -#define LWMI_TYPE_ID_NONE 0x00
> -
>  #define LWMI_FEATURE_VALUE_GET 17
>  #define LWMI_FEATURE_VALUE_SET 18
> =20
> @@ -70,10 +67,9 @@
> =20
>  #define LWMI_FAN_DIV 100
> =20
> -#define LWMI_ATTR_ID_FAN_RPM(x)						\
> -	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
> -	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
> -	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
> +#define LWMI_ATTR_ID_FAN_RPM(x)                                   \
> +	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> =20
>  #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
> @@ -616,12 +612,8 @@ static ssize_t attr_capdata01_show(struct kobject *k=
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
> @@ -686,10 +678,8 @@ static ssize_t attr_current_value_store(struct kobje=
ct *kobj,
>  	if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
>  		return -EBUSY;
> =20
> -	args.arg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id=
) |
> -		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, tunable_attr->cd_mode_id) |
> -		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->featu=
re_id,
> +				 tunable_attr->cd_mode_id, tunable_attr->type_id);
> =20
>  	ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
>  	if (ret)
> @@ -702,10 +692,8 @@ static ssize_t attr_current_value_store(struct kobje=
ct *kobj,
>  	if (value < capdata.min_value || value > capdata.max_value)
>  		return -EINVAL;
> =20
> -	args.arg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id=
) |
> -		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, tunable_attr->cv_mode_id) |
> -		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->featu=
re_id,
> +				 tunable_attr->cv_mode_id, tunable_attr->type_id);
>  	args.arg1 =3D value;
> =20
>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> @@ -750,10 +738,8 @@ static ssize_t attr_current_value_show(struct kobjec=
t *kobj,
>  	if (tunable_attr->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
>  		mode =3D tunable_attr->cv_mode_id;
> =20
> -	args.arg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id=
) |
> -		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> -		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->featu=
re_id,
> +				 tunable_attr->cv_mode_id, tunable_attr->type_id);

Bad rebase?

s/tunable_attr->cv_mode_id/mode/

I don't have further comments on the whole series.

Thanks,
Rong

> =20
>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
>  				    (unsigned char *)&args, sizeof(args),
> @@ -794,10 +780,8 @@ static bool lwmi_attr_01_is_supported(struct tunable=
_attr_01 *tunable_attr)
> =20
>  	/* Determine tunable_attr->cd_mode_id*/
>  	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
> -		args.arg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_i=
d) |
> -			    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -			    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, modes[i]) |
> -			    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +		args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->feat=
ure_id,
> +					 modes[i], tunable_attr->type_id);
> =20
>  		ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
>  		if (ret || !capdata.supported)
> @@ -810,15 +794,10 @@ static bool lwmi_attr_01_is_supported(struct tunabl=
e_attr_01 *tunable_attr)
>  	if (!cd_mode_found)
>  		return cd_mode_found;
> =20
> -	dev_dbg(tunable_attr->dev,
> -		"cd_mode_id: %#010x\n", args.arg0);
> -
>  	/* Determine tunable_attr->cv_mode_id, returns 1 if supported*/
>  	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
> -		args.arg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_i=
d) |
> -			    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -			    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, modes[i]) |
> -			    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +		args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->feat=
ure_id,
> +					 modes[i], tunable_attr->type_id);
> =20
>  		ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
>  					    (unsigned char *)&args, sizeof(args),
> @@ -833,7 +812,10 @@ static bool lwmi_attr_01_is_supported(struct tunable=
_attr_01 *tunable_attr)
>  	if (!cv_mode_found)
>  		return cv_mode_found;
> =20
> -	dev_dbg(tunable_attr->dev, "cv_mode_id: %#010x, attribute support level=
: %#010x\n",
> +	dev_dbg(tunable_attr->dev,
> +		"cd_mode_id: %#010x, cv_mode_id: %#010x, attribute support level: %#01=
0x\n",
> +		lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
> +			     tunable_attr->cd_mode_id, tunable_attr->type_id),
>  		args.arg0, capdata.supported);
> =20
>  	return capdata.supported > 0 ? true : false;
