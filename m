Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2083ED11D;
	Wed, 25 Feb 2026 18:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772044759; cv=pass; b=ZMLBgFHdc6PSoiL8P5tuddtz158kjT3jM1qHAfn0jIryDGvgCDZ/JAWnWWMrpmGm7A2LvTIg2MSMx+R4+lHb/rsgtZnfEQspA0ebOyyKw909cXPyTTGPZIwLEg2QkCWQ7ToKmxp/7rpH9zzzZ+H/HM/Bn8ZF4ICTgKYScwMKlyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772044759; c=relaxed/simple;
	bh=1XsTpEFvxkipGhqQo1mrEBmu3ii0s1bCuUVQ9VGcxMc=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ebKEkBgU92abKo3QEDV+aD5AT0zgdBaB6XTY1TjF4ZOIO86n/HJxiM3/ox77iI7MxfuDWSyBGBI3+ZwycydmNEGKftCYpw1w0+m0E6oANuW3PSFeh7eKeG10IVYyeHIMaeLNo6c5QJNu565NLH4JYnjEGSSR0vJJBIzUXMCZEqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=YaZM+GdX; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="YaZM+GdX"
ARC-Seal: i=1; a=rsa-sha256; t=1772044745; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hgk2NUWRO5hM9zmRCgdQ0PM+WLwwRaGro5Om80iR2l5gjgzzxKuHddIFq2HcospUuqTMtKs7ZzjZHQ+XbY4Nmg+FutiHNXldDOifdsfL4HmZOCko+o1Ik6o2PrueW8aZ9WNx/I23v8iztJrmeXJ5DmFQkKBYjuqyfd45guJDmUI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772044745; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y0RPu1ErzzYerERm5INgE3jJSZFWT5v5+fQ2w5soeT4=; 
	b=DClO4cTr6N79GJByssRQl627jYa4zzC7ZHg0R3jBv1dhaodQ7y5qUzGBvnGQHtLVeiPgwGA/KqbytplvcnHXiGx4BORvRrGR3c/B6Ej2mWhHP5jhVAylwaWM7FAUdahBPsuCmWP+KqjxGcSXZtyiNVh711gucaUeOsYLceapv0g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772044745;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=Y0RPu1ErzzYerERm5INgE3jJSZFWT5v5+fQ2w5soeT4=;
	b=YaZM+GdXt3jf3gIP2485ApCKNXL+6t+oN2cW/PDCOTxKH4VAd7bFp9+xyX8mb+ge
	yCKgOWyeu0ih9Q73DvC/hhM+MepvP3SXOZ6+E0wLbhk5vgu+hHuN3/F4+pGQ6VYzEMb
	Qss3f/TLZx88riDBFaIpRzb7rauubB8Xywh0GqppTPjOiYLfLKwFd+SM/JARkGkXn/B
	7c9Hjvh8+RUFVu4i6j0YzC3AUMjnJ7SDckjUzX8bZR4UO3eoRFfv97SdgF2jmHoYJHN
	rXSsuo0x0wir/1zGinNr6GSYd7JG4jPhPolA1WITWXpIFFxVMAVC6F6RuBbOcRaI6p+
	3NmFZc+OwQ==
Received: by mx.zohomail.com with SMTPS id 1772044744082650.8700241248469;
	Wed, 25 Feb 2026 10:39:04 -0800 (PST)
Message-ID: <c8da7583f184b39d08cb6579de0f74aa72130083.camel@rong.moe>
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
In-Reply-To: <F8B109A3-BC8C-4F7C-9790-FC6A841B5B7D@gmail.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
	 <20260224043200.2680384-3-derekjohn.clark@gmail.com>
	 <4544a2214c9851d2cf0c5515245d9b0a08e942b4.camel@rong.moe>
	 <F8B109A3-BC8C-4F7C-9790-FC6A841B5B7D@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Feb 2026 02:33:56 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Derek,

On Wed, 2026-02-25 at 10:09 -0800, Derek J. Clark wrote:
> On February 25, 2026 9:14:12 AM PST, Rong Zhang <i@rong.moe> wrote:
> > Hi Derek,
> >=20
> > On Tue, 2026-02-24 at 04:31 +0000, Derek J. Clark wrote:
> > > Adds lwmi_is_attr_01_supported, and only creates the attribute subfol=
der
> > > if the attribute is supported by the hardware. Due to some poorly
> > > implemented BIOS, this is a multi-step sequence of events. This is
> > > because:
> > > - Some BIOS support getting the capability data from custom mode (0xf=
f),
> > >   while others only support it in no-mode (0x00).
> > > - Similarly, some BIOS support get/set for the current value from cus=
tom
> > >   mode (0xff), while others only support it in no-mode (0x00).
> > > - Some BIOS report capability data for a method that is not fully
> > >   implemented.
> > > - Some BIOS have methods fully implemented, but no complimentary
> > >   capability data.
> > >=20
> > > To ensure we only expose fully implemented methods with corresponding
> > > capability data, we check each outcome before reporting that an
> > > attribute can be supported.
> > >=20
> > > Checking for lwmi_is_attr_01_supported during remove is not done to
> > > ensure that we don't attempt to call cd01 or send WMI events if one o=
f
> > > the interfaces being removed was the cause of the driver unloading.
> > >=20
> > > While adding members to tunable_attr_01, remove unused capdata pointe=
r
> > > and limit size of all ID's to the appropriate size.
> > >=20
> > > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > Reported-by: Kurt Borja <kuurtb@gmail.com>
> > > Closes: https://lore.kernel.org/platform-driver-x86/DG60P3SHXR8H.3NSE=
HMZ6J7XRC@gmail.com/
> > > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > ---
> > >  drivers/platform/x86/lenovo/wmi-other.c | 117 +++++++++++++++++++++-=
--
> > >  1 file changed, 102 insertions(+), 15 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platfo=
rm/x86/lenovo/wmi-other.c
> > > index 95886df39c8d..f3f12303e379 100644
> > > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > > @@ -545,11 +545,12 @@ static void lwmi_om_fan_info_collect_cd_fan(str=
uct device *dev, struct cd_list *
> > >  /* =3D=3D=3D=3D=3D=3D=3D=3D fw_attributes (component: lenovo-wmi-cap=
data 01) =3D=3D=3D=3D=3D=3D=3D=3D */
> > > =20
> > >  struct tunable_attr_01 {
> > > -	struct capdata01 *capdata;
> > >  	struct device *dev;
> > > -	u32 feature_id;
> > > -	u32 device_id;
> > > -	u32 type_id;
> > > +	u8 feature_id;
> > > +	u8 device_id;
> > > +	u8 type_id;
> > > +	u8 cd_mode_id; /* mode arg for searching capdata */
> > > +	u8 cv_mode_id; /* mode arg for set/get current_value */
> > >  };
> > > =20
> > >  static struct tunable_attr_01 ppt_pl1_spl =3D {
> > > @@ -716,7 +717,7 @@ static ssize_t attr_capdata01_show(struct kobject=
 *kobj,
> > >  	int value, ret;
> > > =20
> > >  	attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr=
->feature_id,
> > > -				    LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_attr->type_id);
> > > +				    tunable_attr->cd_mode_id, tunable_attr->type_id);
> > > =20
> > >  	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata)=
;
> > >  	if (ret)
> > > @@ -782,7 +783,7 @@ static ssize_t attr_current_value_store(struct ko=
bject *kobj,
> > >  		return -EBUSY;
> > > =20
> > >  	args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->f=
eature_id,
> > > -				 mode, tunable_attr->type_id);
> > > +				 tunable_attr->cd_mode_id, tunable_attr->type_id);
> > > =20
> > >  	ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
> > >  	if (ret)
> > > @@ -795,6 +796,8 @@ static ssize_t attr_current_value_store(struct ko=
bject *kobj,
> > >  	if (value < capdata.min_value || value > capdata.max_value)
> > >  		return -EINVAL;
> > > =20
> > > +	args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->f=
eature_id,
> > > +				 tunable_attr->cv_mode_id, tunable_attr->type_id);
> > >  	args.arg1 =3D value;
> > > =20
> > >  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_S=
ET,
> > > @@ -828,13 +831,16 @@ static ssize_t attr_current_value_show(struct k=
object *kobj,
> > >  	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> > >  	struct wmi_method_args_32 args;
> > >  	enum thermal_mode mode;
> > > -	int retval;
> > > -	int ret;
> > > +	int retval, ret;
> > > =20
> > >  	ret =3D lwmi_om_notifier_call(&mode);
> > >  	if (ret)
> > >  		return ret;
> > > =20
> > > +	/* If "no-mode" is the supported mode, ensure we never send current=
 mode */
> > > +	if (tunable_attr->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
> > > +		mode =3D tunable_attr->cv_mode_id;
> > > +
> > >  	args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->f=
eature_id,
> > >  				 mode, tunable_attr->type_id);
> > > =20
> > > @@ -847,6 +853,85 @@ static ssize_t attr_current_value_show(struct ko=
bject *kobj,
> > >  	return sysfs_emit(buf, "%d\n", retval);
> > >  }
> > > =20
> > > +/**
> > > + * lwmi_attr_01_is_supported() - Determine if the given attribute is=
 supported.
> > > + * @tunable_attr: The attribute to verify.
> > > + *
> > > + * First check if the attribute has a corresponding capdata01 table =
in the cd01
> > > + * module under the "custom" mode (0xff). If that is not present the=
n check if
> > > + * there is a corresponding "no-mode" (0x00) entry. If either of tho=
se passes,
> > > + * check capdata->supported for values > 0. If capdata is available,=
 attempt to
> > > + * determine the set/get mode for the current value property using a=
 similar
> > > + * pattern. If the value returned by either custom or no-mode is 0, =
or we get
> > > + * an error, we assume that mode is not supported. If any of the abo=
ve checks
> > > + * fail then the attribute is not fully supported.
> > > + *
> > > + * The probed cd_mode_id/cv_mode_id are stored on the tunable_attr f=
or later
> > > + * reference.
> > > + *
> > > + * Return: Support level, or an error code.
> > > + */
> > > +static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable=
_attr)
> > > +{
> > > +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> > > +	u8 mode =3D LWMI_GZ_THERMAL_MODE_CUSTOM;
> > > +	struct wmi_method_args_32 args;
> > > +	struct capdata01 capdata;
> > > +	int retval, ret;
> > > +
> > > +	/* Determine tunable_attr->cd_mode_id */
> > > +no_mode_fallback_1:
> > > +	args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->f=
eature_id,
> > > +				 mode, tunable_attr->type_id);
> > > +
> > > +	ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
> > > +	if (ret && mode) {
> > > +		dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args=
.arg0);
> > > +		mode =3D LWMI_GZ_THERMAL_MODE_NONE;
> > > +		goto no_mode_fallback_1;
> > > +	}
> > > +	if (ret)
> > > +		goto not_supported;
> > > +	if (!capdata.supported) {
> > > +		ret =3D -EOPNOTSUPP;
> > > +		goto not_supported;
> > > +	}
> > > +
> > > +	tunable_attr->cd_mode_id =3D mode;
> > > +
> > > +	/* Determine tunable_attr->cv_mode_id */
> > > +	mode =3D LWMI_GZ_THERMAL_MODE_CUSTOM;
> > > +no_mode_fallback_2:
> > > +	args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->f=
eature_id,
> > > +				 mode, tunable_attr->type_id);
> > > +
> > > +	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_G=
ET,
> > > +				    (unsigned char *)&args, sizeof(args),
> > > +				    &retval);
> > > +	if ((ret && mode) || (!retval && mode)) {
> > > +		dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args=
.arg0);
> > > +		mode =3D LWMI_GZ_THERMAL_MODE_NONE;
> > > +		goto no_mode_fallback_2;
> > > +	}
> > > +	if (ret)
> > > +		goto not_supported;
> > > +	if (retval =3D=3D 0) {
> > > +		ret =3D -EOPNOTSUPP;
> > > +		goto not_supported;
> > > +	}
> > > +
> >=20
> > I agree with Ilpo that backward gotos are hard to read and should be
> > avoided if possible.
> >=20
> > > +	tunable_attr->cv_mode_id =3D mode;
> > > +	dev_dbg(tunable_attr->dev, "cd_mode_id: %02x%02x%02x%02x, cv_mode_i=
d: %#08x attribute support level: %x\n",
> >=20
> > It's a long line. Wrap at the first comma?
> >=20
> > > +		tunable_attr->device_id, tunable_attr->feature_id, tunable_attr->c=
d_mode_id,
> > > +		tunable_attr->type_id, args.arg0, capdata.supported);
> > > +
> > > +	return capdata.supported;
> > > +
> > > +not_supported:
> > > +	dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args.=
arg0);
> > > +	return ret;
> > > +}
> > > +
> > >  /* Lenovo WMI Other Mode Attribute macros */
> > >  #define __LWMI_ATTR_RO(_func, _name)                                =
  \
> > >  	{                                                             \
> > > @@ -970,19 +1055,21 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_=
priv *priv)
> > >  	}
> > > =20
> > >  	for (i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
> > > -		err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> > > -					 cd01_attr_groups[i].attr_group);
> > > -		if (err)
> > > -			goto err_remove_groups;
> > > -
> > >  		cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->dev;
> > > +		if (lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr) > =
0) {
> > > +			err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> > > +						 cd01_attr_groups[i].attr_group);
> > > +			if (err)
> > > +				goto err_remove_groups;
> > > +		}
> > >  	}
> > >  	return 0;
> > > =20
> > >  err_remove_groups:
> > >  	while (i--)
> > > -		sysfs_remove_group(&priv->fw_attr_kset->kobj,
> > > -				   cd01_attr_groups[i].attr_group);
> > > +		if (lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr) > =
0)
> >=20
> > I don't see lwmi_om_fw_attr_remove() doing the same. If we care about
> > symmetric cleanup, I would imagine a bitmap or so recording what have
> > been created is used there.
> >=20
> > Also it's doubtful if the firmware always return the same result on the
> > same parameters. If a broken firmware somehow returns different results
> > here, some attributes may be left uncleaned.
> >=20
> > That being said, I am not sure if we really need symmetric cleanup.
> > IIUC, sysfs_remove_group() is a no-op if we pass an attr_group that has
> > not been created.
>=20
> Hi Rong,
> We don't want to query the interface if it was removed, and the no-op is =
harmless. It doesn't seem worth it to me to retain that in memory to achiev=
e the same results.

Makes sense. Then I would suggest drop the lwmi_attr_01_is_supported()
check here so that we don't need to worry about broken firmware.

Thanks,
Rong

> > > +			sysfs_remove_group(&priv->fw_attr_kset->kobj,
> > > +					   cd01_attr_groups[i].attr_group);
> > > =20
> > >  	kset_unregister(priv->fw_attr_kset);
> > > =20
> >=20
> > Thanks,
> > Rong
