Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6BE358368;
	Tue,  7 Apr 2026 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775548953; cv=none; b=fJh0+gqAxsVPRGLbn8YJsmdpKHG60DLeujWlm/fKwZRphwx48af4S963cEBsN3iiw1qPf9+6ZPziqaJl6x5tXOmuEwVFO/BIyGXNIiz7gJQ7rHI9mwgsn31DBBIVPC8QN9sVAty9QUrNDmKaBI3XUpblfwvP90oguLBdbcNNLU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775548953; c=relaxed/simple;
	bh=rdLa1JOyNAvo/6sG5MzTgEeXXyqY68tirBEeMq0G4EE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=P4yR+j6dR1PxAZs7jgEYV63sJ4gHRyCwX/nW8xtl5MCeKOhLw9+VqQMXE9qwomO8DI7RhyjKwHRPQfN5pyrnVcRbj16OOOdFF4JlE3YUk3nII4jOCP7VN5j9trmCT9C4q+Z4CCFhu6uRvFI2YEks1tGnwtPx1ose2NWzMTlCsAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gzictjzn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gzictjzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775548952; x=1807084952;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rdLa1JOyNAvo/6sG5MzTgEeXXyqY68tirBEeMq0G4EE=;
  b=GzictjznDmHf67FcsfQl/3oscepVWquPzOCPzdzR5FjBhx2X35+cEpCf
   ptE54PysJWeBIxptvv6ov5n9VjT9HtDILtrmP2foKOv32pKvifeDkurXs
   wTMiKq0VzK0/3N0azW2u5brTtuWlyMevJl8zx+O0xauGEO/ZlsHxRd4g/
   6Rp2nWsLUvciE3PDE5ZufQgS42mUMjJNA7vTUCv/hwO+I/5JrFW1jkNdw
   /Doe+bG0TiwTRF0lvrsfzh3sXo3LcoGSehQBPsvpKLJjx8FEqMrrIcAjU
   gjcngaaadhDSJGYb/8ZtEcpV8hdrj5jDc1chrKnzT1k8yk4eN22Kn0veN
   A==;
X-CSE-ConnectionGUID: e58yYnx+TLW6pfWUfQcFtg==
X-CSE-MsgGUID: YoRkdrRvSqqgpbZugi/7AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76401247"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76401247"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 01:02:31 -0700
X-CSE-ConnectionGUID: Uh8sVLzlRiS4cdZq9aP5kA==
X-CSE-MsgGUID: VKO7jyYCQlasHf0DDSBQZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="228040159"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 01:02:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Apr 2026 11:02:25 +0300 (EEST)
To: Emre Cecanpunar <emreleno@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, krishna.chomal108@gmail.com, 
    edip@medip.dev
Subject: Re: [PATCH v3 4/5] platform/x86: hp-wmi: fix u8 underflow in gpu_delta
 calculation
In-Reply-To: <20260405144502.24944-5-emreleno@gmail.com>
Message-ID: <edf0f72d-6b8e-c269-731f-46e2c2c80c9a@linux.intel.com>
References: <20260405144502.24944-1-emreleno@gmail.com> <20260405144502.24944-5-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1799216800-1775548945=:983"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1799216800-1775548945=:983
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 5 Apr 2026, Emre Cecanpunar wrote:

> gpu_delta was declared as u8. If the firmware specifies a GPU RPM
> lower than the CPU RPM, subtracting them causes an underflow
> (e.g. 10 - 20 =3D 246), which forces the GPU fan to remain clamped at
> U8_MAX (100% speed) during operation.
>=20
> Change gpu_delta to int and use signed arithmetic. Existing signed logic
> in hp_wmi_fan_speed_set() correctly handles negative deltas.
>=20
> Fixes: 46be1453e6e6 ("platform/x86: hp-wmi: add manual fan control for Vi=
ctus S models")
> Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
> ---
> Changes in v2:
> - Drop the if (gpu_delta < 0) guard and pr_warn. A negative delta is
>   valid firmware behavior on boards where CPU_RPM > GPU_RPM. Store
>   gpu_delta as int in struct hp_wmi_hwmon_priv so the existing signed
>   arithmetic and clamp_val() in hp_wmi_fan_speed_set() handle the
>   negative case correctly without saturating at U8_MAX.
>=20
> Changes in v3:
> - Removed unnecessary explicit (int) casts. C's integer promotion rules
>   already convert u8 operands to int for arithmetic; the fix only
>   requires storing the result in an int variable.
>=20
>  drivers/platform/x86/hp/hp-wmi.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/h=
p-wmi.c
> index 2932cab9aa78..db72ad9da0a5 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -455,7 +455,7 @@ enum pwm_modes {
>  struct hp_wmi_hwmon_priv {
>  =09u8 min_rpm;
>  =09u8 max_rpm;
> -=09u8 gpu_delta;
> +=09int gpu_delta;
>  =09u8 mode;
>  =09u8 pwm;
>  =09struct delayed_work keep_alive_dwork;
> @@ -2549,8 +2549,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_=
hwmon_priv *priv)
>  {
>  =09u8 fan_data[128] =3D { 0 };
>  =09struct victus_s_fan_table *fan_table;
> -=09u8 min_rpm, max_rpm, gpu_delta;
> -=09int ret;
> +=09u8 min_rpm, max_rpm;
> +=09int gpu_delta, ret;
> =20
>  =09/* Default behaviour on hwmon init is automatic mode */
>  =09priv->mode =3D PWM_MODE_AUTO;
> @@ -2572,7 +2572,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_=
hwmon_priv *priv)
> =20
>  =09min_rpm =3D fan_table->entries[0].cpu_rpm;
>  =09max_rpm =3D fan_table->entries[fan_table->header.num_entries - 1].cpu=
_rpm;
> -=09gpu_delta =3D fan_table->entries[0].gpu_rpm - fan_table->entries[0].c=
pu_rpm;
> +=09gpu_delta =3D fan_table->entries[0].gpu_rpm -
> +=09=09    fan_table->entries[0].cpu_rpm;

So this part has now become pure newline change (which is unrelated to=20
the intent of this patch)?

>  =09priv->min_rpm =3D min_rpm;
>  =09priv->max_rpm =3D max_rpm;
>  =09priv->gpu_delta =3D gpu_delta;
>=20

--=20
 i.

--8323328-1799216800-1775548945=:983--
