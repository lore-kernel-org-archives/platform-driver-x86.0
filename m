Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A1A19B5A3;
	Sun, 15 Mar 2026 18:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600955; cv=pass; b=Q5jIN4X8uBXMTnFZSwd0y4rK6SUWdA5uLPik6iTcVFpeFlQf9Y0LkVUMDU1qzF9BIX/uCHSD6piwIsv0Xn+C72jkmqsh8Ob3fMB8uC5717IEVaTnNy5YETsgoM4xOVyil6Cc3+Mf8XtDjoRlzM8JbRPefehDfwklNK11nl2WRXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600955; c=relaxed/simple;
	bh=reX7kRLbKlsY1DR9x/tac8UXOFeDhnY2xPbQcQGm0J8=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BnqkntDk1gP/v+/WhNET8CmVZgY922WziaCMkVNDZyPYKQawc5KHLNhRmDGp1uJSfsljnP/doi9EDXB8BXeUQv8ULcCPlrCwpUTVE7mA8gHoT+W0Ug0skGEUqMYjwFNhTe/HeWRUDI4KlcUhTbxniUptnPeoUVKOWjY7ifFHEqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=RfVyPB6M; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="RfVyPB6M"
ARC-Seal: i=1; a=rsa-sha256; t=1773600919; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AgSBlutMfWaQA4QASQ0cE8Rb/UFmzxDgNakR6GaB3ycpR2Dw6vvbDAocqzshBJNYzhpaIgU70/PD5DvrWY8DmQenfj2IN/l+EqcMAuORwi5E4rNwBU5eXmd4CB3spsgE6ou+eLHPdtfd6oxmitEidWOgA9F0/xO85g6nTK9x63w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773600919; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2mNdRqNzoRnneufWfez8NqRdhSQbJN70BG+d/6j41NI=; 
	b=B1C0djm6EuOfKriIaz0j0PvoyYUNl3QQM1dVQpNex8zWAddS2C0T8mzbQ7T36rQ5IhQnIYtggdB+tvpN3+a8cwulXCl/eN2UhC1Oqyn7es0k5sPMHeGOHIrrbOPfWZa5wo+aRhmdy/Zcp3yWfNjF+e2JjbceMQaATAC4CFihbEg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773600919;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=2mNdRqNzoRnneufWfez8NqRdhSQbJN70BG+d/6j41NI=;
	b=RfVyPB6MoYZb26trQ7VJUumDoyF63bvOG8uv0N4rsV1db+UdsEknXpIJfAcbQf3V
	9edvitTz5GY0C0GPcOSqSF9sX0v+JGVKKwzvdDYhw/OFaBRdNiYKdiSgwkJweeApXeG
	rZf17RpP4acnnTATVi20dlVnIwoI8IyCvJxcO5c95pqmIpUm1BA6z2G6hinXCjJeKl+
	1o35iuPaNMbjTj05I+Vgma1cNi2lJzIqWPrvojzmpcHpKKbVcQIPxlWrww7NEwAHTsV
	h7SPrdJcJ6ybCA9CvQI3PApxvWa1jpEcHNY63rK2sBId8ZB8VdTMMbxSm4IPNm6q5MF
	dU/h7kuKlg==
Received: by mx.zohomail.com with SMTPS id 1773600916572465.28055151756166;
	Sun, 15 Mar 2026 11:55:16 -0700 (PDT)
Message-ID: <8cc78d54993a735b9b50894e8bf7eacf0ade54c2.camel@rong.moe>
Subject: Re: [PATCH v4 4/8] platform/x86: lenovo-wmi-other: Limit adding
 attributes to supported devices
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans
 de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Armin Wolf <W_Armin@gmx.de>,  Jonathan Corbet	 <corbet@lwn.net>, Kurt Borja
 <kuurtb@gmail.com>, 	platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <AFC33772-1E08-4690-AE82-98E6CF8AC1A9@gmail.com>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
	 <20260312031032.3467565-5-derekjohn.clark@gmail.com>
	 <0f93f2046ef5033a0cd95c054441da55c8540d7c.camel@rong.moe>
	 <AFC33772-1E08-4690-AE82-98E6CF8AC1A9@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Mar 2026 02:50:10 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Sat, 2026-03-14 at 20:47 -0700, Derek J. Clark wrote:
> On March 14, 2026 6:26:08 PM PDT, Rong Zhang <i@rong.moe> wrote:
> > Hi Derek,
> >=20
> > On Thu, 2026-03-12 at 03:10 +0000, Derek J. Clark wrote:
> > > Adds lwmi_is_attr_01_supported, and only creates the attribute subfol=
der
> > > if the attribute is supported by the hardware. Due to some poorly
> > > implemented BIOS this is a multi-step sequence of events. This is
> > > because:
> > > - Some BIOS support getting the capability data from custom mode (0xf=
f),
> > >   while others only support it in no-mode (0x00).
> > > - Some BIOS support get/set for the current value from custom mode (0=
xff),
> > >   while others only support it in no-mode (0x00).
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
> > > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > Reported-by: Kurt Borja <kuurtb@gmail.com>
> > > Closes: https://lore.kernel.org/platform-driver-x86/DG60P3SHXR8H.3NSE=
HMZ6J7XRC@gmail.com/
> > > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > ---
> > > v4:
> > >   - Use for loop instead of backtrace gotos for checking if an attrib=
ute
> > >     is supported.
> > >   - Add include for dev_printk.
> > >   - Wrap dev_dbg in lwmi_is_attr_01_supported earlier.
> > >   - Don't use symmetric cleanup of attributes in error states.
> > > ---
> > >  drivers/platform/x86/lenovo/wmi-other.c | 76 +++++++++++++++++++++++=
+-
> > >  1 file changed, 74 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platfo=
rm/x86/lenovo/wmi-other.c
> > > index 9fff9c1f768c..55a26e5617d4 100644
> > > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > > @@ -32,6 +32,7 @@
> > >  #include <linux/component.h>
> > >  #include <linux/container_of.h>
> > >  #include <linux/device.h>
> > > +#include <linux/dev_printk.h>
> > >  #include <linux/export.h>
> > >  #include <linux/gfp_types.h>
> > >  #include <linux/hwmon.h>
> > > @@ -871,6 +872,76 @@ static ssize_t attr_current_value_show(struct ko=
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
> > > +	u8 modes[2] =3D { LWMI_GZ_THERMAL_MODE_CUSTOM, LWMI_GZ_THERMAL_MODE=
_NONE };
> > > +	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> > > +	struct wmi_method_args_32 args;
> > > +	bool cd_mode_found =3D false;
> > > +	bool cv_mode_found =3D false;
> > > +	struct capdata01 capdata;
> > > +	int retval, ret, i;
> > > +
> > > +	/* Determine tunable_attr->cd_mode_id*/
> > > +	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
> >=20
> > #include <linux/array_size.h>
> >=20
> > > +		args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->=
feature_id,
> > > +					 modes[i], tunable_attr->type_id);
> > > +
> > > +		ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
> > > +		if (ret || !capdata.supported)
> > > +			continue;
> > > +		tunable_attr->cd_mode_id =3D modes[i];
> > > +		cd_mode_found =3D true;
> > > +		break;
> > > +	}
> > > +
> > > +	if (!cd_mode_found)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	/* Determine tunable_attr->cv_mode_id, returns 1 if supported*/
> > > +	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
> > > +		args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->=
feature_id,
> > > +					 modes[i], tunable_attr->type_id);
> > > +
> > > +		ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_=
GET,
> > > +					    (unsigned char *)&args, sizeof(args),
> > > +					    &retval);
> > > +		if (ret || !retval)
> > > +			continue;
> > > +		tunable_attr->cv_mode_id =3D modes[i];
> > > +		cv_mode_found =3D true;
> > > +		break;
> > > +	}
> > > +
> > > +	if (!cv_mode_found)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	dev_dbg(tunable_attr->dev,
> > > +		"cd_mode_id: %02x%02x%02x%02x, cv_mode_id: %#08x attribute support=
 level: %x\n",
> >                             ^                               ^  ^       =
                   ^
> > > +		tunable_attr->device_id, tunable_attr->feature_id, tunable_attr->c=
d_mode_id,
> > > +		tunable_attr->type_id, args.arg0, capdata.supported);
> >                ^
> >=20
> > 	dev_dbg(tunable_attr->dev,
> > 		"cd_mode_id: %#10x, cv_mode_id: %#10x, attribute support level: %#10x=
\n",
> > 		lwmi_attr_id(...), args.arg0, capdata.supported);
> >=20
>=20
> I hadn't thought about using that here, good idea.
>=20
> > > +
> > > +	return capdata.supported;
> >=20
> > You are casting u32 to int. Return it in a pointer argument if you need
> > it.
>=20
> We don't do anything with the specific value, we just check that the leve=
l is above 0. We also don't do anything with the error codes specifically. =
Perhaps this should return a bool instead and we can return true if this is=
 above 0 and false in all other paths? That would also improve the syntax a=
 bit since the function name is a question and that would allow for !.._is_=
supported checks.

Yeah, that's a good idea.

Thanks,
Rong

>=20
> Thanks,
> Derek
>=20
> > > +}
> > > +
> > >  /* Lenovo WMI Other Mode Attribute macros */
> > >  #define __LWMI_ATTR_RO(_func, _name)                                =
  \
> > >  	{                                                             \
> > > @@ -994,12 +1065,13 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_=
priv *priv)
> > >  	}
> > > =20
> > >  	for (i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
> > > +		cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->dev;
> > > +		if (lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr)  <=
=3D 0)
> >=20
> > Extra whitespace.
> >=20
> > > +			continue;
> >=20
> > Add an empty line in between.
> >=20
> > Thanks,
> > Rong
> >=20
> > >  		err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> > >  					 cd01_attr_groups[i].attr_group);
> > >  		if (err)
> > >  			goto err_remove_groups;
> > > -
> > > -		cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->dev;
> > >  	}
> > >  	return 0;
> > > =20
