Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5781C37881A
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Apr 2026 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775201448; cv=none; b=XQG4zKv6XYn/YcbcGCF8W7ZGBHCb7t/u9oOOE174DEZEBxHjA5FGLw1RQVpJzAMoaqBzj2Tb+askBcufe37DxRAjiwzI86V41XtWakvcsyAt6ll7H4/oPb5vKKEk6/kWYVEiD9X54eejUtL1ad7vlrf6y8XwnflRyQab6U4kT2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775201448; c=relaxed/simple;
	bh=4qw861IXovqBLhm9A4PHXOHpSj425omOra9kWZp7EFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mv9lXZPrSOdZa0fKstUY4tnsB9XAwGyZzjPWt7yCwQ5AVHjb7g/1LFm2h/Cr/gPl5T+Q9iqTkVR5GPvVo8xAxfUtjYmYMLbxMdTL+/xF/3zS0Zg5CZIGskBeGGgqxPIymUh2uICNmbMM4brSf4wEbMWU2ir84qKflHPuI9BhhUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9KlfFfb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9KlfFfb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF238C4AF0B
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Apr 2026 07:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775201448;
	bh=4qw861IXovqBLhm9A4PHXOHpSj425omOra9kWZp7EFo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c9KlfFfbC9DDifECRmtgVW7VP1pvrmUplHz26UzCGAAxhKlw6PBLox+kJbSCActKJ
	 bwW56A3nlWA/KXwupnuUzi6aL4EVieBM9IgJ++oh0XTAm7uvU7GKB8GDaCkHiS1oVT
	 lrVPMV9/wQbC7ldbdaRpHnXCzZsZZTgaqo6RWBPYReRw9sa3urZ4ZTPZy+yCO9cjyI
	 xK1ABHtIsSV0nqzkSp3dS1LG/Ls+EN3pQWQmgMWpEFugyqfwQcunPNLmJn+qCnDc0V
	 akbBtJnsVxDpCGr5soLwu9yl2f/XOovC/b02zxakBw1is3pRZ2f5BX/Kq6Fo9AkzZC
	 1gfAne1M3XnXQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so1719208e87.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 00:30:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbI9GELGiQXZVRJiv+BHQKT+HNvQxSJdPIPfp0K6nT+uezfQOqGIr4KYBFvZjrpm2R0x67K02i4pOLjEoRE1XEEwNv@vger.kernel.org
X-Gm-Message-State: AOJu0YzkjxiIcaEAftDNJAa94zVgmtA3pZj/R0/piszKvXGcJQOyGOIF
	5qe1R6CNUqLN0ohn+6tvQJ7f8Lfeq+gC6xhhtqHT5D1sUklx5SF9WABlLHwaxtKNgjFONFLye9r
	zYye77rcAJiyyVNYz1/W2yV6HDPdKr0OJwXPildjtGg==
X-Received: by 2002:a05:6512:3191:b0:5a1:26f7:8607 with SMTP id
 2adb3069b0e04-5a337584561mr555398e87.22.1775201446676; Fri, 03 Apr 2026
 00:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331112819.103298-1-bartosz.golaszewski@oss.qualcomm.com>
 <acx9veIH-t5cCVc_@google.com> <CAMRc=MfCbKa2YZYPckV7bj-+kcOx1g+v9BjYL0v+SFxTVJTTLA@mail.gmail.com>
 <ac6OpN-pfcdAhdEj@google.com> <CAMRc=McbuVrw5eNp6vhF1DJP=5YM8BA4yTM6wf_1Dcg_T2gBhQ@mail.gmail.com>
 <ac6m36bzve2gdSLa@google.com>
In-Reply-To: <ac6m36bzve2gdSLa@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 3 Apr 2026 09:30:34 +0200
X-Gmail-Original-Message-ID: <CAMRc=McLMXbLoh9qX6tJcQ-Ogwt5U2mpZ=vSX8W6BroK-y9R9w@mail.gmail.com>
X-Gm-Features: AQROBzBxxy9fgpBnSqbxVgL0eURD24mkpH_x1iBLONd9e08d0SwcUPRc_Pdz_fI
Message-ID: <CAMRc=McLMXbLoh9qX6tJcQ-Ogwt5U2mpZ=vSX8W6BroK-y9R9w@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: attach software node to its
 target GPIO device
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 7:30=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Apr 02, 2026 at 06:39:16PM +0200, Bartosz Golaszewski wrote:
> >
> > Ah, maybe sashiko wasn't wrong after all but it definitely could do a
> > better job explaining the actual issue.
>
> Yeah, I agree. OTOH it did notice the problem. I missed it when I first
> read the patch.
>
> > I missed the fact that this is
> > not a device described in firmware and as such doesn't have a firmware
> > node. I see it now. Ok, I'll fix it in v2. In fact, I'll probably wait
> > until v7.1-rc1 and use the new .swnode field.
>
> Danilo tagged the commit adding swnode to platform_device_info so you
> can ask to pull it in when applying the patch:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.g=
it/tag/?h=3Dplatform_device_info_swnode-7.1-rc1
>

I'm not a maintainer for x86 platform drivers. It's not urgent, I'll
respin it after v7.1-rc1.

Bart
