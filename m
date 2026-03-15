Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3FB226D02
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 04:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773547836; cv=pass; b=qcEAIRA2WxWHqeG20ZbqtnrL6x1IBno+4h6lmOkxGtL4pD51sfvdbnjP8azKoo0luELq2z9y4I4JxPbc4Z4geDqkhBrSItdKjN7GJztD7sEiQ191J76N70PfNCkUYsltwls5Q0xeYrf3BLGMH2PvpoERdTf2R/LDq/C0z+32XlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773547836; c=relaxed/simple;
	bh=oOAwKxQCoPPjHBr13CVUv5WND+Rdl02r8/yXp6As3u0=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Fu9UMjetLwOBDEpoaKYee8i6BUgzAfQ7QXhDdqELOsftl/i2lmwGWi/ar55kJmBef5ruXt0xRNNRlQIAZyEQPF2bg6D4slMpov79tXs2Z3eMZgKwFv6SI50SSixXwwm9s4kyYuJpKTVwtqS1Lrg2OaTXihcfsDTU+PiEPdmg1FQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=owAStSc8; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="owAStSc8"
ARC-Seal: i=1; a=rsa-sha256; t=1773539065; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IsrqkILJMrKsD6ILMxOeMyblPplVMkcYK2mnPAbRSuyu64tKsmbHjGm4GuogzgRWqBA25nB0T4NDQ2pHUrlFsLjl1XvtslKb27sFE+q+uXyBQiAptPZL8HjwwyzSkqVuHjhuRJCNipEpVCwS5LCOgSa9QKzWgZjGlenSjFNYqZk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773539065; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=u8OX9fPCkBflRn2oHWU9BpDBWPyT/i4sxUB7bBau41o=; 
	b=F5X/KCcij0zdDvNqnjQUN3Kcnqbc0kAyafQhq0spHbIIz2cMd5K24XEtYkuhPPJgpDai0RrTlrYo8V3cvWvA5AziPyfcYqT/9F4PgEFVXZ/6huI7CvjrTARJWnydXKXIZ4bbJezpx3oWb1AWxPqnOhniYgctNdY2ItYdIFqYGsQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773539065;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=u8OX9fPCkBflRn2oHWU9BpDBWPyT/i4sxUB7bBau41o=;
	b=owAStSc8zQ08pkOquilidYwRUwJrP0DEHRCOMPj0Iz3+2G2+neTed44FflotHd7g
	hW43MesEzA6DQ2E+6p2HZ5n6GJhg+1jEEWa0JOn+4S2R+NzLJ96A6nfmge7xzDtBeWT
	TlH3c5RjVf2L/U6gUUHeF00DBEBmcr2aR3bZYL9g2wOYCS0PmHQXha0VGsg9q61UBEZ
	GtzKjL0qk36H64bMPQx6kbxgXtCU+wxap2T4b9uJXkHkhgJqs3HsdHH77OQfAd5Uolc
	yekf43AZsF/JQBGKUpNxuriICUu0+B/pUrIm1UP2QigIazBjcR6JaNTHrGIMrMgMUux
	P05bPgW/Kw==
Received: by mx.zohomail.com with SMTPS id 1773539063771785.7800035512572;
	Sat, 14 Mar 2026 18:44:23 -0700 (PDT)
Message-ID: <b9071200dadaa53aedb899009b24a5812097f726.camel@rong.moe>
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
In-Reply-To: <0f93f2046ef5033a0cd95c054441da55c8540d7c.camel@rong.moe>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
		 <20260312031032.3467565-5-derekjohn.clark@gmail.com>
	 <0f93f2046ef5033a0cd95c054441da55c8540d7c.camel@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Mar 2026 09:39:16 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Sun, 2026-03-15 at 09:26 +0800, Rong Zhang wrote:
> Hi Derek,
>=20
> On Thu, 2026-03-12 at 03:10 +0000, Derek J. Clark wrote:
> > Adds lwmi_is_attr_01_supported, and only creates the attribute subfolde=
r
> > if the attribute is supported by the hardware. Due to some poorly
> > implemented BIOS this is a multi-step sequence of events. This is
> > because:
> > - Some BIOS support getting the capability data from custom mode (0xff)=
,
> >   while others only support it in no-mode (0x00).
> > - Some BIOS support get/set for the current value from custom mode (0xf=
f),
> >   while others only support it in no-mode (0x00).
> > - Some BIOS report capability data for a method that is not fully
> >   implemented.
> > - Some BIOS have methods fully implemented, but no complimentary
> >   capability data.
> >=20
> > To ensure we only expose fully implemented methods with corresponding
> > capability data, we check each outcome before reporting that an
> > attribute can be supported.
> >=20
> > Checking for lwmi_is_attr_01_supported during remove is not done to
> > ensure that we don't attempt to call cd01 or send WMI events if one of
> > the interfaces being removed was the cause of the driver unloading.
> >=20
> > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > Reported-by: Kurt Borja <kuurtb@gmail.com>
> > Closes: https://lore.kernel.org/platform-driver-x86/DG60P3SHXR8H.3NSEHM=
Z6J7XRC@gmail.com/
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v4:
> >   - Use for loop instead of backtrace gotos for checking if an attribut=
e
> >     is supported.
> >   - Add include for dev_printk.
> >   - Wrap dev_dbg in lwmi_is_attr_01_supported earlier.
> >   - Don't use symmetric cleanup of attributes in error states.
> > ---
> >  drivers/platform/x86/lenovo/wmi-other.c | 76 ++++++++++++++++++++++++-
> >  1 file changed, 74 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform=
/x86/lenovo/wmi-other.c
> > index 9fff9c1f768c..55a26e5617d4 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -32,6 +32,7 @@
> >  #include <linux/component.h>
> >  #include <linux/container_of.h>
> >  #include <linux/device.h>
> > +#include <linux/dev_printk.h>
> >  #include <linux/export.h>
> >  #include <linux/gfp_types.h>
> >  #include <linux/hwmon.h>
> > @@ -871,6 +872,76 @@ static ssize_t attr_current_value_show(struct kobj=
ect *kobj,
> >  	return sysfs_emit(buf, "%d\n", retval);
> >  }
> > =20
> > +/**
> > + * lwmi_attr_01_is_supported() - Determine if the given attribute is s=
upported.
> > + * @tunable_attr: The attribute to verify.
> > + *
> > + * First check if the attribute has a corresponding capdata01 table in=
 the cd01
> > + * module under the "custom" mode (0xff). If that is not present then =
check if
> > + * there is a corresponding "no-mode" (0x00) entry. If either of those=
 passes,
> > + * check capdata->supported for values > 0. If capdata is available, a=
ttempt to
> > + * determine the set/get mode for the current value property using a s=
imilar
> > + * pattern. If the value returned by either custom or no-mode is 0, or=
 we get
> > + * an error, we assume that mode is not supported. If any of the above=
 checks
> > + * fail then the attribute is not fully supported.
> > + *
> > + * The probed cd_mode_id/cv_mode_id are stored on the tunable_attr for=
 later
> > + * reference.
> > + *
> > + * Return: Support level, or an error code.
> > + */
> > +static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_a=
ttr)
> > +{
> > +	u8 modes[2] =3D { LWMI_GZ_THERMAL_MODE_CUSTOM, LWMI_GZ_THERMAL_MODE_N=
ONE };
> > +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> > +	struct wmi_method_args_32 args;
> > +	bool cd_mode_found =3D false;
> > +	bool cv_mode_found =3D false;
> > +	struct capdata01 capdata;
> > +	int retval, ret, i;
> > +
> > +	/* Determine tunable_attr->cd_mode_id*/
> > +	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
>=20
> #include <linux/array_size.h>
>=20
> > +		args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->fe=
ature_id,
> > +					 modes[i], tunable_attr->type_id);
> > +
> > +		ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
> > +		if (ret || !capdata.supported)
> > +			continue;
> > +		tunable_attr->cd_mode_id =3D modes[i];
> > +		cd_mode_found =3D true;
> > +		break;
> > +	}
> > +
> > +	if (!cd_mode_found)
> > +		return -EOPNOTSUPP;
> > +
> > +	/* Determine tunable_attr->cv_mode_id, returns 1 if supported*/
> > +	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
> > +		args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->fe=
ature_id,
> > +					 modes[i], tunable_attr->type_id);
> > +
> > +		ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GE=
T,
> > +					    (unsigned char *)&args, sizeof(args),
> > +					    &retval);
> > +		if (ret || !retval)
> > +			continue;
> > +		tunable_attr->cv_mode_id =3D modes[i];
> > +		cv_mode_found =3D true;
> > +		break;
> > +	}
> > +
> > +	if (!cv_mode_found)
> > +		return -EOPNOTSUPP;
> > +
> > +	dev_dbg(tunable_attr->dev,
> > +		"cd_mode_id: %02x%02x%02x%02x, cv_mode_id: %#08x attribute support l=
evel: %x\n",
>                              ^                               ^  ^        =
                  ^
> > +		tunable_attr->device_id, tunable_attr->feature_id, tunable_attr->cd_=
mode_id,
> > +		tunable_attr->type_id, args.arg0, capdata.supported);
>                 ^
>=20
> 	dev_dbg(tunable_attr->dev,
> 		"cd_mode_id: %#10x, cv_mode_id: %#10x, attribute support level: %#10x\n=
",

Sorry, they should be %#010x.

Thanks,
Rong

> 		lwmi_attr_id(...), args.arg0, capdata.supported);
>=20
> > +
> > +	return capdata.supported;
>=20
> You are casting u32 to int. Return it in a pointer argument if you need
> it.
>=20
> > +}
> > +
> >  /* Lenovo WMI Other Mode Attribute macros */
> >  #define __LWMI_ATTR_RO(_func, _name)                                  =
\
> >  	{                                                             \
> > @@ -994,12 +1065,13 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_pr=
iv *priv)
> >  	}
> > =20
> >  	for (i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
> > +		cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->dev;
> > +		if (lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr)  <=
=3D 0)
>=20
> Extra whitespace.
>=20
> > +			continue;
>=20
> Add an empty line in between.
>=20
> Thanks,
> Rong
>=20
> >  		err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> >  					 cd01_attr_groups[i].attr_group);
> >  		if (err)
> >  			goto err_remove_groups;
> > -
> > -		cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->dev;
> >  	}
> >  	return 0;
> > =20
