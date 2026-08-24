Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC079453A59;
	Mon, 24 Aug 2026 15:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586500; cv=none; b=ZGH8m9uEY+aRSNCAPMji14utPezQZSM9dGtuQGOq9Hy8obBlOctfOn37b/zf3/HDQ+O9HYH6zVVQ/GssB/f44EOHjHpXsLBfwOZfKa7V0od6ppZHjODgcA8KqNt+2uVfexoE3giWBYjgCh+f8m1Pz68HCkL0TS/nG+WbazZsupY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586500; c=relaxed/simple;
	bh=ElpDBlvCuq+2OFhevqRg3LjhirkdvpeE6OrdnAMfZOo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OQMMx17n1DLoV3VJGANgRKeNoUSStm88jvOjk7hGebku4A6tV/aM7XVsR161Y/WBzSLdDiTGtBTwenrCb43RbMgqaRDazUs2g/ojK67tJn01NQcow+NcSkV7V/JVP0RD2p/1AWNjy9P3E6UFnkUpC56q9Jzc3QV/iuD2XGaj7ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtB0x3lk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtB0x3lk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787586497; x=1819122497;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ElpDBlvCuq+2OFhevqRg3LjhirkdvpeE6OrdnAMfZOo=;
  b=WtB0x3lkVD7hMHLo+Rl1Vj9gq/vTvisi5ZMAta8w1eUySvEfqKWGeIkJ
   QuX/d/Dg0kNuXv0sUv/T+nP9K/qjQ6W7NnkA61CgHIZY8NZj9MHTGTBr6
   0Z7IcrDsVGp7odjZhWrEVwUL4VGWuXv7BKiYKnceJmZ7OV0oY7yTGaO6a
   LHN8J+65aL1wYfVZoLD1v1jPJbkUJ4hr6dBXwosIlu3iQ1/zeealsg7wO
   MY5mGoxaqUlluAGDycu2p286wpxyx5hn9CKT3VCGIXVlnkJdYuWE1iNcq
   T/n/3SVsvDT+QrHj0xFzzRAV5KVC1UeN/U11eSQvHgEWWUfBVDuNTe9LP
   g==;
X-CSE-ConnectionGUID: djjjRZccQemdO9wm9XUL9g==
X-CSE-MsgGUID: XVHHWOouRMeZxjsFSFjPsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="113575618"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="113575618"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 08:48:15 -0700
X-CSE-ConnectionGUID: TsAwSK8OQCivet6PFOaoyg==
X-CSE-MsgGUID: kAt0ISXLQRyO1TsRY9PKwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="260880581"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.154])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 08:48:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Aug 2026 18:48:09 +0300 (EEST)
To: =?GB2312?B?y+8g0/7D+g==?= <wolf109909@outlook.com>
cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Mingyou Chen <qby140326@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, Nabil Danial <nabildanial.93@gmail.com>
Subject: Re: [RESEND PATCH 3/5] platform/x86: bitland-mifs-wmi: read fan tach
 from EC window on MIFS v2
In-Reply-To: <20260728180944.51356-4-wolf109909@outlook.com>
Message-ID: <a08329dd-fa23-559e-1f80-61b51a6163b9@linux.intel.com>
References: <20260728180944.51356-1-wolf109909@outlook.com> <20260728180944.51356-4-wolf109909@outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-702350593-1787586489=:1164"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-702350593-1787586489=:1164
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 28 Jul 2026, =E5=AD=99 =E8=AA=89=E9=93=AD wrote:

> The MIFS v2 firmware implements no WMI function for fan speeds (nor
> for the CPU thermometer), so on these machines the hwmon device
> reported zero RPM on every channel.
>=20
> The fan tachometers instead live in the EC shared-memory window at
> 0xFE0B0300 (DSDT \_SB.PC00.LPCB.Q_EC region "ERAM") as little-endian
> u16 RPM values at offsets 0x69 and 0x6B (0 =3D fan stopped). Map the
> window on v2 systems and expose the two fans with proper labels; hide
> the non-existent third fan and temperature channels.
>=20
> Offsets verified by diffing the window between idle and sustained load
> (tach values ramp 0 -> ~2700 RPM and back) on a Xiaomi Book Pro 14.
>=20
> Signed-off-by: Yuming Sun <wolf109909@outlook.com>
> ---
>  drivers/platform/x86/bitland-mifs-wmi.c | 68 +++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x=
86/bitland-mifs-wmi.c
> index 342dd7e1..5f7c85a8 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -17,6 +17,7 @@
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
>  #include <linux/init.h>
> +#include <linux/io.h>
>  #include <linux/input-event-codes.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
> @@ -151,6 +152,16 @@ struct bitland_mifs_output {
>   */
>  #define MIFS_STATUS_ERROR=090xe000
> =20
> +/*
> + * MIFS v2 EC shared-memory window (DSDT \_SB.PC00.LPCB.Q_EC region
> + * "ERAM"). The firmware exposes no WMI fan function, but the fan
> + * tachometers live here as little-endian u16 RPM (0 =3D fan stopped).
> + */
> +#define MIFS_V2_EC_MEM_BASE=090xFE0B0300
> +#define MIFS_V2_EC_MEM_SIZE=090x100

SZ_xx from sizes.h

> +#define MIFS_V2_EC_REG_FAN1=090x69
> +#define MIFS_V2_EC_REG_FAN2=090x6B
> +
>  static u16 mifs_status(const struct bitland_mifs_output *out)
>  {
>  =09return out->reserved1 | (out->operation << 8);
> @@ -188,6 +199,7 @@ struct bitland_mifs_wmi_data {
>  =09enum platform_profile_option saved_profile;
>  =09bool profile_valid;
>  =09bool is_v2;=09/* MIFS v2 firmware: QFAN perf-mode codes */
> +=09u8 __iomem *ec_mem;=09/* v2 EC shared-memory window */
>  };
> =20
>  static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
> @@ -421,6 +433,27 @@ static const char *const fan_labels[] =3D {
>  =09"SYS", /* 2 */
>  };
> =20
> +static const char *const fan_labels_v2[] =3D {
> +=09"Left Fan", /* 0 */
> +=09"Right Fan", /* 1 */

Please align comments.

> +};
> +
> +static umode_t laptop_hwmon_visible(const void *drvdata,
> +=09=09=09=09    enum hwmon_sensor_types type,
> +=09=09=09=09    u32 attr, int channel)
> +{
> +=09const struct bitland_mifs_wmi_data *data =3D drvdata;
> +
> +=09/* v2 firmware: two fans, no CPU temperature channel */
> +=09if (data->is_v2) {
> +=09=09if (type =3D=3D hwmon_fan && channel < 2)
> +=09=09=09return 0444;
> +=09=09return 0;
> +=09}
> +
> +=09return 0444;
> +}
> +
>  static int laptop_hwmon_read(struct device *dev, enum hwmon_sensor_types=
 type,
>  =09=09=09     u32 attr, int channel, long *val)
>  {
> @@ -433,6 +466,22 @@ static int laptop_hwmon_read(struct device *dev, enu=
m hwmon_sensor_types type,
>  =09struct bitland_mifs_output res;
>  =09int ret;
> =20
> +=09/* v2: tachometers are u16 RPM in the EC shared-memory window */
> +=09if (data->is_v2) {
> +=09=09if (type !=3D hwmon_fan || !data->ec_mem)
> +=09=09=09return -EINVAL;

-EINVAL is plain wrong if you failed to initialize ec_mem. There's no=20
problem in input parameters whatsoever in that case.

> +=09=09switch (channel) {
> +=09=09case 0:
> +=09=09=09*val =3D get_unaligned_le16(data->ec_mem + MIFS_V2_EC_REG_FAN1)=
;
> +=09=09=09return 0;
> +=09=09case 1:
> +=09=09=09*val =3D get_unaligned_le16(data->ec_mem + MIFS_V2_EC_REG_FAN2)=
;
> +=09=09=09return 0;
> +=09=09default:
> +=09=09=09return -EINVAL;
> +=09=09}
> +=09}
> +
>  =09switch (type) {
>  =09case hwmon_temp:
>  =09=09input.function =3D WMI_FN_CPU_THERMOMETER;
> @@ -468,9 +517,13 @@ static int laptop_hwmon_read_string(struct device *d=
ev,
>  =09=09=09=09    enum hwmon_sensor_types type, u32 attr,
>  =09=09=09=09    int channel, const char **str)
>  {
> +=09struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +=09const char *const *labels =3D data->is_v2 ? fan_labels_v2 : fan_label=
s;
> +=09int nlabels =3D data->is_v2 ? ARRAY_SIZE(fan_labels_v2) : ARRAY_SIZE(=
fan_labels);

Looks ugly but I suppose you're going to get rid of is_v2 anyway as per=20
somebody else's suggestion so it should try to deal with this I guess.

> +
>  =09if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_label) {
> -=09=09if (channel >=3D 0 && channel < ARRAY_SIZE(fan_labels)) {
> -=09=09=09*str =3D fan_labels[channel];
> +=09=09if (channel >=3D 0 && channel < nlabels) {
> +=09=09=09*str =3D labels[channel];
>  =09=09=09return 0;
>  =09=09}
>  =09}
> @@ -486,7 +539,7 @@ static const struct hwmon_channel_info *laptop_hwmon_=
info[] =3D {
>  };
> =20
>  static const struct hwmon_ops laptop_hwmon_ops =3D {
> -=09.visible =3D 0444,
> +=09.is_visible =3D laptop_hwmon_visible,
>  =09.read =3D laptop_hwmon_read,
>  =09.read_string =3D laptop_hwmon_read_string,
>  };
> @@ -782,6 +835,15 @@ static int bitland_mifs_wmi_probe(struct wmi_device =
*wdev, const void *context)
>  =09=09=09dev_info(&wdev->dev,
>  =09=09=09=09 "MIFS v2 firmware detected (QFAN mode codes)\n");
>  =09=09}
> +
> +=09=09if (drv_data->is_v2) {
> +=09=09=09drv_data->ec_mem =3D devm_ioremap(&wdev->dev,
> +=09=09=09=09=09=09=09MIFS_V2_EC_MEM_BASE,
> +=09=09=09=09=09=09=09MIFS_V2_EC_MEM_SIZE);
> +=09=09=09if (!drv_data->ec_mem)
> +=09=09=09=09dev_warn(&wdev->dev,
> +=09=09=09=09=09 "cannot map EC window, fan tach unavailable\n");
> +=09=09}
>  =09}
> =20
>  =09if (dev_type =3D=3D BITLAND_WMI_EVENT) {
>=20

--=20
 i.

--8323328-702350593-1787586489=:1164--
