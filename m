Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899DB7081A
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121432; cv=pass; b=A7c86XC7B1/PWO+elqZvlFEWk6HJWifJ1ysZJqkUfctXGs/U0sHQ+mBhZIVd+F1ZVwS5HDMycfnnwBwgYoMBAw+15ZOgJX9sKKbuiYjpm+HldqUmI/IRpNQq6F3ZTRb1C4ZflqZqmEpOJoL4XihCWas3JgRS7UUCErCbR30Os/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121432; c=relaxed/simple;
	bh=5qiXLV4NyMTKC/O0Y9hqZSELopUxxiHBNcQaNyuhBtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o3qyFxxeKnjOPzC8DqWmazWC7BSKvdYu9zhIiLWELJaSrjijzhNWl7tu/nsdUq1JxRW6W5Y6vYt33BxEHgapRwKytA0/19o74F47KcbND3DuD3ECRekmmDdYS0koVJNoJeb1xa+q6wzuLhIurLlJGyWVBcFmDGI9X4bBuzmbZqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Td3TDkxB; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Td3TDkxB"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8de7bfa323bso21128906d6.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 02:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782121427; cv=none;
        d=google.com; s=arc-20240605;
        b=i/1S0AF1Lgulcd3fdyksryVRWZhIV2CYfMJjXrgB4otAeQiJKge8XHkRREl1+YQs0y
         +x+l12I8r4GkQsNoeivOCGOJceGiRqhJHjDVSQ5L6yVcafmxLBKX5J62imva7Ifp7bZq
         63ro7U/bg969gFWjZltW25XtL9dwhcIZB+ZjqTlSzNHQk9z2r//4of6lCPLO9FNTOrkr
         LcQXtrohVxNxq98Fegm2WCkjvmutVKu84V18X+Kkh9F7iov6p+u5N8LNvJ0FCcIfG3DM
         b5GJGmduWFT1GFdKf82soWfUfzvP1hIrAzo4QLPu/OLuW/xwIEb+LdW2bwysJhZcx8v3
         6nhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f6bfUyIxNNwQUBe7WE/mtrdSeMw3/Fhy50vWWDU3MpY=;
        fh=wxpj1dsKt/qzN3KJuTKwMVgfVO2b6yNwXDWmV2qFy4Y=;
        b=TnaA2IltTaqYaKWvuSze/NjC0yp/Yf8HvgtBi7fwhXWQL8wP37kSfb6cm0oSXSq/SS
         s5CQbU73eq/qZrYK4FVzPSG+tv6rRfG13HaaNoYYxo+pb86iaBVAh11PU40eMO70quuq
         dRSslM2MOiu3FogxOGgGA5G0geQX4aQek9ofPPxupfgTG2CFmcTV1n3Fj722qLYt0yFL
         Ovudo+zhpggEUt8DWakrTlkwKndLUNI7VsZ7wvnzmpns7whA0/BqP3RGHUdxdQazaviU
         R3o0s1eycW9y9fT8+/WNH8NvWX42ba/wkrn/ctaUnCOSeHUC/h23CH6ntRCOxEO+yyko
         Ublw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782121427; x=1782726227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6bfUyIxNNwQUBe7WE/mtrdSeMw3/Fhy50vWWDU3MpY=;
        b=Td3TDkxBUFN5nAs+IiO1gbwWjEfNW9YbgiBg6U6vqeyMVusesxn2fKycuKPWdamxbb
         SPoPL/pAjlYUq2pPvxvie9KA/8BgkNKLeXgSiNZhpiGL+2mzZTX8reR4WS+U6vUqDvAV
         UFupsIi8mr/o1CMHPO3oW9tCZEZgM+NwIv7S6Nrf3UboiY660QkN7uezD4EOMevBmI05
         DNhDE5lMQeSgDPXweRjHa6Ce9aJMOzXtNhlV48FW5W/giHoScL34I+/+JzhtvvP5C+Qz
         mbTsluqXVX6TTbgU6+BGrJcqojPaN9jkYb9t+DegaFzxmUWt2mRVxIkHK85iFAGsrugj
         axQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121427; x=1782726227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f6bfUyIxNNwQUBe7WE/mtrdSeMw3/Fhy50vWWDU3MpY=;
        b=XdKIe5dWq4txYhhRJFluloL8N10NlSa25UcV0mjEWAr0oIvhnQGV8/0HdzHvsGQv3L
         jhyW9wWSjka1igcB0zobMrWGc7TvqEhBoDm7XOqoVQV4MHmksQEm7CoJV9WswKn1zSFx
         x99EGQqAocB0KAk0KhO7CUar8rfgRjWZ93Qm2i/7mbgiMH84kOY+LM3RjErPGxOk+bGn
         zOrJJF1mGwNTOShH3Y5G6pjONQzS+BQ0JTxaEgD8QSYbYIXqS68kY+OovfJevuor0mNc
         Dl0Mn1p6KfuQKFuhJSlczhMXvNUJmly243fwPsqlsYQgSCXjXdXT02oXTVFb2G35/+bu
         qH5A==
X-Forwarded-Encrypted: i=1; AHgh+RqRa9f+viU8Up2aVuw2JUaIh7OOOpIRvARMcxWB6WG1sxxWtsmIAKFAmgZ560csYmEiY31OEY7Nc8sYoSBc667ucPjm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlk2nUhHxNJGW86rXu/s6GOewdGgS+9+A6/sygtLKsKW65auYu
	PM0I4cL9slTIzpOeJSqxwBrbQu9Gl1nBSd0QKEwy6M8YsjazmclYxaedHNEcx4rDgtS8mcIOSwn
	JPdmEz6TolYzHjzXbg2xKe4cuU5rIU20=
X-Gm-Gg: AfdE7cn1m58ODwP4Fzu50Es3/pjJiPlR/AtgsFf/UYuztHqQDsb5i+2qtNyaqSFoiaU
	2LDfii30kx+aBilj+hr0xKML/pfeRe17CHWZ7+ibxhOjbFwucpg0DaqqsAQKqmuwtenmaAIj9oF
	VErS91uu6eJwF1vaaKGSV5ZkHecaTJ+1cVHpFIyinMbWDQCKVXpGwAWGJMQlFjWMBg2GgmxPWox
	khM5Gle40I0+U1+yMKp9ye9dWReWapLKqZ6qq1AY2VuA/02Rs8cBsp/D9MyDFTwb8OELrvFjA==
X-Received: by 2002:a05:6214:5099:b0:8ce:9ebe:1dd2 with SMTP id
 6a1803df08f44-8de4014931bmr239604596d6.29.1782121427271; Mon, 22 Jun 2026
 02:43:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524121510.36961-1-2minesweeper2@gmail.com>
 <CAB3uXr7aFrHfn-6m7Hg+_jfY2YmTtHRfMegzZYk6Vn1zsKDq1Q@mail.gmail.com>
 <CALOxGBVJzk4GX2xrG3N1Djy1UZhMXMdcYKeJQuBqcf289SO32w@mail.gmail.com>
 <9c59fb4a-542d-ec13-664e-903ef614a358@linux.intel.com> <CALOxGBWEh=9kXGKwx0o-hRGAEhYF_vYZAxVxQvQSN3F-9MpJbw@mail.gmail.com>
In-Reply-To: <CALOxGBWEh=9kXGKwx0o-hRGAEhYF_vYZAxVxQvQSN3F-9MpJbw@mail.gmail.com>
From: Superstes <2minesweeper2@gmail.com>
Date: Mon, 22 Jun 2026 14:43:36 +0500
X-Gm-Features: AVVi8CfD8FwdbTV-7cdm5SOTKKw-84JeBRjg9SQHPQCzv7HCsuUtWvtA5Tg3C_s
Message-ID: <CALOxGBWVujwNiVm8Hobw88GubXGE7cATtgS4NjUF0AsaStEZvg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: huawei-wmi: add ACPI fallback for Fn-lock
 on newer models
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Ayman Bagabas <ayman.bagabas@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Just wanted to check on the status of the ACPI Fn-lock patch for newer
Huawei models (v3 posted on 2026-05-25).

Has there been any feedback or blockers I should address?

Thanks for your time!


=D0=B2=D1=82, 26 =D0=BC=D0=B0=D1=8F 2026=E2=80=AF=D0=B3. =D0=B2 14:09, Supe=
rstes <2minesweeper2@gmail.com>:
>
> >> Do you mean you'd want to serialize .probe()s of those devices?
> I don't really know how to fix this by now, I think serializing i2c
> devices initialization can help.
> It should be well tested(booting, waking from sleep\hibernation) to
> confirm that just serializing works, maybe other workarounds should be
> used.
>
> =D0=B2=D1=82, 26 =D0=BC=D0=B0=D1=8F 2026=E2=80=AF=D0=B3. =D0=B2 13:58, Il=
po J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>:
> >
> > On Tue, 26 May 2026, Superstes wrote:
> >
> > > >> Thank you for working on this. Could you open an issue and/or send=
 a PR
> > > to https://github.com/aymanbagabas/Huawei-WMI ?
> > > Yes, I can send PR in the next two-three days.
> > > >> This is very specific to the FLMH-XX model. Can you confirm this i=
s the case for
> > > other newer models?No, it is the latest model in the Matebook 14 seri=
es, I've just
> > > bought it recently and faced multiple issues, which I try to resolve.=
 I can't found
> > > any information about that issues from another users, but i think tha=
t it can be
> > > related with other recent laptop based on Intel Core Ultra processors=
, it will be
> > > good to have someone with following models:
> > > MateBook Fold (2025)
> > > MateBook X Pro (2024)
> > > MateBook GT 14 (2024)
> > > MateBook D 14 (2024)
> > > >> Wouldn't it be better to put this behavior behind a quirk instead =
of enforcing it
> > > on the whole module?
> > > I haven't found a better place to make such changes. But you can sugg=
est something.
> > > But I think that my workaround is safe because it calls very specific=
 ACPI objects
> > > and uses default fallbacks.
> > >
> > > By the way, maybe You, or Ilpo knows a good place to implement board =
specific i2c
> > > acpi fixes? It Looks like there is a race condition situation which l=
eads to
> > > arbitration loss when kernel tries to initialize multiple devices on =
the i2c bus. To
> > > fix this I've disabled light sensor and made systemd service to remov=
e and enable
> > > the i2c_hid_acpi module, but I haven't found a place where to impleme=
nt a quirk that
> > > fixes that issue.
> >
> > Do you mean you'd want to serialize .probe()s of those devices?
> >
> > --
> >  i.
> >
> > > =D0=BF=D0=BD, 25 =D0=BC=D0=B0=D1=8F 2026=E2=80=AF=D0=B3. =D0=B2 23:38=
, Ayman Bagabas <ayman.bagabas@gmail.com>:
> > >       >
> > >       > Newer Huawei laptops (e.g. FLMH-XX / MateBook 14 2024) no lon=
ger
> > >       support
> > >       > the legacy WMI interface for Fn-lock control. Instead, they e=
xpose
> > >       direct
> > >       > ACPI methods \GFRS and \SFRS (Get/Set Fn key Reversal Status)=
 which
> > >       > communicate with the EC via registers 0x6B (read) and 0x6C (w=
rite).
> > >       >
> > >       > Add huawei_acpi_fn_lock_get() and huawei_acpi_fn_lock_set() h=
elpers
> > >       that
> > >       > use acpi_evaluate_object() to call these methods. Both
> > >       > huawei_wmi_fn_lock_get() and huawei_wmi_fn_lock_set() now pro=
be for
> > >       > \GFRS/\SFRS via acpi_has_method() first and fall back to the =
legacy WMI
> > >       > path if not present.
> > >
> > >       Thank you for working on this. Could you open an issue and/or s=
end a PR
> > >       to https://github.com/aymanbagabas/Huawei-WMI ?
> > >
> > >       >
> > >       > Tested on: HUAWEI FLMH-XX (MateBook 14 2024),
> > >       > CachyOS (kernel 7.0.9-1-cachyos).
> > >       >
> > >       > Signed-off-by: Shaposhnikov Daniil <2minesweeper2@gmail.com>
> > >       > ---
> > >       >  drivers/platform/x86/huawei-wmi.c | 95 +++++++++++++++++++++=
++++++++++
> > >       >  1 file changed, 95 insertions(+)
> > >       >
> > >       > diff --git a/drivers/platform/x86/huawei-wmi.c
> > >       b/drivers/platform/x86/huawei-wmi.c
> > >       > index 93cca17fdf58..19cd8f1a8e33 100644
> > >       > --- a/drivers/platform/x86/huawei-wmi.c
> > >       > +++ b/drivers/platform/x86/huawei-wmi.c
> > >       > @@ -527,11 +527,101 @@ static void huawei_wmi_battery_exit(st=
ruct
> > >       device *dev)
> > >       >
> > >       >  /* Fn lock */
> > >       >
> > >       > +/*
> > >       > + * Newer Huawei models (e.g. HUAWEI FLMH-XX / MateBook 14 20=
24) use
> > >       direct
> > >       > + * ACPI methods \GFRS / \SFRS (Get/Set Fn key Reversal Statu=
s) to
> > >       control
> > >       > + * Fn-lock via EC registers 0x6B (read) and 0x6C (write).
> > >       > + *
> > >       > + * GFRS response buffer layout:
> > >       > + *   byte[0] =3D STAT (0 =3D success)
> > >       > + *   byte[1] =3D 0x01 (fn-lock off) or 0x02 (fn-lock on)
> > >       > + *
> > >       > + * SFRS argument layout (CreateByteField(Arg0, 0x02, FRSR)):
> > >       > + *   Value is read from byte[2] of the integer argument, so =
it must be
> > >       > + *   passed as (value << 16):
> > >       > + *   (1 << 16) =3D fn-lock off (writes 0x55 to EC 0x6C)
> > >       > + *   (2 << 16) =3D fn-lock on  (writes 0x5A to EC 0x6C)
> > >       > + */
> > >
> > >       This is very specific to the FLMH-XX model. Can you confirm thi=
s is the
> > >       case for other newer models?
> > >
> > >       > +
> > >       > +static int huawei_acpi_fn_lock_get(int *on)
> > >       > +{
> > >       > +       union acpi_object acpi_arg, *obj;
> > >       > +       struct acpi_object_list arg_list =3D { .count =3D 1, =
.pointer =3D
> > >       &acpi_arg };
> > >       > +       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER,=
 NULL };
> > >       > +       acpi_status status;
> > >       > +       u8 val;
> > >       > +
> > >       > +       acpi_arg.type =3D ACPI_TYPE_INTEGER;
> > >       > +       acpi_arg.integer.value =3D 0;
> > >       > +
> > >       > +       status =3D acpi_evaluate_object(NULL, "\\GFRS", &arg_=
list,
> > >       &output);
> > >       > +       if (ACPI_FAILURE(status))
> > >       > +               return -EIO;
> > >       > +
> > >       > +       obj =3D output.pointer;
> > >       > +       if (!obj || obj->type !=3D ACPI_TYPE_BUFFER || obj->b=
uffer.length
> > >       < 2) {
> > >       > +               kfree(obj);
> > >       > +               return -ENODATA;
> > >       > +       }
> > >       > +
> > >       > +       /* byte[0] =3D STAT (0 =3D success), byte[1] =3D 1 (o=
ff) or 2 (on) */
> > >       > +       if (obj->buffer.pointer[0] !=3D 0) {
> > >       > +               kfree(obj);
> > >       > +               return -EIO;
> > >       > +       }
> > >       > +
> > >       > +       val =3D obj->buffer.pointer[1];
> > >       > +       if (val !=3D 1 && val !=3D 2) {
> > >       > +               kfree(obj);
> > >       > +               return -ENODATA;
> > >       > +       }
> > >       > +
> > >       > +       if (on)
> > >       > +               *on =3D val - 1; /* 1=E2=86=920 (off), 2=E2=
=86=921 (on) */
> > >       > +
> > >       > +       kfree(obj);
> > >       > +       return 0;
> > >       > +}
> > >       > +
> > >       > +static int huawei_acpi_fn_lock_set(int on)
> > >       > +{
> > >       > +       union acpi_object acpi_arg, *obj;
> > >       > +       struct acpi_object_list arg_list =3D { .count =3D 1, =
.pointer =3D
> > >       &acpi_arg };
> > >       > +       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER,=
 NULL };
> > >       > +       acpi_status status;
> > >       > +       int ret =3D 0;
> > >       > +
> > >       > +       /*
> > >       > +        * SFRS reads byte[2] of its argument via CreateByteF=
ield(Arg0,
> > >       0x02).
> > >       > +        * on=3D0 =E2=86=92 FRSR=3D1 =E2=86=92 EC gets 0x55 (=
fn-lock off)
> > >       > +        * on=3D1 =E2=86=92 FRSR=3D2 =E2=86=92 EC gets 0x5A (=
fn-lock on)
> > >       > +        */
> > >       > +       acpi_arg.type =3D ACPI_TYPE_INTEGER;
> > >       > +       acpi_arg.integer.value =3D (u64)(on + 1) << 16;
> > >       > +
> > >       > +       status =3D acpi_evaluate_object(NULL, "\\SFRS", &arg_=
list,
> > >       &output);
> > >       > +       if (ACPI_FAILURE(status))
> > >       > +               return -EIO;
> > >       > +
> > >       > +       obj =3D output.pointer;
> > >       > +       if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER &&
> > >       > +           obj->buffer.length >=3D 1 && obj->buffer.pointer[=
0] !=3D 0)
> > >       > +               ret =3D -EIO;
> > >       > +
> > >       > +       kfree(obj);
> > >       > +       return ret;
> > >       > +}
> > >       > +
> > >       >  static int huawei_wmi_fn_lock_get(int *on)
> > >       >  {
> > >       >         u8 ret[0x100] =3D { 0 };
> > >       >         int err, i;
> > >       >
> > >       > +       /* Newer models: use direct ACPI \GFRS method */
> > >       > +       if (acpi_has_method(NULL, "\\GFRS"))
> > >       > +               return huawei_acpi_fn_lock_get(on);
> > >
> > >       Wouldn't it be better to put this behavior behind a quirk inste=
ad
> > >       of enforcing it on the whole module? Keep in mind that this is
> > >       also used by Honor devices that have the same WMI method.
> > >
> > >       > +
> > >       > +       /* Legacy WMI fallback */
> > >       >         err =3D huawei_wmi_cmd(FN_LOCK_GET, ret, 0x100);
> > >       >         if (err)
> > >       >                 return err;
> > >       > @@ -550,6 +640,11 @@ static int huawei_wmi_fn_lock_set(int on=
)
> > >       >  {
> > >       >         union hwmi_arg arg;
> > >       >
> > >       > +       /* Newer models: use direct ACPI \SFRS method */
> > >       > +       if (acpi_has_method(NULL, "\\SFRS"))
> > >       > +               return huawei_acpi_fn_lock_set(on);
> > >       > +
> > >       > +       /* Legacy WMI fallback */
> > >       >         arg.cmd =3D FN_LOCK_SET;
> > >       >         arg.args[2] =3D on + 1; // 0 undefined, 1 off, 2 on.
> > >       >
> > >       > --
> > >       > 2.54.0
> > >       >
> > >
> > >
> > >
