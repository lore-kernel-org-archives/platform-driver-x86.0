Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793744815;
	b=NvKcJZ28JtmY1n+dutqZ1KibrzI/tWoSaSvKQd+L/Qs8Nwe7qD6PCiUGSLGhSvKTSh71
	 p3dt5kyIdbfBtpTA7iakYKecnbUgXCs8JHEdnafVJp+rUI37KznM45imkyrEXgaObXpYw
	 6VFvJR2vlIbo9pJ5kLFSjPaceOE0O4XWvxJ4PD1+Xuszc87dJTS1dz2/N+pH4KXOgc+8/
	 fonR5oqjH3kZNIzTpsQ9vwKeiWGXxyRiwHQokQcDylsanhNp5g2TR9SX+s9hI44IZwPQt
	 it42l5tWDhUjAeZhlEgwK1JoX11OfWA4842sCdhhLC3pUEqLiFr8iDwPtBWRH5NgjNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=VPvS26x+lHLuX3TRBkRIJS+dA3Xf8oUPR2UAO/1PFvU=;
	b=ZBi+CbsiwgNmvbbMN/RUw+KKNlsWGevDrvt9Ghv5pQthTTKR515tgpPJoR4vG0zDFTVF
	 mu50jksuuSOK/JswYn5UCYomTDVJgbGvtUteVRDna5VoiRiHA/u1TnzrHnVYaYyUT5RvY
	 d/6zvvptVTiSChNqM2T/ivYnBypDxuPE9qSI/fHzdHkER7oI/2y0G+M9qKXhunYUrmPdA
	 z2X6oYDt33+UgzGHjxmSlL9cA3LOIQn1tElCFNHuxuu3dWI1OBu4DiarCdR0FQksQshut
	 tveZbMo42Axji2m396EDE0CGajxbAOK8/BM/egy1hMp6dIXErRnyNz3hj1JTu+YamTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtKHkAKG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76217606A329
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 22:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76217606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtKHkAKG
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e946155442so326475ad.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2026 14:26:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793744815; cv=none;
        d=google.com; s=arc-20260327;
        b=IYxHN2+GC15Ne56lfEhztzS1hd7RTjgN/s/Z6ZylSfGQ3elTeagIPW0wkWwBSiY8jq
         t9zgCpTR6LHIqeQ4Yuk7CzOyG0gssUzdCt5tzNFRxxehekTy4CTkjTYppOTeRigs2TGQ
         9TxGfTWrJ5lmu9yrZU6v2UnMeHsUBFZuHRYfZYUaKZt1gQeGKyg39MEDzVj37xiVgvg9
         5WTE0HGYwDAh9zLov8MUeVmQ7P5nYDN8/IDzK0lMVO9iSicBY6jBBKAWcU34uwEE9cFP
         gLPPH0eXP08MX2zvSBnqSKi+ZzwprXSxlmuOcbCk2RKFMD1uWI+AAJbb5JgRU478OcjI
         76wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VPvS26x+lHLuX3TRBkRIJS+dA3Xf8oUPR2UAO/1PFvU=;
        fh=YLEoDtbKL1aLfhD5tMQScjkJvcBKCkJA6QKs6ZBCyX0=;
        b=Vw+vBx619vhZ5rl/huqq/fR0Dujv53rmbRE3Ok9XJCXqORzRD+OkFY9ju0jc+s+edl
         PVFN+KI9ztNR5tzj312uqars2Y4DsjmalLs+5FpZ7byg8YVWqc1XEolj9NI643Sy92PO
         xm7MUrW/y9Y8yg72JfGmrK7i1cpJxIIXOvKme7QBuIBTKDpZpO44mO6TgKfpgXRspp2J
         OKyFp48OR8/Kd722mTaBGD6e76pawIHtIH+78jvjsFRk8SxYlVdTjVBr+mCMZx/YYI/l
         qVS8ccZG26x83WgRgDNEdQBO6e7pLVQMzlz3+Mgm5dcLwXcAEg7M+nFLx/R1lLhaEYTX
         ABxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744815; x=1794349615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VPvS26x+lHLuX3TRBkRIJS+dA3Xf8oUPR2UAO/1PFvU=;
        b=HtKHkAKGZGF22vltvSgNDJMx+njQ/YdU48DTzlWsycT+pLvAp3t3eGo5wmvgw/4rKI
         ADANntrtWW07+YD/t2WmdVFd7MtWeSBeoISFFvscnrVIYnPOfNJ+bNGbvUn781TlLiS/
         q8AoLyUrwe5hvU3F64MWdhK8rYjnwpq6fqjgTTPjxt93+lCKupxxfAKNkgeqeedrc9Gf
         njyXtx1ZpbqntQGhj/bLGAVFbQcAk0a+86ZLoVp5Mn2ZT0mpDnBIZbJYknsysVLbMTE2
         qwXI3EqbCQm1m2ekpxfXBf/kl5AWFB9PWT+5fuyFYozXoGyjB98gDxIaByGW0Hf6exv8
         i0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744815; x=1794349615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VPvS26x+lHLuX3TRBkRIJS+dA3Xf8oUPR2UAO/1PFvU=;
        b=HW4TCL9SzB29UM1497HbfT8cPi26/4vFv+zX4alEGrYwji8mnn2l1BwgSbJRSgJ6jr
         p/ctsK0U9wmIMyGlAUosCE08QAOgRchlkYI6hoFsaeTcT9+463t6vTXKkcYrnxCHyw9F
         yDchI+TDnDz8msnprG0Tm1UKmf2rAuPgZNoAcp8Ah8iTzc4gh4+GVQGDMG6rl8ZxqbmR
         PVFDn/M5dLyzBwBytNFc4aFrnIiVVxOD8W09CTCa9x4H0xKU05Ua1IOfDFt9etqZjDgE
         uCG2/txy+dNWFiTr5S5gwMGziQ1Xhkb4E4kKrvKOnDThtBwq8XZVNxs62CkG6MD5RAJa
         ZN5g==
X-Gm-Message-State: APuU4Z8zNgTZXJbr4G7254UbS7BeUbpF/sDQUD2LgqJmnSRd7XT4Z7Rv
	U76LIU9mS2Yurt8df1V3Q1FIu7lfaSxw3XTIO1oVbGuIAoTOdQDmU00n/qw2mRTRKavKcJ6qVQp
	jrEVWd8r4NAmo2dKKRjfWHIVRrBpNTAaB+tuljrEeow==
X-Gm-Gg: AYBFou2JmPbraSFZZKHnHeaJ3xZzmQOpEkHcH1wnsCqoRe3z0OBpoc6g1jCuRzVDLId
	ZdBH7iEi5F6SChM3tJ+ftcjPVjGFC/3SKXJrO4hg783CutV5C1GVHQETggQQUfu9zVhkxSKVXPK
	2h8s5WAKSCbaYEZdFfuEQ6LE4uElM4Ab8IBwbHtr6pTr4puNpp2HoZnLg/wREBfqM0kbNg2/cBz
	nN33QPFCy0XipQQa3hhAh/5G/LmoR8rACwmsMcKrg6BzHYSyHc/Z8XFZepsIm3UOo/r3g3XDo3p
	/BjIQJYrIGV9Tc3Anu+Z+SsKqYLx0o5L8GIbbCs8Fsh77ZErwLtEStJISy9bToDhM/oG2rkDrmz
	7QoIxOtU5a4GAL7kGBT11HS/Q6jYgA07gVevUWuI=
X-Received: by 2002:a17:902:fda7:b0:2e9:c569:7050 with SMTP id
 d9443c01a7336-2eb365116demr138424805ad.47.1793744814592; Tue, 03 Nov 2026
 14:26:54 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFbNUuJGjo5OW1JZhO=uXqk07fmzE8yo2Qibe5PoOtHCmoQXpQ@mail.gmail.com>
 <ccc319f4-24aa-496b-8366-fcfdbd5dbce6@gmail.com>
In-Reply-To: <ccc319f4-24aa-496b-8366-fcfdbd5dbce6@gmail.com>
From: okluar <okluar@gmail.com>
Date: Wed, 4 Nov 2026 01:26:42 +0300
X-Gm-Features: AclHuK9IccSQUT9KU8mqSNbq22CTfJRXu0EuUVWQcDL8jPErGsOOW7GqhUTqqY0
Message-ID: <CAFbNUuKTvJXoNqf-5K7VykOHtFFVdVHTc50aYswC0if4eGQN8w@mail.gmail.com>
Subject: Re: [BUG] platform/x86: bitland-mifs-wmi: performance profile fails
 on TIMI A30 (USB-C only)
To: Mingyou Chen <qby140326@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patches and the quirk. I've built the kernel with your
changes and tested it on my TIMI A30.

Set performance now works. No more "Operation not supported" error. A
quick check in Valheim shows the hardware reacts:
- balanced: ~44W GPU, ~1360 MHz
- performance: ~49W GPU, ~1440 MHz
The fans also spin up noticeably, so the EC is definitely applying the comm=
and.

But reading the profile from sysfs is still broken:
 $ cat /sys/firmware/acpi/platform_profile
 cat: /sys/firmware/acpi/platform_profile: No message of desired type

And dmesg shows:
 platform_profile: Failed to get profile for handler bitland-mifs-wmi
 bitland-mifs-wmi ...: Failed to unmarshal event data: -61

I suspect the GET response from the firmware for this model uses
different values than the ones in my quirk table. So the read mapping
might need to be different for TIMI A30.

Just for context on power limits:
- CPU-only load: both modes hit the same ~50W CPU hardware cap.
- Combined CPU+GPU load (Satisfactory): the total budget caps at ~65W
in both modes (~32W/32W split).
- GPU-only load (Valheim): performance mode shifts the free budget to
the GPU, raising its limit.

Happy to test more patches or do ACPI tracing if needed.

On Tue, Nov 3, 2026 at 5:51=E2=80=AFPM Mingyou Chen <qby140326@gmail.com> w=
rote:
>
> On 11/3/26 16:41, okluar wrote:
> > Hello,
> >
> > I am reporting an issue with the platform_profile interface on a
> > USB-C-only machine.
> >
> > Hardware:
> > - Model: TIMI A30 (Xiaomi Mi Notebook Pro X 15, 2021)
> > - CPU: 11th Gen Intel(R) Core(TM) i7-11370H
> > - iGPU: Intel Iris Xe Graphics
> > - dGPU: NVIDIA GeForce RTX 3050 Ti Mobile
> > - Charging: USB-C PD only (130W). No barrel-jack DC input.
> > - Kernel: 7.3.1-1-cachyos (Arch-based)
> > - Driver: bitland_mifs_wmi
> >
> > Problem:
> > platform_profile_choices correctly lists:
> > low-power balanced balanced-performance performance
> >
> > However, switching to performance fails, regardless of whether the
> > USB-C charger is connected:
> >    $ powerprofilesctl set performance
> >    Failed to communicate with power-profiles-daemon: ... Failed to
> > write to acpi_platform_profile:
> >    Error writing '/sys/firmware/acpi/platform_profile': Operation not
> > supported (15)
> >
> > Direct write also fails:
> >    $ echo performance | sudo tee /sys/firmware/acpi/platform_profile
> >    tee: /sys/firmware/acpi/platform_profile: Operation not supported
> >
> > Analysis:
> > This appears to be the same root cause as other USB-C only models: the
> > function bitland_check_performance_capability() requires
> > WMI_SYSTEM_AC_CIRCULARHOLE (barrel-jack DC), which is physically
> > impossible on this USB-C-only machine. The driver advertises the
> > profile in choices but rejects writes in profile_set().
> >
> > I am happy to test any patches on this model. Please let me know if
> > further ACPI tracing is needed.
> >
> > Thank you.
>
> Hi, this problem is being fixed with the following patch series.
>
> Please add your model to the quirks table before you test the patches.
>
> Link to the patches:
> https://lore.kernel.org/all/20261028112742.674847-1-qby140326@gmail.com/
>
>
> I take a look at your timi_a30_acpi.dat attachment, here's the quirk for
> your machine:
>
> static const struct bitland_profile_entry timi_a30_profile_entries[] =3D =
{
>      /* Change this information if it doesn't match your device. */
>      { PLATFORM_PROFILE_LOW_POWER,   2 },
>      { PLATFORM_PROFILE_BALANCED,    1 },
>      { PLATFORM_PROFILE_PERFORMANCE, 0 },
> };
>
> static const struct bitland_mifs_quirks timi_a30_quirks =3D {
>      .profile_entries =3D timi_a30_profile_entries,
>      .num_profile_entries =3D ARRAY_SIZE(timi_a30_profile_entries),
>      .return_code_at_end =3D false,
>      .skip_ac_type_check =3D true,
> };
>
> static const struct dmi_system_id bitland_mifs_dmi_table[] =3D {
>      {
>          .matches =3D {
>              /* Change this information if it doesn't match your device. =
*/
>              DMI_MATCH(DMI_SYS_VENDOR, "TIMI"),
>              DMI_MATCH(DMI_PRODUCT_NAME, "A30"),
>          },
>          .driver_data =3D (void*)&timi_a30_quirks,
>      },
>      {}
> };
>
