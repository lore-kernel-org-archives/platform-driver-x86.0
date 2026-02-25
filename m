Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6166322157B;
	Wed, 25 Feb 2026 17:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039977; cv=pass; b=X4YXQh2wFm+8f5IlUPEM16z8+lm0DvyBXVVwT1sxNW4y9KBuKhC2Ppu6Wxa8EgNDM7ajiBkJ8BNNBkpUUT8oQrjPI+NAKg092eOYznhB184NFW06fOluj7Z7zLDmxhAixVS0HR+Vc/hlLdodnADLOCpWj/8b7G+M6DxTbINHdbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039977; c=relaxed/simple;
	bh=gMA4aT9bVpcLHLvcZlwLKJZXOrDE5d2Bn12rEWUrWxw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fWfrfC8bYVGF+/lSKfWJXHTZqL7+wXxupkDzriqCNayZlQGmyvOInFpgnKsZcLNF8XxAcRy5kGpIAcLrXiuXQs9kKLQ4J74h59ImMXtz7NYzTILtTd6n4vgGAmhjWzA3/iGWONHTUs2VqmA71knjxwPLpCVm/zH5pfxqgiK2vXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=HihdC10R; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="HihdC10R"
ARC-Seal: i=1; a=rsa-sha256; t=1772039963; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dKKZRZz7L9P/fKTAs2pKG39c/EmndJ1ojfYYkdIN3pMa292NZI899L6M7iQN0inEbKlsilzLJX/uIcoSn4oRnTr+VlTWlE1osyPrdzt8n8/IV/MUEfd/IHycYqDST5r7KSFl9JjAJwEJ8yjwX68QH23cDIwvRxZeUloh7E8mWM4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772039963; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6Nki79pDtXofIw3tObSI7fGAmVpmMqMRGRGW4ADbZZE=; 
	b=k1zeqgNen20zYTV8lJ6dYo62uJ84t+tsIzr0ghf87uh1rqMsC7atPZtGPta2LkSvKXBjH3+vUhhHoKn9+b/7XEIoz/cUF/URx7AnP/CKsHi4lfaF053Y6PNCI0yQpB7SJBJYV4tlFSTm56Amt3IoTRQdd3r4F4B829VyOcfL778=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772039963;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=6Nki79pDtXofIw3tObSI7fGAmVpmMqMRGRGW4ADbZZE=;
	b=HihdC10Rbmowa/a+ED3Awz9UHncmlyRLdYsj5V04WjwN7a1CZ+O5QqiSzEk3c6lt
	pR7hnsjMldD5GF7SPkTEuYqdFhRAjW/l/KGZyL1xpBgFddN3Sa8S61c7KRiEZSlBMax
	iNuxY0g66qmJ0/BfPByDf5hxeax69c05dxOa0KeMmq285mQmtcM5BQHV0LetlpCGTgf
	vJeg5F1yEARqeI5EnbhgD4YapEX6ZHKruW0Of63jHxoXE5fhop87214ixV0TpyF9ZM0
	Ijasdfw5dKuwzpczkWzvmKFwMjAADJ1YmgVtCzMEeskL0x6BlR+FZmfqWO+voY3em3R
	01iXMJfOsg==
Received: by mx.zohomail.com with SMTPS id 177203996213647.23003573411734;
	Wed, 25 Feb 2026 09:19:22 -0800 (PST)
Message-ID: <4544a2214c9851d2cf0c5515245d9b0a08e942b4.camel@rong.moe>
Subject: Re: [PATCH v3 2/6] platform/x86: lenovo-wmi-other: Limit adding
 attributes to supported devices
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260224043200.2680384-3-derekjohn.clark@gmail.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
	 <20260224043200.2680384-3-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Feb 2026 01:14:12 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2026-02-24 at 04:31 +0000, Derek J. Clark wrote:
> Adds lwmi_is_attr_01_supported, and only creates the attribute subfolder
> if the attribute is supported by the hardware. Due to some poorly
> implemented BIOS, this is a multi-step sequence of events. This is
> because:
> - Some BIOS support getting the capability data from custom mode (0xff),
>   while others only support it in no-mode (0x00).
> - Similarly, some BIOS support get/set for the current value from custom
>   mode (0xff), while others only support it in no-mode (0x00).
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
> While adding members to tunable_attr_01, remove unused capdata pointer
> and limit size of all ID's to the appropriate size.
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Reported-by: Kurt Borja <kuurtb@gmail.com>
> Closes: https://lore.kernel.org/platform-driver-x86/DG60P3SHXR8H.3NSEHMZ6=
J7XRC@gmail.com/
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 117 +++++++++++++++++++++---
>  1 file changed, 102 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index 95886df39c8d..f3f12303e379 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -545,11 +545,12 @@ static void lwmi_om_fan_info_collect_cd_fan(struct =
device *dev, struct cd_list *
>  /* =3D=3D=3D=3D=3D=3D=3D=3D fw_attributes (component: lenovo-wmi-capdata=
 01) =3D=3D=3D=3D=3D=3D=3D=3D */
> =20
>  struct tunable_attr_01 {
> -	struct capdata01 *capdata;
>  	struct device *dev;
> -	u32 feature_id;
> -	u32 device_id;
> -	u32 type_id;
> +	u8 feature_id;
> +	u8 device_id;
> +	u8 type_id;
> +	u8 cd_mode_id; /* mode arg for searching capdata */
> +	u8 cv_mode_id; /* mode arg for set/get current_value */
>  };
> =20
>  static struct tunable_attr_01 ppt_pl1_spl =3D {
> @@ -716,7 +717,7 @@ static ssize_t attr_capdata01_show(struct kobject *ko=
bj,
>  	int value, ret;
> =20
>  	attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->fe=
ature_id,
> -				    LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_attr->type_id);
> +				    tunable_attr->cd_mode_id, tunable_attr->type_id);
> =20
>  	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>  	if (ret)
> @@ -782,7 +783,7 @@ static ssize_t attr_current_value_store(struct kobjec=
t *kobj,
>  		return -EBUSY;
> =20
>  	args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->featu=
re_id,
> -				 mode, tunable_attr->type_id);
> +				 tunable_attr->cd_mode_id, tunable_attr->type_id);
> =20
>  	ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
>  	if (ret)
> @@ -795,6 +796,8 @@ static ssize_t attr_current_value_store(struct kobjec=
t *kobj,
>  	if (value < capdata.min_value || value > capdata.max_value)
>  		return -EINVAL;
> =20
> +	args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->featu=
re_id,
> +				 tunable_attr->cv_mode_id, tunable_attr->type_id);
>  	args.arg1 =3D value;
> =20
>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> @@ -828,13 +831,16 @@ static ssize_t attr_current_value_show(struct kobje=
ct *kobj,
>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>  	struct wmi_method_args_32 args;
>  	enum thermal_mode mode;
> -	int retval;
> -	int ret;
> +	int retval, ret;
> =20
>  	ret =3D lwmi_om_notifier_call(&mode);
>  	if (ret)
>  		return ret;
> =20
> +	/* If "no-mode" is the supported mode, ensure we never send current mod=
e */
> +	if (tunable_attr->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
> +		mode =3D tunable_attr->cv_mode_id;
> +
>  	args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->featu=
re_id,
>  				 mode, tunable_attr->type_id);
> =20
> @@ -847,6 +853,85 @@ static ssize_t attr_current_value_show(struct kobjec=
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
> +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> +	u8 mode =3D LWMI_GZ_THERMAL_MODE_CUSTOM;
> +	struct wmi_method_args_32 args;
> +	struct capdata01 capdata;
> +	int retval, ret;
> +
> +	/* Determine tunable_attr->cd_mode_id */
> +no_mode_fallback_1:
> +	args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->featu=
re_id,
> +				 mode, tunable_attr->type_id);
> +
> +	ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
> +	if (ret && mode) {
> +		dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args.arg=
0);
> +		mode =3D LWMI_GZ_THERMAL_MODE_NONE;
> +		goto no_mode_fallback_1;
> +	}
> +	if (ret)
> +		goto not_supported;
> +	if (!capdata.supported) {
> +		ret =3D -EOPNOTSUPP;
> +		goto not_supported;
> +	}
> +
> +	tunable_attr->cd_mode_id =3D mode;
> +
> +	/* Determine tunable_attr->cv_mode_id */
> +	mode =3D LWMI_GZ_THERMAL_MODE_CUSTOM;
> +no_mode_fallback_2:
> +	args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->featu=
re_id,
> +				 mode, tunable_attr->type_id);
> +
> +	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
> +				    (unsigned char *)&args, sizeof(args),
> +				    &retval);
> +	if ((ret && mode) || (!retval && mode)) {
> +		dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args.arg=
0);
> +		mode =3D LWMI_GZ_THERMAL_MODE_NONE;
> +		goto no_mode_fallback_2;
> +	}
> +	if (ret)
> +		goto not_supported;
> +	if (retval =3D=3D 0) {
> +		ret =3D -EOPNOTSUPP;
> +		goto not_supported;
> +	}
> +

I agree with Ilpo that backward gotos are hard to read and should be
avoided if possible.

> +	tunable_attr->cv_mode_id =3D mode;
> +	dev_dbg(tunable_attr->dev, "cd_mode_id: %02x%02x%02x%02x, cv_mode_id: %=
#08x attribute support level: %x\n",

It's a long line. Wrap at the first comma?

> +		tunable_attr->device_id, tunable_attr->feature_id, tunable_attr->cd_mo=
de_id,
> +		tunable_attr->type_id, args.arg0, capdata.supported);
> +
> +	return capdata.supported;
> +
> +not_supported:
> +	dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args.arg0=
);
> +	return ret;
> +}
> +
>  /* Lenovo WMI Other Mode Attribute macros */
>  #define __LWMI_ATTR_RO(_func, _name)                                  \
>  	{                                                             \
> @@ -970,19 +1055,21 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv=
 *priv)
>  	}
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
> -		err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> -					 cd01_attr_groups[i].attr_group);
> -		if (err)
> -			goto err_remove_groups;
> -
>  		cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->dev;
> +		if (lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr) > 0) {
> +			err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> +						 cd01_attr_groups[i].attr_group);
> +			if (err)
> +				goto err_remove_groups;
> +		}
>  	}
>  	return 0;
> =20
>  err_remove_groups:
>  	while (i--)
> -		sysfs_remove_group(&priv->fw_attr_kset->kobj,
> -				   cd01_attr_groups[i].attr_group);
> +		if (lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr) > 0)

I don't see lwmi_om_fw_attr_remove() doing the same. If we care about
symmetric cleanup, I would imagine a bitmap or so recording what have
been created is used there.

Also it's doubtful if the firmware always return the same result on the
same parameters. If a broken firmware somehow returns different results
here, some attributes may be left uncleaned.

That being said, I am not sure if we really need symmetric cleanup.
IIUC, sysfs_remove_group() is a no-op if we pass an attr_group that has
not been created.

> +			sysfs_remove_group(&priv->fw_attr_kset->kobj,
> +					   cd01_attr_groups[i].attr_group);
> =20
>  	kset_unregister(priv->fw_attr_kset);
> =20

Thanks,
Rong
