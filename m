Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09686327BFC;
	Tue, 21 Jul 2026 16:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651961; cv=none; b=h4yu+U9igGRxjbr821+bGnM7WW9JleWXCPL/mvkzBfXs/GR8BJzOd3hE04yhi8CMbyfTu6oL3VGb8XpytM6Vm3SCTepHB/4tdJUBI93Uuy/otemJlTCjLqr3EBUk4nRNGrikOtgZ7sBZ6Q/2xcgPZuJUWe2IeQlIo3xejD20KkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651961; c=relaxed/simple;
	bh=vTeWvJ9NCRM3tiA8R8lY9XmKky97/429Vd7T7V+0VNI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AgwFBYOwKjYjIbK8n3cHeIeXnXQPjXt3kH2PzXaHpUJ0N++rfjwqf5Z2YJ8LOs+RhVD9SYZ/lcJIOWe/6kZmbMhKaVQB2rAJel9VLtwr5HLoYpg/z/231c2E+CdHILwLZEo8EgBGGieDTBhiJUCukqYnVq60ofCWRTCXwf2V1Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWg3fuug; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWg3fuug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784651959; x=1816187959;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vTeWvJ9NCRM3tiA8R8lY9XmKky97/429Vd7T7V+0VNI=;
  b=TWg3fuugCYWwx7RSzZwFnNnXcJ7FjmFuMWPPPkax7WjImZIva0xg3U6I
   Fs6BO0UZAqUqQRPVWkwN1VBlqp2NKVOyxun6/yCTdiDx1ZiLwQzvSQMrW
   n0rF7fcLh5dqzmEScLe7z3Tf7+Kiew1EHpy47Sz48Ztjd9v8k0l3rbWoY
   V478zQR8I+SsD6BfTt7DzcmfEd83O6ttZLHuZmS0NITEawvpidLTr6K21
   NAWYSNIuQ8tM9dhHLMIbVUnEkUG6u/REPurUE27wPA9oj+VDCMiMZJ6gC
   plrzziA6hh7DFXYB4tbCUyoTLhj5gKjznSyM50oJDC+YG3ytvz+BXg5OU
   w==;
X-CSE-ConnectionGUID: Hnq6FXQFSnqEIAK/TBZRUA==
X-CSE-MsgGUID: vmlZg6EIT/a1tPAHIeRaaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85137899"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85137899"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 09:39:18 -0700
X-CSE-ConnectionGUID: WmxurywcT8yEXH2iYtdtZA==
X-CSE-MsgGUID: h2E6XBM6R/yFUfIkYGw7tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="253910727"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 09:39:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 19:39:13 +0300 (EEST)
To: =?UTF-8?Q?K=C3=BCr=C5=9Fat_Abayl=C4=B1?= <hello@kursatabayli.dev>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] platform/x86: hp-wmi: Add GPU MUX switch support
In-Reply-To: <20260711001723.14279-1-hello@kursatabayli.dev>
Message-ID: <c3566dd5-43b7-ffc5-6287-9b9d9c0f0406@linux.intel.com>
References: <20260711001723.14279-1-hello@kursatabayli.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-549302590-1784651953=:1265"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-549302590-1784651953=:1265
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 11 Jul 2026, K=C3=BCr=C5=9Fat Abayl=C4=B1 wrote:

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
> Signed-off-by: K=C3=BCr=C5=9Fat Abayl=C4=B1 <hello@kursatabayli.dev>
> ---
> Changes in v4:
>  - Removed empty lines between function calls and error handling.
>=20
> Changes in v3:
>  - Rebased for the for-next branch (no functional changes).
>=20
> Changes in v2:
>  - Replaced hardcoded bitmask with GENMASK(6, 0).
>  - Added specific defines for MUX modes instead of using raw BIT() macros=
=2E
>  - Initialized arrays with {} instead of { 0 }.
>  - Fixed reverse xmas-tree ordering for local variable declarations.
>  - Removed empty lines between function calls and their return value chec=
ks.
>  - Split ternary operators into standard if-statements for better readabi=
lity.
>  - Added missing <linux/array_size.h> include.
>  - Removed unnecessary cast in hp_wmi_set_mux_mode.
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 134 +++++++++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)
>=20
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/h=
p-wmi.c
> index 34c9b941bdd8..b5486caaec8a 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -14,6 +14,8 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> =20
>  #include <linux/acpi.h>
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
>  #include <linux/cleanup.h>
>  #include <linux/compiler_attributes.h>
>  #include <linux/dmi.h>
> @@ -58,6 +60,12 @@ enum hp_ec_offsets {
>  #define HP_FAN_SPEED_AUTOMATIC=09 0x00
>  #define HP_POWER_LIMIT_DEFAULT=09 0x00
>  #define HP_POWER_LIMIT_NO_CHANGE 0xFF
> +#define HPWMI_MUX_MODE_UMA=09=09BIT(0)
> +#define HPWMI_MUX_MODE_HYBRID=09=09BIT(1)
> +#define HPWMI_MUX_MODE_DISCRETE=09=09BIT(2)
> +#define HPWMI_MUX_MODE_OPTIMUS=09=09BIT(3)
> +#define HPWMI_MUX_MODE_MASK=09=09GENMASK(6, 0)
> +#define HPWMI_MUX_LEGACY_MASK=09=09(HPWMI_MUX_MODE_HYBRID | HPWMI_MUX_MO=
DE_DISCRETE)
> =20
>  #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when=
 zero insize is required
> =20
> @@ -381,6 +389,7 @@ enum hp_wmi_commandtype {
>  =09HPWMI_POSTCODEERROR_QUERY=09=3D 0x2a,
>  =09HPWMI_SYSTEM_DEVICE_MODE=09=3D 0x40,
>  =09HPWMI_THERMAL_PROFILE_QUERY=09=3D 0x4c,
> +=09HPWMI_GRAPHICS_MUX_QUERY=09=3D 0x52,
>  };
> =20
>  struct victus_power_limits {
> @@ -1173,12 +1182,136 @@ static int camera_shutter_input_setup(void)
>  =09return err;
>  }
> =20
> +static const u8 mux_bitmask_map[] =3D {
> +=09[0] =3D HPWMI_MUX_MODE_HYBRID,
> +=09[1] =3D HPWMI_MUX_MODE_DISCRETE,
> +=09[2] =3D HPWMI_MUX_MODE_OPTIMUS,
> +=09[3] =3D HPWMI_MUX_MODE_UMA,
> +};
> +
> +static int hp_wmi_get_mux_supported_modes(u8 *supported)
> +{
> +=09u8 legacy_buffer[4] =3D {};
> +=09u8 buffer[128] =3D {};
> +=09u32 req_packet =3D 0;
> +=09int ret;
> +
> +=09if (!supported)
> +=09=09return -EINVAL;
> +
> +=09/* Try modern BIOS design data query (128-byte buffer) */
> +=09ret =3D hp_wmi_perform_query(HPWMI_GET_SYSTEM_DESIGN_DATA, HPWMI_GM,
> +=09=09=09=09   buffer, zero_if_sup(req_packet), sizeof(buffer));
> +=09if (ret =3D=3D 0) {
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
> +=09if (ret =3D=3D 0) {
> +=09=09*supported =3D HPWMI_MUX_LEGACY_MASK;
> +=09=09return 0;
> +=09}
> +
> +=09if (ret < 0)
> +=09=09return ret;
> +=09return -EINVAL;

Please reverse the logic here so that it's similar to=20
hp_wmi_get_mux_mode(). We try to keep the non-error path on the top-level=
=20
as it will be easier to follow the logic then.

> +}
> +
> +static int hp_wmi_get_mux_mode(u8 *mode)
> +{
> +=09u8 buffer[4] =3D {};
> +=09int ret;
> +
> +=09if (!mode)
> +=09=09return -EINVAL;
> +
> +=09ret =3D hp_wmi_perform_query(HPWMI_GRAPHICS_MUX_QUERY, HPWMI_READ,
> +=09=09=09=09   buffer, sizeof(buffer), sizeof(buffer));
> +=09if (ret < 0)
> +=09=09return ret;
> +=09if (ret > 0)
> +=09=09return -EINVAL;
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
> +=09if (ret < 0)
> +=09=09return ret;
> +=09if (ret > 0)
> +=09=09return -EINVAL;
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
> +=09if (requested >=3D ARRAY_SIZE(mux_bitmask_map))
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
> +=09ret =3D hp_wmi_set_mux_mode(requested);
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
> @@ -1187,6 +1320,7 @@ static struct attribute *hp_wmi_attrs[] =3D {
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

--8323328-549302590-1784651953=:1265--
