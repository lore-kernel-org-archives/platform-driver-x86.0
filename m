Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00793CF69F;
	Wed, 25 Mar 2026 18:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774461613; cv=pass; b=WHvQ2YDiPN5RPxaPfOssxljiA541PX3O2HUkO++gJpDgiajpt9s/DC6EjRMU2JJi6+CS/Gc1WgT/jhRfPgZhJnzFpNmXq+owL7ry4FEOxL/WOAceHb6dq2Gx/u9hq7EkHxlf/rV485Z3SBIDtXTlnrI+iiVGv+td/GyNN579Qao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774461613; c=relaxed/simple;
	bh=lRdjOyfPOXHE/3peDEmvhgJcait1GhRiqPSfumUY0/0=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kPx2KOUhNuBi66dSozd1z2VYun5MHBbpNptnwON4l2JrVvF8OKZ79puxFG4rpo/CFtCSWz0OMV/uJjMxJcM8JHYwLLZqZNyBQJjdfz79xV/aXm1L+9YL4EhnjElrDxUwH4I6uAQMThkHvq6t9UpF42ZG0bEgO3yzwoJWEeiDvF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=cRD4XkUn; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="cRD4XkUn"
ARC-Seal: i=1; a=rsa-sha256; t=1774461596; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GQkwJTeiXw83h3UikZjvtYiew8FD4qTyPqMaQV4hoX9tu3Y2V+KlBmbv9lRrYFM0twihiTtxJRyoYsAKDt89BkS4t+JzZ8gDjvk+4wX6mwYhTNptij5TscfugbWCp4SskBx29SPBr6gvPs7B1UcL8/4/doeu9gm5shliNKFZ8uA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774461596; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=92KcPreP9KwWvq9jwzBmGF0UHzLyUCYxdciT2DV+FQ8=; 
	b=jFMn+iKbZjdd/hc+ACWUY2Ar+zpEe7fEZ7alPn5rTkZD33DZR1qktjCDX4skt6xFdL04WGLimy+ZTwODkxOTqSfoilQ4L4xpOIV+3MROocKNEupP2j3LhuSX8a/woVo2EDlTqEUFzZbFKRKIHhRIvW5Oh6+EmGqMihrspfj+C8s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774461596;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=92KcPreP9KwWvq9jwzBmGF0UHzLyUCYxdciT2DV+FQ8=;
	b=cRD4XkUnJFlmRUE6Z59niatKYDDZscH8TgWrfbZ2lTJ6psy4jBjxnlj6Kyz1mpWC
	9+St+mv45I8IjrPZSjWqjRx90c+9vzgp3GC1k9lsnbFodEQ2pV5uvxYAkcSAEPJ5oPn
	Z2rXSK4t+foX11Bh8lERLz4fO4oBwGHoVWtcZhPGj8qR5BzHkdQivbzyMPtL1f6+Sob
	wy/tPhyNCPzV3ewmBCck/SzU54Gxa1QU4a/8VeGJJxmKy5miqTzptshfCntT09sFyvo
	ns5KrIidIDtmo5iXSt+xQ3HppMoC7REH82wyUCx3Q8dec7jSnURkoLLNmt9S0ky2wDe
	+XRkH51J2w==
Received: by mx.zohomail.com with SMTPS id 1774461594307585.7200805784255;
	Wed, 25 Mar 2026 10:59:54 -0700 (PDT)
Message-ID: <95c7e7b539dd0af41189c754fcd35cec5b6fe182.camel@rong.moe>
Subject: Re: [PATCH v5 3/8] platform/x86: lenovo-wmi-other: Add
 lwmi_attr_id() function
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260324221032.1333636-4-derekjohn.clark@gmail.com>
References: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
	 <20260324221032.1333636-4-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Mar 2026 01:54:49 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2026-03-24 at 22:10 +0000, Derek J. Clark wrote:
> Adds lwmi_attr_id() function. In the same vein as LWMI_ATTR_ID_FAN_RPM(),
> but as a generic, to de-duplicate attribute_id assignment biolerplate.
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v5:
>   - Move references to cv/cd_mode_id to patch 4/8.
>   - Move lwmi_attr_id to wmi-capdata.c and export with namespace.
> v4:
>   - Switch from macro to static inline to preserve types.
> ---
>  drivers/platform/x86/lenovo/wmi-capdata.c  | 25 ++++++++++++--
>  drivers/platform/x86/lenovo/wmi-capdata.h  |  3 ++
>  drivers/platform/x86/lenovo/wmi-gamezone.h |  1 +
>  drivers/platform/x86/lenovo/wmi-other.c    | 39 ++++++----------------
>  4 files changed, 36 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform=
/x86/lenovo/wmi-capdata.c
> index ee1fb02d8e31..6cb3665e9399 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -48,6 +48,7 @@
>  #include <linux/wmi.h>
> =20
>  #include "wmi-capdata.h"
> +#include "wmi-gamezone.h"
> =20
>  #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB=
300E"
>  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE01=
8154"
> @@ -58,9 +59,27 @@
> =20
>  #define LWMI_FEATURE_ID_FAN_TEST 0x05
> =20
> -#define LWMI_ATTR_ID_FAN_TEST							\
> -	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |		\
> -	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_TEST))
> +/**
> + * lwmi_attr_id() - Formats a capability data attribute ID
> + * @dev_id: The u8 corresponding to the device ID.
> + * @feat_id: The u8 corresponding to the feature ID on the device.
> + * @mode_id: The u8 corresponding to the wmi-gamezone mode for set/get.
> + * @type_id: The u8 corresponding to the sub-device.
> + *
> + * Return: u32.
> + */
> +u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 type_id)
> +{
> +	return (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev_id)   |
> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat_id) |
> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode_id) |
> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type_id));
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_attr_id, "LENOVO_WMI_CAPDATA");
> +
> +#define LWMI_ATTR_ID_FAN_TEST                                      \
> +	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_TEST, \
> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_TYPE_ID_NONE)

I don't really love the idea of exporting a very simple function instead
of providing a static inline equivalent in the corresponding header.

Compilers are smart. For example, they are capable to convert
LWMI_ATTR_ID_FAN_RPM(x) into `0x04030000 | (x + 1)', as long as the
function body is accessible.

By implementing and exporting it in wmi-capdata.c, wmi-other.c can no
longer access the function body so no optimization can be done there
(note that LTO has nothing to do when both are compiled as modules).
Hence, the compiler has no choice but to emit a function call to
lwmi_attr_id().

Moreover, your following patches have a lot of
lwmi_attr_id(tunable_attr->*_id, ...) patterns in wmi-other.c. Outlining
a simple function usually has higher overhead than inlining it (hence
worse performance). The calling convention also increases register
pressure, resulting in a bloated code size:

PATCH v5 (whole series):

   text    data     bss     dec     hex filename
   6465    1832       0    8297    2069 lenovo-wmi-capdata.ko
  43132    9153       3   52288    cc40 lenovo-wmi-other.ko

Inlining lwmi_attr_id():

   text    data     bss     dec     hex filename
   6325    1832       0    8157    1fdd lenovo-wmi-capdata.ko
  41070    9153       3   50226    c432 lenovo-wmi-other.ko

52288 - 50226 ~=3D 2KiB, which is quite a lot.

So please move it to capdata.h and make it a static inline function.

> =20
>  enum lwmi_cd_type {
>  	LENOVO_CAPABILITY_DATA_00,
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform=
/x86/lenovo/wmi-capdata.h
> index 8c1df3efcc55..b5b6d0305b6a 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -19,6 +19,8 @@
> =20
>  #define LWMI_DEVICE_ID_FAN	0x04
> =20
> +#define LWMI_TYPE_ID_NONE 0x00
> +
>  struct component_match;
>  struct device;
>  struct cd_list;
> @@ -57,6 +59,7 @@ struct lwmi_cd_binder {
>  	cd_list_cb_t cd_fan_list_cb;
>  };
> =20
> +u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 type_id);
>  void lwmi_cd_match_add_all(struct device *master, struct component_match=
 **matchptr);
>  int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct ca=
pdata00 *output);
>  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct ca=
pdata01 *output);
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
> index c1728c7c2957..7aa512ff1446 100644
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
> @@ -62,8 +61,6 @@
> =20
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> =20
> -#define LWMI_TYPE_ID_NONE 0x00
> -
>  #define LWMI_FEATURE_VALUE_GET 17
>  #define LWMI_FEATURE_VALUE_SET 18
> =20
> @@ -73,10 +70,9 @@
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
> @@ -715,12 +711,8 @@ static ssize_t attr_capdata01_show(struct kobject *k=
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
> @@ -775,7 +767,6 @@ static ssize_t attr_current_value_store(struct kobjec=
t *kobj,
>  	struct wmi_method_args_32 args;
>  	struct capdata01 capdata;
>  	enum thermal_mode mode;
> -	u32 attribute_id;
>  	u32 value;
>  	int ret;
> =20
> @@ -786,13 +777,10 @@ static ssize_t attr_current_value_store(struct kobj=
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
> @@ -803,7 +791,6 @@ static ssize_t attr_current_value_store(struct kobjec=
t *kobj,
>  	if (value < capdata.min_value || value > capdata.max_value)
>  		return -EINVAL;
> =20
> -	args.arg0 =3D attribute_id;
>  	args.arg1 =3D value;
> =20
>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> @@ -837,7 +824,6 @@ static ssize_t attr_current_value_show(struct kobject=
 *kobj,
>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>  	struct wmi_method_args_32 args;
>  	enum thermal_mode mode;
> -	u32 attribute_id;
>  	int retval;
>  	int ret;
> =20
> @@ -845,13 +831,8 @@ static ssize_t attr_current_value_show(struct kobjec=
t *kobj,
>  	if (ret)
>  		return ret;
> =20
> -	attribute_id =3D
> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> -
> -	args.arg0 =3D attribute_id;
> +	args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->featu=
re_id,
> +				 mode, tunable_attr->type_id);

IIUC args.arg1 contains uninitialized data and will be passed to
firmware. Since you are revising its assignment, let's zero-initialize
`args' when declaring it too.

Thanks,
Rong

> =20
>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
>  				    (unsigned char *)&args, sizeof(args),
