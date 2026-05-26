Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1EB35674E;
	Tue, 26 May 2026 08:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785913; cv=none; b=HVE9Im7+fN8ULKFll0b4eAObVqEi5iJ9aYh3QtvLke1Q7o2ubS8YbxcNQpLiGwJEsBObO11uPFMk4DE9bs+ZVjagNMNeweJidez13vq8sB7AkZAOuKNzlb1v1fcnqS8J/R5vLG4xQIObeZ5ENvoZuM19DRQRW1SSQyBsNbVgvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785913; c=relaxed/simple;
	bh=RB0ZP5QJbYWh97+Qrjmr1TsQolTxkgMafC6iByqp9nw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LqbUOI6YQJh38CfhKZobv63wJATc3AEB1CFFjGg5I5u6sOEymeD0GMfw5h4nLHNFvg47AvQftZiqVTR7OW0QAPKoqDmdwWo2VOazJsKKv3YkZJorbBzlbHmi+OZAnhz5O1/wjbhNeBNBTh/oFC0kuIqgGmlGxIUhaJcZ7x5ilvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6Quox4O; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6Quox4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779785908; x=1811321908;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RB0ZP5QJbYWh97+Qrjmr1TsQolTxkgMafC6iByqp9nw=;
  b=g6Quox4Oz3LKMtdZjEccMznH8mGsgeihTI5y4+duswJvjSV+TgO8/O5X
   Pvq69XyObG7YqpbfAtiUOwB6n4SxgMVcWZh+6R+36cve5L+EQP/6KrN+v
   u1dLYuLtK+J9KZRQTSK5WSL2ZFQNuQ7ei5EAwXQVQ83XAwjdsG6p5ziA4
   TAegbk5lXWnFVw7qf9vdUojhGjUXAAw01P3aDan/itB/KTr7DBtvyl5cZ
   hIMJw4MqOJI/ZCI1IWVE2yh4EfBuU7dkeG7uVSIKIF2y2us1kxOHlQMbv
   hlPlmL2AHABHAx497sBK+BLDkIL1M2f6R0dq9q82lY8dHo+mJqnYQCzQ6
   Q==;
X-CSE-ConnectionGUID: PFFN6bp7Q0GkN4iJq5/GUw==
X-CSE-MsgGUID: ES0VDiNuTKavJhq9+mpF2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="106052538"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="106052538"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 01:58:26 -0700
X-CSE-ConnectionGUID: l/1FVcT+S5uToR8+Q4nt4w==
X-CSE-MsgGUID: sMyHnsC3Q+uCghy2zhBd0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="239261836"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.137])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 01:58:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 26 May 2026 11:58:20 +0300 (EEST)
To: Superstes <2minesweeper2@gmail.com>
cc: Ayman Bagabas <ayman.bagabas@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: huawei-wmi: add ACPI fallback for Fn-lock
 on newer models
In-Reply-To: <CALOxGBVJzk4GX2xrG3N1Djy1UZhMXMdcYKeJQuBqcf289SO32w@mail.gmail.com>
Message-ID: <9c59fb4a-542d-ec13-664e-903ef614a358@linux.intel.com>
References: <20260524121510.36961-1-2minesweeper2@gmail.com> <CAB3uXr7aFrHfn-6m7Hg+_jfY2YmTtHRfMegzZYk6Vn1zsKDq1Q@mail.gmail.com> <CALOxGBVJzk4GX2xrG3N1Djy1UZhMXMdcYKeJQuBqcf289SO32w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-841722936-1779785900=:1874"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-841722936-1779785900=:1874
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 26 May 2026, Superstes wrote:

> >> Thank you for working on this. Could you open an issue and/or send a P=
R
> to=C2=A0https://github.com/aymanbagabas/Huawei-WMI=C2=A0?
> Yes, I can send PR in the next two-three days.
> >> This is very specific to the FLMH-XX model. Can you confirm this is th=
e case for
> other newer models?No, it is the latest model in the Matebook 14 series, =
I've just
> bought it recently and faced multiple issues, which I try to resolve. I c=
an't found
> any information about that issues from another users, but i think that it=
 can be
> related with other recent laptop based on Intel Core Ultra processors, it=
 will be
> good to have someone with following models:
> MateBook Fold (2025)
> MateBook X Pro (2024)
> MateBook GT 14 (2024)
> MateBook D 14 (2024)
> >> Wouldn't it be better to put this behavior behind a quirk instead of e=
nforcing it
> on the whole module?
> I haven't found a better place to make such changes. But you can suggest =
something.
> But I think that my workaround is safe because it calls very specific ACP=
I objects
> and uses default fallbacks.
>=20
> By the way, maybe You, or=C2=A0Ilpo knows a good place to implement board=
 specific i2c
> acpi fixes? It Looks like there is a race condition situation which leads=
 to
> arbitration loss when kernel tries to initialize multiple devices on the =
i2c bus. To
> fix this I've disabled light sensor and made systemd service to remove an=
d enable
> the=C2=A0i2c_hid_acpi module, but I haven't found a place where to implem=
ent a quirk that
> fixes that issue.

Do you mean you'd want to serialize .probe()s of those devices?

--
 i.

> =D0=BF=D0=BD, 25 =D0=BC=D0=B0=D1=8F 2026=E2=80=AF=D0=B3. =D0=B2 23:38, Ay=
man Bagabas <ayman.bagabas@gmail.com>:
>       >
>       > Newer Huawei laptops (e.g. FLMH-XX / MateBook 14 2024) no longer
>       support
>       > the legacy WMI interface for Fn-lock control. Instead, they expos=
e
>       direct
>       > ACPI methods \GFRS and \SFRS (Get/Set Fn key Reversal Status) whi=
ch
>       > communicate with the EC via registers 0x6B (read) and 0x6C (write=
).
>       >
>       > Add huawei_acpi_fn_lock_get() and huawei_acpi_fn_lock_set() helpe=
rs
>       that
>       > use acpi_evaluate_object() to call these methods. Both
>       > huawei_wmi_fn_lock_get() and huawei_wmi_fn_lock_set() now probe f=
or
>       > \GFRS/\SFRS via acpi_has_method() first and fall back to the lega=
cy WMI
>       > path if not present.
>=20
>       Thank you for working on this. Could you open an issue and/or send =
a PR
>       to https://github.com/aymanbagabas/Huawei-WMI ?
>=20
>       >
>       > Tested on: HUAWEI FLMH-XX (MateBook 14 2024),
>       > CachyOS (kernel 7.0.9-1-cachyos).
>       >
>       > Signed-off-by: Shaposhnikov Daniil <2minesweeper2@gmail.com>
>       > ---
>       >=C2=A0 drivers/platform/x86/huawei-wmi.c | 95 ++++++++++++++++++++=
+++++++++++
>       >=C2=A0 1 file changed, 95 insertions(+)
>       >
>       > diff --git a/drivers/platform/x86/huawei-wmi.c
>       b/drivers/platform/x86/huawei-wmi.c
>       > index 93cca17fdf58..19cd8f1a8e33 100644
>       > --- a/drivers/platform/x86/huawei-wmi.c
>       > +++ b/drivers/platform/x86/huawei-wmi.c
>       > @@ -527,11 +527,101 @@ static void huawei_wmi_battery_exit(struct
>       device *dev)
>       >
>       >=C2=A0 /* Fn lock */
>       >
>       > +/*
>       > + * Newer Huawei models (e.g. HUAWEI FLMH-XX / MateBook 14 2024) =
use
>       direct
>       > + * ACPI methods \GFRS / \SFRS (Get/Set Fn key Reversal Status) t=
o
>       control
>       > + * Fn-lock via EC registers 0x6B (read) and 0x6C (write).
>       > + *
>       > + * GFRS response buffer layout:
>       > + *=C2=A0 =C2=A0byte[0] =3D STAT (0 =3D success)
>       > + *=C2=A0 =C2=A0byte[1] =3D 0x01 (fn-lock off) or 0x02 (fn-lock o=
n)
>       > + *
>       > + * SFRS argument layout (CreateByteField(Arg0, 0x02, FRSR)):
>       > + *=C2=A0 =C2=A0Value is read from byte[2] of the integer argumen=
t, so it must be
>       > + *=C2=A0 =C2=A0passed as (value << 16):
>       > + *=C2=A0 =C2=A0(1 << 16) =3D fn-lock off (writes 0x55 to EC 0x6C=
)
>       > + *=C2=A0 =C2=A0(2 << 16) =3D fn-lock on=C2=A0 (writes 0x5A to EC=
 0x6C)
>       > + */
>=20
>       This is very specific to the FLMH-XX model. Can you confirm this is=
 the
>       case for other newer models?
>=20
>       > +
>       > +static int huawei_acpi_fn_lock_get(int *on)
>       > +{
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0union acpi_object acpi_arg, *obj;
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct acpi_object_list arg_list =3D =
{ .count =3D 1, .pointer =3D
>       &acpi_arg };
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct acpi_buffer output =3D { ACPI_=
ALLOCATE_BUFFER, NULL };
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_status status;
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_arg.type =3D ACPI_TYPE_INTEGER;
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_arg.integer.value =3D 0;
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D acpi_evaluate_object(NULL,=
 "\\GFRS", &arg_list,
>       &output);
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ACPI_FAILURE(status))
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
IO;
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0obj =3D output.pointer;
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!obj || obj->type !=3D ACPI_TYPE_=
BUFFER || obj->buffer.length
>       < 2) {
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(obj=
);
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
NODATA;
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0}
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* byte[0] =3D STAT (0 =3D success), =
byte[1] =3D 1 (off) or 2 (on) */
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (obj->buffer.pointer[0] !=3D 0) {
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(obj=
);
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
IO;
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0}
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D obj->buffer.pointer[1];
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val !=3D 1 && val !=3D 2) {
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(obj=
);
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
NODATA;
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0}
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (on)
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*on =3D v=
al - 1; /* 1=E2=86=920 (off), 2=E2=86=921 (on) */
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(obj);
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>       > +}
>       > +
>       > +static int huawei_acpi_fn_lock_set(int on)
>       > +{
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0union acpi_object acpi_arg, *obj;
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct acpi_object_list arg_list =3D =
{ .count =3D 1, .pointer =3D
>       &acpi_arg };
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct acpi_buffer output =3D { ACPI_=
ALLOCATE_BUFFER, NULL };
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_status status;
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * SFRS reads byte[2] of its argument=
 via CreateByteField(Arg0,
>       0x02).
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * on=3D0 =E2=86=92 FRSR=3D1 =E2=86=
=92 EC gets 0x55 (fn-lock off)
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * on=3D1 =E2=86=92 FRSR=3D2 =E2=86=
=92 EC gets 0x5A (fn-lock on)
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_arg.type =3D ACPI_TYPE_INTEGER;
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0acpi_arg.integer.value =3D (u64)(on +=
 1) << 16;
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D acpi_evaluate_object(NULL,=
 "\\SFRS", &arg_list,
>       &output);
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ACPI_FAILURE(status))
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
IO;
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0obj =3D output.pointer;
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (obj && obj->type =3D=3D ACPI_TYPE=
_BUFFER &&
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0obj->buffer.length >=3D=
 1 && obj->buffer.pointer[0] !=3D 0)
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -=
EIO;
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(obj);
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;
>       > +}
>       > +
>       >=C2=A0 static int huawei_wmi_fn_lock_get(int *on)
>       >=C2=A0 {
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 ret[0x100] =3D { 0 };
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int err, i;
>       >
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Newer models: use direct ACPI \GFR=
S method */
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (acpi_has_method(NULL, "\\GFRS"))
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return hu=
awei_acpi_fn_lock_get(on);
>=20
>       Wouldn't it be better to put this behavior behind a quirk instead
>       of enforcing it on the whole module? Keep in mind that this is
>       also used by Honor devices that have the same WMI method.
>=20
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Legacy WMI fallback */
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D huawei_wmi_cmd(FN_LOCK_G=
ET, ret, 0x100);
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn err;
>       > @@ -550,6 +640,11 @@ static int huawei_wmi_fn_lock_set(int on)
>       >=C2=A0 {
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0union hwmi_arg arg;
>       >
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Newer models: use direct ACPI \SFR=
S method */
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (acpi_has_method(NULL, "\\SFRS"))
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return hu=
awei_acpi_fn_lock_set(on);
>       > +
>       > +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Legacy WMI fallback */
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arg.cmd =3D FN_LOCK_SET;
>       >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arg.args[2] =3D on + 1; // 0 und=
efined, 1 off, 2 on.
>       >
>       > --
>       > 2.54.0
>       >
>=20
>=20
>=20
--8323328-841722936-1779785900=:1874--
