Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4A515B998;
	Mon, 29 Jun 2026 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732427; cv=none; b=cDpmNeNxRejeY3k7TK9lKEvR7C/dvWQ/iyfq6kC1AItcDpQcPPTUbS49EfTzF1HimPll4Gtk5MHZsQfennbulEGwI5h/i4AxKt1sIigNfQaFocEA1VpUnKMif6Bui1t1IgqC6yeuMoWPFTZg50IMfUpBDRMsOgkegEumd1a+mgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732427; c=relaxed/simple;
	bh=jZtwR/JrkLEadQ8TbHJ6nstPH0J9NRyKUdxuxqtpBcw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=I2vJ8kUdrMggqs0xjhTKL1XDS7gfkcXjbPt/wRqPjoqFIClqROalExI4KRddnggwnqEE2+8o11NWNBYoXDPMgPb3Y9QXJru+D6XTR4EFg084BZYYaT5HL3bLyVmLqd39vKvSeCSu7l9MpXwrxMRfwAPZ1BY/RdcTgiEQyEoYA1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgTcJlb1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgTcJlb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782732426; x=1814268426;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jZtwR/JrkLEadQ8TbHJ6nstPH0J9NRyKUdxuxqtpBcw=;
  b=HgTcJlb1/bue6Kyh/vw19pLQ3KO1FLsnSnnnEu4B7jmJAAlkx8y/oGum
   OH9JHwgKvxtGS8BW40qlK5uZ/vKSKoyfRPCPz0MLDdDvjdzs8xLpSm/mO
   psll3n54OpLSajnytkR4TY8EEytufAjIrtyx7yHorDxMpvuJxJKL9hSgQ
   ugKTT2mAutfXh+rmI8jJp66NQixJIRS4eiuuTSd1EdODfIus+ZtiILee+
   WHaKTXEaiYDSsR2n0Aqlr8g+AMwoLNLUWu0eBZ4K55lZyXuqb7ZqPu+XE
   AwyT0gqUtHs/z9pRYXnaKnbBLQ0NlLt7n8OWTfZd7DVHkODOJ4zNbiuIE
   g==;
X-CSE-ConnectionGUID: /EfYZckrTSyPh0dUvHdX1g==
X-CSE-MsgGUID: 5BhQ9pJzQ+mhXuorj8ctrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="87325680"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="87325680"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:22:01 -0700
X-CSE-ConnectionGUID: ITnPtzVdTXOcGSGmqJE7og==
X-CSE-MsgGUID: iWtoXfvnTDu0NkvX9QECeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="250866020"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.42])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:21:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jun 2026 14:21:55 +0300 (EEST)
To: =?UTF-8?Q?K=C3=BCr=C5=9Fat_Abayl=C4=B1?= <hello@kursatabayli.dev>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add GPU MUX switch support
In-Reply-To: <20260628002144.13468-1-hello@kursatabayli.dev>
Message-ID: <5d16b66d-db27-cb99-30ca-139c521f80a3@linux.intel.com>
References: <20260628002144.13468-1-hello@kursatabayli.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-350241473-1782732115=:1167"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-350241473-1782732115=:1167
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 28 Jun 2026, K=C3=BCr=C5=9Fat Abayl=C4=B1 wrote:

> Add support for querying and switching the graphics MUX mode on HP
> systems via WMI. This introduces the 'gpu_mux_mode' sysfs attribute
> under the hp-wmi platform device, allowing userspace tools to check
> and safely switch between available graphics modes (e.g., UMA, Hybrid,
> Discrete).
>=20
> The hardware capabilities mask is primarily read using the modern
> 128-byte System Design Data query. However, to ensure backward
> compatibility with older models, a fallback mechanism is implemented.
> By mirroring the behavior of the Windows Omen Gaming Hub software, if
> the modern query fails but the MUX WMI endpoint (0x52) responds
> successfully to a read request, the driver defaults to a standard
> Hybrid + Discrete support mask (0x06).
>=20
> The patch relies on the zero_if_sup() macro to handle input size
> requirements safely across different BIOS implementations and uses
> standard error handling paths.
>=20
> Signed-off-by: K=C3=BCr=C5=9Fat Abayl=C4=B1 <hello@kursatabayli.dev>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 128 +++++++++++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>=20
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/h=
p-wmi.c
> index 8ba286ed8721..256e37d91767 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -14,6 +14,7 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> =20
>  #include <linux/acpi.h>
> +#include <linux/bits.h>
>  #include <linux/cleanup.h>
>  #include <linux/compiler_attributes.h>
>  #include <linux/dmi.h>
> @@ -58,6 +59,8 @@ enum hp_ec_offsets {
>  #define HP_FAN_SPEED_AUTOMATIC=09 0x00
>  #define HP_POWER_LIMIT_DEFAULT=09 0x00
>  #define HP_POWER_LIMIT_NO_CHANGE 0xFF
> +#define HPWMI_MUX_MODE_MASK 0x7F

GENMASK()

> +#define HPWMI_MUX_LEGACY_MASK (BIT(1) | BIT(2))

Do we know what these bits are so they could be named with defines and=20
then combined with NAMED1 | NAMED2?
=20
>  #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when=
 zero insize is required
> =20
> @@ -332,6 +335,7 @@ enum hp_wmi_commandtype {
>  =09HPWMI_POSTCODEERROR_QUERY=09=3D 0x2a,
>  =09HPWMI_SYSTEM_DEVICE_MODE=09=3D 0x40,
>  =09HPWMI_THERMAL_PROFILE_QUERY=09=3D 0x4c,
> +=09HPWMI_GRAPHICS_MUX_QUERY=09=3D 0x52,
>  };
> =20
>  struct victus_power_limits {
> @@ -1124,12 +1128,135 @@ static int camera_shutter_input_setup(void)
>  =09return err;
>  }
> =20
> +static const u8 mux_bitmask_map[] =3D {
> +=09[0] =3D BIT(1), /* Hybrid */
> +=09[1] =3D BIT(2), /* Discrete */
> +=09[2] =3D BIT(3), /* Optimus */
> +=09[3] =3D BIT(0), /* UMA */

Please use named defines instead of BIT(x) so you won't need comments=20
anymore.

Are the above BIT(1) | BIT(2) actually same as hybrid & discrete here? In=
=20
that case the naming them with defines makes the connection between them=20
and these array entries much clearer.

> +};
> +
> +static int hp_wmi_get_mux_supported_modes(u8 *supported)
> +{
> +=09u8 buffer[128] =3D { 0 };
> +=09u8 legacy_buffer[4] =3D { 0 };

=3D {}; is enough to initialize to default values (x2).

Please use reverse xmas-tree order.

> +=09u32 req_packet =3D 0;
> +=09int ret;
> +
> +=09if (!supported)
> +=09=09return -EINVAL;
> +
> +=09/* Try modern BIOS design data query (128-byte buffer) */
> +=09ret =3D hp_wmi_perform_query(HPWMI_GET_SYSTEM_DESIGN_DATA, HPWMI_GM,
> +=09=09=09=09   buffer, zero_if_sup(req_packet), sizeof(buffer));
> +
> +=09if (ret =3D=3D 0) {

Please don't leave empty line between call and it's return value check.

> +=09=09*supported =3D buffer[7];
> +=09=09return 0;
> +=09}
> +
> +=09/*
> +=09 * (Fallback): Legacy BIOS behavior based on Omen Gaming Hub.
> +=09 * If the modern query is not supported, check if the MUX query endpo=
int
> +=09 * responds to a read request. If it succeeds, the hardware has MUX
> +=09 * capability but lacks the mode map, defaulting to Hybrid + Discrete=
=2E
> +=09 */
> +=09ret =3D hp_wmi_perform_query(HPWMI_GRAPHICS_MUX_QUERY, HPWMI_READ,
> +=09=09=09=09   legacy_buffer, sizeof(legacy_buffer), 0);
> +
> +=09if (ret =3D=3D 0) {
> +=09=09*supported =3D HPWMI_MUX_LEGACY_MASK;
> +=09=09return 0;
> +=09}
> +
> +=09return ret < 0 ? ret : -EINVAL;

This should probably be split for clarity.

> +}
> +
> +static int hp_wmi_get_mux_mode(u8 *mode)
> +{
> +=09u8 buffer[4] =3D { 0 };
> +=09int ret;
> +
> +=09if (!mode)
> +=09=09return -EINVAL;
> +
> +=09ret =3D hp_wmi_perform_query(HPWMI_GRAPHICS_MUX_QUERY, HPWMI_READ,
> +=09=09=09=09   buffer, sizeof(buffer), sizeof(buffer));
> +
> +=09if (ret)
> +=09=09return ret < 0 ? ret : -EINVAL;

Please split to two ifs.

> +
> +=09/* Mask the highest bit, which might be used as a BIOS status flag */
> +=09*mode =3D buffer[0] & HPWMI_MUX_MODE_MASK;
> +
> +=09return 0;
> +}
> +
> +static int hp_wmi_set_mux_mode(u8 mode)
> +{
> +=09u8 buffer[4] =3D { mode, 0x00, 0x00, 0x00 };
> +=09int ret;
> +
> +=09ret =3D hp_wmi_perform_query(HPWMI_GRAPHICS_MUX_QUERY, HPWMI_WRITE,
> +=09=09=09=09   buffer, sizeof(buffer), sizeof(buffer));
> +
> +=09if (ret)
> +=09=09return ret < 0 ? ret : -EINVAL;
> +
> +=09return 0;
> +}
> +
> +static ssize_t gpu_mux_mode_show(struct device *dev,
> +=09=09=09=09 struct device_attribute *attr,
> +=09=09=09=09 char *buf)
> +{
> +=09u8 mode;
> +=09int ret;
> +
> +=09ret =3D hp_wmi_get_mux_mode(&mode);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%u\n", mode);
> +}
> +
> +static ssize_t gpu_mux_mode_store(struct device *dev,
> +=09=09=09=09  struct device_attribute *attr,
> +=09=09=09=09  const char *buf,
> +=09=09=09=09  size_t count)
> +{
> +=09u32 requested;
> +=09u8 supported;
> +=09int ret;
> +
> +=09ret =3D kstrtou32(buf, 0, &requested);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09if (requested >=3D ARRAY_SIZE(mux_bitmask_map))

Please add include for ARRAY_SIZE().

> +=09=09return -EINVAL;
> +
> +=09ret =3D hp_wmi_get_mux_supported_modes(&supported);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09/* Verify if the requested mode is allowed by the hardware mask */
> +=09if (!(supported & mux_bitmask_map[requested]))
> +=09=09return -EOPNOTSUPP;
> +
> +=09ret =3D hp_wmi_set_mux_mode((u8)requested);

Unnecessary cast.

> +=09if (ret)
> +=09=09return ret;
> +
> +=09return count;
> +}
> +
>  static DEVICE_ATTR_RO(display);
>  static DEVICE_ATTR_RO(hddtemp);
>  static DEVICE_ATTR_RW(als);
>  static DEVICE_ATTR_RO(dock);
>  static DEVICE_ATTR_RO(tablet);
>  static DEVICE_ATTR_RW(postcode);
> +static DEVICE_ATTR_RW(gpu_mux_mode);
> =20
>  static struct attribute *hp_wmi_attrs[] =3D {
>  =09&dev_attr_display.attr,
> @@ -1138,6 +1265,7 @@ static struct attribute *hp_wmi_attrs[] =3D {
>  =09&dev_attr_dock.attr,
>  =09&dev_attr_tablet.attr,
>  =09&dev_attr_postcode.attr,
> +=09&dev_attr_gpu_mux_mode.attr,
>  =09NULL,
>  };
>  ATTRIBUTE_GROUPS(hp_wmi);
>=20

--=20
 i.

--8323328-350241473-1782732115=:1167--
