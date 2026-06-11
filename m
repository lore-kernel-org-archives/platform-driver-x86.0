Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62182C3268
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781191205; cv=pass; b=TNeCuVGbYsbdfG65h58YuVpj2nWTZkOgXmhQN4+LzCHjPwrcji5ZSH/ysuILKiRipiwLWNoao+nOIJ0ZuFfIniAyI/OpjbUlFbjdIGlqEQbgv5sxdjG9AH0Xis/Ig2/itNdi6pHf61fOgffSlTX7kF4q3/4KCfJsoAeUsXIewrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781191205; c=relaxed/simple;
	bh=Pbz6Y1loUDDLLK6nczYdo+vBmtU9j1JymiVWGHlML4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2qESWqfNIigpTXnX2v7iZYYSelzjnXnkkhgF62/cr8ie76Nzl1eOLgZVEjhqloALQbswRzHV14cf36xWFVkwkdfqlr0N+hrQQ6rngVBtImKg0w9fFM9KROEbYdzYDRMb7dkvWE9ACO4vgl+j9hewrZ555jHgwrSlWb8amzuvxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYrJcz4G; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYrJcz4G"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bf1cdcfd6deso991295266b.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 08:20:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781191202; cv=none;
        d=google.com; s=arc-20240605;
        b=lO4zuVqtLk2p50aT1ZvI+17s+wOtdgfYlL4X5OH9Rp6zatywYJ7uilhB6iEv0TOQZ4
         g5PO1s5dtowf2Cdhlr8EaRIvFMoMYegDjAU32aeoptXSVKsHmH80RnvGFB7e1xGMeJ+6
         AOUrBtbChRRJAS4t/k2VKbTPihPnLgQtl0tJfG/Dqu6ZYBUc5afLs/Vv0iKsS8OXRqtr
         rILsf8xPdPsHHXDJm5YsEgC3xYG6Eh+RIssATCoshVlVeOXGkHEeSHIadLUiZChXguqN
         oMtB4Cy5/j/z/sDuM81f3CDXeRsiNwz5gxyeA4QUNntDMbldRD1o83P8yeqO9OMKixUO
         drtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LG5nGCjOit+Ej2lCP0pXC1lW5udjNvwAKpiRVZtUWO4=;
        fh=Sbx3NpCrSomOfYMrDqR36dsOECOKafAjRqY0eAfs1kc=;
        b=c+aDQ43WW+8LO8hUmKQFkXlRKwHUJ+mL6nqcVXrsp9L2y2UV1fwjT/LhJH4NylQH6y
         Np9jSYGVyGhywuRCFZF+Q+TEA4jkkcTLhyzPBjcnagALIoe3o5cPWBEdMc0Jht3L1BJm
         5pKTSso/05uo/7n0bA8BXKSM1RmFcEYCh8RlAqzsKptB21yB6Ad//GPmvh3Bew4DkWcU
         gRA+KcIhTCeP/4n1KYV6+P+aRZn7UOwt9gqIFvWWHiletPDnb9dvnx3rK/EwSGLXEhvL
         /ItR0itD6h9QDEwDQbiUpkFd5/zUYfuTNxN42+tbohLrmxe1HqBkEELEQ7kHkU/URtT1
         JfOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781191202; x=1781796002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LG5nGCjOit+Ej2lCP0pXC1lW5udjNvwAKpiRVZtUWO4=;
        b=ZYrJcz4GI0iMDDimXub/B/ivgd32i538GAwfIBqsbpHbQTKk+/pHbqD81NY/SPm2Uy
         qlScSZ1oig2B3dEnwJhghjWmDMhlY+2FjnRIWwWt6vn8/8fj1ULYxd/+VoNlsS2g2RQo
         nX22xrwyVBXZpo5T1TZzYwYZasi1a69t25RnBrWdVMx9c6hpxYhvy2YH3enCKveWvUWF
         idMcNSr29QBEQ5oIyAqs5sAMfV4HyQcf+fBQsH0pvJXKVOcE0lpN1ZjnqoQ/XSotdYak
         pSfYjhRnDf9LEBNSfuHRzKrPZR6bjipnmpyexvHbMfRT0Zlq9wZyl/8bCwL6mYjYoovj
         jlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781191202; x=1781796002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LG5nGCjOit+Ej2lCP0pXC1lW5udjNvwAKpiRVZtUWO4=;
        b=IJa+yR7h0z7dwLkWbl8VHL4LToLodu0qL5gFGwpFPMCa9qqJtlVL6QOln5ndiF2jHf
         qyEmSkDxCFqBxhx6yQwOLJAHMJG2cr2QOT3N/78YKZ+eH06xFy/vMCvltmZ6kHskKt/Z
         bpMNaH+iXJ8rg8Mr5sOpDOO6bMPLFHS26/5hqJBkGRvausWnBzbE+j1/+jgHOug8uiTR
         nVt10if5OUuJlxXq84KkcMIY38OIUZ5ICmvE1Dtmway4y61Dry/qALYQbYAImx8zJoD3
         eWj2YejWL8Rb5rMGqQ6tYMtsnzcgZ/ZO+tysz5kKzwC+QfLCHirUilbZAkg3vYtyAuzr
         +NfA==
X-Forwarded-Encrypted: i=1; AFNElJ9UskAYpX+klP/tCLU33ePGUEFrhdM+rNr0LVsKdQgUup+dXAqLD31Y88flaCaLikYTeEtRaYTpvKGL/uckUo5M8/zB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/j7SAdH5botStOTpIbXcd0N+4Bera2Xc2/FNPwSgKMQJI6/y
	ABkZRj0acoK0nk5GbD99JOZ5e47GyE4AM0A4BJj41cARe2mjIsSUSljM7KwAxqAklVbhEuUBaWR
	2Ada2nmzyPFn+czJBSYJlJ6SD65Dbc0Q=
X-Gm-Gg: Acq92OF50cegWA7WS5a8dE5yX9BKtGJcIApVkOzTocVHkGs6efU5aedjhUmnWNXNrGi
	jGkkQ7jbWP9EadioznN4egOIUWqCQrH6DGkVyYH0/Ua2+nQ/PWcWLrlG/iUajq3ZCHhMX7HNbp7
	Xee9xnQfkvD7cJXvmLD8VvoFz14UoC3IZKPUwD5PelUte87I0z41Ln4+uKMhMvhNgR+5ZV+t+/1
	gSao9SKlKnBeemPCKeaFapPq+mHkPSHj9nTdSnktWbG43JAaLs6qZZBaY1X7eneVGsPsrEN3uGi
	Vap8G4UQG6Z4LCF5bdM61rjPoHsRH9UcKS5B+yk8SEAagcUNItMp
X-Received: by 2002:a17:906:4787:b0:bdf:8e2a:1092 with SMTP id
 a640c23a62f3a-bfc85745c41mr172961066b.3.1781191201837; Thu, 11 Jun 2026
 08:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531182825.389490-1-hello@kursatabayli.dev> <10e67336-7de7-db89-66f7-8d56e4ff4562@linux.intel.com>
In-Reply-To: <10e67336-7de7-db89-66f7-8d56e4ff4562@linux.intel.com>
From: Radhey Kalra <radheykalra901@gmail.com>
Date: Thu, 11 Jun 2026 20:49:50 +0530
X-Gm-Features: AVVi8CdMv1Peec1fwgQ4qVIernRiiHV0yIOHHfFNadjh3Ek8usieXg7jZSSf59s
Message-ID: <CAJ5VyXK_3wGmJtEwLLAtNFhKb0Ymf8TTSaO6cfozfN1GnComZw@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: hp-wmi: Add dual-channel PWM fan control
 for Victus S
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?B?S8O8csWfYXQgQWJheWzEsQ==?= <hello@kursatabayli.dev>, 
	krishna.chomal108@gmail.com, Hans de Goede <hansg@kernel.org>, emreleno@gmail.com, 
	edip@medip.dev, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

I tested K=C3=BCr=C5=9Fat's v3 patch on my 8A3D machine:

  board_name: 8A3D
  product_name: Victus by HP Gaming Laptop 15-fb0xxx
  kernel: 7.0.11-1-cachyos-bore-lto

For the test I used current platform-drivers-x86/for-next plus the v3 fan
patch, with a temporary 8A3D DMI match added locally because 8A3D is not in
for-next yet.

The patched module exposed the expected interface:

  fan1_input=3D3800
  fan2_input=3D3000
  pwm1_enable=3D2
  pwm1=3D158
  pwm2=3D123

Manual mode also worked:

  write pwm1_enable=3D1
  fan1_input=3D3300
  fan2_input=3D2500
  pwm1_enable=3D1
  pwm1=3D145
  pwm2=3D109

Writing pwm1 and pwm2 separately affected the two fans independently:

  write pwm1=3D140
  fan1_input=3D3000
  fan2_input=3D2500
  pwm1=3D131
  pwm2=3D109

  write pwm2=3D160
  fan1_input=3D3000
  fan2_input=3D3500
  pwm1=3D131
  pwm2=3D153

Brief max mode and return to auto also worked:

  write pwm1_enable=3D0
  fan1_input=3D3900
  fan2_input=3D4500
  pwm1_enable=3D0

  write pwm1_enable=3D2
  fan1_input=3D3300
  fan2_input=3D3700
  pwm1_enable=3D2

I did not see a fan-control failure during the test.

Thanks,
Radhey

On Wed, Jun 10, 2026 at 3:00=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> + Radhey
>
> On Sun, 31 May 2026, K=C3=BCr=C5=9Fat Abayl=C4=B1 wrote:
>
> > Currently, manual fan control on supported Victus S models uses a singl=
e
> > PWM value for both CPU and GPU fans, linking their speeds via a hardcod=
ed
> > gpu_delta offset. This prevents userspace tools from managing the therm=
al
> > profiles of the CPU and GPU independently.
> >
> > Refactor the hwmon implementation to support independent dual-channel
> > PWM control:
> > - Split the single 'pwm' state into 'cpu_pwm' and 'gpu_pwm'.
> > - Expose a second PWM channel ('pwm2') to userspace via hwmon_channel_i=
nfo.
> > - Remove the gpu_delta mechanism entirely.
> >
> > The 'pwm1_enable' mode remains shared, as the underlying hardware does
> > not support per-fan modes. When switching to manual mode, both fans are
> > smoothly initialized to their current RPMs. Additionally, ensure that
> > the HP_FAN_SPEED_AUTOMATIC flag is isolated from rpm_to_pwm mathematica=
l
> > interpolations during mode resets to prevent unintended fan states.
> >
> > Tested on: HP Victus 16-s0xxx
> >
> > Signed-off-by: K=C3=BCr=C5=9Fat Abayl=C4=B1 <hello@kursatabayli.dev>
>
> Has Radhey perhaps had an opportunity to test this patch?
>
> Radhey's series initially had the gpu delta init patch which was dropped
> because this change was anticipated. It would be nice to confirm if this
> patch successfully avoids the gpu delta init problem without introducing
> some other problems?
>
> --
>  i.
>
> > ---
> > Changes in v3:
> > - Addressed review feedback from Krishna Chomal:
> >   - Expanded ternary operators in hp_wmi_fan_speed_set to standard if-e=
lse blocks.
> >   - Replaced hardcoded channel numbers with CPU_FAN and GPU_FAN macros.
> >
> > Changes in v2:
> > - Made RPM readings atomic during the transition to manual mode.
> > - Fixed a variable scoping issue in the pwm_input block.
> > ---
> > ---
> >  drivers/platform/x86/hp/hp-wmi.c | 60 +++++++++++++++++---------------
> >  1 file changed, 32 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp=
/hp-wmi.c
> > index f63bc00d9a9b..cef0c4436bd0 100644
> > --- a/drivers/platform/x86/hp/hp-wmi.c
> > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > @@ -488,9 +488,9 @@ struct hp_wmi_hwmon_priv {
> >       struct mutex lock;      /* protects mode, pwm */
> >       u8 min_rpm;
> >       u8 max_rpm;
> > -     int gpu_delta;
> >       u8 mode;
> > -     u8 pwm;
> > +     u8 cpu_pwm;
> > +     u8 gpu_pwm;
> >       struct delayed_work keep_alive_dwork;
> >  };
> >
> > @@ -817,24 +817,20 @@ static int hp_wmi_fan_speed_max_set(int enabled)
> >       return enabled;
> >  }
> >
> > -static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8 spe=
ed)
> > +static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv)
> >  {
> >       u8 fan_speed[2];
> > -     int gpu_speed, ret;
> > +     int ret;
> >
> > -     fan_speed[CPU_FAN] =3D speed;
> > -     fan_speed[GPU_FAN] =3D speed;
> > +     if (priv->cpu_pwm =3D=3D HP_FAN_SPEED_AUTOMATIC)
> > +             fan_speed[CPU_FAN] =3D HP_FAN_SPEED_AUTOMATIC;
> > +     else
> > +             fan_speed[CPU_FAN] =3D pwm_to_rpm(priv->cpu_pwm, priv);
> >
> > -     /*
> > -      * GPU fan speed is always a little higher than CPU fan speed, we=
 fetch
> > -      * this delta value from the fan table during hwmon init.
> > -      * Exception: Speed is set to HP_FAN_SPEED_AUTOMATIC, to revert t=
o
> > -      * automatic mode.
> > -      */
> > -     if (speed !=3D HP_FAN_SPEED_AUTOMATIC) {
> > -             gpu_speed =3D speed + priv->gpu_delta;
> > -             fan_speed[GPU_FAN] =3D clamp_val(gpu_speed, 0, U8_MAX);
> > -     }
> > +     if (priv->gpu_pwm =3D=3D HP_FAN_SPEED_AUTOMATIC)
> > +             fan_speed[GPU_FAN] =3D HP_FAN_SPEED_AUTOMATIC;
> > +     else
> > +             fan_speed[GPU_FAN] =3D pwm_to_rpm(priv->gpu_pwm, priv);
> >
> >       ret =3D hp_wmi_get_fan_count_userdefine_trigger();
> >       if (ret < 0)
> > @@ -851,7 +847,9 @@ static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon=
_priv *priv, u8 speed)
> >
> >  static int hp_wmi_fan_speed_reset(struct hp_wmi_hwmon_priv *priv)
> >  {
> > -     return hp_wmi_fan_speed_set(priv, HP_FAN_SPEED_AUTOMATIC);
> > +     priv->cpu_pwm =3D HP_FAN_SPEED_AUTOMATIC;
> > +     priv->gpu_pwm =3D HP_FAN_SPEED_AUTOMATIC;
> > +     return hp_wmi_fan_speed_set(priv);
> >  }
> >
> >  static int hp_wmi_fan_speed_max_reset(struct hp_wmi_hwmon_priv *priv)
> > @@ -2402,7 +2400,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wm=
i_hwmon_priv *priv)
> >       case PWM_MODE_MANUAL:
> >               if (!is_victus_s_thermal_profile())
> >                       return -EOPNOTSUPP;
> > -             ret =3D hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, =
priv));
> > +             ret =3D hp_wmi_fan_speed_set(priv);
> >               if (ret < 0)
> >                       return ret;
> >               mod_delayed_work(system_wq, &priv->keep_alive_dwork,
> > @@ -2502,13 +2500,14 @@ static int hp_wmi_hwmon_write(struct device *de=
v, enum hwmon_sensor_types type,
> >                             u32 attr, int channel, long val)
> >  {
> >       struct hp_wmi_hwmon_priv *priv;
> > -     int rpm;
> > +     int cpu_rpm, gpu_rpm;
> >
> >       priv =3D dev_get_drvdata(dev);
> >       guard(mutex)(&priv->lock);
> >       switch (type) {
> >       case hwmon_pwm:
> >               if (attr =3D=3D hwmon_pwm_input) {
> > +                     int rpm;
> >                       if (!is_victus_s_thermal_profile())
> >                               return -EOPNOTSUPP;
> >                       /* PWM input is invalid when not in manual mode *=
/
> > @@ -2518,7 +2517,10 @@ static int hp_wmi_hwmon_write(struct device *dev=
, enum hwmon_sensor_types type,
> >                       /* ensure PWM input is within valid fan speeds */
> >                       rpm =3D pwm_to_rpm(val, priv);
> >                       rpm =3D clamp_val(rpm, priv->min_rpm, priv->max_r=
pm);
> > -                     priv->pwm =3D rpm_to_pwm(rpm, priv);
> > +                     if (channel =3D=3D CPU_FAN)
> > +                             priv->cpu_pwm =3D rpm_to_pwm(rpm, priv);
> > +                     else if (channel =3D=3D GPU_FAN)
> > +                             priv->gpu_pwm =3D rpm_to_pwm(rpm, priv);
> >                       return hp_wmi_apply_fan_settings(priv);
> >               }
> >               switch (val) {
> > @@ -2532,10 +2534,14 @@ static int hp_wmi_hwmon_write(struct device *de=
v, enum hwmon_sensor_types type,
> >                        * When switching to manual mode, set fan speed t=
o
> >                        * current RPM values to ensure a smooth transiti=
on.
> >                        */
> > -                     rpm =3D hp_wmi_get_fan_speed_victus_s(channel);
> > -                     if (rpm < 0)
> > -                             return rpm;
> > -                     priv->pwm =3D rpm_to_pwm(rpm / 100, priv);
> > +                     cpu_rpm =3D hp_wmi_get_fan_speed_victus_s(CPU_FAN=
);
> > +                     if (cpu_rpm < 0)
> > +                             return cpu_rpm;
> > +                     gpu_rpm =3D hp_wmi_get_fan_speed_victus_s(GPU_FAN=
);
> > +                     if (gpu_rpm < 0)
> > +                             return gpu_rpm;
> > +                     priv->cpu_pwm =3D rpm_to_pwm(cpu_rpm / 100, priv)=
;
> > +                     priv->gpu_pwm =3D rpm_to_pwm(gpu_rpm / 100, priv)=
;
> >                       priv->mode =3D PWM_MODE_MANUAL;
> >                       return hp_wmi_apply_fan_settings(priv);
> >               case PWM_MODE_AUTO:
> > @@ -2551,7 +2557,7 @@ static int hp_wmi_hwmon_write(struct device *dev,=
 enum hwmon_sensor_types type,
> >
> >  static const struct hwmon_channel_info * const info[] =3D {
> >       HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
> > -     HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
> > +     HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT, HWMON=
_PWM_INPUT),
> >       NULL
> >  };
> >
> > @@ -2592,7 +2598,7 @@ static int hp_wmi_setup_fan_settings(struct hp_wm=
i_hwmon_priv *priv)
> >       struct victus_s_fan_table *fan_table;
> >       u8 min_rpm, max_rpm;
> >       u8 cpu_rpm, gpu_rpm, noise_db;
> > -     int gpu_delta, i, num_entries, ret;
> > +     int i, num_entries, ret;
> >       size_t header_size, entry_size;
> >
> >       /* Default behaviour on hwmon init is automatic mode */
> > @@ -2638,10 +2644,8 @@ static int hp_wmi_setup_fan_settings(struct hp_w=
mi_hwmon_priv *priv)
> >       if (min_rpm =3D=3D U8_MAX || max_rpm =3D=3D 0)
> >               return -EINVAL;
> >
> > -     gpu_delta =3D fan_table->entries[0].gpu_rpm - fan_table->entries[=
0].cpu_rpm;
> >       priv->min_rpm =3D min_rpm;
> >       priv->max_rpm =3D max_rpm;
> > -     priv->gpu_delta =3D gpu_delta;
> >
> >       return 0;
> >  }
> >
