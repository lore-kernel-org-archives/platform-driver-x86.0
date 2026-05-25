Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BB9340260;
	Mon, 25 May 2026 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704194; cv=none; b=lQH/axivZNt6TRkRE8r93ABEailMqNh0RK6fsUypUZK6GlQRlXTCszYLiaM9jA0w2QnOsblcX91wLcZdX6OyV75lf/EZ4pfqQEHG1JaP0cPhvvlqG8VAvbWJ4+fjHJhVSzjYgMpi+x6HheE5jvPPEaaja6XoXSNlBiU137ldcTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704194; c=relaxed/simple;
	bh=kXQKyuNoR10/af3/KPUHoHNKiLu3BMVlmqGRhI/Hjsc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=X8GPI6FPbN1ZYcNQ8Xnu1vLbNnt7ipUegtluun7QtZTy7LW5twR8bjIh3t72sQUmPRudvAwsRI0ACV6pAjEGROOubQjAj9enxWGcyC8LE498+55/Fl9B36poAmr79N9DW375FinNEyTJWG1uz1jQOeqdKZ+0Zg/0tmFTRN6Civ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5yOj1pC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5yOj1pC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779704191; x=1811240191;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kXQKyuNoR10/af3/KPUHoHNKiLu3BMVlmqGRhI/Hjsc=;
  b=M5yOj1pC6/FpZklptfe0EUsB8KK35ciYbUS8fVCEkiLE1zclADNQ76fx
   55Zgg5c/B8Nv5Vza+I7LWnzzhBl9cghX4+qTecT/V/TfqBTa6Xl2NWGcG
   OoWntTl0Lwj5qWnv4tGdDH5MDBhWxnUJUNyAGQlJ3iYUhAENp9wt0486T
   Bj/DypnU0MWW7p/Yi/K9rHyE7rgMr0TSi5CQyrztXx7L+Ou+zbFta2zqu
   ZLtk+X1zR3iaUkYRr5JzqMIyeJFIoeCDq2245wCkrvHEHSr/EiOFpSAoW
   EcKTaIDvj3DIyj5ilB0jqMojItJItDO7KVlz8q307ynxwi1+2UyLG6DEJ
   A==;
X-CSE-ConnectionGUID: h5XLsypGS9mpfuH3eCLMRQ==
X-CSE-MsgGUID: +8fA+HQ5T4eeqepmLODSnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80641860"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="80641860"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 03:16:31 -0700
X-CSE-ConnectionGUID: u1sULx+tQJO5PkOu6j4DPw==
X-CSE-MsgGUID: 0n4KQEN1SYOlZli5eLZWlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="238994076"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 03:16:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 25 May 2026 13:16:25 +0300 (EEST)
To: Shaposhnikov Daniil <2minesweeper2@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, ayman.bagabas@gmail.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: huawei-wmi: add ACPI fallback for Fn-lock
 on newer models
In-Reply-To: <20260524121510.36961-1-2minesweeper2@gmail.com>
Message-ID: <22a07bfe-5c60-82be-9d4a-56ff2a29bdba@linux.intel.com>
References: <20260524121510.36961-1-2minesweeper2@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1521604307-1779704185=:1159"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1521604307-1779704185=:1159
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 24 May 2026, Shaposhnikov Daniil wrote:

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
>  drivers/platform/x86/huawei-wmi.c | 95 +++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>=20
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/hua=
wei-wmi.c
> index 93cca17fdf58..19cd8f1a8e33 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -527,11 +527,101 @@ static void huawei_wmi_battery_exit(struct device =
*dev)
> =20
>  /* Fn lock */
> =20
> +/*
> + * Newer Huawei models (e.g. HUAWEI FLMH-XX / MateBook 14 2024) use dire=
ct
> + * ACPI methods \GFRS / \SFRS (Get/Set Fn key Reversal Status) to contro=
l
> + * Fn-lock via EC registers 0x6B (read) and 0x6C (write).
> + *
> + * GFRS response buffer layout:
> + *   byte[0] =3D STAT (0 =3D success)
> + *   byte[1] =3D 0x01 (fn-lock off) or 0x02 (fn-lock on)
> + *
> + * SFRS argument layout (CreateByteField(Arg0, 0x02, FRSR)):
> + *   Value is read from byte[2] of the integer argument, so it must be
> + *   passed as (value << 16):
> + *   (1 << 16) =3D fn-lock off (writes 0x55 to EC 0x6C)
> + *   (2 << 16) =3D fn-lock on  (writes 0x5A to EC 0x6C)
> + */
> +
> +static int huawei_acpi_fn_lock_get(int *on)
> +{
> +=09union acpi_object acpi_arg, *obj;
> +=09struct acpi_object_list arg_list =3D { .count =3D 1, .pointer =3D &ac=
pi_arg };
> +=09struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +=09acpi_status status;
> +=09u8 val;
> +
> +=09acpi_arg.type =3D ACPI_TYPE_INTEGER;
> +=09acpi_arg.integer.value =3D 0;
> +
> +=09status =3D acpi_evaluate_object(NULL, "\\GFRS", &arg_list, &output);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +
> +=09obj =3D output.pointer;

You must use __free() here to avoid duplicating kfree() (move the=20
variable declaration mid-function).

> +=09if (!obj || obj->type !=3D ACPI_TYPE_BUFFER || obj->buffer.length < 2=
) {
> +=09=09kfree(obj);
> +=09=09return -ENODATA;
> +=09}
> +
> +=09/* byte[0] =3D STAT (0 =3D success), byte[1] =3D 1 (off) or 2 (on) */
> +=09if (obj->buffer.pointer[0] !=3D 0) {
> +=09=09kfree(obj);
> +=09=09return -EIO;
> +=09}
> +
> +=09val =3D obj->buffer.pointer[1];
> +=09if (val !=3D 1 && val !=3D 2) {

These magic literals should be replaced with using named defines.

> +=09=09kfree(obj);
> +=09=09return -ENODATA;
> +=09}
> +
> +=09if (on)
> +=09=09*on =3D val - 1; /* 1=E2=86=920 (off), 2=E2=86=921 (on) */

This too is unnecessarily cryptic (on a non-performance critical path).

One option would be to convert these two if blocks into a single=20
switch/case. You need to duplicate the if (on) to both case blocks but=20
that doesn't look too bad.

> +
> +=09kfree(obj);
> +=09return 0;
> +}
> +
> +static int huawei_acpi_fn_lock_set(int on)
> +{
> +=09union acpi_object acpi_arg, *obj;
> +=09struct acpi_object_list arg_list =3D { .count =3D 1, .pointer =3D &ac=
pi_arg };
> +=09struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +=09acpi_status status;
> +=09int ret =3D 0;
> +
> +=09/*
> +=09 * SFRS reads byte[2] of its argument via CreateByteField(Arg0, 0x02)=
=2E
> +=09 * on=3D0 =E2=86=92 FRSR=3D1 =E2=86=92 EC gets 0x55 (fn-lock off)
> +=09 * on=3D1 =E2=86=92 FRSR=3D2 =E2=86=92 EC gets 0x5A (fn-lock on)
> +=09 */
> +=09acpi_arg.type =3D ACPI_TYPE_INTEGER;
> +=09acpi_arg.integer.value =3D (u64)(on + 1) << 16;

Please make a named define instead.

The cast looks unnecessary.

> +
> +=09status =3D acpi_evaluate_object(NULL, "\\SFRS", &arg_list, &output);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +
> +=09obj =3D output.pointer;

As with above, please use __free()...

> +=09if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER &&
> +=09    obj->buffer.length >=3D 1 && obj->buffer.pointer[0] !=3D 0)
> +=09=09ret =3D -EIO;

=2E..This can then return immediately.

> +
> +=09kfree(obj);
> +=09return ret;
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
> @@ -550,6 +640,11 @@ static int huawei_wmi_fn_lock_set(int on)
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

--8323328-1521604307-1779704185=:1159--
