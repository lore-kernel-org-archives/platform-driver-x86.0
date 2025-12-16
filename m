Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB7D352F85;
	Tue, 16 Dec 2025 15:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898464; cv=none; b=VX+PjV9KIf2RMeN9rFmqLUkWQPF2zfnapwqAN3bLfH46N6Z42y/6WfJUuS+1U+4wrVJzUS/jg7b8g54QX9Y6HJAO2Rmpm86fSX2NG1Gmzfhvabd3uxhEvNvkbobvLtD/wHIUBrUMqA8aYX0mOQEYlpW72NouutOFX/BlVPKKbHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898464; c=relaxed/simple;
	bh=ahuFwBsHwBZzSqCIBtmkf87Kg5DfsiBsTb8oeZPL3hA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=a441B26bnILLC39xFzoc9VJgmhoKf/hmVIQKdcLQzxR0z6Mz+LVdY5U7KZmK8P3mwTT1hrL/fdzcWvL2HmRbM7sRgh6DsPwYk08npL9auuEZ9l/BQJ4ugqOT1d+tlmVcH33iN62oV+C4HCjv7j5Qx0pNRZnlldk/gAGy+FfFCzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayRJN9sH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayRJN9sH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765898461; x=1797434461;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ahuFwBsHwBZzSqCIBtmkf87Kg5DfsiBsTb8oeZPL3hA=;
  b=ayRJN9sHjJQCDS4dacHAvdswH8VxzxEBV9EawkEH9yM6MybZIpD/J0rj
   onHrf4MuXpkdrOt8hmiKzOOMdchoDmbKzEZP05Ipvu07wtSGe9JtI9JWL
   Oj5XWuDAw5K282BWmPCvIv6PtnMz8JUgOBkDg8TdmGbyIrVKmgc8HuwuC
   hCrZY6oA5LasbKRnl9kZJs+aeigLW9JDtNWUUyoe8jrG87FcXAiz+Lper
   CsWBuxf6H4du+URnrtpq4KxNgIbkMqgnQjHO98GN8QHB4ZfeSduVFWO61
   Mxb5wM8RksS28AanJxgZws+1tsei0H99ud8UZE/c7a+eBx+5l7xm+0gXB
   w==;
X-CSE-ConnectionGUID: CbvANzLQSs+sa54sUjZkZw==
X-CSE-MsgGUID: fsTBS4NMQLmeNlcEtdzmFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67757214"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67757214"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 07:20:59 -0800
X-CSE-ConnectionGUID: Ar6GkLvVQqSe0Q6fNko9Bg==
X-CSE-MsgGUID: 5aop8mGwRYe7sIrp8WOlmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="228724163"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.4])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 07:20:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 16 Dec 2025 17:20:53 +0200 (EET)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] platform/x86: uniwill-laptop: Introduce device
 descriptor system
In-Reply-To: <20c01115-2178-4a92-b600-31f5d3281a35@tuxedocomputers.com>
Message-ID: <c88ac07a-4add-e647-5bf7-810436c88360@linux.intel.com>
References: <20251204135121.435905-1-wse@tuxedocomputers.com> <20251204135121.435905-2-wse@tuxedocomputers.com> <cfe33020-5faa-c780-6d0a-6a6267070983@linux.intel.com> <20c01115-2178-4a92-b600-31f5d3281a35@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-359918297-1765898453=:1169"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-359918297-1765898453=:1169
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 16 Dec 2025, Werner Sembach wrote:

>=20
> Am 16.12.25 um 14:40 schrieb Ilpo J=C3=A4rvinen:
> > On Thu, 4 Dec 2025, Werner Sembach wrote:
> >=20
> > > From: Armin Wolf <W_Armin@gmx.de>
> > >=20
> > > Future additions to the driver will depend on device-specific
> > > initialization steps. Extend the DMI-based feature detection system
> > > to include device descriptors. Each descriptor contains a bitmap of
> > > supported features and a set of callback for performing
> > > device-specific initialization.
> > >=20
> > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
> > > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > > ---
> > >   drivers/platform/x86/uniwill/uniwill-acpi.c | 168 +++++++++++++++++=
---
> > >   1 file changed, 142 insertions(+), 26 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c
> > > b/drivers/platform/x86/uniwill/uniwill-acpi.c
> > > index bd7e63dd51810..01192c32608e5 100644
> > > --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> > > +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> > > @@ -322,6 +322,7 @@ struct uniwill_data {
> > >   =09struct device *dev;
> > >   =09acpi_handle handle;
> > >   =09struct regmap *regmap;
> > > +=09unsigned int features;
> > >   =09struct acpi_battery_hook hook;
> > >   =09unsigned int last_charge_ctrl;
> > >   =09struct mutex battery_lock;=09/* Protects the list of currently
> > > registered batteries */
> > > @@ -341,12 +342,21 @@ struct uniwill_battery_entry {
> > >   =09struct power_supply *battery;
> > >   };
> > >   +struct uniwill_device_descriptor {
> > > +=09unsigned int features;
> > > +=09/* Executed during driver probing */
> > > +=09int (*probe)(struct uniwill_data *data);
> > > +};
> > > +
> > >   static bool force;
> > >   module_param_unsafe(force, bool, 0);
> > >   MODULE_PARM_DESC(force, "Force loading without checking for support=
ed
> > > devices\n");
> > >   -/* Feature bitmask since the associated registers are not reliable=
 */
> > > -static unsigned int supported_features;
> > > +/*
> > > + * Contains device specific data like the feature bitmap since
> > > + * the associated registers are not always reliable.
> > > + */
> > > +static struct uniwill_device_descriptor device_descriptor
> > > __ro_after_init;
> > >     static const char * const uniwill_temp_labels[] =3D {
> > >   =09"CPU",
> > > @@ -411,6 +421,13 @@ static const struct key_entry uniwill_keymap[] =
=3D {
> > >   =09{ KE_END }
> > >   };
> > >   +static inline bool uniwill_device_supports(struct uniwill_data *da=
ta,
> > > +=09=09=09=09=09   unsigned int features_mask,
> > > +=09=09=09=09=09   unsigned int features)
> > > +{
> > > +=09return (data->features & features_mask) =3D=3D features;
> > > +}
> > > +
> > >   static int uniwill_ec_reg_write(void *context, unsigned int reg,
> > > unsigned int val)
> > >   {
> > >   =09union acpi_object params[2] =3D {
> > > @@ -799,24 +816,31 @@ static struct attribute *uniwill_attrs[] =3D {
> > >     static umode_t uniwill_attr_is_visible(struct kobject *kobj, stru=
ct
> > > attribute *attr, int n)
> > >   {
> > > +=09struct device *dev =3D kobj_to_dev(kobj);
> > > +=09struct uniwill_data *data =3D dev_get_drvdata(dev);
> > > +
> > >   =09if (attr =3D=3D &dev_attr_fn_lock_toggle_enable.attr) {
> > > -=09=09if (supported_features & UNIWILL_FEATURE_FN_LOCK_TOGGLE)
> > > +=09=09if (uniwill_device_supports(data,
> > > UNIWILL_FEATURE_FN_LOCK_TOGGLE,
> > > +=09=09=09=09=09    UNIWILL_FEATURE_FN_LOCK_TOGGLE))
> > >   =09=09=09return attr->mode;
> > >   =09}
> > >     =09if (attr =3D=3D &dev_attr_super_key_toggle_enable.attr) {
> > > -=09=09if (supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE)
> > > +=09=09if (uniwill_device_supports(data,
> > > UNIWILL_FEATURE_SUPER_KEY_TOGGLE,
> > > +=09=09=09=09=09    UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> > >   =09=09=09return attr->mode;
> > >   =09}
> > >     =09if (attr =3D=3D &dev_attr_touchpad_toggle_enable.attr) {
> > > -=09=09if (supported_features & UNIWILL_FEATURE_TOUCHPAD_TOGGLE)
> > > +=09=09if (uniwill_device_supports(data,
> > > UNIWILL_FEATURE_TOUCHPAD_TOGGLE,
> > > +=09=09=09=09=09    UNIWILL_FEATURE_TOUCHPAD_TOGGLE))
> > >   =09=09=09return attr->mode;
> > >   =09}
> > >     =09if (attr =3D=3D &dev_attr_rainbow_animation.attr ||
> > >   =09    attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
> > > -=09=09if (supported_features & UNIWILL_FEATURE_LIGHTBAR)
> > > +=09=09if (uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR,
> > > +=09=09=09=09=09    UNIWILL_FEATURE_LIGHTBAR))
> > >   =09=09=09return attr->mode;
> > >   =09}
> > >   @@ -944,7 +968,8 @@ static int uniwill_hwmon_init(struct uniwill_da=
ta
> > > *data)
> > >   {
> > >   =09struct device *hdev;
> > >   -=09if (!(supported_features & UNIWILL_FEATURE_HWMON))
> > > +=09if (!uniwill_device_supports(data, UNIWILL_FEATURE_HWMON,
> > > +=09=09=09=09     UNIWILL_FEATURE_HWMON))
> > >   =09=09return 0;
> > >     =09hdev =3D devm_hwmon_device_register_with_info(data->dev,
> > > "uniwill", data,
> > > @@ -1019,7 +1044,8 @@ static int uniwill_led_init(struct uniwill_data
> > > *data)
> > >   =09unsigned int value;
> > >   =09int ret;
> > >   -=09if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
> > > +=09if (!uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR,
> > > +=09=09=09=09     UNIWILL_FEATURE_LIGHTBAR))
> > >   =09=09return 0;
> > >     =09ret =3D devm_mutex_init(data->dev, &data->led_lock);
> > > @@ -1232,7 +1258,8 @@ static int uniwill_battery_init(struct uniwill_=
data
> > > *data)
> > >   {
> > >   =09int ret;
> > >   -=09if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> > > +=09if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
> > > +=09=09=09=09     UNIWILL_FEATURE_BATTERY))
> > >   =09=09return 0;
> > >     =09ret =3D devm_mutex_init(data->dev, &data->battery_lock);
> > > @@ -1361,6 +1388,19 @@ static int uniwill_probe(struct platform_devic=
e
> > > *pdev)
> > >   =09if (ret < 0)
> > >   =09=09return ret;
> > >   +=09data->features =3D device_descriptor.features;
> > > +
> > > +=09/*
> > > +=09 * Some devices might need to perform some device-specific
> > > initialization steps
> > > +=09 * before the supported features are initialized. Because of this=
 we
> > > have to call
> > > +=09 * this callback just after the EC itself was initialized.
> > > +=09 */
> > > +=09if (device_descriptor.probe) {
> > > +=09=09ret =3D device_descriptor.probe(data);
> > > +=09=09if (ret < 0)
> > > +=09=09=09return ret;
> > > +=09}
> > > +
> > >   =09ret =3D uniwill_battery_init(data);
> > >   =09if (ret < 0)
> > >   =09=09return ret;
> > > @@ -1385,7 +1425,8 @@ static void uniwill_shutdown(struct platform_de=
vice
> > > *pdev)
> > >     static int uniwill_suspend_keyboard(struct uniwill_data *data)
> > >   {
> > > -=09if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> > > +=09if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGG=
LE,
> > > +=09=09=09=09     UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> > >   =09=09return 0;
> > >     =09/*
> > > @@ -1397,7 +1438,8 @@ static int uniwill_suspend_keyboard(struct
> > > uniwill_data *data)
> > >     static int uniwill_suspend_battery(struct uniwill_data *data)
> > >   {
> > > -=09if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> > > +=09if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
> > > +=09=09=09=09     UNIWILL_FEATURE_BATTERY))
> > >   =09=09return 0;
> > >     =09/*
> > > @@ -1432,7 +1474,8 @@ static int uniwill_resume_keyboard(struct
> > > uniwill_data *data)
> > >   =09unsigned int value;
> > >   =09int ret;
> > >   -=09if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> > > +=09if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGG=
LE,
> > > +=09=09=09=09     UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> > >   =09=09return 0;
> > >     =09ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS,
> > > &value);
> > > @@ -1448,7 +1491,8 @@ static int uniwill_resume_keyboard(struct
> > > uniwill_data *data)
> > >     static int uniwill_resume_battery(struct uniwill_data *data)
> > >   {
> > > -=09if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> > > +=09if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
> > > +=09=09=09=09     UNIWILL_FEATURE_BATTERY))
> > >   =09=09return 0;
> > >     =09return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL,
> > > CHARGE_CTRL_MASK,
> > > @@ -1496,6 +1540,25 @@ static struct platform_driver uniwill_driver =
=3D {
> > >   =09.shutdown =3D uniwill_shutdown,
> > >   };
> > >   +static struct uniwill_device_descriptor lapac71h_descriptor __init=
data
> > > =3D {
> > > +=09.features =3D UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> > > +=09=09    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> > > +=09=09    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> > > +=09=09    UNIWILL_FEATURE_BATTERY |
> > > +=09=09    UNIWILL_FEATURE_HWMON
> > > +};
> > > +
> > > +static struct uniwill_device_descriptor lapkc71f_descriptor __initda=
ta =3D
> > > {
> > > +=09.features =3D UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> > > +=09=09    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> > > +=09=09    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> > > +=09=09    UNIWILL_FEATURE_LIGHTBAR |
> > > +=09=09    UNIWILL_FEATURE_BATTERY |
> > > +=09=09    UNIWILL_FEATURE_HWMON
> > > +};
> > > +
> > > +static struct uniwill_device_descriptor empty_descriptor __initdata =
=3D {};
> > > +
> > >   static const struct dmi_system_id uniwill_dmi_table[] __initconst =
=3D {
> > >   =09{
> > >   =09=09.ident =3D "XMG FUSION 15",
> > > @@ -1503,6 +1566,7 @@ static const struct dmi_system_id
> > > uniwill_dmi_table[] __initconst =3D {
> > >   =09=09=09DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
> > >   =09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
> > >   =09=09},
> > > +=09=09.driver_data =3D &empty_descriptor,
> > Hi,
> >=20
> > Is there some advantage of having an "empty descriptor" over just NULL
> > checking its presence in the code?
>=20
> One less "if"

That pays no respect to devs who have read those dummy driver_data=20
lines. ;-)

> In the long run (with more features implemented and tested) there probabl=
y
> wont be any device using the empty descriptor, then it can be removed aga=
in.

Fair (so I'm fine with keeping empty_descriptor for now).

--=20
 i.

--8323328-359918297-1765898453=:1169--
