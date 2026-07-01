Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B3F40960C;
	Wed,  1 Jul 2026 10:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902405; cv=none; b=gQMK8gujLOr9UlpL4kDYm/sHvYde5O89EbgrDZSD60akrmJcp36YPwEKqNDPBTYVQ7tALhSogUmOdWcUjnbsJ1ldbiUTu8Sm0LRHs80ACdwoG6Vlbmq9zK4bTLq9wBfyXIc2A91jmSt3/hDc2azxlv6I8Zg1t8mTDWkiZKSKh0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902405; c=relaxed/simple;
	bh=s/UxuOQve5/xEnwNwVwO4lcDbZOPR7zcFmNAnW/7FO8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=n+EjPrf/sBfTyxGDK0paYCjgjBYvCnd0zyaRIu30ga/gsNigez8P1yKuKP6zPBJUG0e+2jI0C7Xzr4A7xy2ZNgGW+HRwy6BdhChQ5fIQ3SmwBY3dft2rtLCkoRzDQkWwdNcQulG2n+2RM8+yvyiVehKpbMcZjtW82d1zbJsS8y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQLFGJdO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQLFGJdO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782902403; x=1814438403;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=s/UxuOQve5/xEnwNwVwO4lcDbZOPR7zcFmNAnW/7FO8=;
  b=OQLFGJdOaombtLnXXamE8TKPytFvMlGEYT+iY6lfkHllju6b8HUddcB/
   /wKGOQEpz8hxWd5YnwWMTeV3MyuCw7pctGW37J4IQaqms2HlhttP0+U2I
   x+Nj9wLH0O0Xt6nGd2c9Qv1kucjL5K17RfEHUUBsH8Hs7MUA0d05iAOEx
   EcRe4G1YUXtKvc7amxspn5vqBc8Od0yQrQjMvJv+C3PVMMNru3heSMjTt
   tMjhLzqO4hK6ihl8fxL+JF1thNZT+i+54KGTlWHHbunxBZy1GNwShxa1S
   1XNkyr/nF+lbeJx+zN7myhtzUIO+GfYzUreWBPOPioOGeSSTidGvJ/69w
   w==;
X-CSE-ConnectionGUID: YsWJe9u5R+e+1MP2140n+Q==
X-CSE-MsgGUID: aOexv/SkQXCII0iV5CG+Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87466285"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="87466285"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 03:40:03 -0700
X-CSE-ConnectionGUID: LbWMRXa3QJy3Z4G3QLk4qQ==
X-CSE-MsgGUID: 5u5GsSRdSU2ufbMAjRYd/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="282606024"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 03:39:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 1 Jul 2026 13:39:54 +0300 (EEST)
To: Radhey Kalra <radheykalra901@gmail.com>
cc: =?UTF-8?Q?K=C3=BCr=C5=9Fat_Abayl=C4=B1?= <hello@kursatabayli.dev>, 
    krishna.chomal108@gmail.com, Hans de Goede <hansg@kernel.org>, 
    emreleno@gmail.com, edip@medip.dev, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: hp-wmi: Add dual-channel PWM fan control
 for Victus S
In-Reply-To: <CAJ5VyXK_3wGmJtEwLLAtNFhKb0Ymf8TTSaO6cfozfN1GnComZw@mail.gmail.com>
Message-ID: <537bf20d-15e1-b3bf-f02a-09b96405c398@linux.intel.com>
References: <20260531182825.389490-1-hello@kursatabayli.dev> <10e67336-7de7-db89-66f7-8d56e4ff4562@linux.intel.com> <CAJ5VyXK_3wGmJtEwLLAtNFhKb0Ymf8TTSaO6cfozfN1GnComZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1621844142-1782902394=:7215"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1621844142-1782902394=:7215
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 11 Jun 2026, Radhey Kalra wrote:

> Hi Ilpo,
>=20
> I tested K=C3=BCr=C5=9Fat's v3 patch on my 8A3D machine:
>=20
>   board_name: 8A3D
>   product_name: Victus by HP Gaming Laptop 15-fb0xxx
>   kernel: 7.0.11-1-cachyos-bore-lto
>=20
> For the test I used current platform-drivers-x86/for-next plus the v3 fan
> patch, with a temporary 8A3D DMI match added locally because 8A3D is not =
in
> for-next yet.
>=20
> The patched module exposed the expected interface:
>=20
>   fan1_input=3D3800
>   fan2_input=3D3000
>   pwm1_enable=3D2
>   pwm1=3D158
>   pwm2=3D123
>=20
> Manual mode also worked:
>=20
>   write pwm1_enable=3D1
>   fan1_input=3D3300
>   fan2_input=3D2500
>   pwm1_enable=3D1
>   pwm1=3D145
>   pwm2=3D109
>=20
> Writing pwm1 and pwm2 separately affected the two fans independently:
>=20
>   write pwm1=3D140
>   fan1_input=3D3000
>   fan2_input=3D2500
>   pwm1=3D131
>   pwm2=3D109
>=20
>   write pwm2=3D160
>   fan1_input=3D3000
>   fan2_input=3D3500
>   pwm1=3D131
>   pwm2=3D153
>=20
> Brief max mode and return to auto also worked:
>=20
>   write pwm1_enable=3D0
>   fan1_input=3D3900
>   fan2_input=3D4500
>   pwm1_enable=3D0
>=20
>   write pwm1_enable=3D2
>   fan1_input=3D3300
>   fan2_input=3D3700
>   pwm1_enable=3D2
>=20
> I did not see a fan-control failure during the test.

Thanks for testing. Do you want to give your Tested-by tag to be credited
for you testing efforts?

(Up to you, not mandatory, of course. The tag will become permanent public=
=20
record in the commit.)

--=20
 i.

> Thanks,
> Radhey
>=20
> On Wed, Jun 10, 2026 at 3:00=E2=80=AFPM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > + Radhey
> >
> > On Sun, 31 May 2026, K=C3=BCr=C5=9Fat Abayl=C4=B1 wrote:
> >
> > > Currently, manual fan control on supported Victus S models uses a sin=
gle
> > > PWM value for both CPU and GPU fans, linking their speeds via a hardc=
oded
> > > gpu_delta offset. This prevents userspace tools from managing the the=
rmal
> > > profiles of the CPU and GPU independently.
> > >
> > > Refactor the hwmon implementation to support independent dual-channel
> > > PWM control:
> > > - Split the single 'pwm' state into 'cpu_pwm' and 'gpu_pwm'.
> > > - Expose a second PWM channel ('pwm2') to userspace via hwmon_channel=
_info.
> > > - Remove the gpu_delta mechanism entirely.
> > >
> > > The 'pwm1_enable' mode remains shared, as the underlying hardware doe=
s
> > > not support per-fan modes. When switching to manual mode, both fans a=
re
> > > smoothly initialized to their current RPMs. Additionally, ensure that
> > > the HP_FAN_SPEED_AUTOMATIC flag is isolated from rpm_to_pwm mathemati=
cal
> > > interpolations during mode resets to prevent unintended fan states.
> > >
> > > Tested on: HP Victus 16-s0xxx
> > >
> > > Signed-off-by: K=C3=BCr=C5=9Fat Abayl=C4=B1 <hello@kursatabayli.dev>
> >
> > Has Radhey perhaps had an opportunity to test this patch?
> >
> > Radhey's series initially had the gpu delta init patch which was droppe=
d
> > because this change was anticipated. It would be nice to confirm if thi=
s
> > patch successfully avoids the gpu delta init problem without introducin=
g
> > some other problems?
> >
> > --
> >  i.
> >
> > > ---
> > > Changes in v3:
> > > - Addressed review feedback from Krishna Chomal:
> > >   - Expanded ternary operators in hp_wmi_fan_speed_set to standard if=
-else blocks.
> > >   - Replaced hardcoded channel numbers with CPU_FAN and GPU_FAN macro=
s.
> > >
> > > Changes in v2:
> > > - Made RPM readings atomic during the transition to manual mode.
> > > - Fixed a variable scoping issue in the pwm_input block.
> > > ---
> > > ---
> > >  drivers/platform/x86/hp/hp-wmi.c | 60 +++++++++++++++++-------------=
--
> > >  1 file changed, 32 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/=
hp/hp-wmi.c
> > > index f63bc00d9a9b..cef0c4436bd0 100644
> > > --- a/drivers/platform/x86/hp/hp-wmi.c
> > > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > > @@ -488,9 +488,9 @@ struct hp_wmi_hwmon_priv {
> > >       struct mutex lock;      /* protects mode, pwm */
> > >       u8 min_rpm;
> > >       u8 max_rpm;
> > > -     int gpu_delta;
> > >       u8 mode;
> > > -     u8 pwm;
> > > +     u8 cpu_pwm;
> > > +     u8 gpu_pwm;
> > >       struct delayed_work keep_alive_dwork;
> > >  };
> > >
> > > @@ -817,24 +817,20 @@ static int hp_wmi_fan_speed_max_set(int enabled=
)
> > >       return enabled;
> > >  }
> > >
> > > -static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8 s=
peed)
> > > +static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv)
> > >  {
> > >       u8 fan_speed[2];
> > > -     int gpu_speed, ret;
> > > +     int ret;
> > >
> > > -     fan_speed[CPU_FAN] =3D speed;
> > > -     fan_speed[GPU_FAN] =3D speed;
> > > +     if (priv->cpu_pwm =3D=3D HP_FAN_SPEED_AUTOMATIC)
> > > +             fan_speed[CPU_FAN] =3D HP_FAN_SPEED_AUTOMATIC;
> > > +     else
> > > +             fan_speed[CPU_FAN] =3D pwm_to_rpm(priv->cpu_pwm, priv);
> > >
> > > -     /*
> > > -      * GPU fan speed is always a little higher than CPU fan speed, =
we fetch
> > > -      * this delta value from the fan table during hwmon init.
> > > -      * Exception: Speed is set to HP_FAN_SPEED_AUTOMATIC, to revert=
 to
> > > -      * automatic mode.
> > > -      */
> > > -     if (speed !=3D HP_FAN_SPEED_AUTOMATIC) {
> > > -             gpu_speed =3D speed + priv->gpu_delta;
> > > -             fan_speed[GPU_FAN] =3D clamp_val(gpu_speed, 0, U8_MAX);
> > > -     }
> > > +     if (priv->gpu_pwm =3D=3D HP_FAN_SPEED_AUTOMATIC)
> > > +             fan_speed[GPU_FAN] =3D HP_FAN_SPEED_AUTOMATIC;
> > > +     else
> > > +             fan_speed[GPU_FAN] =3D pwm_to_rpm(priv->gpu_pwm, priv);
> > >
> > >       ret =3D hp_wmi_get_fan_count_userdefine_trigger();
> > >       if (ret < 0)
> > > @@ -851,7 +847,9 @@ static int hp_wmi_fan_speed_set(struct hp_wmi_hwm=
on_priv *priv, u8 speed)
> > >
> > >  static int hp_wmi_fan_speed_reset(struct hp_wmi_hwmon_priv *priv)
> > >  {
> > > -     return hp_wmi_fan_speed_set(priv, HP_FAN_SPEED_AUTOMATIC);
> > > +     priv->cpu_pwm =3D HP_FAN_SPEED_AUTOMATIC;
> > > +     priv->gpu_pwm =3D HP_FAN_SPEED_AUTOMATIC;
> > > +     return hp_wmi_fan_speed_set(priv);
> > >  }
> > >
> > >  static int hp_wmi_fan_speed_max_reset(struct hp_wmi_hwmon_priv *priv=
)
> > > @@ -2402,7 +2400,7 @@ static int hp_wmi_apply_fan_settings(struct hp_=
wmi_hwmon_priv *priv)
> > >       case PWM_MODE_MANUAL:
> > >               if (!is_victus_s_thermal_profile())
> > >                       return -EOPNOTSUPP;
> > > -             ret =3D hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm=
, priv));
> > > +             ret =3D hp_wmi_fan_speed_set(priv);
> > >               if (ret < 0)
> > >                       return ret;
> > >               mod_delayed_work(system_wq, &priv->keep_alive_dwork,
> > > @@ -2502,13 +2500,14 @@ static int hp_wmi_hwmon_write(struct device *=
dev, enum hwmon_sensor_types type,
> > >                             u32 attr, int channel, long val)
> > >  {
> > >       struct hp_wmi_hwmon_priv *priv;
> > > -     int rpm;
> > > +     int cpu_rpm, gpu_rpm;
> > >
> > >       priv =3D dev_get_drvdata(dev);
> > >       guard(mutex)(&priv->lock);
> > >       switch (type) {
> > >       case hwmon_pwm:
> > >               if (attr =3D=3D hwmon_pwm_input) {
> > > +                     int rpm;
> > >                       if (!is_victus_s_thermal_profile())
> > >                               return -EOPNOTSUPP;
> > >                       /* PWM input is invalid when not in manual mode=
 */
> > > @@ -2518,7 +2517,10 @@ static int hp_wmi_hwmon_write(struct device *d=
ev, enum hwmon_sensor_types type,
> > >                       /* ensure PWM input is within valid fan speeds =
*/
> > >                       rpm =3D pwm_to_rpm(val, priv);
> > >                       rpm =3D clamp_val(rpm, priv->min_rpm, priv->max=
_rpm);
> > > -                     priv->pwm =3D rpm_to_pwm(rpm, priv);
> > > +                     if (channel =3D=3D CPU_FAN)
> > > +                             priv->cpu_pwm =3D rpm_to_pwm(rpm, priv)=
;
> > > +                     else if (channel =3D=3D GPU_FAN)
> > > +                             priv->gpu_pwm =3D rpm_to_pwm(rpm, priv)=
;
> > >                       return hp_wmi_apply_fan_settings(priv);
> > >               }
> > >               switch (val) {
> > > @@ -2532,10 +2534,14 @@ static int hp_wmi_hwmon_write(struct device *=
dev, enum hwmon_sensor_types type,
> > >                        * When switching to manual mode, set fan speed=
 to
> > >                        * current RPM values to ensure a smooth transi=
tion.
> > >                        */
> > > -                     rpm =3D hp_wmi_get_fan_speed_victus_s(channel);
> > > -                     if (rpm < 0)
> > > -                             return rpm;
> > > -                     priv->pwm =3D rpm_to_pwm(rpm / 100, priv);
> > > +                     cpu_rpm =3D hp_wmi_get_fan_speed_victus_s(CPU_F=
AN);
> > > +                     if (cpu_rpm < 0)
> > > +                             return cpu_rpm;
> > > +                     gpu_rpm =3D hp_wmi_get_fan_speed_victus_s(GPU_F=
AN);
> > > +                     if (gpu_rpm < 0)
> > > +                             return gpu_rpm;
> > > +                     priv->cpu_pwm =3D rpm_to_pwm(cpu_rpm / 100, pri=
v);
> > > +                     priv->gpu_pwm =3D rpm_to_pwm(gpu_rpm / 100, pri=
v);
> > >                       priv->mode =3D PWM_MODE_MANUAL;
> > >                       return hp_wmi_apply_fan_settings(priv);
> > >               case PWM_MODE_AUTO:
> > > @@ -2551,7 +2557,7 @@ static int hp_wmi_hwmon_write(struct device *de=
v, enum hwmon_sensor_types type,
> > >
> > >  static const struct hwmon_channel_info * const info[] =3D {
> > >       HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
> > > -     HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
> > > +     HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT, HWM=
ON_PWM_INPUT),
> > >       NULL
> > >  };
> > >
> > > @@ -2592,7 +2598,7 @@ static int hp_wmi_setup_fan_settings(struct hp_=
wmi_hwmon_priv *priv)
> > >       struct victus_s_fan_table *fan_table;
> > >       u8 min_rpm, max_rpm;
> > >       u8 cpu_rpm, gpu_rpm, noise_db;
> > > -     int gpu_delta, i, num_entries, ret;
> > > +     int i, num_entries, ret;
> > >       size_t header_size, entry_size;
> > >
> > >       /* Default behaviour on hwmon init is automatic mode */
> > > @@ -2638,10 +2644,8 @@ static int hp_wmi_setup_fan_settings(struct hp=
_wmi_hwmon_priv *priv)
> > >       if (min_rpm =3D=3D U8_MAX || max_rpm =3D=3D 0)
> > >               return -EINVAL;
> > >
> > > -     gpu_delta =3D fan_table->entries[0].gpu_rpm - fan_table->entrie=
s[0].cpu_rpm;
> > >       priv->min_rpm =3D min_rpm;
> > >       priv->max_rpm =3D max_rpm;
> > > -     priv->gpu_delta =3D gpu_delta;
> > >
> > >       return 0;
> > >  }
> > >
>=20
--8323328-1621844142-1782902394=:7215--
