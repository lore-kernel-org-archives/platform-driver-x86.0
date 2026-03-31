Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ACE38F23D
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 22:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774996103; cv=none; b=Gqav3OzfJNP5NTlO7YmIA/B7JsaGqwCZEZ/eCsGyiW+0AaGQV9xZmwAY6u99UNXJ2+qZmlIJEdnQ7uMtmt6ofhi40VpN8D3qw/dbndFj3vD2dqg7ruI5rYUFahDzhNKJmTCpqGbe+qPiB04PWaW+4WNzYe1hp8Jr9sKFV5CxdBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774996103; c=relaxed/simple;
	bh=HSEI84D0yFAbIvuVxkKlS+H26voDwAZDIA9nEokKSZk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eAvV7djtYM6e5eujlQ4F/S+aJmGJkriN+PXzZ00vMjV4lIQSpF6c32QACjORQrXOBMHzj7phFfm2cmfXrVjVEgbcYOoYMNwXuR/sEHhDOvjfyv8z7JegSkw7WehNe9RvUBPuHLv2bWk2V+j96cTow+xPlpMMUUfGNK5FTlQz/y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fajbcC+T; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fajbcC+T"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79853c0f5b9so31408117b3.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 15:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774996101; x=1775600901; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7U0u6Dgpgu4PwuwOvCwHi0xs0R9Lw/whtuUHyprjiY=;
        b=fajbcC+TPcJn5PWf62lF4JfDyHgqpzFudzmiPx44EB0pPWyA5Ov/iKh8xnXatNaV6D
         jYBRDRaUkYNg4XGt0tvJZ06xJml4XcslFchg8JkYPiFQZ7zLt2tyAiqWvVeWPkOx8ZFY
         889wY2mP3UqoIPZpA8zioyysxbq4mpR4srcZ5JJlsdGqVOqbVUpk3tDz7webp9zF0gzo
         0nVPOEa8DK27QjsfRkpSQhgbohDAvfwHdRh30z2HM85hB8xkp147eMN/EbEyvaet+T2b
         CspNlvLHqNNgbRkvk9ZVUlQxJuYd/PWcyKuKwiFDGlc4jqQyuZ2KLK2YpbKZ/OfPvmE9
         1hkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774996101; x=1775600901;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7U0u6Dgpgu4PwuwOvCwHi0xs0R9Lw/whtuUHyprjiY=;
        b=lZR3yzDz7gHtXWjmVn+sN+OkFBk0vabnuZ0+04o5jfo59jlpWzDmSgrU/Ap7ziiyvK
         QLYzWdLobgZBrtsIWldTch47XmaW9XRqUudB0tzfMNJkhct6F0piirkbhpYMvpwrYzPS
         SowNw/Rvv/KDjXcQ+1haDL5e0yuEDvYQht8wyEy97gRspqm3GXH62LgOnZk7GRnAZHo2
         7+vvp2Z9ReA7ccmbUJ5KKz1IjXIa8amR2nCOCLg6qcDVj9bDNntzRA5yPg7DmYoLbh/w
         c86pLGmz7pWw+h8XAT6G7iHSt8RstBkDdMdVgZeGLaM1jehfuir89tTbJkRmAGXpm4P9
         8AKw==
X-Forwarded-Encrypted: i=1; AJvYcCXyTkSYMMHrvJcDQ6hsfo+fKCXmG0xI7/pXUWceYw8BS7nnbgpo9/V4QRJsZUdhoJZGCHwyvYT9F4b5DkrG6c/c61no@vger.kernel.org
X-Gm-Message-State: AOJu0YwxLJDu1+4jCHZYzBH3RUsqa87WDEVOylzjbCKExg/0KruJvPmZ
	NEGRGWM7szkC8Cms9ao0T53GCSNzKOIjAzVRybMhQhwayoKZW5vA48hn
X-Gm-Gg: ATEYQzwYCUnPb2RZrnouNvbYlysdgNaKhpZ01VyQfhCockkpoh+iYI4cGQq6ZBYdgvC
	ebe31dUPlYTOHCL7KIm5d7ntgAgpPqamFzI4KtmmTtTKUtUKGKDqwZcONUdHAZ2FMNQrtvfiEOR
	MzC5Vtyfy2tJ38z7uPTewZYcnpjC42v0VPYlGlSam+Eha0OTMCFpe31L/3wbSYmGt/BSzQNdPNT
	G8S0ZrhEcK/xLJA2tRDm9BTtiZ22afpmghcSLKG9TYs03ju7NqKxjMNmw58dSoo/zqwTX+/VK5b
	GiFGUSai7a+3n7nR1JRUO6doE/H2YYWrA4JrkBUFIfD+hmvK17AozfQYjC/W+vfTs6BDnXWgYiK
	+BcpjSUrW2dB4DpXvCifA+60TAOmC+cRUJ3Qk4Ts5C8OTLM/vHf3Q1/43MHKOKep1wc7Nnt4Fl6
	nASRBuwpkz9DaR3iqAOms=
X-Received: by 2002:a05:690c:1e:b0:79a:c630:c404 with SMTP id 00721157ae682-7a21214cb59mr14618097b3.41.1774996100519;
        Tue, 31 Mar 2026 15:28:20 -0700 (PDT)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79cba46f3ccsm54660587b3.40.2026.03.31.15.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 15:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 17:28:18 -0500
Message-Id: <DHHBLQISNSV5.2Y9KW7XURNH5H@gmail.com>
Cc: "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Armin Wolf"
 <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>, "Rong Zhang"
 <i@rong.moe>, "Kurt Borja" <kuurtb@gmail.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 06/13] platform/x86: lenovo-wmi-other: Limit adding
 attributes to supported devices
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
 <20260331181208.421552-7-derekjohn.clark@gmail.com>
In-Reply-To: <20260331181208.421552-7-derekjohn.clark@gmail.com>

On Tue Mar 31, 2026 at 1:12 PM -05, Derek J. Clark wrote:
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
>
> To ensure we only expose fully implemented methods with corresponding
> capability data, we check each outcome before reporting that an
> attribute can be supported.
>
> Checking for lwmi_is_attr_01_supported during remove is not done to
> ensure that we don't attempt to call cd01 or send WMI events if one of
> the interfaces being removed was the cause of the driver unloading.
>
> Reviewed-by: Rong Zhang <i@rong.moe>
> Tested-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Reported-by: Kurt Borja <kuurtb@gmail.com>
> Closes: https://lore.kernel.org/platform-driver-x86/DG60P3SHXR8H.3NSEHMZ6=
J7XRC@gmail.com/
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

Thanks for this!

Tested-by: Kurt Borja <kuurtb@gmail.com>

> ---
> v6:
>   - Zero initialize args in lwmi_is_attr_01_supported.
>   - Fix formatting.
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
>
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index d2838ae5934f..f689d19d711a 100644
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
> @@ -545,6 +547,8 @@ struct tunable_attr_01 {
>  	u8 feature_id;
>  	u8 device_id;
>  	u8 type_id;
> +	u8 cd_mode_id; /* mode arg for searching capdata */
> +	u8 cv_mode_id; /* mode arg for set/get current_value */
>  };
> =20
>  static struct tunable_attr_01 ppt_pl1_spl =3D {
> @@ -777,7 +781,7 @@ static ssize_t attr_current_value_store(struct kobjec=
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
> @@ -830,6 +834,10 @@ static ssize_t attr_current_value_show(struct kobjec=
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
> @@ -842,6 +850,77 @@ static ssize_t attr_current_value_show(struct kobjec=
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
> +	struct wmi_method_args_32 args =3D { 0x0, 0x0 };
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
> +		"cd_mode_id: %#010x, cv_mode_id: %#010x, attribute support level: %#01=
0x\n",
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
> @@ -965,12 +1044,14 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv=
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


--=20
Thanks,
 ~ Kurt

