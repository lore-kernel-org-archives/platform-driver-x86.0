Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E751A28850E;
	Wed, 25 Feb 2026 18:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772045364; cv=pass; b=dIdgAPecD5I4fzui8xVpj8wClKDj1P+ZNXdC/YtGVJNyh7lKKiGdSD75SuMUM+p8X2iy2Z0Ia4AsDxQdb22vsg7RmhKCsRf9Ft5uFD/QmvExqVMZBkTvkGWrZiztrJN6GQsE3Wf2lLguc+yWLK312na4Xxsd8W5CZFPgPzUNSIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772045364; c=relaxed/simple;
	bh=eLQpxhrsQ25TdMzZk25x4ApgbW4U6Hx/YAYpityhqaw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Lf32bO0fmALznPUzoLIdUw/q5kKmzi7GP8fdqNDs0kRUzeMBVYSq9B4wEcSmmylAV0TNXXo+yc/tWown5s8rxXDIZ969v2sJYW7hin//gJPkF9GcRYMw2638nqqNDZl9dnodp+aXPQ5D0xlwlKPlTFbeWOfse4TXsYHpd0182Kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=OXGfb+Km; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="OXGfb+Km"
ARC-Seal: i=1; a=rsa-sha256; t=1772045350; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P3VxyyN0yARtrvqJnXy0NVxBlS7wYv1anlREnr8VYUBfjo7FND6rY3JSI/MA6I5P8LUTtENywfgdi6hXG/ueV8o7Wrt1WVr/HY2uMdbRanVzRuQnLBa0QpmjyogXJkDdrMbtn418vrHJcM0yhnD3iySX+Cc9Fr3fgemXA2MlHMQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772045350; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ajsysiQaby5wQ8/Rx6SD//WYf+i2l28j+J2L95DdMgg=; 
	b=ACu0HFoSvUVOoI1wC4kvkY5j7GP71KXZvXXwjAPrN51eYiMm52zqA8U5+UeLgeTDbE7kPhBGe8b8PHztKAm1PuH6aAzQS71lRRkXmeJjWtZo1FBOvgQmj3r4vACNqd9atTsV7ib0Qyj7FdKspicceJXZUUGgVKzMNRIGXX9uxhQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772045350;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=ajsysiQaby5wQ8/Rx6SD//WYf+i2l28j+J2L95DdMgg=;
	b=OXGfb+Km95jemBD581XC9Q4WkMLfQOtWPtsXpPDVzu9EfpmyPeWFVkODNVQsZlrB
	GNGtSW2H/T1T9PKGEux19riSVrHIphrDSYKTD6db+AuS6QT9o+Kn8YIWJcATYzx8vQ3
	3rNId+a2Jqgp+7r71hSdXN2qTHamWL9V4rj0Ep561jlRngiIis86dub2rdC4adLVfU+
	QxjO/7sdGL8zH1o3I/swZAgBQKjZWE8LmPDI2ZW0ZABrFlVrvopDgpsFr8Z3vvUxHiu
	T/jUrL2mK/++2vkGj6w9cM52xnqCwIKZWtVM6dgrv8dQ9t3cVC2ItU00uHaFkyd4tdt
	uXqD9iWP5A==
Received: by mx.zohomail.com with SMTPS id 1772045348127612.9636873462188;
	Wed, 25 Feb 2026 10:49:08 -0800 (PST)
Message-ID: <4a2abdf1639cca9bf80b168769a807fe21c42469.camel@rong.moe>
Subject: Re: [PATCH v3 6/6] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting.
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <DC0A1067-42C8-4514-8546-A6E13F54CEA6@gmail.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
	 <20260224043200.2680384-7-derekjohn.clark@gmail.com>
	 <222fa8dd3e465aaea2f3ca7ff91bf7ff224278d7.camel@rong.moe>
	 <DC0A1067-42C8-4514-8546-A6E13F54CEA6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Feb 2026 02:44:01 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Derek,

On Wed, 2026-02-25 at 10:23 -0800, Derek J. Clark wrote:
> On February 25, 2026 9:55:40 AM PST, Rong Zhang <i@rong.moe> wrote:
> > Hi Derek,
> >=20
> > There is an extra dot (period) in the title. Please remove it.
> >=20
> > On Tue, 2026-02-24 at 04:32 +0000, Derek J. Clark wrote:
> > > Add charge-type power supply extension for devices that support WMI b=
ased
> > > charge enable/disable. Lenovo Legion devices that implement function =
ID
> > > and capdata 00 ID 0x03010001 are able to enable or disable charging
> > > through the lenovo-wmi-other interface.
> >=20
> > "disable charging"...
> >=20
> > I'd expect it pauses charging immediately and unconditionally instead
> > of setting a threshold, especially considering the its name
> > "INSTANT_MODE". If this is the case, I don't think it fits the
> > definition of POWER_SUPPLY_CHARGE_TYPE_LONGLIFE. It'd better to use
> > POWER_SUPPLY_CHARGE_TYPE_NONE.
>=20
> It really just sets a charge threshold of 80% and lowers the charge speed=
 a bit. I'll come up with a better name than the one Lenovo uses in their d=
ocs.

Makes sense. Thanks for clarification.

FYI, ideapad-laptop conservative mode (i.e.,
POWER_SUPPLY_CHARGE_TYPE_LONGLIFE) doesn't lower the charge speed. It's
just a trivial divergence and isn't a blocker of using
POWER_SUPPLY_CHARGE_TYPE_LONGLIFE here of course.

Thanks,
Rong

> > > The ideapad_laptop driver
> > > conflicts with this if it can also provide the attribute, so we have =
to
> > > get the acpi_handle and check for the same ACPI methods that enable t=
he
> > > feature in that driver. The ACPI method is more reliable from my test=
ing
> > > when both are present, so there is no need to modify the ideapad_lapt=
op
> > > driver instead.
> >=20
> > When ideapad-laptop is blacklisted, there should be no conflict. I
> > would suggest adding a module parameter to force wmi-other to register
> > psy_ext anyway so that users can have their own choice.
> >=20
>=20
> That should be fine. I've found the WMI interface is a little buggy on de=
vices that support the ACPI method. I.e. on the Go S and Go 2 it always rep=
orts the "Enabled" status, but changing it shows the ACPI method reporting =
the correct value. (I used a different attr name to test this)
>=20
> > > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > ---
> > >  drivers/platform/x86/lenovo/wmi-capdata.h |   1 +
> > >  drivers/platform/x86/lenovo/wmi-other.c   | 230 ++++++++++++++++++++=
++
> > >  2 files changed, 231 insertions(+)
> > >=20
> > > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/plat=
form/x86/lenovo/wmi-capdata.h
> > > index b7f9ee7b301a..00471551e7d6 100644
> > > --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> > > +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> > > @@ -26,6 +26,7 @@
> > >  enum lwmi_device_id {
> > >  	LWMI_DEVICE_ID_CPU =3D 0x01,
> > >  	LWMI_DEVICE_ID_GPU =3D 0x02,
> > > +	LWMI_DEVICE_ID_PSU =3D 0x03,
> > >  	LWMI_DEVICE_ID_FAN =3D 0x04,
> > >  };
> > > =20
> > > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platfo=
rm/x86/lenovo/wmi-other.c
> > > index 7f0d5a17b44f..b2daff1b45c2 100644
> > > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > > @@ -42,9 +42,12 @@
> > >  #include <linux/module.h>
> > >  #include <linux/notifier.h>
> > >  #include <linux/platform_profile.h>
> > > +#include <linux/power_supply.h>
> > >  #include <linux/types.h>
> > >  #include <linux/wmi.h>
> > > =20
> > > +#include <acpi/battery.h>
> > > +
> > >  #include "wmi-capdata.h"
> > >  #include "wmi-events.h"
> > >  #include "wmi-gamezone.h"
> > > @@ -78,10 +81,17 @@ enum lwmi_feature_id_gpu {
> > >  	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =3D 0x0b,
> > >  };
> > > =20
> > > +enum lwmi_feature_id_psu {
> > > +	LWMI_FEATURE_ID_PSU_INSTANT_MODE =3D 0x01,
> > > +	LWMI_FEATURE_ID_PSU_CHARGE_MODE =3D 0x02,
> >=20
> > I see no code referencing LWMI_FEATURE_ID_PSU_CHARGE_MODE. What's the
> > mode for?
>=20
> It's another option exposed by some BIOS that is supposed to have similar=
 functionality. None of my devices support it properly so I removed it but =
forgot to clean up this define.
>=20
> > > +};
> > > +
> > >  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> > > =20
> > >  #define LWMI_TYPE_ID_NONE 0x00
> > >  #define LWMI_TYPE_ID_CROSSLOAD 0x01
> > > +#define LWMI_TYPE_ID_PSU_AC 0x01
> > > +#define LWMI_TYPE_ID_PSU_PD 0x02
> > > =20
> > >  #define LWMI_FEATURE_VALUE_GET 17
> > >  #define LWMI_FEATURE_VALUE_SET 18
> > > @@ -92,10 +102,17 @@ enum lwmi_feature_id_gpu {
> > > =20
> > >  #define LWMI_FAN_DIV 100
> > > =20
> > > +#define LWMI_CHARGE_MODE_ENABLED	0x00
> > > +#define LWMI_CHARGE_MODE_DISABLED	0x01
> > > +
> > >  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
> > >  	LWMI_ATTR_ID(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
> > >  		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> > > =20
> > > +#define LWMI_ATTR_ID_PSU(feat, type)		\
> > > +	LWMI_ATTR_ID(LWMI_DEVICE_ID_PSU, feat,		\
> > > +		     LWMI_GZ_THERMAL_MODE_NONE, type)
> > > +
> >=20
> > Unaligned backslashes.
> >=20
> > >  #define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
> > >  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
> > > =20
> > > @@ -137,6 +154,8 @@ struct lwmi_om_priv {
> > >  		bool capdata00_collected : 1;
> > >  		bool capdata_fan_collected : 1;
> > >  	} fan_flags;
> > > +
> > > +	struct acpi_battery_hook battery_hook;
> > >  };
> > > =20
> > >  /*
> > > @@ -561,6 +580,216 @@ static void lwmi_om_fan_info_collect_cd_fan(str=
uct device *dev, struct cd_list *
> > >  	lwmi_om_hwmon_add(priv);
> > >  }
> > > =20
> > > +/* =3D=3D=3D=3D=3D=3D=3D=3D Power Supply Extension (component: lenov=
o-wmi-capdata 00) =3D=3D=3D=3D=3D=3D=3D=3D */
> > > +
> > > +/**
> > > + * lwmi_psy_ext_get_prop() - Get a power_supply_ext property
> > > + * @ps: The battery that was extended
> > > + * @ext: The extension
> > > + * @ext_data: Pointer the lwmi_om_priv drvdata
> > > + * @prop: The property to read
> > > + * @val: The value to return
> > > + *
> > > + * Writes the given value to the power_supply_ext property
> > > + *
> > > + * Return: 0 on success, or an error
> > > + */
> > > +static int lwmi_psy_ext_get_prop(struct power_supply *ps,
> > > +				 const struct power_supply_ext *ext,
> > > +				 void *ext_data,
> > > +				 enum power_supply_property prop,
> > > +				 union power_supply_propval *val)
> > > +{
> > > +	struct lwmi_om_priv *priv =3D ext_data;
> > > +	struct wmi_method_args_32 args;
> > > +	u32 retval;
> > > +	int ret;
> > > +
> > > +	args.arg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_INSTANT_MODE, LW=
MI_TYPE_ID_PSU_AC);
> > > +
> > > +	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_G=
ET,
> > > +				    (unsigned char *)&args, sizeof(args),
> > > +				    &retval);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	dev_dbg(&priv->wdev->dev, "Got return value %x for property %x\n", =
retval, prop);
> > > +
> > > +	if (retval =3D=3D LWMI_CHARGE_MODE_DISABLED)
> > > +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
> > > +	else
> > > +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * lwmi_psy_ext_set_prop() - Set a power_supply_ext property
> > > + * @ps: The battery that was extended
> > > + * @ext: The extension
> > > + * @ext_data: Pointer the lwmi_om_priv drvdata
> > > + * @prop: The property to write
> > > + * @val: The value to write
> > > + *
> > > + * Writes the given value to the power_supply_ext property
> > > + *
> > > + * Return: 0 on success, or an error
> > > + */
> > > +static int lwmi_psy_ext_set_prop(struct power_supply *ps,
> > > +				 const struct power_supply_ext *ext,
> > > +				 void *ext_data,
> > > +				 enum power_supply_property prop,
> > > +				 const union power_supply_propval *val)
> > > +{
> > > +	struct lwmi_om_priv *priv =3D ext_data;
> > > +	struct wmi_method_args_32 args;
> > > +
> > > +	args.arg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_INSTANT_MODE, LW=
MI_TYPE_ID_PSU_AC);
> > > +	if (val->intval =3D=3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)
> > > +		args.arg1 =3D LWMI_CHARGE_MODE_DISABLED;
> > > +	else
> > > +		args.arg1 =3D LWMI_CHARGE_MODE_ENABLED;
> > > +
> > > +	dev_dbg(&priv->wdev->dev, "Attempting to set %#08x for property %x =
to %x\n",
> > > +		args.arg0, prop, args.arg1);
> > > +
> > > +	return lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SE=
T,
> > > +				     (unsigned char *)&args, sizeof(args), NULL);
> > > +}
> > > +
> > > +/**
> > > + * lwmi_psy_prop_is_writeable() - Determine if the property is suppo=
rted
> > > + * @ps: The battery that was extended
> > > + * @ext: The extension
> > > + * @ext_data: Pointer the lwmi_om_priv drvdata
> > > + * @prop: The property to check
> > > + *
> > > + * Checks capdata 00 to determine if the property is supported.
> > > + *
> > > + * Return: Support level, or false
> > > + */
> > > +static int lwmi_psy_prop_is_writeable(struct power_supply *ps,
> > > +				      const struct power_supply_ext *ext,
> > > +				      void *ext_data,
> > > +				      enum power_supply_property prop)
> > > +{
> > > +	struct lwmi_om_priv *priv =3D ext_data;
> > > +	struct capdata00 capdata;
> > > +	u32 attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_INSTANT_M=
ODE, LWMI_TYPE_ID_PSU_AC);
> > > +	int ret;
> > > +
> > > +	ret =3D lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata)=
;
> > > +	if (ret)
> > > +		return false;
> > > +
> > > +	dev_dbg(&priv->wdev->dev, "Battery charge mode (%#08x) support leve=
l: %x\n",
> > > +		attribute_id, capdata.supported);
> > > +
> > > +	return capdata.supported;
> > > +}
> > > +
> > > +static const enum power_supply_property lwmi_psy_ext_props[] =3D {
> > > +	POWER_SUPPLY_PROP_CHARGE_TYPES,
> > > +};
> > > +
> > > +static const struct power_supply_ext lwmi_psy_ext =3D {
> > > +	.name			=3D LWMI_OM_SYSFS_NAME,
> > > +	.properties		=3D lwmi_psy_ext_props,
> > > +	.num_properties		=3D ARRAY_SIZE(lwmi_psy_ext_props),
> > > +	.charge_types		=3D (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> > > +				   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
> > > +	.get_property		=3D lwmi_psy_ext_get_prop,
> > > +	.set_property		=3D lwmi_psy_ext_set_prop,
> > > +	.property_is_writeable	=3D lwmi_psy_prop_is_writeable,
> > > +};
> > > +
> > > +/**
> > > + * lwmi_add_battery() - Connect the power_supply_ext
> > > + * @battery: The battery to extend
> > > + * @hook: The driver hook used to extend the battery
> > > + *
> > > + * Return: 0 on success, or an error.
> > > + */
> > > +static int lwmi_add_battery(struct power_supply *battery, struct acp=
i_battery_hook *hook)
> > > +{
> > > +	struct lwmi_om_priv *priv =3D container_of(hook, struct lwmi_om_pri=
v, battery_hook);
> > > +
> > > +	return power_supply_register_extension(battery, &lwmi_psy_ext, &pri=
v->wdev->dev, priv);
> > > +}
> > > +
> > > +/**
> > > + * lwmi_remove_battery() - Disconnect the power_supply_ext
> > > + * @battery: The battery that was extended
> > > + * @hook: The driver hook used to extend the battery
> > > + *
> > > + * Return: 0 on success, or an error.
> > > + */
> > > +static int lwmi_remove_battery(struct power_supply *battery, struct =
acpi_battery_hook *hook)
> > > +{
> > > +	power_supply_unregister_extension(battery, &lwmi_psy_ext);
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * lwmi_acpi_match() - Attempts to return the ideapad acpi handle
> > > + * @handle: The ACPI handle that manages battery charging
> > > + * @lvl: Unused
> > > + * @context: Void pointer to the acpi_handle object to return
> > > + * @retval: Unused
> > > + *
> > > + * Checks if the ideapad_laptop driver is going to manage charge_typ=
e first,
> > > + * then if not, hooks the battery to our WMI methods.
> > > + *
> > > + * Return: AE_CTRL_TERMINATE if found, AE_OK if not found.
> > > + */
> > > +static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
> > > +				   void *context, void **retval)
> > > +{
> > > +	if (!handle)
> > > +		return AE_OK;
> > > +
> > > +	acpi_handle *ahand =3D context;
> > > +	*ahand =3D handle;
> > > +
> > > +	return AE_CTRL_TERMINATE;
> > > +}
> > > +
> > > +/**
> > > + * lwmi_om_ps_ext_init() - Hooks power supply extension to device ba=
ttery
> > > + * @priv: Driver private data
> > > + *
> > > + * Checks if the ideapad_laptop driver is going to manage charge_typ=
e first,
> > > + * then if not, hooks the battery to our WMI methods.
> > > + */
> > > +static void lwmi_om_ps_ext_init(struct lwmi_om_priv *priv)
> > > +{
> > > +	static const char * const ideapad_hid =3D "VPC2004";
> > > +	acpi_handle handle =3D NULL;
> > > +	int ret;
> > > +
> > > +	/* Deconflict ideapad_laptop driver */
> > > +	ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NUL=
L);
> > > +	if (ret)
> > > +		return;
> > > +
> > > +	if (!handle)
> > > +		return;
> >=20
> > I am a bit confused here. If VPC2004 is not found, handle should remain
> > NULL. In this case we have no conflict, right?
> >=20
> > Thanks,
> > Rong
> >=20
> > > +
> > > +	if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBM=
C")) {
> > > +		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery f=
or device.\n");
> > > +		return;
> > > +	}
> > > +
> > > +	/* Add battery hooks */
> > > +	priv->battery_hook.add_battery	=3D lwmi_add_battery,
> > > +	priv->battery_hook.remove_battery	=3D lwmi_remove_battery,
> > > +	priv->battery_hook.name		=3D "Lenovo WMI Other Battery Extension",
> > > +
> > > +	ret =3D devm_battery_hook_register(&priv->wdev->dev, &priv->battery=
_hook);
> > > +	if (ret)
> > > +		dev_err(&priv->wdev->dev, "Error during battery hook: %i\n", ret);
> > > +}
> > > +
> > >  /* =3D=3D=3D=3D=3D=3D=3D=3D fw_attributes (component: lenovo-wmi-cap=
data 01) =3D=3D=3D=3D=3D=3D=3D=3D */
> > > =20
> > >  struct tunable_attr_01 {
> > > @@ -1325,6 +1554,7 @@ static int lwmi_om_master_bind(struct device *d=
ev)
> > >  		return -ENODEV;
> > > =20
> > >  	lwmi_om_fan_info_collect_cd00(priv);
> > > +	lwmi_om_ps_ext_init(priv);
> > > =20
> > >  	return lwmi_om_fw_attr_add(priv);
> > >  }
