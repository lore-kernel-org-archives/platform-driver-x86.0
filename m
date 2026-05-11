Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597F7386557
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 21:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778533785; cv=pass; b=C8LJQH0Gu459oEE5bzp6fhI7ggb0tIS54ogTYpsRZYJf3Ki5SZcvL3Z6RHbZwGBAszCnX4jB1R+9h92bunDL6i7Io4S7fdK/CxASqDprZCM8NITPijUNug4hYu+4gRYdIjAe4R9+BtVD6gUrkBmhb50I421A/GZNjYXIM2/O6NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778533785; c=relaxed/simple;
	bh=BI3kNuCYI9OkgbBvsjRYry0wl0yIML0sxQzDmpMe3g8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWppr2X6hiAhqfxdgRyj4jqhboxfVyi8cuA9hAf7EpyRyeoRnGl+EjMVCvI4sXaXaE3GtUEfuJzGJjdRC72Cs9RbFcrX95ai3CO7FWJRuviklMEzLtCXKBEPDJWcvE7p1pP++LS/ZMkfaaDiNHOPmCO3e+RRkSZWy9BmL3XXP+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkzcIJqD; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkzcIJqD"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8acb3dab8dfso31912316d6.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 14:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778533782; cv=none;
        d=google.com; s=arc-20240605;
        b=ZbEtR83hw/Znnze8nxZZzVowf25RASUbrh2FZ/kiokllTMoD6Vlx6SOurvLaOe4DNI
         Bw2HfiQDpJEU3gfrWBMxRMUWZE0CDvkRdo9EjZZTKSOEVWfofX73UtopvJOV452K0mqi
         ASa/9YkaRVgXA0UM0VTUbflBx+L6PDtXMpiuGab3jpcRbka4N3AinkRFVjMmtj6KbEzm
         NLrGYa4yUvGvA2ypmUn/fU/wwo1NmJufJeP9gKegPXM8TYJPGsgkjOHKkNxPCm1hx+e3
         8bkxa6lAFaLuJaqzyeBTVJFmCPKxsvdu3QYlvY0AcY51ecePGOBnJW3qwlh5GwJqpyy1
         j+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rZMfteY1wY82sj8q0nfiUiS07+Ep7QxHDGLGhhwStXQ=;
        fh=dZ+7EfPh68eInlT1yTT6/Dr5+VMD9cZt1w2h+km5zSw=;
        b=A3IlSMMtri4HAHeWTM7Ie4DAaiHNOCyOiDUmMAOUYHcedwFVZ7lMM/8L4CUZa8GjZJ
         he8xiUan4xTn2dVhiW9bgBYes4l+Rwk7rXR/3G32JSQw5kwd/us6mr5O/h7imvNgU7QW
         veCliAamPopmKSSqdJgufctzsWK4mWGKJOaLyWF+OA9EBiq4Vh39ExyWT+KFJz8npWot
         rzdbb1T8Tb0VIyPKnYsFaEdSmgDwytpNfX8qF7MVd82DLSKo+ruFEF/E6jWlzPn9lr3v
         ABovVqoZvAhJHCeK2yozFb4A9Su1R7XZpCm1CBzHuXLG51FThHotpkBPEwtXxgLGT/SF
         WIHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778533782; x=1779138582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZMfteY1wY82sj8q0nfiUiS07+Ep7QxHDGLGhhwStXQ=;
        b=FkzcIJqDybIp5cgxi1XgDXI/50e2/Oz4Ea1iTamZtiki1e/zWz7fhPX0ucQBV4OfWa
         GBk6WJG75PMpx2utySQ0tYU28Q3n6yWCYoni5o1T+f9cNhwQPM0dJqhTnyZFbXt8RZQM
         t2JxA7q/nY5FK8lPXohLHk+C4ar4qzmQXul8YiwxHOWwpoZJ9pU4OuuaVk3nrGnrodgv
         ISfSH4y7D1wySFX5Uxr664drg8/tbow5l1FgHe82Ri4b4xg3uxK5DiTTXI+hI7Oolwjb
         YaiMHDh2Tl8ul94UG/L+f31mhVJHGXtnJCPkldiO8iF8fMXxyNktWcUyQHjKrBi7SYsN
         tG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778533782; x=1779138582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rZMfteY1wY82sj8q0nfiUiS07+Ep7QxHDGLGhhwStXQ=;
        b=IWCvmLdFV595Abyudp+rS+oX+IsfNmIzuH0VYlB7Nvw6tOo6GIQMPTGfXHx5LXKBaD
         A379FaB3H1J9BqsORU4O/JmVvfb4Mw55LJ9vz9POQpTjs9EbOaWQjDHYgjSn2GqurYf9
         1e+lFnZDG2i17mh9e6MvnlOzETrmv3Ix/ZXZZxjwy8toKA75zailUhqN18bLt00g3XkI
         FJk85vOobdJFJSmCKuUUAjZ9hbTpXKsr14tAL90jyER2ns/Vtoxgg5ZDuLD+PS0xaVlO
         2D8vS6AGGzaNWoBDh7NMz9FSrmWZamedEBVvw4WYV1TiCZq2LBr1Xtzg7tqKWC5LS7Hg
         DkZw==
X-Forwarded-Encrypted: i=1; AFNElJ9Z5t+3pL2FkoDO4I3CdYXtMn3gWdN+IWivPVnskyLaMRF1MUjkO2UQU88ap8g/5pNs7nDGkszcG8WAQkXL7p+B3K2g@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0q/jKnBynsWqaOmrC58AokHaHYZChpFPGo6Oo3OPc/OITyN7C
	11vq8qEgWm+uKEDFsG25kb05qwY8Qq4dQMeDixFwI0DCvloCtKF3X9A0OGMuOdii7JNRTV+1W57
	pkadMgysnXWfnWlrJCwz/dy5YwoZgM6E=
X-Gm-Gg: Acq92OGsxqehapjSkf0S8P4NTA/C1bqxNSsJWAxEcXr1oNzVYR5keVK7rhCcSILnuhv
	TMDj7jxqZjimVOJKSYgNjj9hoiFGe7kEpWtp+8xkNShL0G0Z+Rt/KHCol6Q081iZ1jEjd27DXi8
	mTvRQoPFZzDdP53TkE9XkI8ufa/KMiEvvd3L0gpoh8G8HTHAyr6xiCqsH/847TpIMhC4yOWZ7e4
	Vvz4FOE2Hk4i4DDGcI6pVgI7STJZimEN2NOy7dtJQFdccfjmBsRioJ4XixzXCH76M4IUYzLq/xp
	+aiZuvX6
X-Received: by 2002:ad4:5d63:0:b0:8ac:a87b:c81c with SMTP id
 6a1803df08f44-8bc46013e12mr394294536d6.44.1778533781736; Mon, 11 May 2026
 14:09:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
 <20260510042546.436874-14-derekjohn.clark@gmail.com> <a0c4f6d3f52efb9837f35af82b1a16021221bf84.camel@rong.moe>
In-Reply-To: <a0c4f6d3f52efb9837f35af82b1a16021221bf84.camel@rong.moe>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Mon, 11 May 2026 14:09:29 -0700
X-Gm-Features: AVHnY4Kd1pfj1whib4lK0qv7IJmGnf0SBFQ_1u4ojAlZS27cpOioC75NmQ5JKzc
Message-ID: <CAFqHKT=C9Hc=qsRMG7TOB+E9nj=5rb_5MPrKMOgcc2mjRxg+qQ@mail.gmail.com>
Subject: Re: [PATCH v12 13/16] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting
To: Rong Zhang <i@rong.moe>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	marshall@shzj.cc, hyacinth@shzj.cc, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 8:42=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
>
> Hi Derek,
>
> I am a little busy these days, sorry for not reviewing your series in
> time.
>
> On Sun, 2026-05-10 at 04:25 +0000, Derek J. Clark wrote:
> > Add charge_behaviour and charge_control_end_threshold attributes throug=
h
> > a power supply extension for devices that support WMI based charge enab=
le
> > & disable.
> >
> > Lenovo Legion devices that implement WMI function and capdata ID
> > 0x03010001 in their BIOS are able to enable or disable charging at 80%
> > through the lenovo-wmi-other interface. Add a charge_control_end_thresh=
old
> > attribute for BATX devices to expose this capability. The GET method fo=
r
> > this attribute is bugged. After analyzing the DSDT and some testing it
> > appears the method grabs bit(3) instead of bit(4) from the EC register
> > that stores the current status, and will only report if charging has
> > been inhibited or not. To work around this, store and report the last
> > setting written to the attribute.
>
> You said "the GET method for charge_control_end_threshold is bugged"
> here, but your code applied the workaround to charge_behaviour. Which is
> the bugged one?
>
Hi Rong,

You're right, the commit message should read differently. The WMI
method tied to harge_behaviour always returns 0, which is why we need
to track it. I just put the bug explanation on the wrong section.


> >
> > Additionally, devices that support WMI function and capdata ID 0x030200=
00
> > are able to force discharge of the battery. Expose this capability with
> > a charge_behaviour attribute in the power supply extension, with the
> > AUTO and FORCE_DISCHARGE behaviors enabled.
> >
> > As some devices only expose one attribute or the other, a bitmask is
> > added with a lookup table and some helper macros to select the correct
> > configuration for the hardware at runtime.
> >
> > The ideapad_laptop driver provides the charge_type attribute to provide
> > similar functionality. When the WMI method is set this can corrupt the
> > ACPI method return and cause hardware and driver errors. To avoid
> > conflicts between the drivers, we get the acpi_handle and do the same
> > check that ideapad_laptop does when it enables the feature. If the
> > feature is supported in ideapad_laptop, abort adding the extension from
> > lenovo-wmi-other. The ACPI method is more reliable when both are
> > present, from my testing, so we can prefer that implementation and do
> > not need to worry about de-conflicting from inside that driver. A new
> > module parameter, force_load_psy_ext, is provided to bypass this ACPI
> > check, as well as feature supported checks, if desired.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v12:
> >   - Move force_load_psy_ext into its own patch after this.
> >   - Use correct type casting for args in new funtions.
> >   - Remove extra parenthesis.
> > v11:
> >   - Refactor to use charge_behaviour and charge_control_end_threshold,
> >     per the class documentation. The ideapad_laptop driver will be fixe=
d
> >     in a separate patch series.
> >   - Due to the extensive refactoring, I have removed the reviewed-by
> >     tags from Rong and Mark to allow them to recertify the code in its
> >     current state.
> > v7:
> >   - Use devm_battery_hook_register, manually unregister during unbind.
> > v6:
> >   - Check feature flags to determine if the extension should be loaded
> >     and if it is writable.
> >   - Zero initialize wmi_method_args_32.
> >   - Fix formatting.
> > v5:
> >   - Use switch statement instead of if for battery charge state set/get=
.
> >   - use force_load_psy_ext to skip all ACPI interactions.
> >   - Various formatting fixes.
> > v4:
> >   - Remove unused defines.
> >   - Disambiguate charging defines by renaming them to be more consisten=
t
> >     with the kernel modes they represent.
> >   - Add module parameter to ignore ACPI checks.
> >   - Don't fail if the ACPI handle isn't found, skip the ACPI check
> >     instead.
> > ---
> >  drivers/platform/x86/lenovo/Kconfig       |   1 +
> >  drivers/platform/x86/lenovo/wmi-capdata.h |   1 +
> >  drivers/platform/x86/lenovo/wmi-other.c   | 388 ++++++++++++++++++++++
> >  3 files changed, 390 insertions(+)
> >
> > diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86=
/lenovo/Kconfig
> > index 09b1b055d2e0..b9a5d18caa1e 100644
> > --- a/drivers/platform/x86/lenovo/Kconfig
> > +++ b/drivers/platform/x86/lenovo/Kconfig
> > @@ -262,6 +262,7 @@ config LENOVO_WMI_GAMEZONE
> >  config LENOVO_WMI_TUNING
> >       tristate "Lenovo Other Mode WMI Driver"
> >       depends on ACPI_WMI
> > +     depends on ACPI_BATTERY
> >       select HWMON
> >       select FW_ATTR_CLASS
> >       select LENOVO_WMI_CAPDATA
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.h
> > index a7cfdeaa58f7..a49229cec245 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> > @@ -21,6 +21,7 @@
> >  enum lwmi_device_id {
> >       LWMI_DEVICE_ID_CPU =3D 0x01,
> >       LWMI_DEVICE_ID_GPU =3D 0x02,
> > +     LWMI_DEVICE_ID_PSU =3D 0x03,
> >       LWMI_DEVICE_ID_FAN =3D 0x04,
> >  };
> >
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform=
/x86/lenovo/wmi-other.c
> > index 1cd2bb5244d2..4d95a9109f5e 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -41,9 +41,12 @@
> >  #include <linux/limits.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_profile.h>
> > +#include <linux/power_supply.h>
> >  #include <linux/types.h>
> >  #include <linux/wmi.h>
> >
> > +#include <acpi/battery.h>
> > +
> >  #include "wmi-capdata.h"
> >  #include "wmi-events.h"
> >  #include "wmi-helpers.h"
> > @@ -75,9 +78,15 @@ enum lwmi_feature_id_gpu {
> >       LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =3D      0x0b,
> >  };
> >
> > +enum lwmi_feature_id_psu {
> > +     LWMI_FEATURE_ID_PSU_CHARGE_END_THRESHOLD =3D      0x01,
> > +     LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOR =3D           0x02,
> > +};
> > +
> >  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> >
> >  #define LWMI_TYPE_ID_CROSSLOAD       0x01
> > +#define LWMI_TYPE_ID_PSU_AC  0x01
> >
> >  #define LWMI_FEATURE_VALUE_GET 17
> >  #define LWMI_FEATURE_VALUE_SET 18
> > @@ -88,10 +97,19 @@ enum lwmi_feature_id_gpu {
> >
> >  #define LWMI_FAN_DIV 100
> >
> > +#define LWMI_CHARGE_BEHAVIOR_DISCHARGE       0x00
> > +#define LWMI_CHARGE_BEHAVIOR_AUTO    0x01
> > +#define LWMI_CHARGE_END_100          0x00
> > +#define LWMI_CHARGE_END_80           0x01
> > +
> >  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
> >       lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
> >                    LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> >
> > +#define LWMI_ATTR_ID_PSU(feat, type)                 \
> > +     lwmi_attr_id(LWMI_DEVICE_ID_PSU, feat,          \
> > +                  LWMI_GZ_THERMAL_MODE_NONE, type)
> > +
> >  #define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
> >  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
> >
> > @@ -131,6 +149,11 @@ struct lwmi_om_priv {
> >               bool capdata00_collected : 1;
> >               bool capdata_fan_collected : 1;
> >       } fan_flags;
> > +
> > +     enum power_supply_charge_behaviour charge_behaviour;
> > +     const struct power_supply_ext *battery_ext;
> > +     struct acpi_battery_hook battery_hook;
> > +     bool bh_registered;
> >  };
> >
> >  /*
> > @@ -555,6 +578,368 @@ static void lwmi_om_fan_info_collect_cd_fan(struc=
t device *dev, struct cd_list *
> >       lwmi_om_hwmon_add(priv);
> >  }
> >
> > +/* =3D=3D=3D=3D=3D=3D=3D=3D Power Supply Extension (component: lenovo-=
wmi-capdata 00) =3D=3D=3D=3D=3D=3D=3D=3D */
> > +
> > +/**
> > + * lwmi_psy_ext_get_prop() - Get a power_supply_ext property
> > + * @ps: The battery that was extended
> > + * @ext: The extension
> > + * @ext_data: Pointer to the lwmi_om_priv drvdata
> > + * @prop: The property to read
> > + * @val: The value to return
> > + *
> > + * Writes the given value to the power_supply_ext property
> > + *
> > + * Return: 0 on success, or an error
> > + */
> > +static int lwmi_psy_ext_get_prop(struct power_supply *ps,
> > +                              const struct power_supply_ext *ext,
> > +                              void *ext_data,
> > +                              enum power_supply_property prop,
> > +                              union power_supply_propval *val)
> > +{
> > +     struct lwmi_om_priv *priv =3D ext_data;
> > +     struct wmi_method_args_32 args =3D {};
> > +     u32 retval;
> > +     int ret;
> > +
> > +     switch (prop) {
> > +     case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> > +             /* Reading from BIOS reads the wrong bit. Use cached valu=
e */
> > +             val->intval =3D priv->charge_behaviour;
> > +             return 0;
> > +     case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> > +             args.arg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE=
_END_THRESHOLD,
> > +                                          LWMI_TYPE_ID_PSU_AC);
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE=
_GET,
> > +                                 (u8 *)&args, sizeof(args),
> > +                                 &retval);
> > +     if (ret)
> > +             return ret;
> > +
> > +     dev_dbg(&priv->wdev->dev, "Got return value %#x for property %#x\=
n", retval, prop);
> > +
> > +     switch (retval) {
> > +     case LWMI_CHARGE_END_80:
> > +             val->intval =3D 80;
> > +             break;
> > +     case LWMI_CHARGE_END_100:
> > +             val->intval =3D 100;
> > +             break;
> > +     default:
> > +             dev_err(&priv->wdev->dev, "Got invalid charge limit value=
: %#x\n", retval);
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * lwmi_psy_ext_set_prop() - Set a power_supply_ext property
> > + * @ps: The battery that was extended
> > + * @ext: The extension
> > + * @ext_data: Pointer to the lwmi_om_priv drvdata
> > + * @prop: The property to write
> > + * @val: The value to write
> > + *
> > + * Writes the given value to the power_supply_ext property
> > + *
> > + * Return: 0 on success, or an error
> > + */
> > +static int lwmi_psy_ext_set_prop(struct power_supply *ps,
> > +                              const struct power_supply_ext *ext,
> > +                              void *ext_data,
> > +                              enum power_supply_property prop,
> > +                              const union power_supply_propval *val)
> > +{
> > +     struct lwmi_om_priv *priv =3D ext_data;
> > +     struct wmi_method_args_32 args =3D {};
> > +
> > +     switch (prop) {
> > +     case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> > +             args.arg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE=
_BEHAVIOR,
> > +                                          LWMI_TYPE_ID_NONE);
> > +             switch (val->intval) {
> > +             case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
> > +                     args.arg1 =3D LWMI_CHARGE_BEHAVIOR_AUTO;
> > +                     break;
> > +             case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
> > +                     args.arg1 =3D LWMI_CHARGE_BEHAVIOR_DISCHARGE;
> > +                     break;
> > +             default:
> > +                     dev_err(&priv->wdev->dev, "Got invalid charge beh=
avior value: %#x\n",
> > +                             val->intval);
> > +                     return -EINVAL;
> > +             }
> > +             priv->charge_behaviour =3D val->intval;
>
> The cache shouldn't be updated if lwmi_dev_evaluate_int() returns an
> error, right?
>
> > +             break;
> > +     case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> > +             args.arg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE=
_END_THRESHOLD,
> > +                                          LWMI_TYPE_ID_PSU_AC);
> > +             switch (val->intval) {
> > +             case 0 ... 80:
> > +                     args.arg1 =3D LWMI_CHARGE_END_80;
> > +                     break;
> > +             case 81 ... 100:
> > +                     args.arg1 =3D LWMI_CHARGE_END_100;
> > +                     break;
> > +             default:
> > +                     dev_err(&priv->wdev->dev, "Got invalid charge lim=
it value: %#x\n",
> > +                             val->intval);
> > +                     return -EINVAL;
> > +             }
> > +             break;
> > +     default:
> > +             return false;
> > +     }
> > +
> > +     dev_dbg(&priv->wdev->dev, "Attempting to set %#010x for property =
%#x to %#x\n",
> > +             args.arg0, prop, args.arg1);
> > +
> > +     return lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_=
SET,
> > +                                  (u8 *)&args, sizeof(args), NULL);
> > +}
> > +
> > +/**
> > + * lwmi_psy_prop_is_suppported() - Determine if the property is suppor=
ted
> > + * @priv: Pointer to the lwmi_om_priv drvdata
> > + * @prop: The power supply property to be evaluated
> > + *
> > + * Checks capdata 00 to determine if the property is supported.
> > + *
> > + * Return: true if readable, or false
> > + */
> > +static bool lwmi_psy_prop_is_supported(struct lwmi_om_priv *priv, enum=
 power_supply_property prop)
> > +{
> > +     struct capdata00 capdata;
> > +     u32 attribute_id;
> > +     int ret;
> > +
> > +     switch (prop) {
> > +     case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> > +             attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHA=
RGE_BEHAVIOR,
> > +                                             LWMI_TYPE_ID_NONE);
> > +             break;
> > +     case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> > +             attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHA=
RGE_END_THRESHOLD,
> > +                                             LWMI_TYPE_ID_PSU_AC);
> > +             break;
> > +     default:
> > +             return false;
> > +     }
> > +
> > +     ret =3D lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdat=
a);
> > +     if (ret)
> > +             return false;
> > +
> > +     dev_dbg(&priv->wdev->dev, "Battery charge feature (%#010x) suppor=
t level: %#x\n",
> > +             attribute_id, capdata.supported);
> > +
> > +     return (capdata.supported & LWMI_SUPP_VALID) && (capdata.supporte=
d & LWMI_SUPP_GET);
> > +}
> > +
> > +/**
> > + * lwmi_psy_prop_is_writeable() - Determine if the property is writeab=
le
> > + * @ps: The battery that was extended
> > + * @ext: The extension
> > + * @ext_data: Pointer the lwmi_om_priv drvdata
> > + * @prop: The property to check
> > + *
> > + * Checks capdata 00 to determine if the property is writable.
> > + *
> > + * Return: true if writable, or false
> > + */
> > +static int lwmi_psy_prop_is_writeable(struct power_supply *ps,
> > +                                   const struct power_supply_ext *ext,
> > +                                   void *ext_data,
> > +                                   enum power_supply_property prop)
> > +{
> > +     struct lwmi_om_priv *priv =3D ext_data;
> > +     struct capdata00 capdata;
> > +     u32 attribute_id;
> > +     int ret;
> > +
> > +     switch (prop) {
> > +     case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> > +             attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHA=
RGE_BEHAVIOR,
> > +                                             LWMI_TYPE_ID_NONE);
> > +             break;
> > +     case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> > +             attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHA=
RGE_END_THRESHOLD,
> > +                                             LWMI_TYPE_ID_PSU_AC);
> > +             break;
> > +     default:
> > +             return false;
> > +     }
> > +
> > +     ret =3D lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdat=
a);
> > +     if (ret)
> > +             return false;
>
> This shares a lot of lines of code with lwmi_psy_prop_is_supported().
> I'd factor the common code into a helper function.
>
> I don't have a strong preference though. It's fine to keep it as is.

This is simple enough. Since I'm changin the file anyway I'll add it.

> > +
> > +     return !!(capdata.supported & LWMI_SUPP_SET);
> > +}
> > +
> > +static const enum power_supply_property lwmi_psy_ext_props_all[] =3D {
> > +     POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
> > +     POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> > +};
> > +
> > +static const enum power_supply_property lwmi_psy_ext_props_threshold[]=
 =3D {
> > +     POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> > +};
> > +
> > +static const enum power_supply_property lwmi_psy_ext_props_behaviour[]=
 =3D {
> > +     POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
> > +};
> > +
> > +#define DEFINE_LWMI_POWER_SUPPLY_EXTENSION(_name, _props, _behaviours)=
       \
> > +     static const struct power_supply_ext _name =3D {                 =
 \
> > +             .name                   =3D LWMI_OM_SYSFS_NAME,          =
 \
> > +             .properties             =3D _props,                      =
 \
> > +             .num_properties         =3D ARRAY_SIZE(_props),          =
 \
> > +             .charge_behaviours      =3D _behaviours,                 =
 \
> > +             .get_property           =3D lwmi_psy_ext_get_prop,       =
 \
> > +             .set_property           =3D lwmi_psy_ext_set_prop,       =
 \
> > +             .property_is_writeable  =3D lwmi_psy_prop_is_writeable,  =
 \
> > +     }
> > +
> > +#define LWMI_CHARGE_BEHAVIOURS (BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO=
) | \
> > +                             BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT=
_CHARGE))
>
> lwmi_psy_ext_get_prop() and lwmi_psy_ext_set_prop() use
> POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE. Mismatch.
>

> > +
> > +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_all, lwmi_psy_ext_prop=
s_all,
> > +                                LWMI_CHARGE_BEHAVIOURS);
> > +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_threshold,
> > +                                lwmi_psy_ext_props_threshold, 0);
> > +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_behaviour,
> > +                                lwmi_psy_ext_props_behaviour,
> > +                                LWMI_CHARGE_BEHAVIOURS);
> > +
> > +#define LWMI_PSY_PROP_BEHAVIOUR BIT(0)
> > +#define LWMI_PSY_PROP_THRESHOLD BIT(1)
> > +
> > +static const struct power_supply_ext *lwmi_psy_exts[] =3D {
> > +     [LWMI_PSY_PROP_BEHAVIOUR] =3D                             &lwmi_p=
sy_ext_behaviour,
> > +     [LWMI_PSY_PROP_THRESHOLD] =3D                             &lwmi_p=
sy_ext_threshold,
> > +     [LWMI_PSY_PROP_BEHAVIOUR | LWMI_PSY_PROP_THRESHOLD] =3D   &lwmi_p=
sy_ext_all,
> > +};
> > +
> > +/**
> > + * lwmi_add_battery() - Connect the power_supply_ext
> > + * @battery: The battery to extend
> > + * @hook: The driver hook used to extend the battery
> > + *
> > + * Return: 0 on success, or an error.
> > + */
> > +static int lwmi_add_battery(struct power_supply *battery, struct acpi_=
battery_hook *hook)
> > +{
> > +     struct lwmi_om_priv *priv =3D container_of(hook, struct lwmi_om_p=
riv, battery_hook);
> > +
> > +     return power_supply_register_extension(battery, priv->battery_ext=
, &priv->wdev->dev, priv);
> > +}
> > +
> > +/**
> > + * lwmi_remove_battery() - Disconnect the power_supply_ext
> > + * @battery: The battery that was extended
> > + * @hook: The driver hook used to extend the battery
> > + *
> > + * Return: 0 on success, or an error.
> > + */
> > +static int lwmi_remove_battery(struct power_supply *battery, struct ac=
pi_battery_hook *hook)
> > +{
> > +     struct lwmi_om_priv *priv =3D container_of(hook, struct lwmi_om_p=
riv, battery_hook);
> > +
> > +     power_supply_unregister_extension(battery, priv->battery_ext);
> > +     return 0;
> > +}
> > +
> > +/**
> > + * lwmi_acpi_match() - Attempts to return the ideapad acpi handle
> > + * @handle: The ACPI handle that manages battery charging
> > + * @lvl: Unused
> > + * @context: Void pointer to the acpi_handle object to return
> > + * @retval: Unused
> > + *
> > + * Checks if the ideapad_laptop driver is going to manage charge_type =
first,
> > + * then if not, hooks the battery to our WMI methods.
> > + *
> > + * Return: AE_CTRL_TERMINATE if found, AE_OK if not found.
> > + */
> > +static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
> > +                                void *context, void **retval)
> > +{
> > +     acpi_handle *ahand =3D context;
> > +
> > +     if (!handle)
> > +             return AE_OK;
> > +
> > +     *ahand =3D handle;
> > +
> > +     return AE_CTRL_TERMINATE;
> > +}
> > +
> > +/**
> > + * lwmi_om_psy_ext_init() - Hooks power supply extension to device bat=
tery
> > + * @priv: Pointer to the lwmi_om_priv drvdata.
> > + *
> > + * Checks if the ideapad_laptop driver is going to manage charge attri=
butes first,
> > + * then if not, hooks the battery to our WMI methods if they are suppo=
rted.
> > + */
> > +static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
> > +{
> > +     static const char * const ideapad_hid =3D "VPC2004";
> > +     acpi_handle handle =3D NULL;
> > +     unsigned int props =3D 0;
> > +     int ret;
> > +
> > +     priv->bh_registered =3D false;
>
> Why do we need this? priv was devm_kzalloc()ed.
>

We need to unregister the battery hook manually so the power_supply
list is updated. I can't check against battery_hook or battery_ext as
they will be valid always, and AFAIK we only want to run the
unregister if it was registered.

Thanks,
Derek

> > +
> > +     /* Deconflict ideapad_laptop driver */
> > +     ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, N=
ULL);
> > +     if (ret)
> > +             return;
> > +
> > +     if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(=
handle, "SBMC")) {
> > +             dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages =
battery for device\n");
> > +             return;
> > +     }
> > +
> > +     if (lwmi_psy_prop_is_supported(priv, POWER_SUPPLY_PROP_CHARGE_BEH=
AVIOUR))
> > +             props |=3D LWMI_PSY_PROP_BEHAVIOUR;
> > +     if (lwmi_psy_prop_is_supported(priv, POWER_SUPPLY_PROP_CHARGE_CON=
TROL_END_THRESHOLD))
> > +             props |=3D LWMI_PSY_PROP_THRESHOLD;
> > +     if (!props)
> > +             return;
> > +
> > +     /* Add battery hooks */
> > +     priv->battery_ext =3D lwmi_psy_exts[props];
> > +     priv->battery_hook.add_battery =3D lwmi_add_battery;
> > +     priv->battery_hook.remove_battery =3D lwmi_remove_battery;
> > +     priv->battery_hook.name =3D "Lenovo WMI Other Battery Extension";
> > +     priv->bh_registered =3D true;
>
> I guess the default charge behavior is auto. If that's the case, let's
> initialize priv->charge_behaviour to reflect this, so that it won't
> confuse users in most cases.
>
> Thanks,
> Rong
>
> > +
> > +     battery_hook_register(&priv->battery_hook);
> > +}
> > +
> > +/**
> > + * lwmi_om_psy_remove() - Unregister battery hook
> > + * @priv: Driver private data
> > + *
> > + * Unregisters the battery hook if applicable.
> > + */
> > +static void lwmi_om_psy_remove(struct lwmi_om_priv *priv)
> > +{
> > +     if (!priv->bh_registered)
> > +             return;
> > +
> > +     battery_hook_unregister(&priv->battery_hook);
> > +     priv->bh_registered =3D false;
> > +}
> > +
> >  /* =3D=3D=3D=3D=3D=3D=3D=3D fw_attributes (component: lenovo-wmi-capda=
ta 01) =3D=3D=3D=3D=3D=3D=3D=3D */
> >
> >  struct tunable_attr_01 {
> > @@ -1241,6 +1626,7 @@ static int lwmi_om_master_bind(struct device *dev=
)
> >       }
> >
> >       lwmi_om_fan_info_collect_cd00(priv);
> > +     lwmi_om_psy_ext_init(priv);
> >
> >       lwmi_om_fw_attr_add(priv);
> >
> > @@ -1263,6 +1649,8 @@ static void lwmi_om_master_unbind(struct device *=
dev)
> >
> >       lwmi_om_hwmon_remove(priv);
> >
> > +     lwmi_om_psy_remove(priv);
> > +
> >       component_unbind_all(dev, NULL);
> >  }
> >
