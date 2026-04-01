Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59708472767;
	Wed,  1 Apr 2026 18:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068692; cv=pass; b=gl+2b+P99hG7QZ1NFwcKFBOcVDO9RES7SvCvibifWm/W2+p7+i7qxyO9YdD6kv5r+S52sIS0dVZWHd//hyAqmLbypott1Qz1tP3mmfTaKn2YpnevUc2OR5l7mhuKhXgvYbjhQUtMT2VqmzGhHglNeCm/Bbf6d20Cq6R6wy4XAAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068692; c=relaxed/simple;
	bh=iB1yJwyVsrTDulbfFiGhOMWW/D5oZ3O5BY1GrAwvWVM=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DzlAR4gyxW60Hvx4TpAQrSx0vUZo9B5NDHpqKLnd6rqBCwa5NMVDzpr2gj+CgfkgyDMprHR8irU33w28CUMEPtkjtHfC85tuJp9RItGXDGExSL6rMbgYzJnfw+1PRNY8AWT7HBrEcmqR+nIckg7QUCSHH4dRCylxdDmMrq9setE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=fPPKpkF4; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="fPPKpkF4"
ARC-Seal: i=1; a=rsa-sha256; t=1775068683; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QGoGDFZSvAUrC3F8bEe1uGKDPQZTdPa3pE+7/zJWtKPVPn8c/7SMEXnwSwFyuoyLzinRzLnpfQanwJoDSF0lZAfCRO3Sple/4MpSlEfGufhsljROBzNUH5cfXhq1+WnotvYbQ4J34TTHB0NwDtjZrcUmObvXMk/h5zpeI4bl2ow=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775068683; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FMvpEWTNE5Xtb8cnkciBbOrOR+P7GQFuXng43HDyU9w=; 
	b=XcjPxlVtJw8LsFhEws8mVY0t4a853hYMfmQqTHt1GQfjVtUlA3R8F0Arl2Ky4W3OGOMWHguMmC3dCHvu2u6FwoggnTRJSONFz2FVUptwbBSlhjxtjO4t4k8S27qYcUG0GYn9T/nia2vhqRdojSU/FxdQzx0c0Tp+Yhbs68wjsuI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775068683;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=FMvpEWTNE5Xtb8cnkciBbOrOR+P7GQFuXng43HDyU9w=;
	b=fPPKpkF4sQaW0Zmb4vd0BHHiiu3UdGXMCoEUv53cy2k6h+F7b7m2Ued+wYeIdQDK
	c4ajsTPgoYUWRICMgtn+52U+PWC1ECX4sGdreVQF8owteNfYQ4/srjIJWumTnAd4DSH
	Xq4lS/Pmdv0naAxxEviLVpxHRzOpIHcM8oh9oS2/g6efnfnZGc2U6BRcQ8PogAVj5CW
	eY47iZ0jO2twpO3rKEMgkK0DhMmA5L/Vgx4mR11+xo3POOiovobRehqrHfd/MvLZadE
	Oh0km8CbJ4T3e7uJ0plgiAI3RKh3NFuFWS8nPKfkxotlnQbpVJKmz31iIV/X18IUNKB
	BR7TSudd9A==
Received: by mx.zohomail.com with SMTPS id 1775068682136345.0498996163552;
	Wed, 1 Apr 2026 11:38:02 -0700 (PDT)
Message-ID: <502ca89e011380e3b2b2131c3a3db1b4cc3e6edf.camel@rong.moe>
Subject: Re: [PATCH v6 05/13] platform/x86: lenovo-wmi-other: Add
 lwmi_attr_id() function
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260331181208.421552-6-derekjohn.clark@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
	 <20260331181208.421552-6-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Apr 2026 02:29:25 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2026-03-31 at 18:12 +0000, Derek J. Clark wrote:
> Adds lwmi_attr_id() function. In the same vein as LWMI_ATTR_ID_FAN_RPM(),
> but as a generic, to de-duplicate attribute_id assignment biolerplate.
>=20
> Reviewed-by: Rong Zhang <i@rong.moe>
> Tested-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v6:
>   - Move lwmi_attr_id to wmi-capdata.h as static inline.
> v5:
>   - Move references to cv/cd_mode_id to patch 4/8.
>   - Move lwmi_attr_id to wmi-capdata.c and export with namespace.
> v4:
>   - Switch from macro to static inline to preserve types.
> ---
>  drivers/platform/x86/lenovo/wmi-capdata.c |  8 ++---
>  drivers/platform/x86/lenovo/wmi-capdata.h | 20 ++++++++++++
>  drivers/platform/x86/lenovo/wmi-other.c   | 39 ++++++-----------------
>  3 files changed, 34 insertions(+), 33 deletions(-)
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

Bad rebase? IIUC it is unneeded until patch 13.

Thanks,
Rong

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
> index b24bf98c19ad..d2838ae5934f 100644
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
> @@ -61,8 +60,6 @@
> =20
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> =20
> -#define LWMI_TYPE_ID_NONE 0x00
> -
>  #define LWMI_FEATURE_VALUE_GET 17
>  #define LWMI_FEATURE_VALUE_SET 18
> =20
> @@ -72,10 +69,9 @@
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
> @@ -714,12 +710,8 @@ static ssize_t attr_capdata01_show(struct kobject *k=
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
> @@ -774,7 +766,6 @@ static ssize_t attr_current_value_store(struct kobjec=
t *kobj,
>  	struct wmi_method_args_32 args =3D { 0x0, 0x0 };
>  	struct capdata01 capdata;
>  	enum thermal_mode mode;
> -	u32 attribute_id;
>  	u32 value;
>  	int ret;
> =20
> @@ -785,13 +776,10 @@ static ssize_t attr_current_value_store(struct kobj=
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
> @@ -802,7 +790,6 @@ static ssize_t attr_current_value_store(struct kobjec=
t *kobj,
>  	if (value < capdata.min_value || value > capdata.max_value)
>  		return -EINVAL;
> =20
> -	args.arg0 =3D attribute_id;
>  	args.arg1 =3D value;
> =20
>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> @@ -836,7 +823,6 @@ static ssize_t attr_current_value_show(struct kobject=
 *kobj,
>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>  	struct wmi_method_args_32 args =3D { 0x0, 0x0 };
>  	enum thermal_mode mode;
> -	u32 attribute_id;
>  	int retval;
>  	int ret;
> =20
> @@ -844,13 +830,8 @@ static ssize_t attr_current_value_show(struct kobjec=
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
> =20
>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
>  				    (unsigned char *)&args, sizeof(args),
