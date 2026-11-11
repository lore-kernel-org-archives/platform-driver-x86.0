Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794398081;
	b=iJG2rNI9f/jEcl+wx+euNoWcQIdaLazFdvEeUsqnTYDfA9vdVog6MEE3HBvliIGLXrCa
	 oCpwZlOwARHHTzwoXnCigV+J5ywRKDq3O34rgKF5fLx5VLhUn1NPiL2KkzT3QlVwQdZPW
	 fj47n5HVe9frHY6KGFD/i0XmBKFS0BMcB60J8HlodOpBUKHXaopoGj7hdY0MoGPDPsp3m
	 9xMJg8Bauny4fA2xlItso+lKcOt82qzAeTDA+Ev3EEUJ2cLy9MEzO+rJV5Fau00swEW8B
	 EkqKZ/yhxXO12TbBHuCKbjuWBqJzM8HIGAv3zFUdEX0QIEr04XK26BZxBm+PgbSVyXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3fDtt9EOYof3vP0v5Tgg7SMnZKncapnqXHgfIFtFdrQ=;
	b=2ae27emX8EPi38ckNJzk48kltJVJ0h7T4VFuX1UuFMZcNLJCZCblbUfYxY/3o8pISImN
	 FP/rvPPHJsSOSio8ZU3XdIuLrI4E/ya3Mn2uej57lyPQ0DbcOPn2ssvVFqX71Bvzr2mco
	 OIsJK9AtOxP0IGAACNqvJhVQWh29CojhWmF3gFYTQRDO+vOsUqiIUIiK3Qx1KoyNd12Ek
	 mAPfSD0C9FL3rYbUsZh/U4LuCyr6SFVxyFdmQLPILTSgezNlRVhNxva2TWIpGhM++LIM8
	 /eDU8mjenxbTw+D3wUyUZqCuYhaMBL9f33Z6AJk5flnQ8PPP/8ZeRSDI/9yjh+6vfkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R84nuUYx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76E7606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 11:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D76E7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R84nuUYx
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-537548b811aso24440191cf.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 03:54:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794398080; cv=none;
        d=google.com; s=arc-20260327;
        b=n65YNNQW0vz8JQjYKf/6KxAI/Y/jALE/oUnxKfa2bTnMoj4fJ3YGxEAtXY6Bd3fh+Y
         cELf6sfp2ZslqpDr9P1fYR1IHzDW4U8S8nlLoJJHu1ks5mIqzjdcxaZ4EIP6oOZ0gpY/
         ZyqfvMpnHTa76qkI3C+90IcO1LIMNAXOrUTSZlAgpmVmHwAdTIApDHEFGi6JPDhbSuYD
         rIY+DPCqqd7drKduQTsc/6l6k5QRsy8dbUrkmdpkhuk8kAy2LgeOfTN4wQt6rt+yL/nj
         BLH4A5tFhDXyLOUZZhHmGmdsJFIb/nRP/CnWMz3kW9AF/iPo2kPKfU32QioaHxwF3hwT
         k0Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3fDtt9EOYof3vP0v5Tgg7SMnZKncapnqXHgfIFtFdrQ=;
        fh=9CtV9uyKLDLts4R9pFXMGJxa5qrw9azflCs1+nOgaHo=;
        b=fSvrK1W5lnGW8WP9GMh1f3NbinaKrmlkhXRULlZp9NyG3LF6soVbY8jJED3sICCn9H
         zxdRHaM/DnDKuQk3kMvgxigKEEer9XCpO0IPm1mkU9sONNBvkys5QdLfR73n+csxkKHR
         4kFKnZ1wPIH2YTz34+WI3zh4JXv6jXda9vbPsIPgU7xthGZ55+3+BbI4B2KTKieNAcI0
         bAlnYBjk/G6jHY/FGRBMx2j10KhpaCT2B/GaD+BYiw21+wzmgc3rPYky+8eYDMVzfuIY
         d00Zp/vTTnIELQvAbSsSc98PmRS5MasMirvYqDfPmTDBnnD65WQvMPa62INtKJsfDnpV
         A6BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398080; x=1795002880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3fDtt9EOYof3vP0v5Tgg7SMnZKncapnqXHgfIFtFdrQ=;
        b=R84nuUYxsjfMQnpUIuLyWQzZB93b5bing+cEahFmWG7ZB1MCkrs6ocd/cFri5egfg4
         q35JeprtG6/hX1opW31HYjAX1t4LLlSjkJR9xQfTYMC1s2mlGIXeevGB+PbpkZYDwqSb
         iZ3oOT7gr9UhZu2E8rHIXQNHuM97ut24CWRnEKGU1yyze6T1WOA71jkkzAoSAM4Cr+4R
         KNxN4RLU3vlen7V7PQ+zEF8d7Nd7r2iThQnfdCuxIjNbGY3H3KXAfo4oNvgqOd1u6qhE
         rR5iLcktkgttp0VQv8CbtW9rfyuLnKDR7WJjO3BOYwktOEdGjRD/TNoYsheRks7BCp5x
         ALxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398080; x=1795002880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fDtt9EOYof3vP0v5Tgg7SMnZKncapnqXHgfIFtFdrQ=;
        b=v0kMjp+o8NuOttFyD1PHzpDYWHkJCVCYcgv1ms/sGEFce58Zhpiq5ESVCpbc4k0xgC
         3Qcjm5T59L6povYw6iI8cR3G+7V4DgBZ43AfEcQWLccXSm+Ea0+j8qUWa1/QwvBtMjv0
         9wWw+hgOcfqwzUiVWuNWz9jfxX4nf5qF/7W7dv1RJtws/sfCobUWJlPTHRJd/r1CPEBk
         ByuHYJAlFPJyTSz9kWSWh3jO080Xy9EIwaBFX+pt66QjIO2W0fxb4z5PhdHp8vqCX3eu
         fPzFVCbmMucK3u5IFffGA7J+ANm9se30Kgjke7OYl7yPdowEFpDumbYSB4lWbBocrldy
         FX0Q==
X-Forwarded-Encrypted: i=1; AL+hErE5GvqNubqrn8plKcohKr4xW7uReNJt99YOjHnegUPGzGDWC6NrmuUu5lNLpv3LfedH/giusWqpR8wNG8yQ4kqKEjO1@vger.kernel.org
X-Gm-Message-State: APuU4Z9BdjlEg9D1R8c3iT7H+wx9EN3rVIt/Q6acDZ45z7ZbbpkHJ+6L
	DDDQlXpYsspjU8KT3NPoEeyZnski6rFMnEXp/RR970orVzHnI+0aY5NnLMAeAfiDRWLnvsWs2jA
	AGIHk/WJpM8ds9GZTUJUbKiDG8y1R/6zeOO0VHD6Wji85/qA=
X-Gm-Gg: AYBFou3ux/yGhhGeigGVcLRBxFSrwL59F/p5M1/Gus7eqizijeNTSLe408/0/ZL3Hc4
	j+SPXXa7ANCVdZ49rUUPO3ywNvslkcb/Dkcy3Xt3Bv4GqNdiuJhfkge0FWcnYLUjxS8+eO5pjcN
	+eAgcbGL2lcTnG0fNNFU2FMU0x/w4goJGMtyN7bnq+3AqDhLUsccJKzLC7O0kciXrJttc00ZrH5
	KS2/770dR9ASZRz1hBwCHcUtsiWLyuqWyc2w+8zewQd/baAMR0WFyGTRpU4hjl4M3lX/Zfg1zLd
	PfWma+Ds6qFtH2uWjlbv6Q9zVLJqMYoYwL/G8witHoG0UuUMMxFobU/t0toZ3ivN0U7SFQNektQ
	kkns5mK4psVI5O1cZiOaIlYfRaz7OnuzqJxsUQpAyORbBlwAGs5bsZn3+H7g=
X-Received: by 2002:a05:622a:5812:b0:536:71ce:5d53 with SMTP id
 d75a77b69052e-556bfa38b0cmr25662931cf.15.1794398079509; Wed, 11 Nov 2026
 03:54:39 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929134503.17249-1-qby140326@gmail.com> <20260929134503.17249-6-qby140326@gmail.com>
 <20260930015058.3076905-1-uselessfire@gmail.com> <CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com>
 <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com>
 <20261008-tm2307-tm2309-entry-uselessfire@gmail.com> <CAObHBTys45jfPro1PhNBgYVzM7mozMScE56k9Mt9mirmEuCCrA@mail.gmail.com>
 <CAM-sYPoQHZ0vK+MfH-oQk=6h+C=cbmeqcKLoQhviTDsSG4r9bA@mail.gmail.com>
In-Reply-To: <CAM-sYPoQHZ0vK+MfH-oQk=6h+C=cbmeqcKLoQhviTDsSG4r9bA@mail.gmail.com>
From: Martiya Aryan Mehr <martiya.ar@gmail.com>
Date: Wed, 11 Nov 2026 15:24:26 +0330
X-Gm-Features: AclHuK9XNBeeIINtpY_o7A7gxVapDihIqHuoCj1IWlvyKqzhRPFisWvtLLnIOmQ
Message-ID: <CAM-sYPqwjx-TVMUBLt7wRTqqCxCXUn8ZBcZ879eQqjnD513tHQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] platform/x86: bitland-mifs-wmi: Add per-machine
 ops table
To: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>
Cc: Anton Karasev <uselessfire@gmail.com>, qby140326@gmail.com, 
	ilpo.jarvinen@linux.intel.com, hansg@kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Armin Wolf <W_Armin@gmx.de>, ilya.gladyshev@linux.dev, kento@kekto.ru, 
	ericted8810@gmail.com, chris@miget.com, matias.civadda2342001@gmail.com, 
	btx342@gmail.com, wleizc7319@gmail.com, wolf109909@outlook.com, i@rsplwe.com, 
	bozhenpeng93@gmail.com, aleksejirlik@gmail.com, zsanya322@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anton,

I hope you're doing well.

I'm following up on the previous discussions and patches regarding the
"bitland-mifs-wmi" driver and its support for the Xiaomi Redmi Book
Pro 16 2024 (TM2309).

First of all, thank you for the time and effort you've put into
investigating this laptop's firmware and improving the driver. I
really appreciate your work.

I wanted to ask about the current development status and what we can
expect in the coming kernel releases.

I have a few questions:

1. Current development status and upstream integration

How is the development progressing at the moment? Have the relevant
patches been accepted or merged into the upstream Linux kernel, or are
they still under review and development?

Do you have an idea of when these improvements might become available
in stable kernel releases and eventually in Arch Linux's official
kernel packages?

2. Battery charge limit (80% charging protection)

One of the most important features for me is proper battery charge protecti=
on.

Will the driver eventually support the 80% charge limit correctly on
the TM2309, similar to how it works in Windows?

More specifically, will we be able to enable the limit, keep the
battery at approximately 80% while the laptop remains plugged in, and
have charging resume only when the battery level drops below the
firmware's configured threshold?

I'd also like to know whether this feature will be exposed through a
proper Linux interface rather than relying on potentially unsafe WMI
commands.

3. Platform performance profiles

Will all four performance profiles eventually be properly supported on
this laptop?

- Low Power
- Balanced
- Performance (Turbo)
- Max Power (Geek)

Will these profiles work correctly through "power-profiles-daemon" and
the standard KDE power management interface?

I'm particularly interested in whether Turbo will work on both AC
power and battery, and whether Max Power will be available as a
separate, explicitly selectable option.

4. Fan control and hardware monitoring

Are there any plans to investigate proper fan speed monitoring and fan
control, GPU mode, keyboard backlight control, and CPU temperature
reporting on this model?

I understand that some of these features may not be implemented in the
current firmware WMI interface, but I'd like to know whether
alternative methods are being considered.

5. Thermald and CPU power limits

I noticed the discussion about MMIO PL1 and MSR PL1 in the
TM2309/TM2307 reports.

Is this issue being investigated? Can we expect the performance
profiles to apply the correct CPU power limits consistently,
particularly under sustained workloads?

6. Suspend and resume reliability

Are there any known issues with suspend/resume related to the new
profile mappings, particularly the reported problem involving a stale
QFAN value of 0?

Will this be addressed as part of the upcoming patches?

Finally, I want to let you know that I'm happy to help with testing on
my own Redmi Book Pro 16 2024.

If there are patches, test builds, diagnostic commands, logs, or
specific tests that would be useful, I'd be glad to run them and
report the results. I can also test different scenarios on AC power
and battery and provide any required hardware or firmware information.

My goal is to help make Linux work as well as possible on this laptop,
so that we can eventually have a reliable and fully functional
experience without having to rely on Windows for these hardware
features.

Thank you again for your work and for helping improve Linux support
for these Xiaomi laptops.

Best regards,
Martiya

On Wed, Nov 11, 2026 at 3:10=E2=80=AFPM Martiya Aryan Mehr <martiya.ar@gmai=
l.com> wrote:
>
> Hi Anton,
>
> I hope you're doing well.
>
> I'm following up on the previous discussions and patches regarding the "b=
itland-mifs-wmi" driver and its support for the Xiaomi Redmi Book Pro 16 20=
24 (TM2309).
>
> First of all, thank you for the time and effort you've put into investiga=
ting this laptop's firmware and improving the driver. I really appreciate y=
our work.
>
> I wanted to ask about the current development status and what we can expe=
ct in the coming kernel releases.
>
> I have a few questions:
>
> 1. Current development status and upstream integration
>
> How is the development progressing at the moment? Have the relevant patch=
es been accepted or merged into the upstream Linux kernel, or are they stil=
l under review and development?
>
> Do you have an idea of when these improvements might become available in =
stable kernel releases and eventually in Arch Linux's official kernel packa=
ges?
>
> 2. Battery charge limit (80% charging protection)
>
> One of the most important features for me is proper battery charge protec=
tion.
>
> Will the driver eventually support the 80% charge limit correctly on the =
TM2309, similar to how it works in Windows?
>
> More specifically, will we be able to enable the limit, keep the battery =
at approximately 80% while the laptop remains plugged in, and have charging=
 resume only when the battery level drops below the firmware's configured t=
hreshold?
>
> I'd also like to know whether this feature will be exposed through a prop=
er Linux interface rather than relying on potentially unsafe WMI commands.
>
> 3. Platform performance profiles
>
> Will all four performance profiles eventually be properly supported on th=
is laptop?
>
> - Low Power
> - Balanced
> - Performance (Turbo)
> - Max Power (Geek)
>
> Will these profiles work correctly through "power-profiles-daemon" and th=
e standard KDE power management interface?
>
> I'm particularly interested in whether Turbo will work on both AC power a=
nd battery, and whether Max Power will be available as a separate, explicit=
ly selectable option.
>
> 4. Fan control and hardware monitoring
>
> Are there any plans to investigate proper fan speed monitoring and fan co=
ntrol, GPU mode, keyboard backlight control, and CPU temperature reporting =
on this model?
>
> I understand that some of these features may not be implemented in the cu=
rrent firmware WMI interface, but I'd like to know whether alternative meth=
ods are being considered.
>
> 5. Thermald and CPU power limits
>
> I noticed the discussion about MMIO PL1 and MSR PL1 in the TM2309/TM2307 =
reports.
>
> Is this issue being investigated? Can we expect the performance profiles =
to apply the correct CPU power limits consistently, particularly under sust=
ained workloads?
>
> 6. Suspend and resume reliability
>
> Are there any known issues with suspend/resume related to the new profile=
 mappings, particularly the reported problem involving a stale QFAN value o=
f 0?
>
> Will this be addressed as part of the upcoming patches?
>
> Finally, I want to let you know that I'm happy to help with testing on my=
 own Redmi Book Pro 16 2024.
>
> If there are patches, test builds, diagnostic commands, logs, or specific=
 tests that would be useful, I'd be glad to run them and report the results=
. I can also test different scenarios on AC power and battery and provide a=
ny required hardware or firmware information.
>
> My goal is to help make Linux work as well as possible on this laptop, so=
 that we can eventually have a reliable and fully functional experience wit=
hout having to rely on Windows for these hardware features.
>
> Thank you again for your work and for helping improve Linux support for t=
hese Xiaomi laptops.
>
> Best regards,
> Martiya
>
> On Fri, Oct 9, 2026, 1:36=E2=80=AFAM Milo=C5=A1 Vlku <vlku.milos.fun@gmai=
l.com> wrote:
>>
>> Hi Anton,
>>
>> Ran your questions on my TM2307 (kernel 7.2.9, for-next plus Chris's
>> GET-only change).
>>
>> On battery the driver refuses balanced-performance and performance, like
>> you said. But if I write the mode straight to QFAN, both 3 and 4 stick o=
n
>> battery without complaint. So same as your TM2309 - the firmware is fine
>> with it and these boards don't really need the capability check.
>>
>> Fn+K only ever goes 1 -> 3 -> 2. I pressed it around twenty times while
>> watching QFAN and it never landed on 4. So I agree with your mapping:
>> performance should be Turbo (3), and full speed should be max-power so
>> nobody gets it by accident from the desktop slider.
>>
>> You're right about the suspend problem too. My patch didn't handle a
>> stale 0 at all, so it would have broken suspend the same way it did on
>> the TM2426. Reading 0 as balanced makes sense. Thanks for catching that.
>>
>> kb_mode reads back -EIO here on for-next, so your patch should hide it o=
n
>> this board as well. I haven't built your patch yet though, so that's jus=
t
>> the precondition - happy to test it properly if another report helps.
>>
>> Command 0x10 looks the same as yours: subcommand 1 reads SOH1 and 2 is
>> bit 0 of LONL at 0xA4. The only difference is that subcommand 3 compares
>> ADPW against 100 instead of 140. That looks like the most this board can
>> take over USB-C: ADPW reads 100 with the stock 100 W charger on either
>> port, still 100 with a 160 W one, and 0 on battery. The ports report USB
>> PD 2.0, so no EPR. My limit is off (LONL 0, AFBC 100), SOH1 100.
>>
>> One more thing, since you use thermald: with int3400_thermal loaded,
>> thermald --adaptive sets the MMIO PL1 from the GDDV table here too (abou=
t
>> 25/50/90 W), but the CPU still drew 27 W because the MSR PL1 stayed at
>> 28 W. Restarting thermald puts it back to 28 W; profile changes don't.
>> With it opened after thermald starts, sustained load settles around 56 W
>> at 101 C, and balanced at 45 W. Does your MSR PL1 also read 28 W after
>> thermald starts?
>>
>> Happy to do the joint TM2307/TM2309 entry with you once Chris's series i=
s
>> out - either way round is fine. I'll put my Tested-by on Chris's thread
>> rather than here.
>>
>> Thanks,
>> Milos
