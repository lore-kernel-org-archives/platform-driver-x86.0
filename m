Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B2D25D536
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 08:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755590748; cv=none; b=Lf1YQTCYY15xVZeyoP4MHJDsMjI7Ooyu0Y9Uqk4xt19a3dpRoj/bdxJXLAxBYA1FOMhBGihH31F/GLy2iJY/UXnVOe+Yi29rAZeDAPqdGEjdtooKHqpIXv8Wa5iR67A7q4N0N/TWf/HpVk66vLhJiLvi8XDr92KJM70rXUIbT1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755590748; c=relaxed/simple;
	bh=2/XvFBKWN9JSiS0TgXJUBXrBB7okryGW0q5anJD3BoE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DQddwkZ6xUgIyEKMyOnHQbfwkcb3ZV+5qOqqZMPJ0J82abxtc10BcSYbXy2h2bV1o2LIMYyPSBiBHUdbVzN2lCehzsl2EfFV9ppeey3y+a6xgywI3NwM1qLi0tgdMUHpT9vwa4x7uHUITczn8ZTAr/3TMHFOCWMjZ5qhhNU+ho0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAXXFoRB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAXXFoRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755590746; x=1787126746;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2/XvFBKWN9JSiS0TgXJUBXrBB7okryGW0q5anJD3BoE=;
  b=OAXXFoRBQqE3zIvJ2AajSFY+0g5SCUrUVECGdZvqXBZidbBtnuY6CLxh
   16chCkU1uA5InJkajPQN7TZpkwuEBsziX7BfWadHKHOjzmrb40kTWoFCN
   wtF2nweRZNZcH5Q4/t1VPx10q/OZ/iXb9jvSK73ygBiWYFuT5S5gwMQ/l
   Bnp9YiDGoSrXs1/zNbqk4JlRxn8IW3BrXvp9VkpwQ2vzJolStLWf/q3Fm
   e5hq9C8nKvwABNRWahsCETjcxnEgyN05ESS+yy/NV+e5azxVGbvORam56
   ytv9O0tDGrZLpgnFgLY704hWuzma4wiuz9BnK86A/Wef+TrSe9CaECBVU
   w==;
X-CSE-ConnectionGUID: fV+7cCp2TdqH+ARXurruzQ==
X-CSE-MsgGUID: n6AkSA3qTMSxuSal3hSeew==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="60449012"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="60449012"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 01:05:45 -0700
X-CSE-ConnectionGUID: y2j1DICrSVGqrXW0Jqe8cA==
X-CSE-MsgGUID: W4P9qviwSGGuWwyaIsgtRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="168190560"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 01:05:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Aug 2025 11:05:39 +0300 (EEST)
To: Marc Burkhardt <marc.burkhardt@protoco.consulting>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>
cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>
Subject: Re: [RFC PATCH v1] platform/x86: thinkpad_acpi: Add parameter to
 suppress invalid thermal sensors
In-Reply-To: <20250818204353.857304-1-marc.burkhardt@protoco.consulting>
Message-ID: <5a10e50a-ba06-e326-0643-73135709c8a3@linux.intel.com>
References: <20250818204353.857304-1-marc.burkhardt@protoco.consulting>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1509353922-1755590739=:949"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1509353922-1755590739=:949
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 18 Aug 2025, Marc Burkhardt wrote:

> While moving an existing Icinga installation to a Lenovo P15 20SU I came
> across broken JSON output from a "sensors -Aj" command consumed by the

The commit message is not meant to be a history lesson about how the patch
came to be but to describe the problem seen and how patch is fixing it.=20
Please try to state imperatively what is the problem, not "I did x" kind=20
of sentences. E.g.,

"sensors -Aj" JSON output on Lenovo P15 20SU is broken because ...

Also try to avoid using "This patch" to start a sentence.

> Icinga check_lm_sensors plugin. After fiddling around trying to build a
> fix in either lm_sensors or Icinga I found out the error was rooted in
> some sysfs file that was created but threw errors while being read. On my
> Lenovo ThinkPad the default fallback to 8 temperature sensors creates
> sysfs entries like in my case "temp8_input" that fail when read, causing
> the issue in user-space.
>
> This patch adds a module parameter (suppress_sensor) using
> module_param_array() to allow users to specify a comma-separated list of
> zero-based sensor indices to suppress sysfs file creation (e.g.
> suppress_sensor=3D3,7). Instead of a model-specific quirk, this provides
> flexible configuration for any ThinkPad with similar issues and is workin=
g
> out-of-the-box without additional models being marked for the quirk.

Can't we determine this at probe time automatically?

We generally try to avoid module parameters whenever possible. Sometimes,
if not automated way exists, quirk + a parameter intended for temporary=20
use might be acceptable compromise. I don't understand why you say=20
"additional models being marked for the quirk" as that seems never=20
necessary even if a quirk exists.

> The
> parameter uses a fixed-size array based on TPACPI_MAX_THERMAL_SENSORS (16=
)
> consistent with the driver=E2=80=99s thermal sensor handling (ie.
> ibm_thermal_sensors_struct or sensor_dev_attr_thermal_temp_input).
>=20
> Logging via pr_info() reports the number of suppressed sensors at module
> initialization, and pr_info() logs each suppressed sensor during sysfs
> attribute creation. Invalid sensor indices are logged once via pr_warn()
> to avoid repetitive warnings.

This logging likely needs work too (to print much less), but lets first=20
agree with the way forward.

> Tested on a ThinkPad P15 with
> suppress_sensor=3D3,7, confirming suppression of temp4_input and temp8_in=
put
> with no sysfs errors. Bounds checking for uncommon values is in place or
> will be logged.
>=20
> The patch applies to the current
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git althou=
gh
> it was initially written for a 6.16.0 kernel.
>
> I look forward to any feedback on the patch and/or handling of submission=
=2E
> Please CC: for now as I am not (yet) subscribed. Thank you.

Please don't include details like these 2 last paragraphs into the commit=
=20
message itself, it's fine to state things like this below --- line as=20
they're automatically removed when the patch is applied.

Usually Linus' tree is fine as base, but sometimes pdx86 for-next has=20
diverged.

>=20
> Signed-off-by: Marc Burkhardt <marc.burkhardt@protoco.consulting>
> ---
> Notes:
> I haven't posted on LKML or send a patch for over a decade now so
> please forgive any possible mistakes I made regarding current coding
> conventions or more generally in submitting this patch. The patch was
> running for some time here with faulty sensors removed from sysfs and no
> problems otherwise detected and was surely run through checkpatch.pl befo=
re
> submission. get_maintainer.pl was helpful to find the hopefully right
> people for CC:ing but I am otherweise totally unaware of any current
> procedures or best-practices when it comes to submitting a patch.

Welcome back. You did quite well regardless. :-)

> drivers/platform/x86/lenovo/thinkpad_acpi.c | 35 ++++++++++++++++++++++++=
+++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index cc19fe520ea9..30ff01f87403 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -6019,6 +6019,30 @@ struct ibm_thermal_sensors_struct {
>  =09s32 temp[TPACPI_MAX_THERMAL_SENSORS];
>  };
> =20
> +static int suppress_sensor[TPACPI_MAX_THERMAL_SENSORS];
> +static unsigned int suppress_sensor_count;
> +
> +static bool is_sensor_suppressed(int index)
> +{
> +=09unsigned int i;
> +=09bool logged =3D false;
> +
> +=09for (i =3D 0; i < suppress_sensor_count; i++) {
> +=09=09if (suppress_sensor[i] =3D=3D index)
> +=09=09=09return true;
> +
> +=09=09if (!logged &&
> +=09=09=09(suppress_sensor[i] < 0
> +=09=09=09=09|| suppress_sensor[i] >=3D TPACPI_MAX_THERMAL_SENSORS)) {
> +=09=09=09pr_warn("Invalid sensor index %d in suppress_sensor\n",
> +=09=09=09=09suppress_sensor[i]);
> +=09=09=09logged =3D true;
> +=09=09}
> +=09}
> +
> +=09return false;
> +}
> +
>  static const struct tpacpi_quirk thermal_quirk_table[] __initconst =3D {
>  =09/* Non-standard address for thermal registers on some ThinkPads */
>  =09TPACPI_Q_LNV3('R', '1', 'F', true),=09/* L13 Yoga Gen 2 */
> @@ -6313,6 +6337,11 @@ static umode_t thermal_attr_is_visible(struct kobj=
ect *kobj,
> =20
>  =09int idx =3D sensor_attr->index;
> =20
> +=09if (is_sensor_suppressed(idx)) {
> +=09=09pr_info("Sensor %d suppressed\n", idx);
> +=09=09return 0;
> +=09}
> +
>  =09switch (thermal_read_mode) {
>  =09case TPACPI_THERMAL_NONE:
>  =09=09return 0;
> @@ -11653,6 +11682,9 @@ static void __init thinkpad_acpi_init_banner(void=
)
>  =09=09=09thinkpad_id.model_str,
>  =09=09=09(thinkpad_id.nummodel_str) ?
>  =09=09=09=09thinkpad_id.nummodel_str : "unknown");
> +
> +=09pr_info("Suppressing %d user-supplied sensor(s) via parameter suppres=
s_sensor\n",
> +=09=09suppress_sensor_count);
>  }
> =20
>  /* Module init, exit, parameters */
> @@ -11785,6 +11817,9 @@ MODULE_PARM_DESC(experimental,
>  module_param_named(debug, dbg_level, uint, 0);
>  MODULE_PARM_DESC(debug, "Sets debug level bit-mask");
> =20
> +module_param_array(suppress_sensor, int, &suppress_sensor_count, 0444);
> +MODULE_PARM_DESC(suppress_sensor, "Comma-separated sensor indices to sup=
press (e.g., 3,7)");
> +
>  module_param(force_load, bool, 0444);
>  MODULE_PARM_DESC(force_load,
>  =09=09 "Attempts to load the driver even on a mis-identified ThinkPad wh=
en true");
>=20

--=20
 i.

--8323328-1509353922-1755590739=:949--
