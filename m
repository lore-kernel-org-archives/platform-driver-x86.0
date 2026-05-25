Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B782C08C8;
	Mon, 25 May 2026 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779712412; cv=none; b=ErlRTkHKmKUUGZbHS7DngMXAOBgjdtriREPjDfKKO4tx0XRgbtnAy3NAZOo3vHTKT2tmNU8vJqRp4nbvUAgoVHtWbU1f/ejuncgfAPI7ZURWiPkAIe2s9W2HxdlE+3YCqC16ySTfK5G9aPtgPdCpS35oZSPgU54IZEsFLKx4AyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779712412; c=relaxed/simple;
	bh=5sZfpaRD0sc02UqpwsbdbSOi+M900+/0SBc1gPIe5o8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ASiDp8PDZZ6CFVWhMGWvKb8NyMtMEoS6ABOaURBCIT15SCgI/+WlF1T9TpwTR8IlFQKXscRwhHk1n16ecQAwH7dFrBOkbsiYjZC/V48oNmvIxKZ+dlGaHyzoJYTwIgrvr8Y2CaiLRC0FgLzDIwCXBskapqywAxM3O1rfoDws9IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgvrYqwu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgvrYqwu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779712410; x=1811248410;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=5sZfpaRD0sc02UqpwsbdbSOi+M900+/0SBc1gPIe5o8=;
  b=UgvrYqwu/1qMiy983H0V/+jhMW1Yvryi3bx+jy60or8nEoM+g3ipUtGj
   YEpVPeoznIDY5k7/L8q/1lcp6fOoSbxchhlj9RnT0TWTK4G2kDWZjph2B
   D+xg16aaJTlLvM7gVrTFe+A1j9xiBVD/+VYDkHWAFKT++wCFDi2l8m5BM
   9MdI3taHcPZIb9baZNUFNYLFNCLjg/QYyN6rZxtyUMIcO2xND/cnEP4Wn
   ZucuAdirkqx8aB/SdwXNoA35z4Pbl0sb8Lo4DFqdbI9XMEh+yDsKOM6o4
   1xvvCf+nY4BBTfHYR/nsn++YeAtukFXUOstf3h2U6T1qV5DGNEaa5p6NJ
   g==;
X-CSE-ConnectionGUID: i89Cqs41QmKlQmHCJP/S9g==
X-CSE-MsgGUID: HBnwmYpMR12mqCAhA+upRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="97961042"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="97961042"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 05:33:30 -0700
X-CSE-ConnectionGUID: XIxCZRx0TZiQQwic6lF9ZQ==
X-CSE-MsgGUID: VbuGYwvmTuW9qe1Pi7kb4w==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 05:33:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 25 May 2026 15:33:23 +0300 (EEST)
To: Shaposhnikov Daniil <2minesweeper2@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] platform/x86: huawei-wmi: add ACPI fallback for
 Fn-lock on newer models
In-Reply-To: <20260525121738.11354-2-2minesweeper2@gmail.com>
Message-ID: <d6df277b-512e-65f2-dc19-4912f6da55c8@linux.intel.com>
References: <20260524121510.36961-1-2minesweeper2@gmail.com> <20260525121738.11354-1-2minesweeper2@gmail.com> <20260525121738.11354-2-2minesweeper2@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1020946773-1779712007=:1159"
Content-ID: <8f1d5fd1-f43e-f86f-8f26-d58202eecb15@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1020946773-1779712007=:1159
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <e5a56aad-9df6-02af-70c7-b301677305f6@linux.intel.com>

On Mon, 25 May 2026, Shaposhnikov Daniil wrote:

> Newer Huawei laptops (e.g. FLMH-XX / MateBook 14 2024) no longer support
> the legacy WMI interface for Fn-lock control. Instead, they expose direct
> ACPI methods \GFRS and \SFRS (Get/Set Fn key Reversal Status) which
> communicate with the EC via registers 0x6B (read) and 0x6C (write).
>=20
> Add huawei_acpi_fn_lock_get() and huawei_acpi_fn_lock_set() helpers that
> use acpi_evaluate_object() to call these methods. Both
> huawei_wmi_fn_lock_get() and huawei_wmi_fn_lock_set() now probe for
> \GFRS/\SFRS via acpi_has_method() first and fall back to the legacy WMI
> path if not present.
>=20
> Tested on: HUAWEI FLMH-XX (MateBook 14 2024),
> CachyOS (kernel 7.0.9-1-cachyos).
>=20
> Signed-off-by: Shaposhnikov Daniil <2minesweeper2@gmail.com>
> ---
>  drivers/platform/x86/huawei-wmi.c | 98 +++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>=20
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/hua=
wei-wmi.c
> index 93cca17fdf58..006aa31eb777 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -6,6 +6,7 @@
>   */
> =20
>  #include <linux/acpi.h>
> +#include <linux/cleanup.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/dmi.h>
> @@ -527,11 +528,103 @@ static void huawei_wmi_battery_exit(struct device =
*dev)
> =20
>  /* Fn lock */
> =20
> +/* GFRS byte[1] / SFRS byte[2] (FRSR) fn-lock state values */
> +#define FN_LOCK_ACPI_OFF=091
> +#define FN_LOCK_ACPI_ON=09=092
> +
> +/*
> + * Newer Huawei models (e.g. HUAWEI FLMH-XX / MateBook 14 2024) use dire=
ct
> + * ACPI methods \GFRS / \SFRS (Get/Set Fn key Reversal Status) to contro=
l
> + * Fn-lock via EC registers 0x6B (read) and 0x6C (write).
> + *
> + * GFRS response buffer layout:
> + *   byte[0] =3D STAT (0 =3D success)
> + *   byte[1] =3D FN_LOCK_ACPI_OFF (fn-lock off) or FN_LOCK_ACPI_ON (fn-l=
ock on)
> + *
> + * SFRS argument layout (CreateByteField(Arg0, 0x02, FRSR)):
> + *   Value is read from byte[2] of the integer argument, so it must be
> + *   passed as (value << 16):
> + *   (FN_LOCK_ACPI_OFF << 16) =3D fn-lock off (writes 0x55 to EC 0x6C)
> + *   (FN_LOCK_ACPI_ON  << 16) =3D fn-lock on  (writes 0x5A to EC 0x6C)
> + */
> +
> +static int huawei_acpi_fn_lock_get(int *on)
> +{
> +=09union acpi_object acpi_arg;
> +=09struct acpi_object_list arg_list =3D { .count =3D 1, .pointer =3D &ac=
pi_arg };
> +=09struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +=09acpi_status status;
> +
> +=09acpi_arg.type =3D ACPI_TYPE_INTEGER;
> +=09acpi_arg.integer.value =3D 0;
> +
> +=09status =3D acpi_evaluate_object(NULL, "\\GFRS", &arg_list, &output);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +
> +=09union acpi_object *obj __free(kfree) =3D output.pointer;
> +
> +=09if (!obj || obj->type !=3D ACPI_TYPE_BUFFER || obj->buffer.length < 2=
)
> +=09=09return -ENODATA;
> +
> +=09/* byte[0] =3D STAT (0 =3D success), byte[1] =3D fn-lock state */
> +=09if (obj->buffer.pointer[0] !=3D 0)

Could you also name this 0 with a define (it's also used in set side).

> +=09=09return -EIO;
> +
> +=09switch (obj->buffer.pointer[1]) {
> +=09case FN_LOCK_ACPI_OFF:
> +=09=09if (on)
> +=09=09=09*on =3D 0;
> +=09=09break;
> +=09case FN_LOCK_ACPI_ON:
> +=09=09if (on)
> +=09=09=09*on =3D 1;
> +=09=09break;
> +=09default:
> +=09=09return -ENODATA;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int huawei_acpi_fn_lock_set(int on)
> +{
> +=09union acpi_object acpi_arg;
> +=09struct acpi_object_list arg_list =3D { .count =3D 1, .pointer =3D &ac=
pi_arg };
> +=09struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +=09acpi_status status;
> +
> +=09/*
> +=09 * SFRS reads byte[2] of its argument via CreateByteField(Arg0, 0x02)=
=2E
> +=09 * on=3D0 =E2=86=92 FRSR=3DFN_LOCK_ACPI_OFF =E2=86=92 EC gets 0x55 (f=
n-lock off)
> +=09 * on=3D1 =E2=86=92 FRSR=3DFN_LOCK_ACPI_ON  =E2=86=92 EC gets 0x5A (f=
n-lock on)
> +=09 */
> +=09acpi_arg.type =3D ACPI_TYPE_INTEGER;
> +=09acpi_arg.integer.value =3D (on ? FN_LOCK_ACPI_ON : FN_LOCK_ACPI_OFF) =
<< 16;
> +
> +=09status =3D acpi_evaluate_object(NULL, "\\SFRS", &arg_list, &output);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +
> +=09union acpi_object *obj __free(kfree) =3D output.pointer;
> +
> +=09if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER &&
> +=09    obj->buffer.length >=3D 1 && obj->buffer.pointer[0] !=3D 0)

Now that I look this again, is the logic wrong way around here? This=20
results in returning 0 in many of what I'd assume to be error cases.

> +=09=09return -EIO;
> +
> +=09return 0;
> +}
> +
>  static int huawei_wmi_fn_lock_get(int *on)
>  {
>  =09u8 ret[0x100] =3D { 0 };
>  =09int err, i;
> =20
> +=09/* Newer models: use direct ACPI \GFRS method */
> +=09if (acpi_has_method(NULL, "\\GFRS"))
> +=09=09return huawei_acpi_fn_lock_get(on);
> +
> +=09/* Legacy WMI fallback */
>  =09err =3D huawei_wmi_cmd(FN_LOCK_GET, ret, 0x100);
>  =09if (err)
>  =09=09return err;
> @@ -550,6 +643,11 @@ static int huawei_wmi_fn_lock_set(int on)
>  {
>  =09union hwmi_arg arg;
> =20
> +=09/* Newer models: use direct ACPI \SFRS method */
> +=09if (acpi_has_method(NULL, "\\SFRS"))
> +=09=09return huawei_acpi_fn_lock_set(on);
> +
> +=09/* Legacy WMI fallback */
>  =09arg.cmd =3D FN_LOCK_SET;
>  =09arg.args[2] =3D on + 1; // 0 undefined, 1 off, 2 on.
> =20
>=20

--=20
 i.
--8323328-1020946773-1779712007=:1159--
