Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCAF48B36C
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Jul 2026 12:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909466; cv=pass; b=MVqz8EdX9b4bzBwCxmJsn0s98IqdGQ/TUutCK4uQ4gMciunqiKZqq8+S5L1XS5Z7VA2EHF9KVokxUAQw6tE1DUoTpnC5jB1uWz47RgA+yGGlbIzm5EdIgYRapNKG9DxmfE/BdwVd/aFLsTOpbqHybMwLo8GYNrVOurOSYjfNGro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909466; c=relaxed/simple;
	bh=vMWdSNMfAz8KdU9zjzaOPU9zGKQwGd63iq3RFl/GOzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgreUA/jwfGfkT3IwSmrlUZR0AcDoDAeMHoRNYHL3dAjVCQJO+35WQoVWP5uiPSeqjd9I7U01NZOpLvRYUXIkxADwuWjLU+pec3yA5wC5QIWdhSRooFZbaRQ4hOkdEEr8tBv7DoF+++mryqJ119m1vWxrDfVzKyjXP8lCFV49XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aqdwm27v; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aqdwm27v"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1297f37073so76200366b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jul 2026 05:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782909462; cv=none;
        d=google.com; s=arc-20260327;
        b=edE3eNqkccFVuKrHamdusdcT0tXl1n+cOYp7MNvOikqEQrHnDWYzjaASE9kWiqYrDP
         OV7G9QTfiLkkaN6rBF2ezalJuWCCJZiTh+ss0kDRuLN28Q44ZozZ9/Udh7P6QY0yeP6Q
         TCwSsEXvMcNr4xEj/ni2+wwZA0T85OJ/3cX4jd0M2fkYwCXKm0I/HX0IJhqbCCCbyiVX
         xn74cKSnDlvoKK7Jpp8xpN3ELgqesTzFZ/s6IsaZov6gSB+fzbGSyV/ZqhTQPbjtjlsX
         80f9ca9xqRmNlis0ykGuWG2jy8ZYiuCnUiVM2x7lvlEHTtPsuH5rjJelepOboZs1CZcc
         ljTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8oiXllMV6QlUmfTaIgLkcKpgeZLcalpMnowy+iCJnE4=;
        fh=qxrkK8+Ps0lx5zgYvJzJE1W4udUPNNWfOlLofPa+MR8=;
        b=ZjPrUTcyGlb4+A/i6fN/ZfVjLb01XuNgWVC9ylKbabGGi1mNTz/pBrfVZoijezWBBO
         GEVhEkSv39e53Su3AIAgzbWZBb5rNeX+xfIjMf5SigkV/Upc9vuyQK0foYmFENU3MzsQ
         jwaYS6HFEQBGTSxuEozznUKfZD90ki8E7/eI8v/ClQlZU7gt2aUCNO4LfkTudoqRD1Yu
         OEshWB0iE+s7yFJNUj2elIbWq73eIjgPCHNZqpHfDJZlJSVmeBNDg/lJ0pR22xP8Edfq
         oPZFfYJhs7IMrSCJuqjDUHdqaiL0SlfpEsLXNVyBSkBxgYdiXArPylgasCOZWNrqdAgM
         kdTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782909462; x=1783514262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oiXllMV6QlUmfTaIgLkcKpgeZLcalpMnowy+iCJnE4=;
        b=Aqdwm27vd0wfX6oSE5OD5LIeN1A4A3cUAf1SvNUPDAOHebw1ctEBg4hTSuCeSDa3WB
         01vMX1+7mI1POAMGVzghQFLlIm6OTcBgKO9Kiw5hyyut60fssCDAKHtXkMgh5A2I2mKH
         U/d4lVLq4LELdfIPW6rQQDdOXZOL5Y632qS3ntrTi60AUE16G+1SxvIJeWeW5Wow4bXs
         NBYiskweZX1tvixZHhtt6KJhS/PIUU17RNYCjfIpn9SJc7u4xHRr9IiS53wq7gPDXshw
         x3FJyPd+qTZCaYJaahrzZOKabB3aNwDP1YJcqh0Us6O2e9G/vhMyGJv7reqApACjZq8d
         eWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909462; x=1783514262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8oiXllMV6QlUmfTaIgLkcKpgeZLcalpMnowy+iCJnE4=;
        b=gzlPGqtPB3wa1EyvZtN/GlqBvbITNgrOW+qzCH6zRNQsQtG4+tCpCNb3rAXFx86dkg
         oK4D30FBZFa4wV8/1Cu40dykH++AExTSW/dfCZZLH1QixfhqtaOHR0SMedc++Ju4q4VT
         PkS+Cra5Hhq+FZrIML618Ls7DthfDomkEnkEn/Slf7BihLFdnIrmvRfBVxetsjDxLLDj
         21Zf6VnKhH3SuKlxITWxqqR8NBZyHbj9WUVmFi11BQBUqx2FUjfNbp/CpxFAw7+rkxCl
         jYOE9QgZHdJqMinoh6eC8Lg9yQOl/ff/J4hISbXDcgQUgI5z0ry1AsfzQQitfYZoFzGp
         YTlg==
X-Forwarded-Encrypted: i=1; AHgh+RrbVdDo0/A9HhL/lPmUwot6NfJ6ksThOlpvJbWwSSNk3RYxPVoa5l+hTaN9z8lmaQBLHI7buiK2AabmqMEDEkyWneBV@vger.kernel.org
X-Gm-Message-State: AOJu0YykXPQzA6qGO6OinoYz9PkfhiEozTiB4CSta1kRn3oa99/l2rMe
	pBsF3j31kAwvHwSYQW5uth8AXTWN49+/wXiYBTpMVBN81hi2iaSKFbG19Lq4kdxcTGH/V+WwCeA
	29pnfCF2D6gvOBvr64P6a/a+Qg5EAJWc=
X-Gm-Gg: AfdE7cnQrxdD4ABU+4LF5P4b1aQdegdqAzfsePyOn4h+ERc9acaikw78/60fHTeOQkG
	rnYA2xIYnEHqb9LUXUri1QtWLodi6AITbEsI3IFa5gSg7AHa7847Qsf9sIQvsq24KkQnBd9gctQ
	9v7N35niToF80Zf04pUBT1lW6IEkmqNTInza55u071fKAnkOIKNvq1qvz/vM2eR2nRwuYBZO7GD
	DO3OSjlkEz+EeEQqJvfK2i1v3gRpHTFfnVvjtxC1kkDeKPRymWePyTf1Jm/DwWzcXJPkadSaEhU
	R+icAQxGA9XDhjrwZYW8RK6OOd/sQLM=
X-Received: by 2002:a17:907:c244:b0:bf5:2395:8d5b with SMTP id
 a640c23a62f3a-c12aa336677mr67663366b.47.1782909462140; Wed, 01 Jul 2026
 05:37:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531182825.389490-1-hello@kursatabayli.dev>
 <10e67336-7de7-db89-66f7-8d56e4ff4562@linux.intel.com> <CAJ5VyXK_3wGmJtEwLLAtNFhKb0Ymf8TTSaO6cfozfN1GnComZw@mail.gmail.com>
 <537bf20d-15e1-b3bf-f02a-09b96405c398@linux.intel.com>
In-Reply-To: <537bf20d-15e1-b3bf-f02a-09b96405c398@linux.intel.com>
From: Radhey Kalra <radheykalra901@gmail.com>
Date: Wed, 1 Jul 2026 18:07:30 +0530
X-Gm-Features: AVVi8CcT47QUgfCac3ckIxdyBNijQ7mU3Xfe_tMOH7eTTOMz21PY1ll6dUGPg0U
Message-ID: <CAJ5VyXLdU8XJEw3On7b6fKYww=woJvf1wENwr0a0MEq-Z3OV1Q@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: hp-wmi: Add dual-channel PWM fan control
 for Victus S
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?B?S8O8csWfYXQgQWJheWzEsQ==?= <hello@kursatabayli.dev>, 
	krishna.chomal108@gmail.com, Hans de Goede <hansg@kernel.org>, emreleno@gmail.com, 
	edip@medip.dev, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, please!

On Wed, Jul 1, 2026 at 4:10=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 11 Jun 2026, Radhey Kalra wrote:
>
> > Hi Ilpo,
> >
> > I tested K=C3=BCr=C5=9Fat's v3 patch on my 8A3D machine:
> >
> >   board_name: 8A3D
> >   product_name: Victus by HP Gaming Laptop 15-fb0xxx
> >   kernel: 7.0.11-1-cachyos-bore-lto
> >
> > For the test I used current platform-drivers-x86/for-next plus the v3 f=
an
> > patch, with a temporary 8A3D DMI match added locally because 8A3D is no=
t in
> > for-next yet.
> >
> > The patched module exposed the expected interface:
> >
> >   fan1_input=3D3800
> >   fan2_input=3D3000
> >   pwm1_enable=3D2
> >   pwm1=3D158
> >   pwm2=3D123
> >
> > Manual mode also worked:
> >
> >   write pwm1_enable=3D1
> >   fan1_input=3D3300
> >   fan2_input=3D2500
> >   pwm1_enable=3D1
> >   pwm1=3D145
> >   pwm2=3D109
> >
> > Writing pwm1 and pwm2 separately affected the two fans independently:
> >
> >   write pwm1=3D140
> >   fan1_input=3D3000
> >   fan2_input=3D2500
> >   pwm1=3D131
> >   pwm2=3D109
> >
> >   write pwm2=3D160
> >   fan1_input=3D3000
> >   fan2_input=3D3500
> >   pwm1=3D131
> >   pwm2=3D153
> >
> > Brief max mode and return to auto also worked:
> >
> >   write pwm1_enable=3D0
> >   fan1_input=3D3900
> >   fan2_input=3D4500
> >   pwm1_enable=3D0
> >
> >   write pwm1_enable=3D2
> >   fan1_input=3D3300
> >   fan2_input=3D3700
> >   pwm1_enable=3D2
> >
> > I did not see a fan-control failure during the test.
>
> Thanks for testing. Do you want to give your Tested-by tag to be credited
> for you testing efforts?
>
> (Up to you, not mandatory, of course. The tag will become permanent publi=
c
> record in the commit.)
>
> --
>  i.
>
> > Thanks,
> > Radhey
> >
> > On Wed, Jun 10, 2026 at 3:00=E2=80=AFPM Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > >
> > > + Radhey
> > >
> > > On Sun, 31 May 2026, K=C3=BCr=C5=9Fat Abayl=C4=B1 wrote:
> > >
> > > > Currently, manual fan control on supported Victus S models uses a s=
ingle
> > > > PWM value for both CPU and GPU fans, linking their speeds via a har=
dcoded
> > > > gpu_delta offset. This prevents userspace tools from managing the t=
hermal
> > > > profiles of the CPU and GPU independently.
> > > >
> > > > Refactor the hwmon implementation to support independent dual-chann=
el
> > > > PWM control:
> > > > - Split the single 'pwm' state into 'cpu_pwm' and 'gpu_pwm'.
> > > > - Expose a second PWM channel ('pwm2') to userspace via hwmon_chann=
el_info.
> > > > - Remove the gpu_delta mechanism entirely.
> > > >
> > > > The 'pwm1_enable' mode remains shared, as the underlying hardware d=
oes
> > > > not support per-fan modes. When switching to manual mode, both fans=
 are
> > > > smoothly initialized to their current RPMs. Additionally, ensure th=
at
> > > > the HP_FAN_SPEED_AUTOMATIC flag is isolated from rpm_to_pwm mathema=
tical
> > > > interpolations during mode resets to prevent unintended fan states.
> > > >
> > > > Tested on: HP Victus 16-s0xxx
> > > >
> > > > Signed-off-by: K=C3=BCr=C5=9Fat Abayl=C4=B1 <hello@kursatabayli.dev=
>
> > >
> > > Has Radhey perhaps had an opportunity to test this patch?
> > >
> > > Radhey's series initially had the gpu delta init patch which was drop=
ped
> > > because this change was anticipated. It would be nice to confirm if t=
his
> > > patch successfully avoids the gpu delta init problem without introduc=
ing
> > > some other problems?
> > >
> > > --
> > >  i.
> > >
> > > > ---
> > > > Changes in v3:
> > > > - Addressed review feedback from Krishna Chomal:
> > > >   - Expanded ternary operators in hp_wmi_fan_speed_set to standard =
if-else blocks.
> > > >   - Replaced hardcoded channel numbers with CPU_FAN and GPU_FAN mac=
ros.
> > > >
> > > > Changes in v2:
> > > > - Made RPM readings atomic during the transition to manual mode.
> > > > - Fixed a variable scoping issue in the pwm_input block.
> > > > ---
> > > > ---
> > > >  drivers/platform/x86/hp/hp-wmi.c | 60 +++++++++++++++++-----------=
----
> > > >  1 file changed, 32 insertions(+), 28 deletions(-)
> > > >
> > > > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x8=
6/hp/hp-wmi.c
> > > > index f63bc00d9a9b..cef0c4436bd0 100644
> > > > --- a/drivers/platform/x86/hp/hp-wmi.c
> > > > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > > > @@ -488,9 +488,9 @@ struct hp_wmi_hwmon_priv {
> > > >       struct mutex lock;      /* protects mode, pwm */
> > > >       u8 min_rpm;
> > > >       u8 max_rpm;
> > > > -     int gpu_delta;
> > > >       u8 mode;
> > > > -     u8 pwm;
> > > > +     u8 cpu_pwm;
> > > > +     u8 gpu_pwm;
> > > >       struct delayed_work keep_alive_dwork;
> > > >  };
> > > >
> > > > @@ -817,24 +817,20 @@ static int hp_wmi_fan_speed_max_set(int enabl=
ed)
> > > >       return enabled;
> > > >  }
> > > >
> > > > -static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8=
 speed)
> > > > +static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv)
> > > >  {
> > > >       u8 fan_speed[2];
> > > > -     int gpu_speed, ret;
> > > > +     int ret;
> > > >
> > > > -     fan_speed[CPU_FAN] =3D speed;
> > > > -     fan_speed[GPU_FAN] =3D speed;
> > > > +     if (priv->cpu_pwm =3D=3D HP_FAN_SPEED_AUTOMATIC)
> > > > +             fan_speed[CPU_FAN] =3D HP_FAN_SPEED_AUTOMATIC;
> > > > +     else
> > > > +             fan_speed[CPU_FAN] =3D pwm_to_rpm(priv->cpu_pwm, priv=
);
> > > >
> > > > -     /*
> > > > -      * GPU fan speed is always a little higher than CPU fan speed=
, we fetch
> > > > -      * this delta value from the fan table during hwmon init.
> > > > -      * Exception: Speed is set to HP_FAN_SPEED_AUTOMATIC, to reve=
rt to
> > > > -      * automatic mode.
> > > > -      */
> > > > -     if (speed !=3D HP_FAN_SPEED_AUTOMATIC) {
> > > > -             gpu_speed =3D speed + priv->gpu_delta;
> > > > -             fan_speed[GPU_FAN] =3D clamp_val(gpu_speed, 0, U8_MAX=
);
> > > > -     }
> > > > +     if (priv->gpu_pwm =3D=3D HP_FAN_SPEED_AUTOMATIC)
> > > > +             fan_speed[GPU_FAN] =3D HP_FAN_SPEED_AUTOMATIC;
> > > > +     else
> > > > +             fan_speed[GPU_FAN] =3D pwm_to_rpm(priv->gpu_pwm, priv=
);
> > > >
> > > >       ret =3D hp_wmi_get_fan_count_userdefine_trigger();
> > > >       if (ret < 0)
> > > > @@ -851,7 +847,9 @@ static int hp_wmi_fan_speed_set(struct hp_wmi_h=
wmon_priv *priv, u8 speed)
> > > >
> > > >  static int hp_wmi_fan_speed_reset(struct hp_wmi_hwmon_priv *priv)
> > > >  {
> > > > -     return hp_wmi_fan_speed_set(priv, HP_FAN_SPEED_AUTOMATIC);
> > > > +     priv->cpu_pwm =3D HP_FAN_SPEED_AUTOMATIC;
> > > > +     priv->gpu_pwm =3D HP_FAN_SPEED_AUTOMATIC;
> > > > +     return hp_wmi_fan_speed_set(priv);
> > > >  }
> > > >
> > > >  static int hp_wmi_fan_speed_max_reset(struct hp_wmi_hwmon_priv *pr=
iv)
> > > > @@ -2402,7 +2400,7 @@ static int hp_wmi_apply_fan_settings(struct h=
p_wmi_hwmon_priv *priv)
> > > >       case PWM_MODE_MANUAL:
> > > >               if (!is_victus_s_thermal_profile())
> > > >                       return -EOPNOTSUPP;
> > > > -             ret =3D hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->p=
wm, priv));
> > > > +             ret =3D hp_wmi_fan_speed_set(priv);
> > > >               if (ret < 0)
> > > >                       return ret;
> > > >               mod_delayed_work(system_wq, &priv->keep_alive_dwork,
> > > > @@ -2502,13 +2500,14 @@ static int hp_wmi_hwmon_write(struct device=
 *dev, enum hwmon_sensor_types type,
> > > >                             u32 attr, int channel, long val)
> > > >  {
> > > >       struct hp_wmi_hwmon_priv *priv;
> > > > -     int rpm;
> > > > +     int cpu_rpm, gpu_rpm;
> > > >
> > > >       priv =3D dev_get_drvdata(dev);
> > > >       guard(mutex)(&priv->lock);
> > > >       switch (type) {
> > > >       case hwmon_pwm:
> > > >               if (attr =3D=3D hwmon_pwm_input) {
> > > > +                     int rpm;
> > > >                       if (!is_victus_s_thermal_profile())
> > > >                               return -EOPNOTSUPP;
> > > >                       /* PWM input is invalid when not in manual mo=
de */
> > > > @@ -2518,7 +2517,10 @@ static int hp_wmi_hwmon_write(struct device =
*dev, enum hwmon_sensor_types type,
> > > >                       /* ensure PWM input is within valid fan speed=
s */
> > > >                       rpm =3D pwm_to_rpm(val, priv);
> > > >                       rpm =3D clamp_val(rpm, priv->min_rpm, priv->m=
ax_rpm);
> > > > -                     priv->pwm =3D rpm_to_pwm(rpm, priv);
> > > > +                     if (channel =3D=3D CPU_FAN)
> > > > +                             priv->cpu_pwm =3D rpm_to_pwm(rpm, pri=
v);
> > > > +                     else if (channel =3D=3D GPU_FAN)
> > > > +                             priv->gpu_pwm =3D rpm_to_pwm(rpm, pri=
v);
> > > >                       return hp_wmi_apply_fan_settings(priv);
> > > >               }
> > > >               switch (val) {
> > > > @@ -2532,10 +2534,14 @@ static int hp_wmi_hwmon_write(struct device=
 *dev, enum hwmon_sensor_types type,
> > > >                        * When switching to manual mode, set fan spe=
ed to
> > > >                        * current RPM values to ensure a smooth tran=
sition.
> > > >                        */
> > > > -                     rpm =3D hp_wmi_get_fan_speed_victus_s(channel=
);
> > > > -                     if (rpm < 0)
> > > > -                             return rpm;
> > > > -                     priv->pwm =3D rpm_to_pwm(rpm / 100, priv);
> > > > +                     cpu_rpm =3D hp_wmi_get_fan_speed_victus_s(CPU=
_FAN);
> > > > +                     if (cpu_rpm < 0)
> > > > +                             return cpu_rpm;
> > > > +                     gpu_rpm =3D hp_wmi_get_fan_speed_victus_s(GPU=
_FAN);
> > > > +                     if (gpu_rpm < 0)
> > > > +                             return gpu_rpm;
> > > > +                     priv->cpu_pwm =3D rpm_to_pwm(cpu_rpm / 100, p=
riv);
> > > > +                     priv->gpu_pwm =3D rpm_to_pwm(gpu_rpm / 100, p=
riv);
> > > >                       priv->mode =3D PWM_MODE_MANUAL;
> > > >                       return hp_wmi_apply_fan_settings(priv);
> > > >               case PWM_MODE_AUTO:
> > > > @@ -2551,7 +2557,7 @@ static int hp_wmi_hwmon_write(struct device *=
dev, enum hwmon_sensor_types type,
> > > >
> > > >  static const struct hwmon_channel_info * const info[] =3D {
> > > >       HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
> > > > -     HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
> > > > +     HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT, H=
WMON_PWM_INPUT),
> > > >       NULL
> > > >  };
> > > >
> > > > @@ -2592,7 +2598,7 @@ static int hp_wmi_setup_fan_settings(struct h=
p_wmi_hwmon_priv *priv)
> > > >       struct victus_s_fan_table *fan_table;
> > > >       u8 min_rpm, max_rpm;
> > > >       u8 cpu_rpm, gpu_rpm, noise_db;
> > > > -     int gpu_delta, i, num_entries, ret;
> > > > +     int i, num_entries, ret;
> > > >       size_t header_size, entry_size;
> > > >
> > > >       /* Default behaviour on hwmon init is automatic mode */
> > > > @@ -2638,10 +2644,8 @@ static int hp_wmi_setup_fan_settings(struct =
hp_wmi_hwmon_priv *priv)
> > > >       if (min_rpm =3D=3D U8_MAX || max_rpm =3D=3D 0)
> > > >               return -EINVAL;
> > > >
> > > > -     gpu_delta =3D fan_table->entries[0].gpu_rpm - fan_table->entr=
ies[0].cpu_rpm;
> > > >       priv->min_rpm =3D min_rpm;
> > > >       priv->max_rpm =3D max_rpm;
> > > > -     priv->gpu_delta =3D gpu_delta;
> > > >
> > > >       return 0;
> > > >  }
> > > >
> >
