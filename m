Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8512066F7
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 04:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773547647; cv=pass; b=fBmLZEU0Wm9bNJA2anck0EW7MPbK2IIT2IJngUNXKNyCPXox3e8hqBLx62qzMl3+waYthTc/p7BbfAY6H77LgGnhIcR1b1BTVM9DM4WWlG3qgEdjv2v3aDGI6YQ5RAqEbz8DNInEHYcgC6DYcvGdewhSQSLHroyzm0yT/zwdYQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773547647; c=relaxed/simple;
	bh=DHjwjGao6KTMVidAiOtHjIp5QigQr/DSlbxw04LkBwk=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cTl9e715jNW4FiJk6VP+CgMthW5H1IGXRFmW09bekezx4lPxLJ5KVOkGjYZfCe2kAx30g5KtBhLbd4wu4bMuUjgZB/ww7Zq4M4sy1bObAwrne/SisFNnTUHat0GbrAA2wejVP2xL4lYzeW2cTpj7cPFTrW3Nrsa4qifePhqSLOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=fhIojmTP; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="fhIojmTP"
ARC-Seal: i=1; a=rsa-sha256; t=1773538278; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ANCMM/2admmUhiTZLJlSJeO9wFy5tfwiOWB+MYtkKQiA34P5+ue50+5l09pVyS4N+2WbCXhvcYFSGJoq7QtVFFTUpwJv5yd11f/ue760DUe993f3QuOA+SBnqLBdFJ0MtF3QA+xMnFQVx6OnBkX7YSisgn/4feQPX63qLtp8hDo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773538278; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=T7+W3RR6GheybvI7WstUeqW79cjo5R+F21usBgFGD2M=; 
	b=a+7px/+ZJ5yWWtp0KjRjfsK+htw4AioFrr/KChzMQz6BtBLHoWI6pniDFbaOtQNT2Su0Be1uzlQbbnjHTVDQ3Z7CXKR+9ZPNjHBFudVTaS7zr6Sned05xWOTRntk6xKC9q89JIoXbwWFXWL+YYfuyhH6xh+TE4UOXLQI/d/3VrQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773538278;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=T7+W3RR6GheybvI7WstUeqW79cjo5R+F21usBgFGD2M=;
	b=fhIojmTP9N0G22IaNZqSiefEPcP1xKxGV/cZIT7p/OsrnyOcR0KvAFbD4dMbX06B
	bs+R5cE3vcTpXFU4YLhfGKMC+eV/ao97u/ppXTjiqsrc4Zv8K6B5BqkAwdWoz9GNlAb
	mRNX0eLF/WwKC87kZkkejM/tnQJxYUDAMy3ew3e0PYUBdo+5uM3erApL6X2DnAgCxKD
	iSAXMUURbpeRIAeH4mtwMS3rts0KW42gZ4dU2YOu2jKRtRVGrQYsSwVuIFKSGbL8nrm
	yRGHRTqssGgDq5CSVCxxe0eSrvZxzmkPdbsVMHe/hdX/awqSrkibFwFrRteTEgSqdSB
	u/XULM6FkQ==
Received: by mx.zohomail.com with SMTPS id 1773538276027276.8074382440874;
	Sat, 14 Mar 2026 18:31:16 -0700 (PDT)
Message-ID: <0f93f2046ef5033a0cd95c054441da55c8540d7c.camel@rong.moe>
Subject: Re: [PATCH v4 4/8] platform/x86: lenovo-wmi-other: Limit adding
 attributes to supported devices
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260312031032.3467565-5-derekjohn.clark@gmail.com>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
	 <20260312031032.3467565-5-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Mar 2026 09:26:08 +0800
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
> v4:
>   - Use for loop instead of backtrace gotos for checking if an attribute
>     is supported.
>   - Add include for dev_printk.
>   - Wrap dev_dbg in lwmi_is_attr_01_supported earlier.
>   - Don't use symmetric cleanup of attributes in error states.
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 76 ++++++++++++++++++++++++-
>  1 file changed, 74 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index 9fff9c1f768c..55a26e5617d4 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -32,6 +32,7 @@
>  #include <linux/component.h>
>  #include <linux/container_of.h>
>  #include <linux/device.h>
> +#include <linux/dev_printk.h>
>  #include <linux/export.h>
>  #include <linux/gfp_types.h>
>  #include <linux/hwmon.h>
> @@ -871,6 +872,76 @@ static ssize_t attr_current_value_show(struct kobjec=
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
> + * Return: Support level, or an error code.
> + */
> +static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_att=
r)
> +{
> +	u8 modes[2] =3D { LWMI_GZ_THERMAL_MODE_CUSTOM, LWMI_GZ_THERMAL_MODE_NON=
E };
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> +	struct wmi_method_args_32 args;
> +	bool cd_mode_found =3D false;
> +	bool cv_mode_found =3D false;
> +	struct capdata01 capdata;
> +	int retval, ret, i;
> +
> +	/* Determine tunable_attr->cd_mode_id*/
> +	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {

#include <linux/array_size.h>

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
> +		return -EOPNOTSUPP;
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
> +		return -EOPNOTSUPP;
> +
> +	dev_dbg(tunable_attr->dev,
> +		"cd_mode_id: %02x%02x%02x%02x, cv_mode_id: %#08x attribute support lev=
el: %x\n",
                             ^                               ^  ^          =
                ^
> +		tunable_attr->device_id, tunable_attr->feature_id, tunable_attr->cd_mo=
de_id,
> +		tunable_attr->type_id, args.arg0, capdata.supported);
                ^

	dev_dbg(tunable_attr->dev,
		"cd_mode_id: %#10x, cv_mode_id: %#10x, attribute support level: %#10x\n",
		lwmi_attr_id(...), args.arg0, capdata.supported);

> +
> +	return capdata.supported;

You are casting u32 to int. Return it in a pointer argument if you need
it.

> +}
> +
>  /* Lenovo WMI Other Mode Attribute macros */
>  #define __LWMI_ATTR_RO(_func, _name)                                  \
>  	{                                                             \
> @@ -994,12 +1065,13 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv=
 *priv)
>  	}
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
> +		cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->dev;
> +		if (lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr)  <=3D =
0)

Extra whitespace.

> +			continue;

Add an empty line in between.

Thanks,
Rong

>  		err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
>  					 cd01_attr_groups[i].attr_group);
>  		if (err)
>  			goto err_remove_groups;
> -
> -		cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->dev;
>  	}
>  	return 0;
> =20
