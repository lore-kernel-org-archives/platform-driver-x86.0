Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E43404BD0;
	Wed, 10 Jun 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093931; cv=none; b=RHfttx5uXP/XosCVq0yKrktqAkIznelLWBdZUE1SVreTFCd8Cog2c3Ue09i3tbcPtrscQznbWAAZDRU67e7CN44cTqX8+qoYjbedISpPbtNOVWx6SYeAK9itzRCs/ZJwuK0ymNrj9EtiaDPMOxva/jKsd8DvLgzHwIWDt4yReJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093931; c=relaxed/simple;
	bh=QgfhxDPnVNW1Vi5ZYP2jgDZ2QxhcbxcIpoyz7fIvvnc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lKvaZM3GIoEwgGDa3dvzrqKDJ14Jni5CEDffkXCr8dD0Tg5arNis1n6S+Y0zN+HVePvfC1RzzdwfP4Z7Ya7N+PPTvbUiW37gRhRkNxteyTesC8EWMZtD2NLZQU38HPftPksPdX5AWrVK3Nr7tmAevPWfKZThDXBO/E6n5xO2x/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ing1jHyA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ing1jHyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781093928; x=1812629928;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QgfhxDPnVNW1Vi5ZYP2jgDZ2QxhcbxcIpoyz7fIvvnc=;
  b=ing1jHyAK7Mh8FPCxu311f+6PkJoZy/ZYhF20LhMb5rPC44KpKdMfg+Y
   kDh8kABTX0Q+61ij0FGEl9exMccUqn+yAysN5YXhgqxIPiaLj1qLZB8N4
   a9ld7jlwPIz1Kb0HGZfcNlF8ehcF1oDWmaZPqNv9NXdEaBHkVzHI+qsvT
   CqrDYuXRKXF0cJeG2ZQrqx4T+HNAmUAZDlYcwU6HyVmBwIIYgUuWw16JH
   Bja6iz00Bi01wrV4g6v9Bw4369h9m+xzBsFLt7kTnf/o9NOC6yGS/3b9s
   NojTyLbw3bCmKqWbwN9qWMLNOaGVw5t7fa+5w6qxUj9ERIsyA6TqxltqU
   A==;
X-CSE-ConnectionGUID: fV+xBkUtRRKN51M9ucupNA==
X-CSE-MsgGUID: /NF1kPsXR+q07BMzRL7zrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80899417"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="80899417"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 05:18:46 -0700
X-CSE-ConnectionGUID: Y5ADGJCJTe2NLoc1XHqr3A==
X-CSE-MsgGUID: HN4omWSRT9mGzID5BfCsMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="246248038"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 05:18:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 15:18:39 +0300 (EEST)
To: =?KOI8-R?B?68/Oxc7LzyDhzsTSxcog98nL1M/Sz9fJ3g==?= <admin@aquinas.su>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v8] platform/x86: hp-wmi: Add multicolor LED support for
 HP keyboard backlight
In-Reply-To: <Jhl3t35KQoOh1UjBI9iDGA@aquinas.su>
Message-ID: <1f323c53-4328-dd15-2f8d-04b041cc0e6b@linux.intel.com>
References: <9VMMQwZjRUOGJGZr-0_YbA@aquinas.su> <Yum2UkOKSk-F7vHbhPXMxA@aquinas.su> <e1bce5de-34e8-4351-96ae-7edf4379b99b@kernel.org> <Jhl3t35KQoOh1UjBI9iDGA@aquinas.su>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-88954322-1781093919=:1359"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-88954322-1781093919=:1359
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 18 May 2026, =D0=9A=D0=BE=D0=BD=D0=B5=D0=BD=D0=BA=D0=BE =D0=90=D0=
=BD=D0=B4=D1=80=D0=B5=D0=B9 =D0=92=D0=B8=D0=BA=D1=82=D0=BE=D1=80=D0=BE=D0=
=B2=D0=B8=D1=87 wrote:

> >=20
> > I'm afraid the names are still wrong. Your patch results in e.g. :
> >=20
> > hp::kbd_backlight_zone-right
> >=20
> > where as per:
> >=20
> > https://lore.kernel.org/linux-leds/20260504145434.12746-1-johannes.goed=
e@oss
> > .qualcomm.com/
> >=20
> > this should be:
> >=20
> > hp::kbd_zoned_backlight-right
> >=20
> > Regards,
> >=20
> > Hans
> >=20
>=20
> I would like to sincerely apologize for the mistake in understanding the=
=20
> documentation. I received feedback pointing out my error, corrected it=20
> accordingly, but unfortunately, there was still an oversight. After being=
=20
> notified of the second error, I have now thoroughly reviewed everything a=
gain=20
> and made all necessary corrections.
>=20
> I truly appreciate your patience and guidance throughout this process. Yo=
ur=20
> feedback has been extremely helpful in helping me reach the correct=20
> understanding. I am committed to ensuring that all future submissions are=
=20
> fully compliant with the documentation requirements.
>=20
> Thank you for your time and understanding.
>=20
> ---
>=20
> From: Edip Hazuri <edip@medip.dev>
>=20
> Add support for the HP keyboard RGB backlight found on HP OMEN and
> HP Victus laptops. These keyboards expose per-zone RGB control through
> WMI commands.
>=20
> Register multicolor LED class devices for each keyboard zone (up to 4
> zones, depending on the keyboard type). Each zone exposes individual
> red, green, and blue channels via the multicolor LED subsystem.
>=20
> Also hardware-initiated brightness changes (e.g. via the keyboard
> backlight hotkey, mostly fn+f4) are reported.
>=20
> The color data is stored in a 128-byte color table managed by the
> firmware, with RGB values starting at offset 25, packed sequentially
> per zone.
>=20
> Signed-off-by: Konenko Andrey Viktorovich <admin@aquinas.su>
>=20
> ---
>=20
> Changes since v7:
>  - The LED class device names changed to be consistent with the documenta=
tion.
>=20
> Changes since v6:
>  - The LED class device names have been made more consistent with the=20
> documentation, in accordance with patch https://lore.kernel.org/linux-led=
s/
> 20260504145434.12746-1-johannes.goede@oss.qualcomm.com/
> underscores have been replaced with dashes where indicated.
>=20
> Changes since v5:
>  - LED class device names changed from a number to using a descriptive na=
me=20
> for each zone.
>=20
> v4: https://lore.kernel.org/all/20260303084022.7223-3-edip@medip.dev/
>=20
> Changes since v4:
>  - Fix circular dependencies
>=20
> Changes since v3:
>  - Merge the changes into a single commit
>=20
> Changes since v1:
>  - Fix mentioned style errors
>  - Add Kconfig dependencies
>=20
> ---
>=20
>  drivers/platform/x86/hp/Kconfig  |   2 +
>  drivers/platform/x86/hp/hp-wmi.c | 284 ++++++++++++++++++++++++++++++-
>  2 files changed, 285 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kc=
onfig
> index dd51491b9bcd..2a1841cbec76 100644
> --- a/drivers/platform/x86/hp/Kconfig
> +++ b/drivers/platform/x86/hp/Kconfig
> @@ -45,6 +45,8 @@ config HP_WMI
>  =09select INPUT_SPARSEKMAP
>  =09select ACPI_PLATFORM_PROFILE
>  =09select HWMON
> +=09select LEDS_CLASS
> +=09select LEDS_CLASS_MULTICOLOR
>  =09help
>  =09  Say Y here if you want to support WMI-based hotkeys on HP laptops=
=20
> and
>  =09  to read data from WMI such as docking or ambient light sensor=20
> state.
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/h=
p-
> wmi.c
> index d1cc6e7d176c..19da18f68337 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -14,6 +14,7 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> =20
>  #include <linux/acpi.h>
> +#include <linux/array_size.h>
>  #include <linux/cleanup.h>
>  #include <linux/compiler_attributes.h>
>  #include <linux/dmi.h>
> @@ -23,6 +24,8 @@
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/kernel.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
>  #include <linux/limits.h>
>  #include <linux/minmax.h>
>  #include <linux/module.h>
> @@ -57,6 +60,7 @@ enum hp_ec_offsets {
> =20
>  #define HP_FAN_SPEED_AUTOMATIC=09 0x00
>  #define HP_POWER_LIMIT_DEFAULT=09 0x00
> +#define HP_COLOR_TABLE_PADDING=09 25
>  #define HP_POWER_LIMIT_NO_CHANGE 0xFF
> =20
>  #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when=
 zero=20
> insize is required

Long lines in this patch seem corrupted.

--=20
 i.

--8323328-88954322-1781093919=:1359--
