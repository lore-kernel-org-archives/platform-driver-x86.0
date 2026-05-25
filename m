Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1237335AC13
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 19:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779736943; cv=pass; b=khytIi2c13e/REleDcb/2x7DJzYmSci7Tk3/Kf3K+QI33Su491ex2+XGWLo2qwyTsDhdqVjRc1CEUYGWrbNoj4Iq8pOcxxvsvGFzODUPSgrfZvHFbxW3A7I5gdxQLBlzjD8PassjyNL4zYvBn5NgfyzpVgfILgOTuMzDlNmSgCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779736943; c=relaxed/simple;
	bh=fIanTDjqzwQBASHCMtJOFVx3XklkatpecmT7NSXaz9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fa4fcWoGhOEeAZhpvexxEpc+qGmQbn9xmZytRUwYj2+D8jwvJgaNlbx/2tWfE1iz++3YaIm9gmJ+xefp+mqVqmsJxeks/X2NA1Mc+cfvZH2ENcgbLffqhA7GRLriOSxmEgc3Zaprd+oksvz0CJGKV+wu10V+yvRcw3lFqHHW4eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1RdHJl+; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1RdHJl+"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50fc496c8baso112306051cf.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 12:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779736941; cv=none;
        d=google.com; s=arc-20240605;
        b=Hz1lNJYytPfOt4HTmPtw2vz3ZLRYSqebwSWWmxlHBIVIO+nDhwiw9ubV+8WWrmbt+y
         ypDLgMS4+PXKEcYvcxke+RdcloP7ACbxmYEIl9U2EyD7zyYcc67IFGOmvACYhNIztOeJ
         qC2mztWUr1TJoYDuIjsSU8uz5v5q1B86br14dvpS5OQijb+2JqSNlIRO09yi1riyXQlg
         YIvBWscaG/YYCjJCwmH1EXtI9Q9ZhJRfftuBPJF5/gq+NswUzQ2bYmo0Ac4olSPh/sRe
         mQuGj0ronakC/NI5bSyS1bleFWrvlcVxuVi3Ftb04KiRwmVcSO8vA8CMqqA02e9ydNpk
         ur1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7xIk0DJpacOb0OPqvrMDtd4cQ6AoVr4F+6fkYLqmanQ=;
        fh=5Ytr2WK2kj38MA+t45eOQgr+IXcQNxZ/kQQT0pkjXQw=;
        b=OzDaRbwphZWSbfBcLXhWIyFzZwJbttC7d23aNKmP4GhT3dgTR9+KNUXoLip3ucOCrE
         1yfMHKHu+e01e2M9mk6ABBNz3UJVOzImczaYoKew10OFYVzDwg49LWUFbDllYuIhHceO
         CB87UOmsaGqobBbAT0ZvqGt1MyldSdZerYly2+QFrIwYrVMKUFWxUNDaSba3lDG8w3KX
         SABAzhtyqvYNuJ5C1WXcoj+yuurUTttjbr9tZfRSyBlSl1vOXea0EE/TGNEMl1e/t3V2
         G77eq+rbD33I1gySbosh5whURBZOLJDQAn5UZQtabtu3YHr0MLq53ALE8EKhCBiyVHBs
         45RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779736941; x=1780341741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xIk0DJpacOb0OPqvrMDtd4cQ6AoVr4F+6fkYLqmanQ=;
        b=T1RdHJl+m/+RRK56B0mFRzcyxpWfvz8FFINGwsJwZpXUHNcGHdC9MNJyxN6J9wH5vL
         H7L7R66hJ93LhJ6Yhmdp83nReS7XPBK+77Wlpmk1DXaBIHqs6ndRDX/a9tGkBtu0ZDHT
         JUdz2c3RDIsPh7bEeVyt5arClbG36IjUdsbRhwVMbc/HPk6W5kryw2HpiAyDMeT/z2n8
         syv9FDukBwBbLbK4c6yOiZHF4tRUDBNZIJYacdgPdUmK95cp0rr5I8KI34AqVoaZCrlT
         w+PiVqqlliV9IjWuFgD2lfecolBvYiVRXEpYBpXkD3Jpu5q2HGKzevCIKGcPfTXopklJ
         V6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779736941; x=1780341741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7xIk0DJpacOb0OPqvrMDtd4cQ6AoVr4F+6fkYLqmanQ=;
        b=AJvMp1T9OheSyeoPw1JFYYkorjNNDiR9RtmZH32D2ceVJJ65cNdsvUJiBsex+ofLBN
         tXbgmTkelVrRI0gxybdqYHsT4ZptyDQkKSUYrzEprEu+BhWsUN8O2OgE8UVbrqcKvpZs
         dOSegt3r53OY01m0CzR3skM3Xs1MY17hyFlT4W0DXgWiXakHN7tm4Mq4jp/kfUJpSFgF
         d/rSrX4VJMfO78Jnm+FHUBG/rawjH5pULHLlIOQacCGcvt7igbgJMGhqVjCXG+HVFU76
         +fJZLcrPssm/nm/9uQDV3Epnk0Mt9ZF2PpLDVtXX4XiHLFvazHN3AknDhYZGZ4dq8AVy
         I/SQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9bnPtzuR9vAjVoBC03fTLRo3CFCPCCzimx4lo0P4oBWmQ3AP8bTDkAGmndN87BLk/gaSyfRlxMzg52D0XU+Iwl3vI@vger.kernel.org
X-Gm-Message-State: AOJu0YzVqAVX2Eir9tubmmAztlOaSmRkIvzinu9U2adqbIMNE7PZoDIA
	at+69AhDMsb1eva8UXqHBAklKFLbqmni2yzqUI3tv0eMF+UPAtQyCM1biBxTgtsbh9QEIqjk6Fi
	2b36AIAmBHAA5J0Pcsdn5+4flb7iuYtQ=
X-Gm-Gg: Acq92OHZ5d3VBTUMmu/TWrPtERnhmb1IhxBgrvhbl4whe0svlXBkfYvk/dpW83/Isml
	ynYFZ2qttxHwkps9OGrHEdKHsebrMgHiZ3pWEklv5ueeNOdGH1jJJ5rAlg2QxlLnx67r42LcOh8
	qLUYPx1g89VQVX7q6housxV+sOJYHwYnd/vd7XiPNkhxBaNhYM8zHYktgQWjQWrJKXCBcCd6Tky
	RZffdqd2/l/7WOBbOkBjnAuoM41AEmzzTGbx6xyvLV2ui1xSx6K8+mW36EyRt/+uYuTO80MT+JF
	Y2+Hk24Ta8+ueatApQpTOwD1kuAlu9S0QFVb5hFV
X-Received: by 2002:ac8:5711:0:b0:516:df33:bdb9 with SMTP id
 d75a77b69052e-516df33c1a2mr174589051cf.47.1779736940584; Mon, 25 May 2026
 12:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524121510.36961-1-2minesweeper2@gmail.com> <CAB3uXr7aFrHfn-6m7Hg+_jfY2YmTtHRfMegzZYk6Vn1zsKDq1Q@mail.gmail.com>
In-Reply-To: <CAB3uXr7aFrHfn-6m7Hg+_jfY2YmTtHRfMegzZYk6Vn1zsKDq1Q@mail.gmail.com>
From: Superstes <2minesweeper2@gmail.com>
Date: Tue, 26 May 2026 00:22:08 +0500
X-Gm-Features: AVHnY4L2zViYgEK7nMUyi3a_nuyWf1ajvnjD_GuqsvqFvUXx8GlvjaBNxJMnbWc
Message-ID: <CALOxGBXdvYMSk089kYtL5+_tANHaLAa+paso_BtHByVq8O0qLw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: huawei-wmi: add ACPI fallback for Fn-lock
 on newer models
To: Ayman Bagabas <ayman.bagabas@gmail.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>> Thank you for working on this. Could you open an issue and/or send a PR =
to https://github.com/aymanbagabas/Huawei-WMI ?
Yes, I can send PR in the next two-three days.
>> This is very specific to the FLMH-XX model. Can you confirm this is the =
case for other newer models?
No, it is the latest model in the Matebook 14 series, I've just bought
it recently and faced multiple issues, which I try to resolve. I can't
found any information about that issues from another users, but i
think that it can be related with other recent laptop based on Intel
Core Ultra processors, it will be good to have someone with following
models:
MateBook Fold (2025)
MateBook X Pro (2024)
MateBook GT 14 (2024)
MateBook D 14 (2024)
>> Wouldn't it be better to put this behavior behind a quirk instead of enf=
orcing it on the whole module?
I haven't found a better place to make such changes. But you can
suggest something. But I think that my workaround is safe because it
calls very specific ACPI objects and uses default fallbacks.

By the way, maybe You, or Ilpo knows a good place to implement board
specific i2c acpi fixes? It Looks like there is a race condition
situation which leads to arbitration loss when kernel tries to
initialize multiple devices on the i2c bus. To fix this I've disabled
light sensor and made systemd service to remove and enable the
i2c_hid_acpi module, but I haven't found a place where to implement a
quirk that fixes that issue.


=D0=BF=D0=BD, 25 =D0=BC=D0=B0=D1=8F 2026=E2=80=AF=D0=B3. =D0=B2 23:38, Ayma=
n Bagabas <ayman.bagabas@gmail.com>:
>
> >
> > Newer Huawei laptops (e.g. FLMH-XX / MateBook 14 2024) no longer suppor=
t
> > the legacy WMI interface for Fn-lock control. Instead, they expose dire=
ct
> > ACPI methods \GFRS and \SFRS (Get/Set Fn key Reversal Status) which
> > communicate with the EC via registers 0x6B (read) and 0x6C (write).
> >
> > Add huawei_acpi_fn_lock_get() and huawei_acpi_fn_lock_set() helpers tha=
t
> > use acpi_evaluate_object() to call these methods. Both
> > huawei_wmi_fn_lock_get() and huawei_wmi_fn_lock_set() now probe for
> > \GFRS/\SFRS via acpi_has_method() first and fall back to the legacy WMI
> > path if not present.
>
> Thank you for working on this. Could you open an issue and/or send a PR
> to https://github.com/aymanbagabas/Huawei-WMI ?
>
> >
> > Tested on: HUAWEI FLMH-XX (MateBook 14 2024),
> > CachyOS (kernel 7.0.9-1-cachyos).
> >
> > Signed-off-by: Shaposhnikov Daniil <2minesweeper2@gmail.com>
> > ---
> >  drivers/platform/x86/huawei-wmi.c | 95 +++++++++++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >
> > diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/h=
uawei-wmi.c
> > index 93cca17fdf58..19cd8f1a8e33 100644
> > --- a/drivers/platform/x86/huawei-wmi.c
> > +++ b/drivers/platform/x86/huawei-wmi.c
> > @@ -527,11 +527,101 @@ static void huawei_wmi_battery_exit(struct devic=
e *dev)
> >
> >  /* Fn lock */
> >
> > +/*
> > + * Newer Huawei models (e.g. HUAWEI FLMH-XX / MateBook 14 2024) use di=
rect
> > + * ACPI methods \GFRS / \SFRS (Get/Set Fn key Reversal Status) to cont=
rol
> > + * Fn-lock via EC registers 0x6B (read) and 0x6C (write).
> > + *
> > + * GFRS response buffer layout:
> > + *   byte[0] =3D STAT (0 =3D success)
> > + *   byte[1] =3D 0x01 (fn-lock off) or 0x02 (fn-lock on)
> > + *
> > + * SFRS argument layout (CreateByteField(Arg0, 0x02, FRSR)):
> > + *   Value is read from byte[2] of the integer argument, so it must be
> > + *   passed as (value << 16):
> > + *   (1 << 16) =3D fn-lock off (writes 0x55 to EC 0x6C)
> > + *   (2 << 16) =3D fn-lock on  (writes 0x5A to EC 0x6C)
> > + */
>
> This is very specific to the FLMH-XX model. Can you confirm this is the
> case for other newer models?
>
> > +
> > +static int huawei_acpi_fn_lock_get(int *on)
> > +{
> > +       union acpi_object acpi_arg, *obj;
> > +       struct acpi_object_list arg_list =3D { .count =3D 1, .pointer =
=3D &acpi_arg };
> > +       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> > +       acpi_status status;
> > +       u8 val;
> > +
> > +       acpi_arg.type =3D ACPI_TYPE_INTEGER;
> > +       acpi_arg.integer.value =3D 0;
> > +
> > +       status =3D acpi_evaluate_object(NULL, "\\GFRS", &arg_list, &out=
put);
> > +       if (ACPI_FAILURE(status))
> > +               return -EIO;
> > +
> > +       obj =3D output.pointer;
> > +       if (!obj || obj->type !=3D ACPI_TYPE_BUFFER || obj->buffer.leng=
th < 2) {
> > +               kfree(obj);
> > +               return -ENODATA;
> > +       }
> > +
> > +       /* byte[0] =3D STAT (0 =3D success), byte[1] =3D 1 (off) or 2 (=
on) */
> > +       if (obj->buffer.pointer[0] !=3D 0) {
> > +               kfree(obj);
> > +               return -EIO;
> > +       }
> > +
> > +       val =3D obj->buffer.pointer[1];
> > +       if (val !=3D 1 && val !=3D 2) {
> > +               kfree(obj);
> > +               return -ENODATA;
> > +       }
> > +
> > +       if (on)
> > +               *on =3D val - 1; /* 1=E2=86=920 (off), 2=E2=86=921 (on)=
 */
> > +
> > +       kfree(obj);
> > +       return 0;
> > +}
> > +
> > +static int huawei_acpi_fn_lock_set(int on)
> > +{
> > +       union acpi_object acpi_arg, *obj;
> > +       struct acpi_object_list arg_list =3D { .count =3D 1, .pointer =
=3D &acpi_arg };
> > +       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> > +       acpi_status status;
> > +       int ret =3D 0;
> > +
> > +       /*
> > +        * SFRS reads byte[2] of its argument via CreateByteField(Arg0,=
 0x02).
> > +        * on=3D0 =E2=86=92 FRSR=3D1 =E2=86=92 EC gets 0x55 (fn-lock of=
f)
> > +        * on=3D1 =E2=86=92 FRSR=3D2 =E2=86=92 EC gets 0x5A (fn-lock on=
)
> > +        */
> > +       acpi_arg.type =3D ACPI_TYPE_INTEGER;
> > +       acpi_arg.integer.value =3D (u64)(on + 1) << 16;
> > +
> > +       status =3D acpi_evaluate_object(NULL, "\\SFRS", &arg_list, &out=
put);
> > +       if (ACPI_FAILURE(status))
> > +               return -EIO;
> > +
> > +       obj =3D output.pointer;
> > +       if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER &&
> > +           obj->buffer.length >=3D 1 && obj->buffer.pointer[0] !=3D 0)
> > +               ret =3D -EIO;
> > +
> > +       kfree(obj);
> > +       return ret;
> > +}
> > +
> >  static int huawei_wmi_fn_lock_get(int *on)
> >  {
> >         u8 ret[0x100] =3D { 0 };
> >         int err, i;
> >
> > +       /* Newer models: use direct ACPI \GFRS method */
> > +       if (acpi_has_method(NULL, "\\GFRS"))
> > +               return huawei_acpi_fn_lock_get(on);
>
> Wouldn't it be better to put this behavior behind a quirk instead
> of enforcing it on the whole module? Keep in mind that this is
> also used by Honor devices that have the same WMI method.
>
> > +
> > +       /* Legacy WMI fallback */
> >         err =3D huawei_wmi_cmd(FN_LOCK_GET, ret, 0x100);
> >         if (err)
> >                 return err;
> > @@ -550,6 +640,11 @@ static int huawei_wmi_fn_lock_set(int on)
> >  {
> >         union hwmi_arg arg;
> >
> > +       /* Newer models: use direct ACPI \SFRS method */
> > +       if (acpi_has_method(NULL, "\\SFRS"))
> > +               return huawei_acpi_fn_lock_set(on);
> > +
> > +       /* Legacy WMI fallback */
> >         arg.cmd =3D FN_LOCK_SET;
> >         arg.args[2] =3D on + 1; // 0 undefined, 1 off, 2 on.
> >
> > --
> > 2.54.0
> >
