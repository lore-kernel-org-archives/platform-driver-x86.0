Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162102C0303;
	Tue,  7 Jul 2026 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429071; cv=none; b=oytYyyvE2sqJqZHMrZyggTyb2an9RIa7Q5xU+kzMm8AtX+WPwJIZnibOeqwBp1153m0fO8RP4UhPoJoxavEY8nNwTWspZ7BNVB5uvZvO9zX7KD/QkvnaXutxpLSBjOXOhe9MF0CpFbO3Vn75697XB7HqltAc7HQdk42U7MHYoY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429071; c=relaxed/simple;
	bh=05JAK6ezHh1sBS8E22kINVIzrScx55tK0GXVjjELED4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fm5EKkICR8WPIbjK6G+rVCbDuQoXR8hcE8xoXiQx2jcgjtFzs6MsYPgCdeYkbfCjk10db5AeNqfZCnTOpQjsAzzgAQfwE1TB/wfZB8Au7YjdHkBWs3ggTHTyd3iROTVDBuRctPF1yf/6iICSYfrlrG5rrEOIJtzAekz3ktUYHVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBiB5rtt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBiB5rtt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783429069; x=1814965069;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=05JAK6ezHh1sBS8E22kINVIzrScx55tK0GXVjjELED4=;
  b=WBiB5rttIfgHtBYdgnsjgq7YrqfNmgOrv7Jk6cq712vuWO6dfbV2bRBq
   yQAVujA958yrP9nnX8zvwS8PAW01kE56bTHi/d8U29cBUWV/AKkFHik0/
   1SyiLO3OcbQGzUCeqkCvgM7WQzQyhZyufATS7fatD8T9VpNKLmcNnSKv6
   RaSAU7WLOgSzjsOHk09XNFBYXtLLQs6qBcnVs13EGtrqSLhhehSurnPJQ
   E/eoJW8YZsNrx8lfXXV35pdTBM3YzLVyEGROGzkyzZk7Ioh/X9sSAg1Nb
   qlThozNe9/oJuegMIz/wLKaxw2tn4v+usBiDLjmBoUL2kdjXb42uIDnOg
   Q==;
X-CSE-ConnectionGUID: 4eS8Vm45QxiFzqD5eyuyIA==
X-CSE-MsgGUID: kx+F98XcQyuhgEd+y3kCjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="94678573"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94678573"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 05:57:48 -0700
X-CSE-ConnectionGUID: qpc1tW/8QHqCgFivBfGOnQ==
X-CSE-MsgGUID: XAGWeOT5S8CzQ9lrdgccLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="257564568"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 05:57:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jul 2026 15:57:41 +0300 (EEST)
To: =?UTF-8?Q?K=C3=BCr=C5=9Fat_Abayl=C4=B1?= <hello@kursatabayli.dev>
cc: Hans de Goede <hansg@kernel.org>, krishna.chomal108@gmail.com, 
    emreleno@gmail.com, edip@medip.dev, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: hp-wmi: Add dual-channel PWM fan control
 for Victus S
In-Reply-To: <20260531182825.389490-1-hello@kursatabayli.dev>
Message-ID: <cefc3738-fbbe-d4a9-eaf9-2f869c5d04e9@linux.intel.com>
References: <20260531182825.389490-1-hello@kursatabayli.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-463222359-1783429061=:1152"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-463222359-1783429061=:1152
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 31 May 2026, K=C3=BCr=C5=9Fat Abayl=C4=B1 wrote:

> Currently, manual fan control on supported Victus S models uses a single
> PWM value for both CPU and GPU fans, linking their speeds via a hardcoded
> gpu_delta offset. This prevents userspace tools from managing the thermal
> profiles of the CPU and GPU independently.
>=20
> Refactor the hwmon implementation to support independent dual-channel
> PWM control:
> - Split the single 'pwm' state into 'cpu_pwm' and 'gpu_pwm'.
> - Expose a second PWM channel ('pwm2') to userspace via hwmon_channel_inf=
o.
> - Remove the gpu_delta mechanism entirely.
>=20
> The 'pwm1_enable' mode remains shared, as the underlying hardware does
> not support per-fan modes. When switching to manual mode, both fans are
> smoothly initialized to their current RPMs. Additionally, ensure that
> the HP_FAN_SPEED_AUTOMATIC flag is isolated from rpm_to_pwm mathematical
> interpolations during mode resets to prevent unintended fan states.
>=20
> Tested on: HP Victus 16-s0xxx
>=20
> Signed-off-by: K=C3=BCr=C5=9Fat Abayl=C4=B1 <hello@kursatabayli.dev>
>=20
> ---
> Changes in v3:
> - Addressed review feedback from Krishna Chomal:
>   - Expanded ternary operators in hp_wmi_fan_speed_set to standard if-els=
e blocks.
>   - Replaced hardcoded channel numbers with CPU_FAN and GPU_FAN macros.
>=20
> Changes in v2:
> - Made RPM readings atomic during the transition to manual mode.
> - Fixed a variable scoping issue in the pwm_input block.
> ---
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 60 +++++++++++++++++---------------
>  1 file changed, 32 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/h=
p-wmi.c
> index f63bc00d9a9b..cef0c4436bd0 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -488,9 +488,9 @@ struct hp_wmi_hwmon_priv {
>  =09struct mutex lock;=09/* protects mode, pwm */
>  =09u8 min_rpm;
>  =09u8 max_rpm;
> -=09int gpu_delta;
>  =09u8 mode;
> -=09u8 pwm;
> +=09u8 cpu_pwm;
> +=09u8 gpu_pwm;
>  =09struct delayed_work keep_alive_dwork;
>  };
> =20
> @@ -817,24 +817,20 @@ static int hp_wmi_fan_speed_max_set(int enabled)
>  =09return enabled;
>  }
> =20
> -static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8 speed=
)
> +static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv)
>  {
>  =09u8 fan_speed[2];
> -=09int gpu_speed, ret;
> +=09int ret;
> =20
> -=09fan_speed[CPU_FAN] =3D speed;
> -=09fan_speed[GPU_FAN] =3D speed;
> +=09if (priv->cpu_pwm =3D=3D HP_FAN_SPEED_AUTOMATIC)
> +=09=09fan_speed[CPU_FAN] =3D HP_FAN_SPEED_AUTOMATIC;
> +=09else
> +=09=09fan_speed[CPU_FAN] =3D pwm_to_rpm(priv->cpu_pwm, priv);
> =20
> -=09/*
> -=09 * GPU fan speed is always a little higher than CPU fan speed, we fet=
ch
> -=09 * this delta value from the fan table during hwmon init.
> -=09 * Exception: Speed is set to HP_FAN_SPEED_AUTOMATIC, to revert to
> -=09 * automatic mode.
> -=09 */
> -=09if (speed !=3D HP_FAN_SPEED_AUTOMATIC) {
> -=09=09gpu_speed =3D speed + priv->gpu_delta;
> -=09=09fan_speed[GPU_FAN] =3D clamp_val(gpu_speed, 0, U8_MAX);
> -=09}
> +=09if (priv->gpu_pwm =3D=3D HP_FAN_SPEED_AUTOMATIC)
> +=09=09fan_speed[GPU_FAN] =3D HP_FAN_SPEED_AUTOMATIC;
> +=09else
> +=09=09fan_speed[GPU_FAN] =3D pwm_to_rpm(priv->gpu_pwm, priv);
> =20
>  =09ret =3D hp_wmi_get_fan_count_userdefine_trigger();
>  =09if (ret < 0)
> @@ -851,7 +847,9 @@ static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_p=
riv *priv, u8 speed)
> =20
>  static int hp_wmi_fan_speed_reset(struct hp_wmi_hwmon_priv *priv)
>  {
> -=09return hp_wmi_fan_speed_set(priv, HP_FAN_SPEED_AUTOMATIC);
> +=09priv->cpu_pwm =3D HP_FAN_SPEED_AUTOMATIC;
> +=09priv->gpu_pwm =3D HP_FAN_SPEED_AUTOMATIC;
> +=09return hp_wmi_fan_speed_set(priv);
>  }
> =20
>  static int hp_wmi_fan_speed_max_reset(struct hp_wmi_hwmon_priv *priv)
> @@ -2402,7 +2400,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_=
hwmon_priv *priv)
>  =09case PWM_MODE_MANUAL:
>  =09=09if (!is_victus_s_thermal_profile())
>  =09=09=09return -EOPNOTSUPP;
> -=09=09ret =3D hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
> +=09=09ret =3D hp_wmi_fan_speed_set(priv);
>  =09=09if (ret < 0)
>  =09=09=09return ret;
>  =09=09mod_delayed_work(system_wq, &priv->keep_alive_dwork,
> @@ -2502,13 +2500,14 @@ static int hp_wmi_hwmon_write(struct device *dev,=
 enum hwmon_sensor_types type,
>  =09=09=09      u32 attr, int channel, long val)
>  {
>  =09struct hp_wmi_hwmon_priv *priv;
> -=09int rpm;
> +=09int cpu_rpm, gpu_rpm;
> =20
>  =09priv =3D dev_get_drvdata(dev);
>  =09guard(mutex)(&priv->lock);
>  =09switch (type) {
>  =09case hwmon_pwm:
>  =09=09if (attr =3D=3D hwmon_pwm_input) {
> +=09=09=09int rpm;
>  =09=09=09if (!is_victus_s_thermal_profile())
>  =09=09=09=09return -EOPNOTSUPP;
>  =09=09=09/* PWM input is invalid when not in manual mode */
> @@ -2518,7 +2517,10 @@ static int hp_wmi_hwmon_write(struct device *dev, =
enum hwmon_sensor_types type,
>  =09=09=09/* ensure PWM input is within valid fan speeds */
>  =09=09=09rpm =3D pwm_to_rpm(val, priv);
>  =09=09=09rpm =3D clamp_val(rpm, priv->min_rpm, priv->max_rpm);
> -=09=09=09priv->pwm =3D rpm_to_pwm(rpm, priv);
> +=09=09=09if (channel =3D=3D CPU_FAN)
> +=09=09=09=09priv->cpu_pwm =3D rpm_to_pwm(rpm, priv);
> +=09=09=09else if (channel =3D=3D GPU_FAN)
> +=09=09=09=09priv->gpu_pwm =3D rpm_to_pwm(rpm, priv);
>  =09=09=09return hp_wmi_apply_fan_settings(priv);
>  =09=09}
>  =09=09switch (val) {
> @@ -2532,10 +2534,14 @@ static int hp_wmi_hwmon_write(struct device *dev,=
 enum hwmon_sensor_types type,
>  =09=09=09 * When switching to manual mode, set fan speed to
>  =09=09=09 * current RPM values to ensure a smooth transition.
>  =09=09=09 */
> -=09=09=09rpm =3D hp_wmi_get_fan_speed_victus_s(channel);
> -=09=09=09if (rpm < 0)
> -=09=09=09=09return rpm;
> -=09=09=09priv->pwm =3D rpm_to_pwm(rpm / 100, priv);
> +=09=09=09cpu_rpm =3D hp_wmi_get_fan_speed_victus_s(CPU_FAN);
> +=09=09=09if (cpu_rpm < 0)
> +=09=09=09=09return cpu_rpm;
> +=09=09=09gpu_rpm =3D hp_wmi_get_fan_speed_victus_s(GPU_FAN);
> +=09=09=09if (gpu_rpm < 0)
> +=09=09=09=09return gpu_rpm;
> +=09=09=09priv->cpu_pwm =3D rpm_to_pwm(cpu_rpm / 100, priv);
> +=09=09=09priv->gpu_pwm =3D rpm_to_pwm(gpu_rpm / 100, priv);

Could you please rebase this patch, it no longer applies cleanly and I was=
=20
unsure of what is the correct resolution.

Please also add Radhey's Tested-by tag while preparing the next version.

--
 i.

>  =09=09=09priv->mode =3D PWM_MODE_MANUAL;
>  =09=09=09return hp_wmi_apply_fan_settings(priv);
>  =09=09case PWM_MODE_AUTO:
> @@ -2551,7 +2557,7 @@ static int hp_wmi_hwmon_write(struct device *dev, e=
num hwmon_sensor_types type,
> =20
>  static const struct hwmon_channel_info * const info[] =3D {
>  =09HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
> -=09HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
> +=09HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT, HWMON_PWM=
_INPUT),
>  =09NULL
>  };
> =20
> @@ -2592,7 +2598,7 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_=
hwmon_priv *priv)
>  =09struct victus_s_fan_table *fan_table;
>  =09u8 min_rpm, max_rpm;
>  =09u8 cpu_rpm, gpu_rpm, noise_db;
> -=09int gpu_delta, i, num_entries, ret;
> +=09int i, num_entries, ret;
>  =09size_t header_size, entry_size;
> =20
>  =09/* Default behaviour on hwmon init is automatic mode */
> @@ -2638,10 +2644,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi=
_hwmon_priv *priv)
>  =09if (min_rpm =3D=3D U8_MAX || max_rpm =3D=3D 0)
>  =09=09return -EINVAL;
> =20
> -=09gpu_delta =3D fan_table->entries[0].gpu_rpm - fan_table->entries[0].c=
pu_rpm;
>  =09priv->min_rpm =3D min_rpm;
>  =09priv->max_rpm =3D max_rpm;
> -=09priv->gpu_delta =3D gpu_delta;
> =20
>  =09return 0;
>  }
>=20
--8323328-463222359-1783429061=:1152--
