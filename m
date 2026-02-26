Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7C61917FB;
	Thu, 26 Feb 2026 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097646; cv=none; b=JkAMz9qCCC1hh+8Z9Z7+/qtShmEDulq3brNA9ODgr6fyQpvgNfMTiVUA2WVfZxqUVq8op4WtSLo/RghNkE46cTHPq4bzmHo43NEJuTcAgyQMALBRsd3GzmHyt2Hr7JJbmAac8r+GjGbhOKN3ebZqjEYVkMfVIzs7Nc1HFzloPB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097646; c=relaxed/simple;
	bh=L++1YqESdjFayG7lHVJYoi9aycTSiMsOiFe32FL/Kss=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OSpwFbIRTl42n45PhCsrlF1o+NaJdzMo7o965w2+yVSA83ETVEW0TvPXcCG2ElRaqad2QQ3FLttUbcyq8pI+BBqRZH/Zrel9+00as6uVaoEDIqSjJTfvtBGYsCdlB8xWbiUyQ9vid1y2MT6Ok13HJKm0R3RceYWn+pY2e2OAQAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAinUjJQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAinUjJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772097646; x=1803633646;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=L++1YqESdjFayG7lHVJYoi9aycTSiMsOiFe32FL/Kss=;
  b=ZAinUjJQmOWFrGh/Lo64aLyQagayS71jIWWKKxWcJV4e28Ub1RPUJulO
   /i7g12zU51NARSte2gEYqTTo4XMZhE4T5x7bgW78gDDaDr6xhY896Kpxe
   Gz4CTjj+Qln9tVnXk/RjCQOv+QCEIO3PjWz3oTMv1uMsEOFOL2AA1wXeo
   1W/8QwHxs8alWI/FptSGuT2/FvuUlnBl0ps1kaiYjRqp2AZDaGwCwGi26
   xqbgP3e0XAU3rVCmlcrUNollGtfXZjx2IXjZU0yEP4+v4Kx1k/Ba/w2i5
   HvtagWhuS7nnH4GJ3mEr+OfyPjqoxblF7TaceeVK8qx9gfGLGE9ir2NPm
   g==;
X-CSE-ConnectionGUID: R6V3P7vSRkuYYrAnieOmhA==
X-CSE-MsgGUID: SoL0p0/RRV+Rs3CgizZTUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90563744"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="90563744"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:20:45 -0800
X-CSE-ConnectionGUID: EItsKr67QVCV9zFpdfxrAA==
X-CSE-MsgGUID: stl8I7B2SzW2pgdN2VEMKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="220652052"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:20:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Feb 2026 11:20:38 +0200 (EET)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] platform/x86: lenovo-wmi-other: Limit adding
 attributes to supported devices
In-Reply-To: <D08EFEB7-C14F-41A0-A6F1-1E415ADC67A3@gmail.com>
Message-ID: <7b71699f-7a7d-ae25-9002-89cc106abcee@linux.intel.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-3-derekjohn.clark@gmail.com> <d5928a3f-37e8-fdb1-2aa3-ffd9f9250d34@linux.intel.com> <D08EFEB7-C14F-41A0-A6F1-1E415ADC67A3@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-161740484-1772097638=:11587"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-161740484-1772097638=:11587
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 25 Feb 2026, Derek J. Clark wrote:

> On February 24, 2026 12:47:56 AM PST, "Ilpo J=C3=A4rvinen" <ilpo.jarvinen=
@linux.intel.com> wrote:
> >On Tue, 24 Feb 2026, Derek J. Clark wrote:
> >
> >> Adds lwmi_is_attr_01_supported, and only creates the attribute subfold=
er
> >> if the attribute is supported by the hardware. Due to some poorly
> >> implemented BIOS, this is a multi-step sequence of events. This is
> >> because:
> >> - Some BIOS support getting the capability data from custom mode (0xff=
),
> >>   while others only support it in no-mode (0x00).
> >> - Similarly, some BIOS support get/set for the current value from cust=
om
> >>   mode (0xff), while others only support it in no-mode (0x00).
> >> - Some BIOS report capability data for a method that is not fully
> >>   implemented.
> >> - Some BIOS have methods fully implemented, but no complimentary
> >>   capability data.
> >>=20
> >> To ensure we only expose fully implemented methods with corresponding
> >> capability data, we check each outcome before reporting that an
> >> attribute can be supported.
> >>=20
> >> Checking for lwmi_is_attr_01_supported during remove is not done to
> >> ensure that we don't attempt to call cd01 or send WMI events if one of
> >> the interfaces being removed was the cause of the driver unloading.
> >>=20
> >
> >> While adding members to tunable_attr_01, remove unused capdata pointer
> >> and limit size of all ID's to the appropriate size.
> >
> >Please don't mix changes like this. Create a seprate patch for it.
> >
> >> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> >> Reported-by: Kurt Borja <kuurtb@gmail.com>
> >> Closes: https://lore.kernel.org/platform-driver-x86/DG60P3SHXR8H.3NSEH=
MZ6J7XRC@gmail.com/
> >> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >> ---
> >>  drivers/platform/x86/lenovo/wmi-other.c | 117 +++++++++++++++++++++--=
-
> >>  1 file changed, 102 insertions(+), 15 deletions(-)
> >>=20
> >> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platfor=
m/x86/lenovo/wmi-other.c
> >> index 95886df39c8d..f3f12303e379 100644
> >> --- a/drivers/platform/x86/lenovo/wmi-other.c
> >> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> >> @@ -545,11 +545,12 @@ static void lwmi_om_fan_info_collect_cd_fan(stru=
ct device *dev, struct cd_list *
> >>  /* =3D=3D=3D=3D=3D=3D=3D=3D fw_attributes (component: lenovo-wmi-capd=
ata 01) =3D=3D=3D=3D=3D=3D=3D=3D */
> >> =20
> >>  struct tunable_attr_01 {
> >> -=09struct capdata01 *capdata;
> >>  =09struct device *dev;
> >> -=09u32 feature_id;
> >> -=09u32 device_id;
> >> -=09u32 type_id;
> >> +=09u8 feature_id;
> >> +=09u8 device_id;
> >> +=09u8 type_id;
> >> +=09u8 cd_mode_id; /* mode arg for searching capdata */
> >> +=09u8 cv_mode_id; /* mode arg for set/get current_value */
> >>  };
> >> =20
> >>  static struct tunable_attr_01 ppt_pl1_spl =3D {
> >> @@ -716,7 +717,7 @@ static ssize_t attr_capdata01_show(struct kobject =
*kobj,
> >>  =09int value, ret;
> >> =20
> >>  =09attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_att=
r->feature_id,
> >> -=09=09=09=09    LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_attr->type_id);
> >> +=09=09=09=09    tunable_attr->cd_mode_id, tunable_attr->type_id);
> >> =20
> >>  =09ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata=
);
> >>  =09if (ret)
> >> @@ -782,7 +783,7 @@ static ssize_t attr_current_value_store(struct kob=
ject *kobj,
> >>  =09=09return -EBUSY;
> >> =20
> >>  =09args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->=
feature_id,
> >> -=09=09=09=09 mode, tunable_attr->type_id);
> >> +=09=09=09=09 tunable_attr->cd_mode_id, tunable_attr->type_id);
> >> =20
> >>  =09ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
> >>  =09if (ret)
> >> @@ -795,6 +796,8 @@ static ssize_t attr_current_value_store(struct kob=
ject *kobj,
> >>  =09if (value < capdata.min_value || value > capdata.max_value)
> >>  =09=09return -EINVAL;
> >> =20
> >> +=09args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->=
feature_id,
> >> +=09=09=09=09 tunable_attr->cv_mode_id, tunable_attr->type_id);
> >>  =09args.arg1 =3D value;
> >> =20
> >>  =09ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_=
SET,
> >> @@ -828,13 +831,16 @@ static ssize_t attr_current_value_show(struct ko=
bject *kobj,
> >>  =09struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> >>  =09struct wmi_method_args_32 args;
> >>  =09enum thermal_mode mode;
> >> -=09int retval;
> >> -=09int ret;
> >> +=09int retval, ret;
> >> =20
> >>  =09ret =3D lwmi_om_notifier_call(&mode);
> >>  =09if (ret)
> >>  =09=09return ret;
> >> =20
> >> +=09/* If "no-mode" is the supported mode, ensure we never send curren=
t mode */
> >> +=09if (tunable_attr->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
> >> +=09=09mode =3D tunable_attr->cv_mode_id;
> >> +
> >>  =09args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->=
feature_id,
> >>  =09=09=09=09 mode, tunable_attr->type_id);
> >> =20
> >> @@ -847,6 +853,85 @@ static ssize_t attr_current_value_show(struct kob=
ject *kobj,
> >>  =09return sysfs_emit(buf, "%d\n", retval);
> >>  }
> >> =20
> >> +/**
> >> + * lwmi_attr_01_is_supported() - Determine if the given attribute is =
supported.
> >> + * @tunable_attr: The attribute to verify.
> >> + *
> >> + * First check if the attribute has a corresponding capdata01 table i=
n the cd01
> >> + * module under the "custom" mode (0xff). If that is not present then=
 check if
> >> + * there is a corresponding "no-mode" (0x00) entry. If either of thos=
e passes,
> >> + * check capdata->supported for values > 0. If capdata is available, =
attempt to
> >> + * determine the set/get mode for the current value property using a =
similar
> >> + * pattern. If the value returned by either custom or no-mode is 0, o=
r we get
> >> + * an error, we assume that mode is not supported. If any of the abov=
e checks
> >> + * fail then the attribute is not fully supported.
> >> + *
> >> + * The probed cd_mode_id/cv_mode_id are stored on the tunable_attr fo=
r later
> >> + * reference.
> >> + *
> >> + * Return: Support level, or an error code.
> >> + */
> >> +static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_=
attr)
> >> +{
> >> +=09struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> >> +=09u8 mode =3D LWMI_GZ_THERMAL_MODE_CUSTOM;
> >> +=09struct wmi_method_args_32 args;
> >> +=09struct capdata01 capdata;
> >> +=09int retval, ret;
> >> +
> >> +=09/* Determine tunable_attr->cd_mode_id */
> >> +no_mode_fallback_1:
> >> +=09args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->=
feature_id,
> >> +=09=09=09=09 mode, tunable_attr->type_id);
> >> +
> >> +=09ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
> >> +=09if (ret && mode) {
> >> +=09=09dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", a=
rgs.arg0);
> >
> >Add include.
> >
> >> +=09=09mode =3D LWMI_GZ_THERMAL_MODE_NONE;
> >> +=09=09goto no_mode_fallback_1;
> >
> >Is it possible to make a helper so you don't need these back gotos?
> >
>=20
> Sure. How about I put both modes into an array and loop through them,=20
> passing the values to a function that will evaluate it. I can break if=20
> there is a match and throw an error if there's no match at the end.

It would probably work okay with a loop (which you've basically done now=20
in a custom way using that goto) and array.

> >> +=09}
> >> +=09if (ret)
> >> +=09=09goto not_supported;
> >> +=09if (!capdata.supported) {
> >> +=09=09ret =3D -EOPNOTSUPP;
> >> +=09=09goto not_supported;
> >> +=09}
> >> +
> >> +=09tunable_attr->cd_mode_id =3D mode;
> >> +
> >> +=09/* Determine tunable_attr->cv_mode_id */
> >> +=09mode =3D LWMI_GZ_THERMAL_MODE_CUSTOM;
> >> +no_mode_fallback_2:
> >> +=09args.arg0 =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->=
feature_id,
> >> +=09=09=09=09 mode, tunable_attr->type_id);
> >> +
> >> +=09ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_=
GET,
> >> +=09=09=09=09    (unsigned char *)&args, sizeof(args),
> >> +=09=09=09=09    &retval);
> >> +=09if ((ret && mode) || (!retval && mode)) {
> >> +=09=09dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", a=
rgs.arg0);
> >> +=09=09mode =3D LWMI_GZ_THERMAL_MODE_NONE;
> >> +=09=09goto no_mode_fallback_2;
> >
> >Same question here?
> >
> >> +=09}
> >> +=09if (ret)
> >> +=09=09goto not_supported;
> >> +=09if (retval =3D=3D 0) {
> >> +=09=09ret =3D -EOPNOTSUPP;
> >> +=09=09goto not_supported;
> >> +=09}
> >> +
> >> +=09tunable_attr->cv_mode_id =3D mode;
> >> +=09dev_dbg(tunable_attr->dev, "cd_mode_id: %02x%02x%02x%02x, cv_mode_=
id: %#08x attribute support level: %x\n",
> >> +=09=09tunable_attr->device_id, tunable_attr->feature_id, tunable_attr=
->cd_mode_id,
> >> +=09=09tunable_attr->type_id, args.arg0, capdata.supported);
> >> +
> >> +=09return capdata.supported;
> >> +
> >> +not_supported:
> >> +=09dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args=
=2Earg0);
> >> +=09return ret;
> >> +}
> >> +
> >>  /* Lenovo WMI Other Mode Attribute macros */
> >>  #define __LWMI_ATTR_RO(_func, _name)                                 =
 \
> >>  =09{                                                             \
> >> @@ -970,19 +1055,21 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_p=
riv *priv)
> >>  =09}
> >> =20
> >>  =09for (i =3D 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
> >> -=09=09err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> >> -=09=09=09=09=09 cd01_attr_groups[i].attr_group);
> >> -=09=09if (err)
> >> -=09=09=09goto err_remove_groups;
> >> -
> >>  =09=09cd01_attr_groups[i].tunable_attr->dev =3D &priv->wdev->dev;
> >> +=09=09if (lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr)=
 > 0) {
> >
> >Reverse logic and use continue.
> >
> >> +=09=09=09err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
> >> +=09=09=09=09=09=09 cd01_attr_groups[i].attr_group);
> >> +=09=09=09if (err)
> >> +=09=09=09=09goto err_remove_groups;
> >> +=09=09}
> >>  =09}
> >>  =09return 0;
> >> =20
> >>  err_remove_groups:
> >>  =09while (i--)
> >> -=09=09sysfs_remove_group(&priv->fw_attr_kset->kobj,
> >> -=09=09=09=09   cd01_attr_groups[i].attr_group);
> >> +=09=09if (lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr)=
 > 0)
> >
> >Reverse logic + continue.
> >
> >> +=09=09=09sysfs_remove_group(&priv->fw_attr_kset->kobj,
> >> +=09=09=09=09=09   cd01_attr_groups[i].attr_group);
> >
> >You need to add braces for multiline constructs.
> >
> >> =20
> >>  =09kset_unregister(priv->fw_attr_kset);
> >> =20
> >>=20
> >
>=20

--=20
 i.

--8323328-161740484-1772097638=:11587--
