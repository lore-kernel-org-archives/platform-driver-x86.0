Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3AA27B340
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786601; cv=pass; b=ADBG+T+4TCaQuW4kcNHXjYSgR7mt3fNWs5rquMCXsIBBidot52Pxdy7R5IlQPrvZ4AOFlq7siFTXQMHwBjkcej7MR3ss22BbieOLm32K5ToIc7Sz5E1GYjFjjb8KzMBN189bbIhirdFzBWTFQSVym6MNSWZZTe5W204zKwQEGHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786601; c=relaxed/simple;
	bh=X4gZt18YeVSVHTw+EFpn/T7V/oRMDmdgUoVdrEx1sas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MBZEY7FVB34T1qPgUkQPz1i594BK8SigxrrMX1ClvlfZ6WtiHjiMQH0nUdZ+MFyubEpJzM9hovl6KfaoskGjFpOetbk6qe+2qcogj6v+rQN+aObEUx9fT+1vfQjyBpyikULrVtA4PmOnmhPVCPADQ8ZXR31XPkC8Qdb3BmxJFY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kh0P7UpF; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh0P7UpF"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8c921396e37so106858226d6.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 02:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779786594; cv=none;
        d=google.com; s=arc-20240605;
        b=Xc2svS1Z/hxo5JXkITDRnrShCvAhIgGS4FQxsCqUZ5EPG/eKDGOhwfiq3QjC9iNuq+
         obuIILfughkBmOqBRx4LAl9oqJLbeqa2gs9zux03SlbAS8iy9gp3A3ch840arn+ws4R8
         pCyqxNcIu0SJy+/mGH1fSkRCm6r6BbUvj6n3DwqfMI4QP4fTvJMawwXtD1m9AuDJ0rvy
         yFNDt1EdEk1IUg7EjJ7VpFgLQDhKigUkEpeHeD9S2m4R8YO6aCA6fU0dPIIdkKXJSAfx
         RDljgOT5b/Y5g8mDgngdhF6Yi2MgGBS39hLbofyo2Hzvmy5tQ8FU3NW8Zxs6LGdLa124
         wtlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iMKWTbKY6Ip+PrNst3qsO5Ji04oV/zxnnXE7/OqaoHs=;
        fh=UzkwNZgM2EVzAwAlu/S0CkQm56kdOoj1ij+UEDsKlTQ=;
        b=BnDpsuXCAWJW3+isT/1mwHGrj4K22DwiZ66BJwPlilMjDkHbkxVhsMsfIlxeKSr/ZI
         IvEh8LQ82Zcad38YNOY2rW2UgBaZ7wuNVU8OuZPePo/oMRUbR2ZWB8NdadQSogt8kYo8
         e6Encd7iewIf/skjz73cxvVc4CDc+MSpt1e8yo6GV9GOMifEuvWAcXCAXEEZkkQQWR1x
         3sgpvRX02MKTHaiRzdEcBhKb4ODSbNhfioUnk0MWKG2J3cFk5nARJShi0E7NwfLWyHs6
         3t+Xq1MNZP9LR0ipwV4nXFI4DC8dBtqBiH74PAgLaOlkaXczHxC483pwTntQWxvGdLQd
         InzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779786594; x=1780391394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMKWTbKY6Ip+PrNst3qsO5Ji04oV/zxnnXE7/OqaoHs=;
        b=Kh0P7UpF9LcCFPwuJR+JvlE+KmZLMKXFY03q52yhID9FDSuGUW7IhpwXP97oGtBSwv
         2qHcqPcGbZ1D7rS9Ger/yBRYO4vG71bxjeYQLV/8sbu92PxqLiWK+zwz8I1gCgPSRZDK
         vfmg0mRu9thqZMDm5MRqlURqxgm2EQBjAQMFwbYf3voPjXDBAPi8glBNmk0rqCQo0Oc0
         a9ZN8K20TeS8E8QMUaQkacj6iNTrOeLQcG8OPS/OSrRJo2PDGCn5ieMuXPr9WU8yPiOM
         TsXVh8l4TGW1GI6M7E5Ho0alt3TPr+2R+jx4zxvxBkr6iUQ9kbVcljZBw+hOZL5cxOF0
         ovvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779786594; x=1780391394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iMKWTbKY6Ip+PrNst3qsO5Ji04oV/zxnnXE7/OqaoHs=;
        b=XxVeg5rbIyqiu+NWVH52VQAQftQltEQPx0FkHotnprza7s4J9ssw2JK6rGmW/6g/kR
         SX9uus8Nn1S6Yvt/1dECdc0NVLjLXZKUyCZi5kYy7PKgKgieLdwJ4DQAMO8D7/DRj4pN
         XUgo4R10tTbqEg1cIQWGXWUljklz8nri5ZAFqg7+TQsEkl0Bw109FItpxloPyQaL23fT
         pjKE0qvUOc4Yazmab7dw6+6/qTdQPg0P5GNUGC0ES5UdIkci27exd7kaChlQDL7mE+KG
         ZHuSQ6pzJW/iAIMlUqaKfvzCwtdvoXR8gqjGsPCtlGnmcJAGVNCg9xpVOBAM2JzlT1+u
         9AUw==
X-Forwarded-Encrypted: i=1; AFNElJ/kPaR2+mv05u3SMQny2O/4JGFoDVT0l4Z9jkUp8QThuTTaYcxtE+nVZvxlIQ8XcH880Q5M2254PROr3MVzvJ1rf2Fz@vger.kernel.org
X-Gm-Message-State: AOJu0YxpCTFvnoJ9OyrBHrXL0I7B3654vqEyFseB8RZehbWlwLyWoVFL
	xPXkNu2UQPqJk61obj/GoCBV1ApoMheF0rkBtWERBHS55LvFTQ/f10l3jSSz0EdyoHvstW1mpMH
	Ds2UM0Qr2xMg024fxosGT0QFFDuejmFE=
X-Gm-Gg: Acq92OExUq1fu1PtujiSIq5uGnMWpXQj783WpFW6j9Tqgr+lVBUFW66k0Qdg+5weVE0
	zI03o1wYmIqLUaaayCi1veNWwXDsLhBjD1fMbpRmrc0u+lBp1+ln425QxBbN11XI8pNrBWfIf37
	p8tMoOP98yZ/0OJlCE2gQQuMzg6mFZ2hsK2zPCgj1WVSdv+fxH7E5sWhG5/61iRaKJSlQAN7wuI
	XJC0SEc8kSaj6ZHsKyxfcGUehw8eY07/VtUVk0eEn2fVV/IorCFaYoZFV9X3B6cgfL7hAtou15I
	yK1Ph2z/tY7ToBzFKaRhXetzHfdH9wr+pqbGlIyc
X-Received: by 2002:ad4:574d:0:b0:8cc:ccb:48d6 with SMTP id
 6a1803df08f44-8cc7b5c497fmr299302146d6.32.1779786593576; Tue, 26 May 2026
 02:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524121510.36961-1-2minesweeper2@gmail.com>
 <CAB3uXr7aFrHfn-6m7Hg+_jfY2YmTtHRfMegzZYk6Vn1zsKDq1Q@mail.gmail.com>
 <CALOxGBVJzk4GX2xrG3N1Djy1UZhMXMdcYKeJQuBqcf289SO32w@mail.gmail.com> <9c59fb4a-542d-ec13-664e-903ef614a358@linux.intel.com>
In-Reply-To: <9c59fb4a-542d-ec13-664e-903ef614a358@linux.intel.com>
From: Superstes <2minesweeper2@gmail.com>
Date: Tue, 26 May 2026 14:09:41 +0500
X-Gm-Features: AVHnY4IL_ykrrD5Auo3J4xDiVkP9X2vtzhVcKNbxeSGye1R3HZFrAxLBPYca2ZQ
Message-ID: <CALOxGBWEh=9kXGKwx0o-hRGAEhYF_vYZAxVxQvQSN3F-9MpJbw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: huawei-wmi: add ACPI fallback for Fn-lock
 on newer models
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Ayman Bagabas <ayman.bagabas@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>> Do you mean you'd want to serialize .probe()s of those devices?
I don't really know how to fix this by now, I think serializing i2c
devices initialization can help.
It should be well tested(booting, waking from sleep\hibernation) to
confirm that just serializing works, maybe other workarounds should be
used.

=D0=B2=D1=82, 26 =D0=BC=D0=B0=D1=8F 2026=E2=80=AF=D0=B3. =D0=B2 13:58, Ilpo=
 J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>:
>
> On Tue, 26 May 2026, Superstes wrote:
>
> > >> Thank you for working on this. Could you open an issue and/or send a=
 PR
> > to https://github.com/aymanbagabas/Huawei-WMI ?
> > Yes, I can send PR in the next two-three days.
> > >> This is very specific to the FLMH-XX model. Can you confirm this is =
the case for
> > other newer models?No, it is the latest model in the Matebook 14 series=
, I've just
> > bought it recently and faced multiple issues, which I try to resolve. I=
 can't found
> > any information about that issues from another users, but i think that =
it can be
> > related with other recent laptop based on Intel Core Ultra processors, =
it will be
> > good to have someone with following models:
> > MateBook Fold (2025)
> > MateBook X Pro (2024)
> > MateBook GT 14 (2024)
> > MateBook D 14 (2024)
> > >> Wouldn't it be better to put this behavior behind a quirk instead of=
 enforcing it
> > on the whole module?
> > I haven't found a better place to make such changes. But you can sugges=
t something.
> > But I think that my workaround is safe because it calls very specific A=
CPI objects
> > and uses default fallbacks.
> >
> > By the way, maybe You, or Ilpo knows a good place to implement board sp=
ecific i2c
> > acpi fixes? It Looks like there is a race condition situation which lea=
ds to
> > arbitration loss when kernel tries to initialize multiple devices on th=
e i2c bus. To
> > fix this I've disabled light sensor and made systemd service to remove =
and enable
> > the i2c_hid_acpi module, but I haven't found a place where to implement=
 a quirk that
> > fixes that issue.
>
> Do you mean you'd want to serialize .probe()s of those devices?
>
> --
>  i.
>
> > =D0=BF=D0=BD, 25 =D0=BC=D0=B0=D1=8F 2026=E2=80=AF=D0=B3. =D0=B2 23:38, =
Ayman Bagabas <ayman.bagabas@gmail.com>:
> >       >
> >       > Newer Huawei laptops (e.g. FLMH-XX / MateBook 14 2024) no longe=
r
> >       support
> >       > the legacy WMI interface for Fn-lock control. Instead, they exp=
ose
> >       direct
> >       > ACPI methods \GFRS and \SFRS (Get/Set Fn key Reversal Status) w=
hich
> >       > communicate with the EC via registers 0x6B (read) and 0x6C (wri=
te).
> >       >
> >       > Add huawei_acpi_fn_lock_get() and huawei_acpi_fn_lock_set() hel=
pers
> >       that
> >       > use acpi_evaluate_object() to call these methods. Both
> >       > huawei_wmi_fn_lock_get() and huawei_wmi_fn_lock_set() now probe=
 for
> >       > \GFRS/\SFRS via acpi_has_method() first and fall back to the le=
gacy WMI
> >       > path if not present.
> >
> >       Thank you for working on this. Could you open an issue and/or sen=
d a PR
> >       to https://github.com/aymanbagabas/Huawei-WMI ?
> >
> >       >
> >       > Tested on: HUAWEI FLMH-XX (MateBook 14 2024),
> >       > CachyOS (kernel 7.0.9-1-cachyos).
> >       >
> >       > Signed-off-by: Shaposhnikov Daniil <2minesweeper2@gmail.com>
> >       > ---
> >       >  drivers/platform/x86/huawei-wmi.c | 95 +++++++++++++++++++++++=
++++++++
> >       >  1 file changed, 95 insertions(+)
> >       >
> >       > diff --git a/drivers/platform/x86/huawei-wmi.c
> >       b/drivers/platform/x86/huawei-wmi.c
> >       > index 93cca17fdf58..19cd8f1a8e33 100644
> >       > --- a/drivers/platform/x86/huawei-wmi.c
> >       > +++ b/drivers/platform/x86/huawei-wmi.c
> >       > @@ -527,11 +527,101 @@ static void huawei_wmi_battery_exit(stru=
ct
> >       device *dev)
> >       >
> >       >  /* Fn lock */
> >       >
> >       > +/*
> >       > + * Newer Huawei models (e.g. HUAWEI FLMH-XX / MateBook 14 2024=
) use
> >       direct
> >       > + * ACPI methods \GFRS / \SFRS (Get/Set Fn key Reversal Status)=
 to
> >       control
> >       > + * Fn-lock via EC registers 0x6B (read) and 0x6C (write).
> >       > + *
> >       > + * GFRS response buffer layout:
> >       > + *   byte[0] =3D STAT (0 =3D success)
> >       > + *   byte[1] =3D 0x01 (fn-lock off) or 0x02 (fn-lock on)
> >       > + *
> >       > + * SFRS argument layout (CreateByteField(Arg0, 0x02, FRSR)):
> >       > + *   Value is read from byte[2] of the integer argument, so it=
 must be
> >       > + *   passed as (value << 16):
> >       > + *   (1 << 16) =3D fn-lock off (writes 0x55 to EC 0x6C)
> >       > + *   (2 << 16) =3D fn-lock on  (writes 0x5A to EC 0x6C)
> >       > + */
> >
> >       This is very specific to the FLMH-XX model. Can you confirm this =
is the
> >       case for other newer models?
> >
> >       > +
> >       > +static int huawei_acpi_fn_lock_get(int *on)
> >       > +{
> >       > +       union acpi_object acpi_arg, *obj;
> >       > +       struct acpi_object_list arg_list =3D { .count =3D 1, .p=
ointer =3D
> >       &acpi_arg };
> >       > +       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, N=
ULL };
> >       > +       acpi_status status;
> >       > +       u8 val;
> >       > +
> >       > +       acpi_arg.type =3D ACPI_TYPE_INTEGER;
> >       > +       acpi_arg.integer.value =3D 0;
> >       > +
> >       > +       status =3D acpi_evaluate_object(NULL, "\\GFRS", &arg_li=
st,
> >       &output);
> >       > +       if (ACPI_FAILURE(status))
> >       > +               return -EIO;
> >       > +
> >       > +       obj =3D output.pointer;
> >       > +       if (!obj || obj->type !=3D ACPI_TYPE_BUFFER || obj->buf=
fer.length
> >       < 2) {
> >       > +               kfree(obj);
> >       > +               return -ENODATA;
> >       > +       }
> >       > +
> >       > +       /* byte[0] =3D STAT (0 =3D success), byte[1] =3D 1 (off=
) or 2 (on) */
> >       > +       if (obj->buffer.pointer[0] !=3D 0) {
> >       > +               kfree(obj);
> >       > +               return -EIO;
> >       > +       }
> >       > +
> >       > +       val =3D obj->buffer.pointer[1];
> >       > +       if (val !=3D 1 && val !=3D 2) {
> >       > +               kfree(obj);
> >       > +               return -ENODATA;
> >       > +       }
> >       > +
> >       > +       if (on)
> >       > +               *on =3D val - 1; /* 1=E2=86=920 (off), 2=E2=86=
=921 (on) */
> >       > +
> >       > +       kfree(obj);
> >       > +       return 0;
> >       > +}
> >       > +
> >       > +static int huawei_acpi_fn_lock_set(int on)
> >       > +{
> >       > +       union acpi_object acpi_arg, *obj;
> >       > +       struct acpi_object_list arg_list =3D { .count =3D 1, .p=
ointer =3D
> >       &acpi_arg };
> >       > +       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, N=
ULL };
> >       > +       acpi_status status;
> >       > +       int ret =3D 0;
> >       > +
> >       > +       /*
> >       > +        * SFRS reads byte[2] of its argument via CreateByteFie=
ld(Arg0,
> >       0x02).
> >       > +        * on=3D0 =E2=86=92 FRSR=3D1 =E2=86=92 EC gets 0x55 (fn=
-lock off)
> >       > +        * on=3D1 =E2=86=92 FRSR=3D2 =E2=86=92 EC gets 0x5A (fn=
-lock on)
> >       > +        */
> >       > +       acpi_arg.type =3D ACPI_TYPE_INTEGER;
> >       > +       acpi_arg.integer.value =3D (u64)(on + 1) << 16;
> >       > +
> >       > +       status =3D acpi_evaluate_object(NULL, "\\SFRS", &arg_li=
st,
> >       &output);
> >       > +       if (ACPI_FAILURE(status))
> >       > +               return -EIO;
> >       > +
> >       > +       obj =3D output.pointer;
> >       > +       if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER &&
> >       > +           obj->buffer.length >=3D 1 && obj->buffer.pointer[0]=
 !=3D 0)
> >       > +               ret =3D -EIO;
> >       > +
> >       > +       kfree(obj);
> >       > +       return ret;
> >       > +}
> >       > +
> >       >  static int huawei_wmi_fn_lock_get(int *on)
> >       >  {
> >       >         u8 ret[0x100] =3D { 0 };
> >       >         int err, i;
> >       >
> >       > +       /* Newer models: use direct ACPI \GFRS method */
> >       > +       if (acpi_has_method(NULL, "\\GFRS"))
> >       > +               return huawei_acpi_fn_lock_get(on);
> >
> >       Wouldn't it be better to put this behavior behind a quirk instead
> >       of enforcing it on the whole module? Keep in mind that this is
> >       also used by Honor devices that have the same WMI method.
> >
> >       > +
> >       > +       /* Legacy WMI fallback */
> >       >         err =3D huawei_wmi_cmd(FN_LOCK_GET, ret, 0x100);
> >       >         if (err)
> >       >                 return err;
> >       > @@ -550,6 +640,11 @@ static int huawei_wmi_fn_lock_set(int on)
> >       >  {
> >       >         union hwmi_arg arg;
> >       >
> >       > +       /* Newer models: use direct ACPI \SFRS method */
> >       > +       if (acpi_has_method(NULL, "\\SFRS"))
> >       > +               return huawei_acpi_fn_lock_set(on);
> >       > +
> >       > +       /* Legacy WMI fallback */
> >       >         arg.cmd =3D FN_LOCK_SET;
> >       >         arg.args[2] =3D on + 1; // 0 undefined, 1 off, 2 on.
> >       >
> >       > --
> >       > 2.54.0
> >       >
> >
> >
> >
