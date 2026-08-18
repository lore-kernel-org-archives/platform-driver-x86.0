Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F88821255A
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 00:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787014301; cv=pass; b=MmYmsJPCR9P9txIKvfjbwf9ZOTl+pPZ2T6frQQy1pMNhxJVhm2s3RayMWWcurDBtvbCJu6MOSUcbLOM1PeqKmKDhW/Fzl71eLr4HBzRfRcxXt8Oh30ZAqn3KxDo3O2QMt+iKg+HTE6FRb2bsug4gJNV6GZ/stMQ6EwKpbwYwT5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787014301; c=relaxed/simple;
	bh=JRaSnpRPmbru0X+AssR0bNaxkfWIjC2/+rqe9T7Yyg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rU1x+t+sZ7GrJwUptspZxzHy3Kggf9MCEWL4+Wij2rD2BVNlZnCCLTYvr9eQv7IAWD9eFHJhH3go/7i43bkNyKtw2Qq8klSwalZOddEqAnSqFsxcHby1adUuaS3V2fYEWTjK2pmoqVYWJx4k02vE/O0Q2avqOfSthZQfieJ6n3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3cvKNm2; arc=pass smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3cvKNm2"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-48a0ca07c38so2497127b6e.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 17:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787014299; cv=none;
        d=google.com; s=arc-20260327;
        b=hhmI/Fryt4F1FxtdYgRfupSMo6SKuWZC2uoZJEYGkoT2s+yzz+tBmba3khP0rmwVzi
         68j2+xVozqFTzi8VMf1uJSmHdlZppi8pH2n55IYvrNan6jog/9T0Sr2E4SLrf9Pd+O8h
         nAfYMd9rC4h2TG9JCwDzNuyZ3wgKTY71cEroT68QqlvMjZj4B8znrOuM0cg5aEF83A1y
         WbBpBwgJffYZ/SUkp3+5PoRLD1YOvI7RHRswFbeQPIXvGDQp7A3VCLajTJQau7bIciQi
         Hn+/I9++aOlVdTYjC9Gsif193lrBnjLDr0/00+b32pG2/LrNggjpT714rZipmYJVeEj4
         AN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hSzEQGQ8BwD+v47rym8e4+l05nqNiumaVytjab1pNCA=;
        fh=Ew0qPtABMG5HBlYIJHtjfnfOzE7eGS0b2DTint8ZhxQ=;
        b=Aech51oKyQOjZ/Tn4Og0wPrR0xHFaQBCcSE7Ho4PEbZf0qaI0bCwse7Hc9h8AWpzw8
         fpDr704yfaMwGq6P5Dm34hS4qJ6M/v157MQBkJkEHkEmyhI7pIlGd6mAh4GoJydir1rL
         UNMFOq82NMu6wx3nrP+xDIeDo4CdkQGPUkDE1LCDrF00GcmrluZlNV7hsx4IgZqTt2F9
         ACGt4lbinDtvXqAx0YX41IC/Z02cBVunXOP+n6I4/SSCoXydBm/wZg/Im9+f0T+6EOsh
         BpaeCePLWhy5Tl0Gd6GPUiJNXuS+DaxjlubTAXpIr0fj7fUephihSPfD1UsZJOoPGheJ
         lcFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787014299; x=1787619099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hSzEQGQ8BwD+v47rym8e4+l05nqNiumaVytjab1pNCA=;
        b=g3cvKNm23pJQiTlSCmooN0cxbymStP8pBtILE+AG+QNSFuRGeRWuEcFZAbbqpy3pwD
         SfMBZe53HZWyQQR/QtSiAbBa9+Axfy++XPSxvvIC0Px7vB1EFgkWHVwRMlrh0/QyIPYF
         MHkZQ9qnkorxx7l2eH/xOMzMBupxxSL/7vdBE76cHIiQ1N7how2faXRO8SCrGaGZwx7u
         AuNcHS7rdQBUh+mZmCe/GNxJyb7038WN2QjYD8rD9Ou4s4h03WyyBC89u5YC11DpyGH6
         9b7Aa01pI2Eo/+fqB3mtGsWKveStsBrRbawOfEXKFsze+F97KFtutIpficDS/EfeMdgb
         7Dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787014299; x=1787619099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSzEQGQ8BwD+v47rym8e4+l05nqNiumaVytjab1pNCA=;
        b=mqCMihzbg0pgMb/lnFDaTtheU8nilssUS8Iotu9x+0hZmWd14+u2cwKSWNseqrfR+7
         mWWPEstazGyx+VG1A4W0joh92Re2hDhJeR73N+z+QlE+0na4npU9qg5O2A2iVzy0304a
         I4sooRya3D5fmEpY9UHJKMqBHIYtxqMaDjUl7Ck64/eeA6cmtHki0pDoy4vLjWYMz3Oi
         P5kmty5UzyH+OTVCtXNMyYutaRP5WOvqUYR0Kcnq/YAmnpmIFJUi2f69IVf5LxD5V6+u
         01fNhhkxYukSih//9ePHj14Noy3HT+MC8sFZJCS5es3UsiX3VFmWiHiGo0xTn/FtVY2/
         OqfA==
X-Forwarded-Encrypted: i=1; AHgh+RoKEK4AeVaD0egrnrFP01Fzio2e6Qlgr7NQ4hVwbqpjRpNvFS7hQ4iSOmTSC+PTsXqr3Gs0GLgpf8rcLS5gG6BSw3Ms@vger.kernel.org
X-Gm-Message-State: AOJu0YyAn5JmQiSnroTv2eMmyyuT+y+/aD1+cD2bOmxwx89o8Z0xWW6N
	garKz8ZWFLtRTsLPRUdWBwyRczb+ZUS9nON8b+M/aASKphZk3iyImXAjmhD8ahjzCnHo6RZMNfB
	gQMJuw/RbUBY4kNvZT1HCtzWSal9qI5po
X-Gm-Gg: AR+sD13mrSO9EVx51oRb1bGijm8pRJfJLpOHDwQxMoyow6JGGTcEjB4veRoj+pu5EY8
	1tSZ1qFeqw7yJwPYWPt0onZiXlzwQV53Scbjr/Q2boP65cS1gvxZ52CWPLqwXtCMFY5pH8b5fdW
	IuhuafVmHLWEKBozESgJNS81tIZrQr/Z9iAXqUIWUbk/AI7vqj9ir/2bK8qffIoUX0p6O2t5vJD
	yIQZuYJLIRY1lUuDYlTBuYl9nrpSS07RmqGEKHyjiPfGfwAJ6XyVBPZ3Ig21XAir22lkFVm2Ezf
	El3VSoMS8RSsJZNeNyfKMKytEUFZahP46ifGNhd6aybZF4hsUtkHtfWCwQleycKDFxDubGywJCp
	TNfl8SnlNbSLJV/Rcb6/qiRloRrYjii2i0LHs
X-Received: by 2002:a05:6808:1907:b0:492:3ed0:9073 with SMTP id
 5614622812f47-4b2973be92fmr4415235b6e.4.1787014298824; Mon, 17 Aug 2026
 17:51:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729222920.6490-1-justinyvar@gmail.com> <20260729235125.1698-1-justinyvar@gmail.com>
 <a7c7611d-1721-407d-a4d3-ec096c5e34e2@gmx.de> <CADkD=u565J=YACh5j8WDiB6kxGrr_2zb+9WpOEQbuYEZBrSGgg@mail.gmail.com>
 <CADkD=u7ADLuLrVcHYGFmy=3j1VDVYhx8+dA4YrJcoObtCqzauQ@mail.gmail.com>
In-Reply-To: <CADkD=u7ADLuLrVcHYGFmy=3j1VDVYhx8+dA4YrJcoObtCqzauQ@mail.gmail.com>
From: Justin Vargas <justinyvar@gmail.com>
Date: Mon, 17 Aug 2026 20:51:27 -0400
X-Gm-Features: AcwNN1VoNQt0F-xeXKhtxv5t2U8rj-EmQLmtv4coeyoVmA9OMlsLaa4HNZiSiUU
Message-ID: <CADkD=u5e7D9WMKU5qmkeNsf-nOtRRQV_TmCENF_V4qd4tptdmg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: acer-wmi: Add support for Acer Nitro ANV15-51
To: Armin Wolf <W_Armin@gmx.de>
Cc: jlee@suse.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the delay - my "about a week" was optimistic, and life got busy w=
ith
other stuff.

Still on it though. The hold-up is getting a Linux install onto this machin=
e
that can actually build and load a module: the live USB route doesn't work
(its kernel and the current repo headers are different versions), and my
dual-boot attempt ran into Acer firmware weirdness with the bootloader.

If you'd rather not sit on the patch, I'm happy for it to go in as tested w=
ith
&quirk_acer_predator_v4, and to send the fan fields as a follow-up patch on=
ce
I can verify them. Otherwise I'll report back once I have results.

Thanks,
Justin

On Fri, Jul 31, 2026 at 3:15=E2=80=AFAM Justin Vargas <justinyvar@gmail.com=
> wrote:
>
> > can you create a custom quirk entry and check if controlling the CPU/GP=
U fans
> > works? For this you need to fill-in the number of CPU/GPU fans inside s=
truct
> > quirk_entry and set "pwm" to "1".
> >
> > I think fo something like "quirk_acer_predator_ph16_72", just without "=
.tubo =3D 1".
>
> Happy to. Based on sensors output with predator_v4=3D1 loaded, this machi=
ne has
> two fans (fan1 and fan2 under acer-isa-0ace), so the quirk would be:
>
> static struct quirk_entry quirk_acer_nitro_anv15_51 =3D {
>     .cpu_fans =3D 1,
>     .gpu_fans =3D 1,
>     .predator_v4 =3D 1,
>     .pwm =3D 1,
> };
>
> On testing: this laptop runs Windows day to day, and my earlier results c=
ame
> from a live USB session, which turns out not to work for loading a self-b=
uilt
> module - the live image's kernel and the current repo headers are differe=
nt
> versions. I'm setting up a persistent Linux install on a separate drive s=
o I
> can build and load a patched module properly, but I've hit some snags the=
re.
>
> So it will likely be about a week before I can report back on fan control=
. If
> you'd rather not wait, I'm equally happy for the patch to go in as tested=
 with
> &quirk_acer_predator_v4, and to follow up with a separate patch adding th=
e fan
> fields once I've verified them.
>
> Either way I'll report back with results rather than leaving it open.
>
> Thanks,
> Justin
>
> On Thu, Jul 30, 2026 at 10:05=E2=80=AFAM Justin Vargas <justinyvar@gmail.=
com> wrote:
> >
> > > can you create a custom quirk entry and check if controlling the CPU/=
GPU fans
> > > works? For this you need to fill-in the number of CPU/GPU fans inside=
 struct
> > > quirk_entry and set "pwm" to "1".
> > >
> > > I think fo something like "quirk_acer_predator_ph16_72", just without=
 ".tubo =3D 1".
> >
> > Sure. The machine has two fans - with predator_v4=3D1 loaded, sensors r=
eports
> > fan1 and fan2 under acer-isa-0ace - so I'll use:
> >
> > static struct quirk_entry quirk_acer_nitro_anv15_51 =3D {
> >     .cpu_fans =3D 1,
> >     .gpu_fans =3D 1,
> >     .predator_v4 =3D 1,
> >     .pwm =3D 1,
> > };
> >
> > One note on timing: this laptop runs Windows day to day and I've been t=
esting
> > from a live USB, so I need to set up an environment that can build and =
load a
> > patched module on the hardware before I can report back on fan control.=
 That
> > may take me a few days, but I'll follow up with results either way, and=
 send a
> > v3 once I can confirm whether PWM control works.
> >
> > Thanks for the quick review,
> > Justin
> >
> >
> > On Thu, Jul 30, 2026 at 5:17=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wro=
te:
> > >
> > > Am 30.07.26 um 01:51 schrieb Justin Vargas:
> > >
> > > > The Acer Nitro ANV15-51 uses the Predator V4 WMI interface for ther=
mal
> > > > profile handling and hardware monitoring, but has no quirk entry, s=
o
> > > > these features are only available when the predator_v4 module param=
eter
> > > > is passed manually.
> > > >
> > > > Add a quirk entry for this model.
> > > >
> > > > Note that this machine does not support the turbo thermal profile: =
its
> > > > supported profiles bitmap (misc setting 0x0A) reads 0x53, and writi=
ng
> > > > PLATFORM_PROFILE_PERFORMANCE is rejected by the firmware. The four
> > > > remaining profiles work as expected.
> > >
> > > Hi,
> > >
> > > can you create a custom quirk entry and check if controlling the CPU/=
GPU fans
> > > works? For this you need to fill-in the number of CPU/GPU fans inside=
 struct quirk_entry
> > > and set "pwm" to "1".
> > >
> > > I think fo something like "quirk_acer_predator_ph16_72", just without=
 ".tubo =3D 1".
> > >
> > > Thanks,
> > > Armin Wolf
> > >
> > > > Assisted-by: Claude:claude-opus-5
> > > > Signed-off-by: Justin Vargas <justinyvar@gmail.com>
> > > > Tested-by: Justin Vargas <justinyvar@gmail.com>
> > > > ---
> > > > v2: Add Assisted-by trailer per
> > > >      Documentation/process/coding-assistants.rst. No change to the =
code.
> > > >
> > > > Tested on an Acer Nitro ANV15-51, BIOS V1.60 (04/08/2026),
> > > > kernel 7.0.11-1-cachyos:
> > > >
> > > >    $ sudo dmidecode -s system-product-name
> > > >    Nitro ANV15-51
> > > >
> > > >    $ sudo modprobe acer_wmi predator_v4=3D1
> > > >    $ cat /sys/firmware/acpi/platform_profile_choices
> > > >    low-power quiet balanced balanced-performance performance
> > > >
> > > > Writing low-power, quiet, balanced and balanced-performance all suc=
ceed
> > > > and audibly change fan behaviour. Writing performance is rejected b=
y the
> > > > firmware, consistent with the supported profiles bitmap (0x0A) read=
ing
> > > > 0x53, i.e. bit 5 (turbo) clear.
> > > >
> > > > hwmon works: sensors reports acer-isa-0ace with fan1 3024 RPM,
> > > > fan2 2685 RPM, temp1 +48.0 C.
> > > >
> > > > The WMI mechanism was cross-checked on Windows, where NitroSense sw=
itches
> > > > profiles via SetGamingMiscSetting with index 0x0B and the same prof=
ile
> > > > values used by this driver.
> > > >
> > > > The analysis and patch were produced with AI assistance (see the
> > > > Assisted-by trailer); all testing was performed by me on the physic=
al
> > > > machine, and I take responsibility for the patch as signed off abov=
e.
> > > >
> > > >   drivers/platform/x86/acer-wmi.c | 9 +++++++++
> > > >   1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86=
/acer-wmi.c
> > > > index e0eaaefb13d..a7290f85166 100644
> > > > --- a/drivers/platform/x86/acer-wmi.c
> > > > +++ b/drivers/platform/x86/acer-wmi.c
> > > > @@ -662,6 +662,15 @@ static const struct dmi_system_id acer_quirks[=
] __initconst =3D {
> > > >               },
> > > >               .driver_data =3D &quirk_acer_nitro_an515_58,
> > > >       },
> > > > +     {
> > > > +             .callback =3D dmi_matched,
> > > > +             .ident =3D "Acer Nitro ANV15-51",
> > > > +             .matches =3D {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-51")=
,
> > > > +             },
> > > > +             .driver_data =3D &quirk_acer_predator_v4,
> > > > +     },
> > > >       {
> > > >               .callback =3D dmi_matched,
> > > >               .ident =3D "Acer Predator PH315-53",
