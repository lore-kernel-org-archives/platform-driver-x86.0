Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675564C224E
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 18:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829726; cv=none; b=QkzWW1QTudMVEZIA3M5z7V/BGYCpAZquIZH5USdlFp83bXBTBggLyVYwVCMP6DAQPfCXneMNVEGQvNrYr5NEPeM0ilZh8WQruhOgCsGMPbuUBVJdp5EcOJi69YiJ8lKhfgl+irGXrzL+dh0rHmbeT+ZgyllPPwQRK0Almgj64Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829726; c=relaxed/simple;
	bh=eeuJHxAGlkeiy/cVd0cZdyhkOUBK9Xe/qcok54fo4Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXfer/idGTsDH0T/6LRvB+cVJBg6TzhALbYplL1tr6wolrpQZtspbm8ogHSpMxXBqFgcjdtxVQ4Pmb+kXh9Ilcx0/KlH2UimjwXpkBt8wY46J5xUYRi0z1uPZx2MvkRPw24AeF3SeOJWqOO1F8iOUzlRWpa55lxqIMKS/F4eqMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVLLUxXY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVLLUxXY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263C01F008A4
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 18:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791829725;
	bh=zTwZEcqT4cuHUrLj8dCqmZcCri8FqNJ+g1r6s3P087g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hVLLUxXYzkADMI4XSUUwQwKR94kEohv+2/tI3fCd64abXrWPStMN+eMtCEtFSYRkf
	 7P7XdDKuEP2j/jE2d481u8hx5WUuSfIBLacyR2zyOhej6pfqQcMRsjjl8ZEcy7H6w4
	 kogcCgZmrgHt/2tOqCgPrVbY8x2BgDuC01C7VjpuDyL5SJPfT4LSeV4Qp3O91ahdkR
	 yRLzJPhMhTT3K5KfV6ENw6gdMTPqHReot/wefbwJC/KA7DpC2ru/JhicX87B0mkOKd
	 eh2HgrxGVnOoY/bhL8T6hDK5YUyCtChNfnE7vgAZC8+jJHaWY4Q8E0JXHaMLqRD9LO
	 Bh5uZfi4AnhuQ==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so2064626a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 11:28:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxDqtoiO2EkL6QaDfmwc4zUdDkWTes17jtmYkjEZ8Tqg85bVp+3fI/Xy2njhzklGQufzcUfoZ3RvGBBC7gBHV5+Pfkq@vger.kernel.org
X-Gm-Message-State: AFq9FYLkxW5G/JvM91yQ7kGUm+W2q6Te0T28d/66rBi9Bzj6hppSj3CP
	fjCXootxfSYZP2XA7mMqWpeBQ5jKL+nQW1ipBc849R0AI3IiFbhSeDuZY4jsCBAjMo5hGP8QIk1
	WQkAp4qCD6+pTX0OVCoIHR+8Jdr32LHQ=
X-Received: by 2002:a05:6402:51cc:b0:6b1:c2cd:dafc with SMTP id
 4fb4d7f45d1cf-6b1c2cde1d6mr2882683a12.20.1791829724092; Mon, 12 Oct 2026
 11:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACiNov445=gavzZY=Yz74HNMUgd2BKoYoazWFDRRsz9uhA_rfA@mail.gmail.com>
 <CACiNov6n4Sr4nkAnTXJ9ZmMz022KebfAM8Hf2JV_EZ+KVa9THg@mail.gmail.com> <CACiNov5XvayanL6SED-z1pLY9rMnyVbCdf=RyyhLXzDSLcXuVg@mail.gmail.com>
In-Reply-To: <CACiNov5XvayanL6SED-z1pLY9rMnyVbCdf=RyyhLXzDSLcXuVg@mail.gmail.com>
From: Len Brown <lenb@kernel.org>
Date: Mon, 12 Oct 2026 14:28:30 -0400
X-Gmail-Original-Message-ID: <CAJvTdK=ydvyCLU7RCiy8hbt8kuD22z=030tKB2yczcFJ7+4aRQ@mail.gmail.com>
X-Gm-Features: AclHuK8an2c27zHREZGv_iu_DSkxqOFc-IhGBRizCaeunuW9CJT5BW5CW5dWNqM
Message-ID: <CAJvTdK=ydvyCLU7RCiy8hbt8kuD22z=030tKB2yczcFJ7+4aRQ@mail.gmail.com>
Subject: Re: [REPORT] Kaby Lake-H (MacBookPro14,3): package C-state stuck at
 PC3 on Linux, macOS reaches PC10
To: Angel <angellindo@gmail.com>
Cc: linux-pm@vger.kernel.org, rafael@kernel.org, 
	artem.bityutskiy@linux.intel.com, 
	rajneesh bhardwaj <irenic.rajneesh@gmail.com>, xi.pardee@linux.intel.com, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I applaud you for making a 9-year old laptop useful well after its
vendor dropped software support.

Though running and debugging Linux on it would have been significantly
more interesting 9-years ago...

This platform has an AMD GPU, and MacOS is not open source.  We have
no idea what
levers MacOS may have pulled to allow the processor to get past PC3.

You've found a way to get idle power down to 1.7W from 3.5W
without PC6 or PC10.  Is that not enough -- are you really counting on
the old battery in this box?

In any case, the problem at hand is this box is blocked on PC6.  You
need to get past that to get to PC10.

-Len

On Wed, Oct 7, 2026 at 11:48=E2=80=AFPM Angel <angellindo@gmail.com> wrote:
>
> Two more data points:
>
> 1. Reproduced on a stock distro kernel with nothing else running:
>    Arch Linux live ISO, 7.2.2-arch1-1, default cmdline, no out-of-tree
>    patches, no desktop, intel_idle. turbostat, 6 x 10 s per stage:
>      idle, console on:                        PC3 93-94 %, PC6..PC10
> 0, PkgWatt 3.8 W
>      console blanked:                       PC3 98.8-99.0 %, PC6..PC10 0,=
 3.5 W
>      + amdgpu/snd_hda unbound:   PC3 98.8-99.0 %, PC6..PC10 0, 3.5 W
>    Cores sit in C7 99.6 % and GFX RC6 99 %.
>
> 2. macOS on the same unit with the same firmware setting I use on
>    Linux (gmux forced to the iGPU, gpuswitch 0) reaches PC7 ~95 % at
>    ~0.2 W with a USB stick plugged in (PC10 ~80 % with nothing
>    plugged). So the forced-iGPU mode is not the cause.
>
>    Earlier I also tried, on Linux, taking all three PEG links down at
>    once (Link Disable) and putting both Thunderbolt controllers into
>    the same state macOS uses (RTPC(0) + _PS3/PCDA: Gen1, D3hot, power
>    GPIOs low). Package power dropped to ~1.7 W but PC6..PC10 stayed 0
>    in every case.
>
> Thanks,
> Angel Lindo <angellindo@gmail.com>
>


--=20
Len Brown, Intel Open Source Technology Center
