Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66B6411608;
	Wed, 25 Mar 2026 18:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774461919; cv=pass; b=FEy2Bg8Ckz546RrPqClSS6AX7EMYq0xNcV4/V3PjQCJ8+d4qtsMP2R5ZWqLDgXlqyEbwNGSie2zLflLsQxbVuieuWwE2K2kpbix64OvaWuVYO4Iuqwp1ZkvpkbLy5qpZ7aLKPZvR3bXn/gfM82duGZzVxUkHroFQIdVGCpk7ZYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774461919; c=relaxed/simple;
	bh=AC7C8MHL+YUsCMH97G5voSg/i2e8V0wINuTHxFHhQPo=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=skoUB8J3a6bWcv92QNJMiYDNu+HMaUdPVXd8DIMDqsfA2+8o32Cgn6vUb7fdoc5aWWG+NQwDZA86zhZbPNy+hGFyxf7pOqy+SKh/YlJe1bVPnzQU1xHisZVSaP4cFoasUFPlh6DHro5/Hd3cvLkCu4X5bWo+CzrXd3dZXqMicvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=HZoNZ/mK; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="HZoNZ/mK"
ARC-Seal: i=1; a=rsa-sha256; t=1774461905; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hKH/ras3EzMY0dCfjuieSeTNkBVdfpKN9tbMYgmfTGTMd7cQfXK9rRGLGRw2vs0hEmi1X8++K0aN5Pk+8GxtiXMi26CBoS1flf4I3zdYBEl0RCChL5DNnG9JIh5DNM4id6TSICieuJSO0Aant+en70d4+q5L3x6caWlFsf/eubQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774461905; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4C77HZ9GsnIlc2UyNxUevGygU9YuPeyEx5JykdXN1+8=; 
	b=YvSdv2SX+tAhviNXAfqDooR2IHiRl5rxsxCizCSSxePUbCs53weT0CEtiUjcva7FeUFC9R0XWFQFJ1QrdCONWwPvJu/lpAsjR803y0MaTT8JHiiDMvUHu/O3yh4mXJhetskPXoK1GSCT14V36Mn+QraJ7OX0qa9qU1qBqaHtUvY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774461905;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=4C77HZ9GsnIlc2UyNxUevGygU9YuPeyEx5JykdXN1+8=;
	b=HZoNZ/mKFtmDCSi9JSjLJr8M/3gLSHlGSCqQLTwpQWNmcJz8G9sZF6rx5ZRYOMba
	qSuw29SRmc9D/qo9gXVT+VPnlguNfQ+t4CoMU+GBWwrc9Mgo7pbtG8Ya2sRvztbTmqK
	5TgBtrBg4hIWr6sc150bbsLi3T9bbVkwjPdmUPK0XcLboLYLlkeDKwq6Na4uR6D/FA5
	IRmE3kj5mdlvriJ2YVgn5Mj1ZNPs5GFvAeEfY9VPXeLAcgN6SOv+aI6l0TBbj8d4S2R
	qIKGqnekX2eo5MBxj6Tz8SBLcCWUbqHeHxDKoXl4Zd/ezu14RMojDL6pjh6tVnh+gp1
	I43u1i5wIw==
Received: by mx.zohomail.com with SMTPS id 1774461904430250.6914976806754;
	Wed, 25 Mar 2026 11:05:04 -0700 (PDT)
Message-ID: <0d00994a850e5110a323a14e27453f6447c9d0f3.camel@rong.moe>
Subject: Re: [PATCH v5 4/8] platform/x86: lenovo-wmi-other: Limit adding
 attributes to supported devices
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260324221032.1333636-5-derekjohn.clark@gmail.com>
References: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
	 <20260324221032.1333636-5-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Mar 2026 01:59:07 +0800
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
> Adds lwmi_is_attr_01_supported, and only creates the attribute subfolder
> if the attribute is supported by the hardware. Due to some poorly
> implemented BIOS this is a multi-step sequence of events. This is
> because:
> - Some BIOS support getting the capability data from custom mode (0xff),
>   while others only support it in no-mode (0x00).
> - Some BIOS support get/set for the current value from custom mode (0xff)=
,
>   while others only support it in no-mode (0x00).
> - Some BIOS report capability data for a method that is not fully
>   implemented.
> - Some BIOS have methods fully implemented, but no complimentary
>   capability data.
>=20
> To ensure we only expose fully implemented methods with corresponding
> capability data, we check each outcome before reporting that an
> attribute can be supported.
>=20
> Checking for lwmi_is_attr_01_supported during remove is not done to
> ensure that we don't attempt to call cd01 or send WMI events if one of
> the interfaces being removed was the cause of the driver unloading.
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Reported-by: Kurt Borja <kuurtb@gmail.com>
> Closes: https://lore.kernel.org/platform-driver-x86/DG60P3SHXR8H.3NSEHMZ6=
J7XRC@gmail.com/
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v5:
>   - Move cv/cd_mode_id refrences from path 3/4.
>   - Add missing import for ARRAY_SIZE.
>   - Make lwmi_is_attr_01_supported return bool instead of u32.
>   - Various formatting fixes.
> v4:
>   - Use for loop instead of backtrace gotos for checking if an attribute
>     is supported.
>   - Add include for dev_printk.
>   - Wrap dev_dbg in lwmi_is_attr_01_supported earlier.
>   - Don't use symmetric cleanup of attributes in error states.
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 87 ++++++++++++++++++++++++-
>  1 file changed, 84 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index 7aa512ff1446..dd98e7f930f5 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -27,10 +27,12 @@
>   */
> =20
>  #include <linux/acpi.h>
> +#include <linux/array_size.h>
>  #include <linux/cleanup.h>
>  #include <linux/component.h>
>  #include <linux/container_of.h>
>  #include <linux/device.h>
> +#include <linux/dev_printk.h>
>  #include <linux/export.h>
>  #include <linux/gfp_types.h>
>  #include <linux/hwmon.h>
> @@ -546,6 +548,8 @@ struct tunable_attr_01 {
>  	u8 feature_id;
>  	u8 device_id;
>  	u8 type_id;
> +	u8 cd_mode_id; /* mode arg for searching capdata */
> +	u8 cv_mode_id; /* mode arg for set/get current_value */
>  };
> =20
>  static struct tunable_attr_01 ppt_pl1_spl =3D {
> @@ -778,7 +782,7 @@ static ssize_t attr_current_value_store(struct kobjec=
t *kobj,
>  		return -EBUSY;
> =20
>  	args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->featu=
re_id,
> -				 mode, tunable_attr->type_id);
> +				 tunable_attr->cd_mode_id, tunable_attr->type_id);
> =20
>  	ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
>  	if (ret)
> @@ -831,6 +835,10 @@ static ssize_t attr_current_value_show(struct kobjec=
t *kobj,
>  	if (ret)
>  		return ret;
> =20
> +	/* If "no-mode" is the supported mode, ensure we never send current mod=
e */
> +	if (tunable_attr->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
> +		mode =3D tunable_attr->cv_mode_id;
> +
>  	args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->featu=
re_id,
>  				 mode, tunable_attr->type_id);
> =20
> @@ -843,6 +851,77 @@ static ssize_t attr_current_value_show(struct kobjec=
t *kobj,
>  	return sysfs_emit(buf, "%d\n", retval);
>  }
> =20
> +/**
> + * lwmi_attr_01_is_supported() - Determine if the given attribute is sup=
ported.
> + * @tunable_attr: The attribute to verify.
> + *
> + * First check if the attribute has a corresponding capdata01 table in t=
he cd01
> + * module under the "custom" mode (0xff). If that is not present then ch=
eck if
> + * there is a corresponding "no-mode" (0x00) entry. If either of those p=
asses,
> + * check capdata->supported for values > 0. If capdata is available, att=
empt to
> + * determine the set/get mode for the current value property using a sim=
ilar
> + * pattern. If the value returned by either custom or no-mode is 0, or w=
e get
> + * an error, we assume that mode is not supported. If any of the above c=
hecks
> + * fail then the attribute is not fully supported.
> + *
> + * The probed cd_mode_id/cv_mode_id are stored on the tunable_attr for l=
ater
> + * reference.
> + *
> + * Return: bool.
> + */
> +static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_at=
tr)
> +{
> +	u8 modes[2] =3D { LWMI_GZ_THERMAL_MODE_CUSTOM, LWMI_GZ_THERMAL_MODE_NON=
E };
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> +	struct wmi_method_args_32 args;

See my reply to the previous patch, i.e., zero-initialize `args'.

> +	bool cd_mode_found =3D false;
> +	bool cv_mode_found =3D false;
> +	struct capdata01 capdata;
> +	int retval, ret, i;
> +
> +	/* Determine tunable_attr->cd_mode_id*/
> +	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
> +		args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->feat=
ure_id,
> +					 modes[i], tunable_attr->type_id);
> +
> +		ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
> +		if (ret || !capdata.supported)
> +			continue;
> +		tunable_attr->cd_mode_id =3D modes[i];
> +		cd_mode_found =3D true;
> +		break;
> +	}
> +
> +	if (!cd_mode_found)
> +		return cd_mode_found;
> +
> +	/* Determine tunable_attr->cv_mode_id, returns 1 if supported*/
> +	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
> +		args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->feat=
ure_id,
> +					 modes[i], tunable_attr->type_id);
> +
> +		ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
> +					    (unsigned char *)&args, sizeof(args),
> +					    &retval);
> +		if (ret || !retval)
> +			continue;
> +		tunable_attr->cv_mode_id =3D modes[i];
> +		cv_mode_found =3D true;
> +		break;
> +	}
> +
> +	if (!cv_mode_found)
> +		return cv_mode_found;
> +
> +	dev_dbg(tunable_attr->dev,
> +		"cd_mode_id: %#10x, cv_mode_id: %#10x attribute support level: %#10x\n=
",
                                                     ^

A comma is missing here.

Also, the format specifier should be `%#010x', otherwise the padding
will be whitespace instead of 0. Sorry for the mistake in my reply to
v4.

Thanks,
Rong

> +		lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
> +			     tunable_attr->cd_mode_id, tunable_attr->type_id),
> +		args.arg0, capdata.supported);
> +
> +	return capdata.supported > 0 ? true : false;
> +}
> +
>  /* Lenovo WMI Other Mode Attribute macros */
>  #define __LWMI_ATTR_RO(_func, _name)                                  \
>  	{                                                             \
> @@ -966,12 +1045,14 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv=
 *priv)
>  	}
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
> +		cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->dev;
> +		if (!lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr))
> +			continue;
> +
>  		err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
>  					 cd01_attr_groups[i].attr_group);
>  		if (err)
>  			goto err_remove_groups;
> -
> -		cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->dev;
>  	}
>  	return 0;
> =20
